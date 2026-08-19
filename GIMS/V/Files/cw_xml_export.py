# CodeWalker XML High-mesh bake for GIMS Evo (3ds Max Python).
# Same idea as Sollumz write_xml: build XML in Python, not MAXScript.

from __future__ import print_function

import re

try:
    from pymxs import runtime as rt
except Exception:
    rt = None


def _s(val):
    if val is None:
        return ""
    return str(val)


def _fmt(val):
    try:
        return ("%.9g" % float(val))
    except Exception:
        return "0"


def _byte(val):
    try:
        n = int(round(float(val)))
    except Exception:
        n = 255
    if n < 0:
        n = 0
    if n > 255:
        n = 255
    return str(n)


def _user_prop(obj, key):
    try:
        v = rt.getUserProp(obj, key)
        if v is None:
            return ""
        return str(v).lower()
    except Exception:
        return ""


def _mxs_true(val):
    if val is True:
        return True
    if val is False or val is None:
        return False
    try:
        s = str(val).strip().lower()
        if s in ("true", "1"):
            return True
        if s in ("false", "0", "undefined", "none", ""):
            return False
    except Exception:
        pass
    return False


def _hidden(obj):
    try:
        return _mxs_true(rt.isHidden(obj))
    except Exception:
        pass
    try:
        return _mxs_true(rt.getProperty(obj, "isHidden"))
    except Exception:
        pass
    return False


def _class_name(obj):
    try:
        return str(rt.classOf(obj))
    except Exception:
        return ""


def _coll_items(coll):
    out = []
    if coll is None:
        return out
    try:
        for item in coll:
            out.append(item)
        if out:
            return out
    except Exception:
        pass
    count = 0
    try:
        count = int(coll.count)
    except Exception:
        try:
            count = int(len(coll))
        except Exception:
            count = 0
    for i in range(0, count + 2):
        try:
            out.append(coll[i])
        except Exception:
            pass
    return out


def _is_model_mesh_mod(mod):
    try:
        cls = rt.classOf(mod)
        try:
            if cls == rt.EGIMS_V_ModelMesh:
                return True
        except Exception:
            pass
        name = str(cls).lower()
        if "modelmesh" in name:
            return True
        if "egims_v_modelmesh" in str(mod).lower():
            return True
    except Exception:
        pass
    return False


def _bone_tag(obj):
    for getter in (
        lambda: int(getattr(obj, "ID")),
        lambda: int(getattr(getattr(obj, "baseObject"), "ID")),
    ):
        try:
            return getter()
        except Exception:
            pass
    try:
        for mod in _coll_items(obj.modifiers):
            try:
                return int(getattr(mod, "ID"))
            except Exception:
                pass
    except Exception:
        pass
    return None


def _mesh_mod(obj):
    try:
        for mod in _coll_items(obj.modifiers):
            if _is_model_mesh_mod(mod):
                return mod
    except Exception:
        pass
    return None


def _children(obj):
    try:
        return _coll_items(obj.children)
    except Exception:
        return []


def _walk(obj, acc):
    acc.append(obj)
    for child in _children(obj):
        _walk(child, acc)
    return acc


def _node_id(obj):
    try:
        return int(rt.getHandleByAnim(obj))
    except Exception:
        try:
            return "n:" + str(obj.name)
        except Exception:
            return id(obj)


def _scene_objs():
    out = []
    seen = set()

    def add(obj):
        try:
            key = _node_id(obj)
        except Exception:
            return
        if key in seen:
            return
        seen.add(key)
        out.append(obj)

    for getter in (
        lambda: rt.objects,
        lambda: rt.geometry,
        lambda: rt.selection,
    ):
        try:
            for obj in _coll_items(getter()):
                add(obj)
        except Exception:
            pass
    return out


def _is_geometry(obj):
    try:
        if rt.superClassOf(obj) == rt.GeometryClass:
            return True
    except Exception:
        pass
    name = _class_name(obj).lower()
    if "mesh" in name or "poly" in name:
        return True
    try:
        return int(obj.numfaces) > 0
    except Exception:
        return False


def _lod_of(obj, mod):
    prop = _user_prop(obj, "GIMS_XMLLOD").strip()
    if prop in ("1", "2", "3", "4"):
        return int(prop)
    if mod is not None:
        for getter in (
            lambda: int(mod.Type),
            lambda: int(rt.getProperty(mod, "Type")),
        ):
            try:
                lod = getter()
                if lod in (1, 2, 3, 4):
                    return lod
            except Exception:
                pass
    name = ""
    try:
        name = str(obj.name).lower()
    except Exception:
        name = ""
    if "_h_" in name or name.endswith("_h"):
        return 1
    if "_m_" in name or "_med" in name:
        return 2
    if "_vl_" in name or "_vlow" in name:
        return 4
    if "_l_" in name or "_low" in name:
        return 3
    return 0


def _find_root(name):
    if name:
        try:
            node = rt.getNodeByName(name)
            if node is not None:
                return node
        except Exception:
            pass
        try:
            for obj in rt.objects:
                try:
                    if str(obj.name) == name:
                        return obj
                except Exception:
                    pass
        except Exception:
            pass
    try:
        for obj in _scene_objs():
            name = _class_name(obj).lower()
            if "egims_v_model" in name and "mesh" not in name and "bone" not in name:
                return obj
    except Exception:
        pass
    return None


def _ancestor_chain(node):
    out = []
    cur = node
    seen = set()
    while cur is not None:
        try:
            key = _node_id(cur)
        except Exception:
            key = id(cur)
        if key in seen:
            break
        seen.add(key)
        out.append(cur)
        try:
            cur = cur.parent
        except Exception:
            cur = None
    return out


def _infer_root(mesh_candidates):
    if not mesh_candidates:
        return None
    skins = _collect_skin_bones(mesh_candidates)
    if skins:
        shared = None
        for bone in skins:
            chain = _ancestor_chain(bone)
            keys = set(_node_id(n) for n in chain)
            if shared is None:
                shared = keys
            else:
                shared &= keys
        if shared:
            for node in _ancestor_chain(skins[0]):
                try:
                    key = _node_id(node)
                except Exception:
                    key = id(node)
                if key in shared:
                    return node
    for obj in mesh_candidates:
        try:
            p = obj.parent
            if p is not None:
                return p
        except Exception:
            pass
    return None


def _inv_tm(obj):
    try:
        return rt.inverse(obj.transform)
    except Exception:
        return rt.matrix3(1)


def _mul(p, tm):
    try:
        return p * tm
    except Exception:
        return p


def _bone_index_map(text):
    """name(lower) -> skeleton Index, parsed straight out of the XML that's
    already on disk. Skeleton bone ORDER/COUNT doesn't change during a patch
    (see _replace_skeleton), so this stays valid for the whole export run."""
    m = re.search(r"<Skeleton>(.*?)</Skeleton>", text, re.S)
    if not m:
        return {}
    result = {}
    for item in re.findall(r"<Item>(.*?)</Item>", m.group(1), re.S):
        nm = re.search(r"<Name>(.*?)</Name>", item)
        ix = re.search(r'<Index value="(\d+)"', item)
        if nm and ix:
            result[nm.group(1).strip().lower()] = int(ix.group(1))
    return result


def _rigid_bone_index(obj, bone_index_map):
    """Fallback for meshes with no Skin modifier: walk up the scene hierarchy
    and rigidly bind every vertex to the nearest ancestor (or self) that is
    actually a named bone in the skeleton. This is the normal GTA vehicle
    convention for non-smooth-skinned moving parts (doors, wheels, turrets).
    Returns 0 (root) only if nothing in the chain matches."""
    try:
        name = str(obj.name).strip().lower()
    except Exception:
        name = ""
    if name in bone_index_map:
        return bone_index_map[name]
    try:
        parent = obj.parent
    except Exception:
        parent = None
    hops = 0
    while parent is not None and hops < 64:
        try:
            pname = str(parent.name).strip().lower()
        except Exception:
            pname = ""
        if pname in bone_index_map:
            return bone_index_map[pname]
        try:
            parent = parent.parent
        except Exception:
            parent = None
        hops += 1
    return 0


def _skin_vertex_blend(obj, nverts, bone_index_map):
    """Real per-vertex weights/indices from a Skin modifier, if the object has
    one. Returns a list of nverts entries (each a list of up to 4
    (bone_index, weight) tuples), or None if there's no usable Skin data -
    callers should fall back to _rigid_bone_index in that case. Assumes
    snapshotAsMesh's vertex order/count lines up with the base Skin vertices,
    which holds for a standard Editable Poly/Mesh + Skin stack."""
    try:
        skin_mod = None
        for m in obj.modifiers:
            if rt.classOf(m) == rt.Skin:
                skin_mod = m
                break
        if skin_mod is None:
            return None
        rt.modPanel.setCurrentObject(skin_mod)
        out = []
        any_found = False
        for vi in range(1, nverts + 1):
            try:
                cnt = int(rt.skinOps.getVertexWeightCount(skin_mod, vi))
            except Exception:
                cnt = 0
            entries = []
            for k in range(1, cnt + 1):
                try:
                    bone_id = int(rt.skinOps.getVertexWeightBoneID(skin_mod, vi, k))
                    w = float(rt.skinOps.getVertexWeight(skin_mod, vi, k))
                    bone_node = rt.skinOps.getBone(skin_mod, bone_id)
                    bname = str(bone_node.name).strip().lower()
                except Exception:
                    continue
                idx = bone_index_map.get(bname)
                if idx is None or w <= 0:
                    continue
                entries.append((idx, w))
                any_found = True
            out.append(entries)
        if not any_found:
            return None
        return out
    except Exception:
        return None


def _mesh_data(obj, inv_tm, bone_index_map=None):
    tri = None
    try:
        tri = rt.snapshotAsMesh(obj)
    except Exception:
        return None
    if tri is None:
        return None
    try:
        nverts = int(tri.numverts)
        nfaces = int(tri.numfaces)
        if nverts < 1 or nfaces < 1:
            return None
        positions = []
        normals = []
        uvs = []
        colors = []
        has_uv = False
        has_col = False
        try:
            has_uv = bool(rt.meshop.getMapSupport(tri, 1))
        except Exception:
            has_uv = False
        try:
            has_col = bool(rt.meshop.getMapSupport(tri, 0))
        except Exception:
            has_col = False
        for i in range(1, nverts + 1):
            p = rt.getVert(tri, i)
            p = _mul(p, inv_tm)
            positions.append((float(p.x), float(p.y), float(p.z)))
            try:
                n = rt.getNormal(tri, i)
                n = _mul(n, inv_tm)
                normals.append((float(n.x), float(n.y), float(n.z)))
            except Exception:
                normals.append((0.0, 0.0, 1.0))
            uvs.append((0.0, 0.0))
            colors.append((255, 255, 255, 255))
        if has_uv:
            for fi in range(1, nfaces + 1):
                try:
                    mf = rt.meshop.getMapFace(tri, 1, fi)
                    vf = rt.getFace(tri, fi)
                    corners = ((vf.x, mf.x), (vf.y, mf.y), (vf.z, mf.z))
                    for vi_src, mi_src in corners:
                        mv = rt.meshop.getMapVert(tri, 1, int(mi_src))
                        vi = int(vi_src) - 1
                        if 0 <= vi < nverts:
                            uvs[vi] = (float(mv.x), float(mv.y))
                except Exception:
                    pass
        if has_col:
            for fi in range(1, nfaces + 1):
                try:
                    mf = rt.meshop.getMapFace(tri, 0, fi)
                    vf = rt.getFace(tri, fi)
                    corners = ((vf.x, mf.x), (vf.y, mf.y), (vf.z, mf.z))
                    for vi_src, mi_src in corners:
                        mv = rt.meshop.getMapVert(tri, 0, int(mi_src))
                        vi = int(vi_src) - 1
                        if 0 <= vi < nverts:
                            colors[vi] = (
                                int(max(0, min(255, round(float(mv.x) * 255.0)))),
                                int(max(0, min(255, round(float(mv.y) * 255.0)))),
                                int(max(0, min(255, round(float(mv.z) * 255.0)))),
                                255,
                            )
                except Exception:
                    pass
        groups = {}
        for fi in range(1, nfaces + 1):
            try:
                face = rt.getFace(tri, fi)
                mat_id = int(rt.getFaceMatID(tri, fi))
            except Exception:
                continue
            shader = mat_id - 1
            if shader < 0:
                shader = 0
            tris = groups.get(shader)
            if tris is None:
                tris = []
                groups[shader] = tris
            tris.append((int(face.x) - 1, int(face.y) - 1, int(face.z) - 1))
        bone_index_map = bone_index_map or {}
        skin_blend = _skin_vertex_blend(obj, nverts, bone_index_map)
        blend_weights = []
        blend_indices = []
        if skin_blend is not None:
            for entries in skin_blend:
                entries = sorted(entries, key=lambda e: e[1], reverse=True)[:4]
                total = sum(w for _, w in entries) or 1.0
                bw = [0, 0, 0, 0]
                bi = [0, 0, 0, 0]
                for i, (idx, w) in enumerate(entries):
                    bw[i] = int(max(0, min(255, round((w / total) * 255.0))))
                    bi[i] = idx
                blend_weights.append(tuple(bw))
                blend_indices.append(tuple(bi))
        else:
            rigid_idx = _rigid_bone_index(obj, bone_index_map)
            for _ in range(nverts):
                blend_weights.append((255, 0, 0, 0))
                blend_indices.append((rigid_idx, 0, 0, 0))
        return {
            "positions": positions,
            "normals": normals,
            "uvs": uvs,
            "colors": colors,
            "groups": groups,
            "blend_weights": blend_weights,
            "blend_indices": blend_indices,
        }
    except Exception:
        return None


def _geom_xml(shader, positions, normals, uvs, colors, blend_weights, blend_indices, tris):
    used = {}
    remap = []
    new_pos = []
    new_nrm = []
    new_uv = []
    new_col = []
    new_bw = []
    new_bi = []
    new_idx = []
    for a, b, c in tris:
        for src in (a, b, c):
            dst = used.get(src)
            if dst is None:
                dst = len(new_pos)
                used[src] = dst
                if 0 <= src < len(positions):
                    new_pos.append(positions[src])
                    new_nrm.append(normals[src] if src < len(normals) else (0.0, 0.0, 1.0))
                    new_uv.append(uvs[src] if src < len(uvs) else (0.0, 0.0))
                    new_col.append(colors[src] if src < len(colors) else (255, 255, 255, 255))
                    new_bw.append(blend_weights[src] if src < len(blend_weights) else (255, 0, 0, 0))
                    new_bi.append(blend_indices[src] if src < len(blend_indices) else (0, 0, 0, 0))
                else:
                    new_pos.append((0.0, 0.0, 0.0))
                    new_nrm.append((0.0, 0.0, 1.0))
                    new_uv.append((0.0, 0.0))
                    new_col.append((255, 255, 255, 255))
                    new_bw.append((255, 0, 0, 0))
                    new_bi.append((0, 0, 0, 0))
            remap.append(dst)
        new_idx.append((remap[-3], remap[-2], remap[-1]))
    if not new_pos or not new_idx:
        return ""
    bmin = [new_pos[0][0], new_pos[0][1], new_pos[0][2]]
    bmax = [new_pos[0][0], new_pos[0][1], new_pos[0][2]]
    for p in new_pos:
        for i in range(3):
            if p[i] < bmin[i]:
                bmin[i] = p[i]
            if p[i] > bmax[i]:
                bmax[i] = p[i]
    lines = []
    app = lines.append
    app("     <Item>\n")
    app('      <ShaderIndex value="%d" />\n' % int(shader))
    app(
        '      <BoundingBoxMin x="%s" y="%s" z="%s" w="%s" />\n'
        % (_fmt(bmin[0]), _fmt(bmin[1]), _fmt(bmin[2]), _fmt(bmin[0]))
    )
    app(
        '      <BoundingBoxMax x="%s" y="%s" z="%s" w="%s" />\n'
        % (_fmt(bmax[0]), _fmt(bmax[1]), _fmt(bmax[2]), _fmt(bmax[0]))
    )
    # BoneIDs used to be hardcoded to a single "0" here, and every vertex below
    # was hardcoded to weight 255/index 0 - i.e. every mesh this function ever
    # wrote was rigidly bound to the root bone, no matter what object or bone
    # it actually came from. That's why moving parts (turrets, etc.) exported
    # through this path never responded to their bone's rotation in-game.
    used_bone_ids = sorted(set(bi[0] for bi in new_bi) | set([0]))
    app("      <BoneIDs>" + ", ".join(str(b) for b in used_bone_ids) + "</BoneIDs>\n")
    app("      <VertexBuffer>\n")
    app('       <Flags value="0" />\n')
    app('       <Layout type="GTAV1">\n')
    app("        <Position />\n")
    app("        <BlendWeights />\n")
    app("        <BlendIndices />\n")
    app("        <Normal />\n")
    app("        <Colour0 />\n")
    app("        <TexCoord0 />\n")
    app("        <TexCoord1 />\n")
    app("       </Layout>\n")
    app("       <Data>\n")
    for i, p in enumerate(new_pos):
        n = new_nrm[i]
        uv = new_uv[i]
        col = new_col[i]
        bw = new_bw[i]
        bi = new_bi[i]
        app(
            "        %s %s %s   %d %d %d %d   %d %d %d %d   %s %s %s   %s %s %s %s   %s %s   %s %s\n"
            % (
                _fmt(p[0]),
                _fmt(p[1]),
                _fmt(p[2]),
                bw[0], bw[1], bw[2], bw[3],
                bi[0], bi[1], bi[2], bi[3],
                _fmt(n[0]),
                _fmt(n[1]),
                _fmt(n[2]),
                _byte(col[0]),
                _byte(col[1]),
                _byte(col[2]),
                _byte(col[3]),
                _fmt(uv[0]),
                _fmt(-uv[1]),
                _fmt(uv[0]),
                _fmt(-uv[1]),
            )
        )
    app("       </Data>\n")
    app("      </VertexBuffer>\n")
    app("      <IndexBuffer>\n")
    app("       <Data>\n")
    chunk = []
    written = 0
    for a, b, c in new_idx:
        chunk.append("%d %d %d" % (a, b, c))
        written += 1
        if written == 8:
            app("        " + " ".join(chunk) + "\n")
            chunk = []
            written = 0
    if chunk:
        app("        " + " ".join(chunk) + "\n")
    app("       </Data>\n")
    app("      </IndexBuffer>\n")
    app("     </Item>\n")
    return "".join(lines)


def _model_xml(geoms, mask=255):
    if not geoms:
        return ""
    lines = []
    app = lines.append
    app("   <Item>\n")
    app('    <RenderMask value="%d" />\n' % int(mask))
    app('    <Flags value="1" />\n')
    app('    <HasSkin value="1" />\n')
    app('    <BoneIndex value="0" />\n')
    app('    <Unknown1 value="1" />\n')
    app("    <Geometries>\n")
    for g in geoms:
        app(g)
    app("    </Geometries>\n")
    app("   </Item>\n")
    return "".join(lines)


def _replace_high(original, high_xml):
    open_tag = "<DrawableModelsHigh>"
    close_tag = "</DrawableModelsHigh>"
    start = original.find(open_tag)
    if start < 0:
        return original
    end = original.find(close_tag, start)
    if end < 0:
        return original
    return original[:start] + high_xml + original[end + len(close_tag) :]


def _is_bone(obj):
    name = _class_name(obj).lower()
    if "model_bone" in name:
        return True
    if "dummy" in name or "helper" in name or "point" in name:
        n = ""
        try:
            n = str(obj.name).strip().lower()
        except Exception:
            n = ""
        if n and (
            n == "chassis"
            or n.startswith("chassis_")
            or n.startswith("wheel")
            or n.startswith("door_")
            or n.startswith("seat_")
            or n.startswith("bonnet")
            or n.startswith("boot")
            or n.startswith("exhaust")
            or n.startswith("window_")
            or n.startswith("siren")
            or n.startswith("suspension_")
            or n.startswith("extra_")
            or n.startswith("overheat")
            or n.startswith("neon_")
            or n.startswith("interiorlight")
            or n.startswith("steering")
            or n.startswith("engine")
            or n.startswith("hub_")
            or n.startswith("weapon_")
        ):
            return True
    if _bone_tag(obj) is not None:
        return True
    try:
        for mod in _coll_items(obj.modifiers):
            cls = str(rt.classOf(mod)).lower()
            if "bonemod" in cls or "model_bone" in cls:
                return True
            try:
                if str(mod.name).lower() == "bone":
                    return True
            except Exception:
                pass
    except Exception:
        pass
    return False


def _is_skin_mod(mod):
    try:
        cls = str(rt.classOf(mod)).lower()
    except Exception:
        cls = ""
    return cls == "skin" or " skin" in cls or cls.endswith("skin")


def _skin_mod(obj):
    try:
        for mod in _coll_items(obj.modifiers):
            if _is_skin_mod(mod):
                return mod
    except Exception:
        pass
    return None


def _skin_bone_node(mod, index):
    for getter in (
        lambda: rt.skinOps.GetBoneNode(mod, index),
        lambda: rt.skinOps.GetBoneName(mod, index, 1),
    ):
        try:
            node = getter()
            if node is not None:
                return node
        except Exception:
            pass
    try:
        name = str(rt.skinOps.GetBoneName(mod, index, 0))
        if name:
            return rt.getNodeByName(name)
    except Exception:
        pass
    return None


def _collect_skin_bones(candidates):
    out = []
    seen = set()
    for obj in candidates:
        mod = _skin_mod(obj)
        if mod is None:
            continue
        count = 0
        for getter in (
            lambda: int(rt.skinOps.GetNumberBones(mod)),
            lambda: int(rt.skinOps.GetNumberBones(mod, 0)),
        ):
            try:
                count = getter()
                if count > 0:
                    break
            except Exception:
                pass
        for i in range(1, count + 1):
            bone = _skin_bone_node(mod, i)
            if bone is None:
                continue
            try:
                key = _node_id(bone)
            except Exception:
                key = id(bone)
            if key in seen:
                continue
            seen.add(key)
            out.append(bone)
    return out


def _bone_parent(obj, root):
    try:
        parent = obj.parent
    except Exception:
        parent = None
    while parent is not None:
        if root is not None:
            try:
                if parent == root:
                    return parent
            except Exception:
                pass
        if _is_bone(parent):
            return parent
        pname = _class_name(parent).lower()
        if "egims_v_model" in pname and "mesh" not in pname and "bone" not in pname and "light" not in pname:
            return parent
        try:
            parent = parent.parent
        except Exception:
            parent = None
    return root


def _collect_bones(root, mesh_candidates=None):
    bones = []
    seen = set()
    skin_names = set()

    def add(obj, allow_non_bone=False):
        if obj is None:
            return
        ok = _is_bone(obj)
        if not ok and allow_non_bone:
            try:
                low = str(obj.name).strip().lower()
            except Exception:
                low = ""
            ok = low in skin_names
        if not ok:
            return
        try:
            key = _node_id(obj)
        except Exception:
            key = id(obj)
        if key in seen:
            return
        seen.add(key)
        bones.append(obj)

    skins = []
    if mesh_candidates:
        skins = _collect_skin_bones(mesh_candidates)
    if not skins:
        skins = _collect_skin_bones(_scene_objs())
    for obj in skins:
        try:
            low = str(obj.name).strip().lower()
        except Exception:
            low = ""
        if low:
            skin_names.add(low)

    tree = []
    if root is not None:
        try:
            _walk(root, tree)
        except Exception:
            tree = []
    for obj in tree:
        add(obj, allow_non_bone=True)
    for obj in skins:
        add(obj, allow_non_bone=True)
    if not bones:
        for obj in _scene_objs():
            add(obj, allow_non_bone=True)
    for obj in skins:
        add(obj, allow_non_bone=True)
    return bones, skins


_LAST_XFORM_ERROR = ""


def _local_xform(obj, parent):
    global _LAST_XFORM_ERROR
    for script in (
        "(\n"
        " global GIMS_CW_BX, GIMS_CW_BR, GIMS_CW_BS\n"
        " local ParentTM = (if GIMS_CW_BONEPARENT == undefined then (matrix3 1) else GIMS_CW_BONEPARENT.transform)\n"
        " local LocalTM = (GIMS_CW_BONE.transform * (inverse ParentTM))\n"
        " GIMS_CW_BX = LocalTM.translationPart\n"
        " GIMS_CW_BR = LocalTM.rotationPart\n"
        " GIMS_CW_BS = LocalTM.scalePart\n"
        ")\n",
        "(\n"
        " global GIMS_CW_BX, GIMS_CW_BR, GIMS_CW_BS\n"
        " local InvParentTM = (if GIMS_CW_BONEPARENT == undefined then (matrix3 1) else (inverse GIMS_CW_BONEPARENT.transform))\n"
        " GIMS_CW_BX = (GIMS_CW_BONE.pos * InvParentTM)\n"
        " local Rot = ((inverse (GIMS_CW_BONE.rotation as matrix3)) * InvParentTM).rotation\n"
        " GIMS_CW_BR = (inverse Rot)\n"
        " GIMS_CW_BS = (if GIMS_CW_BONEPARENT == undefined then GIMS_CW_BONE.scale else (GIMS_CW_BONE.scale / GIMS_CW_BONEPARENT.scale))\n"
        ")\n",
    ):
        try:
            rt.GIMS_CW_BONE = obj
            rt.GIMS_CW_BONEPARENT = parent
            rt.execute(script)
            pos = rt.GIMS_CW_BX
            rot = rt.GIMS_CW_BR
            scl = rt.GIMS_CW_BS
            return (
                (float(pos.x), float(pos.y), float(pos.z)),
                (float(rot.x), float(rot.y), float(rot.z), float(rot.w)),
                (float(scl.x), float(scl.y), float(scl.z)),
            )
        except Exception as exc:
            # This used to be a bare `except: pass`, which is exactly why the
            # bake could return "transforms could not be read" for every single
            # bone with zero clue why. Keep the most recent real error so it can
            # be surfaced to the MaxScript listener instead of thrown away.
            try:
                obj_name = str(obj.name)
            except Exception:
                obj_name = "?"
            _LAST_XFORM_ERROR = "%s: %s (%s)" % (obj_name, exc, type(exc).__name__)
    return None


def _scene_bone_xforms(root, expected_names=None, mesh_candidates=None):
    out = {}
    records = []
    bones, skin_bones = _collect_bones(root, mesh_candidates=mesh_candidates)
    for obj in bones:
        try:
            name = str(obj.name)
        except Exception:
            continue
        if not name:
            continue
        data = _local_xform(obj, _bone_parent(obj, root))
        if data is None:
            continue
        parent_name = ""
        parent_low = ""
        try:
            parent = _bone_parent(obj, root)
            if parent is not None:
                parent_name = str(parent.name).strip()
                parent_low = parent_name.lower()
        except Exception:
            parent_name = ""
            parent_low = ""
        out[name] = data
        out[name.lower()] = data
        records.append(
            {
                "name": name,
                "name_l": name.lower(),
                "parent_name": parent_name,
                "parent_l": parent_low,
                "data": data,
                "tag": _bone_tag(obj),
            }
        )
    if expected_names:
        for obj in _scene_objs():
            try:
                name = str(obj.name)
            except Exception:
                continue
            if not name:
                continue
            low = name.lower()
            if low not in expected_names:
                continue
            if name in out or low in out:
                continue
            data = _local_xform(obj, _bone_parent(obj, root))
            if data is None:
                continue
            out[name] = data
            out[low] = data
    return out, len(bones), len(skin_bones), records, _LAST_XFORM_ERROR


def _self_tag(name, attrs):
    return "<" + name + " " + attrs + " />"


def _vec3_attrs(val):
    return 'x="%s" y="%s" z="%s"' % (_fmt(val[0]), _fmt(val[1]), _fmt(val[2]))


def _quat_attrs(val):
    return 'x="%s" y="%s" z="%s" w="%s"' % (
        _fmt(val[0]),
        _fmt(val[1]),
        _fmt(val[2]),
        _fmt(val[3]),
    )


def _replace_first_tag(block, tag, replacement):
    import re

    pattern = r"<" + tag + r"\s[^>]*/>"
    updated, count = re.subn(pattern, replacement, block, count=1)
    if count:
        return updated
    pattern = r"<" + tag + r">.*?</" + tag + r">"
    updated, count = re.subn(pattern, replacement, block, count=1, flags=re.DOTALL)
    if count:
        return updated
    return block


def _patch_bone_item(item, pos, rot, scale):
    item = _replace_first_tag(item, "Translation", _self_tag("Translation", _vec3_attrs(pos)))
    item = _replace_first_tag(item, "Rotation", _self_tag("Rotation", _quat_attrs(rot)))
    item = _replace_first_tag(item, "Scale", _self_tag("Scale", _vec3_attrs(scale)))
    return item


def _item_name(item):
    start = item.find("<Name>")
    end = item.find("</Name>", start)
    if start < 0 or end < 0:
        return ""
    return item[start + 6 : end].strip()


def _split_skel_items(skel):
    items = []
    start = 0
    while True:
        a = skel.find("<Item>", start)
        if a < 0:
            break
        b = skel.find("</Item>", a)
        if b < 0:
            break
        b += len("</Item>")
        items.append((a, b, skel[a:b]))
        start = b
    return items


def _skeleton_names(xml):
    names = set()
    start = 0
    while True:
        a = xml.find("<Skeleton>", start)
        if a < 0:
            break
        b = xml.find("</Skeleton>", a)
        if b < 0:
            break
        b += len("</Skeleton>")
        for _, _, item in _split_skel_items(xml[a:b]):
            name = _item_name(item).strip().lower()
            if name:
                names.add(name)
        start = b
    return names


def _patch_skel_block(skel, bones):
    if not bones:
        return skel, 0
    items = _split_skel_items(skel)
    if not items:
        return skel, 0
    patched = 0
    parts = []
    cursor = 0
    for start, end, item in items:
        parts.append(skel[cursor:start])
        name = _item_name(item)
        data = bones.get(name) or bones.get(name.lower())
        if data is not None:
            item = _patch_bone_item(item, data[0], data[1], data[2])
            patched += 1
        parts.append(item)
        cursor = end
    parts.append(skel[cursor:])
    return "".join(parts), patched


def _build_skeleton_block(scene_records):
    if not scene_records:
        return "", 0
    by_name = {}
    for rec in scene_records:
        by_name[rec["name_l"]] = rec
    ordered = []
    seen = set()

    def visit(name_l):
        if name_l in seen:
            return
        rec = by_name.get(name_l)
        if rec is None:
            return
        parent_l = rec.get("parent_l", "")
        if parent_l and parent_l in by_name and parent_l != name_l:
            visit(parent_l)
        seen.add(name_l)
        ordered.append(rec)

    for rec in scene_records:
        visit(rec["name_l"])

    index_of = {}
    children = {}
    for i, rec in enumerate(ordered):
        key = rec["name_l"]
        index_of[key] = i
        children.setdefault(key, [])
    for rec in ordered:
        parent_l = rec.get("parent_l", "")
        if parent_l in index_of:
            children[parent_l].append(rec["name_l"])
    sibling_index = {}
    for kids in children.values():
        for i, child_l in enumerate(kids):
            nxt = kids[i + 1] if i + 1 < len(kids) else None
            sibling_index[child_l] = index_of[nxt] if nxt in index_of else -1

    lines = []
    app = lines.append
    app("  <Skeleton>\n")
    app('   <Unknown1C value="16777216" />\n')
    app('   <Unknown50 value="4154276131" />\n')
    app('   <Unknown54 value="3487491776" />\n')
    app('   <Unknown58 value="500019064" />\n')
    app("   <Bones>\n")
    for i, rec in enumerate(ordered):
        name = rec["name"]
        parent_l = rec.get("parent_l", "")
        parent_i = index_of[parent_l] if parent_l in index_of else -1
        sib_i = sibling_index.get(rec["name_l"], -1)
        tag = rec.get("tag")
        if tag is None:
            tag = 0
        pos, rot, scl = rec["data"]
        flags = "RotX, RotY, RotZ, TransX, TransY, TransZ, Unk0" if parent_i < 0 else "RotX, RotY, RotZ"
        app("    <Item>\n")
        app("     <Name>%s</Name>\n" % name)
        app('     <Tag value="%d" />\n' % int(tag))
        app('     <Index value="%d" />\n' % i)
        app('     <ParentIndex value="%d" />\n' % parent_i)
        app('     <SiblingIndex value="%d" />\n' % sib_i)
        app("     <Flags>%s</Flags>\n" % flags)
        app("     " + _self_tag("Translation", _vec3_attrs(pos)) + "\n")
        app("     " + _self_tag("Rotation", _quat_attrs(rot)) + "\n")
        app("     " + _self_tag("Scale", _vec3_attrs(scl)) + "\n")
        app('     <TransformUnk x="0" y="4" z="-3" w="0" />\n')
        app("    </Item>\n")
    app("   </Bones>\n")
    app("  </Skeleton>\n")
    return "".join(lines), len(ordered)


def _item_int(item, tag):
    m = re.search(r"<" + tag + r"\s+value=\"(-?\d+)\"", item)
    if not m:
        return None
    try:
        return int(m.group(1))
    except Exception:
        return None


def _append_missing_bones(skel, scene_records):
    """Insert brand-new <Item> entries for scene bones that have no matching
    entry in this skeleton block yet - e.g. a turret/weapon rig transplanted
    in from a different vehicle. Existing entries and their indices are left
    completely untouched (so existing mesh skin-weight bone indices stay
    valid); new bones are appended at the end and linked into their parent's
    sibling chain."""
    if not scene_records:
        return skel, 0
    items = _split_skel_items(skel)
    if not items:
        return skel, 0

    existing = {}
    max_index = -1
    root_existing_l = None
    for start, end, item in items:
        name_l = _item_name(item).strip().lower()
        idx = _item_int(item, "Index")
        pidx = _item_int(item, "ParentIndex")
        sidx = _item_int(item, "SiblingIndex")
        if idx is not None and idx > max_index:
            max_index = idx
        if name_l:
            existing[name_l] = {"index": idx, "parent_index": pidx, "sibling_index": sidx}
            if pidx == -1 and root_existing_l is None:
                root_existing_l = name_l

    by_name_l = {rec["name_l"]: rec for rec in scene_records}
    missing = [rec for rec in scene_records if rec["name_l"] not in existing]
    if not missing:
        return skel, 0

    ordered = []
    seen = set()

    def visit(name_l, stack=frozenset()):
        if name_l in seen or name_l in existing or name_l in stack:
            return
        rec = by_name_l.get(name_l)
        if rec is None:
            return
        parent_l = rec.get("parent_l", "")
        if parent_l and parent_l != name_l and parent_l in by_name_l:
            visit(parent_l, stack | {name_l})
        seen.add(name_l)
        ordered.append(rec)

    for rec in missing:
        visit(rec["name_l"])
    if not ordered:
        return skel, 0

    root_existing_index = existing[root_existing_l]["index"] if root_existing_l else None

    next_index = max_index + 1
    new_index_of = {}
    last_child = {}
    for name_l, info in existing.items():
        if info.get("sibling_index") == -1 and info.get("parent_index") is not None:
            last_child[info["parent_index"]] = {"kind": "existing", "name_l": name_l}

    existing_sibling_patches = {}
    new_items = []
    for rec in ordered:
        name_l = rec["name_l"]
        parent_l = rec.get("parent_l", "")
        if parent_l in existing:
            parent_index = existing[parent_l]["index"]
        elif parent_l in new_index_of:
            parent_index = new_index_of[parent_l]
        else:
            parent_index = root_existing_index if root_existing_index is not None else -1

        my_index = next_index
        next_index += 1
        new_index_of[name_l] = my_index

        prev = last_child.get(parent_index)
        if prev is not None:
            if prev["kind"] == "existing":
                existing_sibling_patches[prev["name_l"]] = my_index
            else:
                for ni in new_items:
                    if ni["name_l"] == prev["name_l"]:
                        ni["sibling_index"] = my_index
                        break
        last_child[parent_index] = {"kind": "new", "name_l": name_l}

        pos, rot, scl = rec["data"]
        tag = rec.get("tag")
        if tag is None:
            tag = 0
        flags = "RotX, RotY, RotZ, TransX, TransY, TransZ, Unk0" if parent_index < 0 else "RotX, RotY, RotZ"
        new_items.append(
            {
                "name_l": name_l,
                "name": rec["name"],
                "index": my_index,
                "parent_index": parent_index,
                "sibling_index": -1,
                "tag": tag,
                "flags": flags,
                "pos": pos,
                "rot": rot,
                "scl": scl,
            }
        )

    parts = []
    cursor = 0
    for start, end, item in items:
        parts.append(skel[cursor:start])
        name_l = _item_name(item).strip().lower()
        if name_l in existing_sibling_patches:
            item = re.sub(
                r'<SiblingIndex\s+value="-?\d+"\s*/>',
                '<SiblingIndex value="%d" />' % existing_sibling_patches[name_l],
                item,
                count=1,
            )
        parts.append(item)
        cursor = end
    parts.append(skel[cursor:])
    patched_skel = "".join(parts)

    lines = []
    for ni in new_items:
        lines.append("    <Item>\n")
        lines.append("     <Name>%s</Name>\n" % ni["name"])
        lines.append('     <Tag value="%d" />\n' % int(ni["tag"]))
        lines.append('     <Index value="%d" />\n' % ni["index"])
        lines.append('     <ParentIndex value="%d" />\n' % ni["parent_index"])
        lines.append('     <SiblingIndex value="%d" />\n' % ni["sibling_index"])
        lines.append("     <Flags>%s</Flags>\n" % ni["flags"])
        lines.append("     " + _self_tag("Translation", _vec3_attrs(ni["pos"])) + "\n")
        lines.append("     " + _self_tag("Rotation", _quat_attrs(ni["rot"])) + "\n")
        lines.append("     " + _self_tag("Scale", _vec3_attrs(ni["scl"])) + "\n")
        lines.append('     <TransformUnk x="0" y="4" z="-3" w="0" />\n')
        lines.append("    </Item>\n")
    insertion = "".join(lines)

    bones_close = patched_skel.rfind("</Bones>")
    if bones_close < 0:
        return patched_skel, 0
    patched_skel = patched_skel[:bones_close] + insertion + patched_skel[bones_close:]
    return patched_skel, len(new_items)


def _insert_skeleton_block(xml, skeleton_block):
    if not skeleton_block:
        return xml
    pos = xml.find("</ShaderGroup>")
    if pos >= 0:
        pos += len("</ShaderGroup>")
        return xml[:pos] + "\n" + skeleton_block + xml[pos:]
    pos = xml.find("<Joints>")
    if pos >= 0:
        return xml[:pos] + skeleton_block + xml[pos:]
    pos = xml.find("</Drawable>")
    if pos >= 0:
        return xml[:pos] + skeleton_block + xml[pos:]
    return xml + "\n" + skeleton_block


def _replace_skeleton(original, root, mesh_candidates=None, create_when_missing=False):
    names = _skeleton_names(original)
    bones, scene_bone_count, skin_bone_count, scene_records, xform_error = _scene_bone_xforms(
        root, expected_names=names, mesh_candidates=mesh_candidates
    )
    if not bones:
        return original, {
            "scene_bones": scene_bone_count,
            "skin_bones": skin_bone_count,
            "skeleton_blocks": 0,
            "patched": 0,
            "created": 0,
            "status": "scene_bones_missing" if scene_bone_count == 0 else "scene_bone_transforms_missing",
            "xform_error": xform_error,
        }
    start = 0
    chunks = []
    total = 0
    blocks = 0
    created = 0
    while True:
        a = original.find("<Skeleton>", start)
        if a < 0:
            chunks.append(original[start:])
            break
        b = original.find("</Skeleton>", a)
        if b < 0:
            chunks.append(original[start:])
            break
        b += len("</Skeleton>")
        chunks.append(original[start:a])
        block, count = _patch_skel_block(original[a:b], bones)
        block, added = _append_missing_bones(block, scene_records)
        chunks.append(block)
        total += count
        created += added
        blocks += 1
        start = b
    status = "ok"
    if blocks == 0:
        if create_when_missing:
            skel_xml, created = _build_skeleton_block(scene_records)
            if skel_xml and created > 0:
                status = "skeleton_created"
                total = created
                blocks = 1
                chunks = [_insert_skeleton_block(original, skel_xml)]
            else:
                status = "skeleton_missing"
        else:
            status = "skeleton_missing"
    elif total == 0 and created == 0:
        status = "no_matching_scene_bones"
    return "".join(chunks), {
        "scene_bones": scene_bone_count,
        "skin_bones": skin_bone_count,
        "skeleton_blocks": blocks,
        "patched": total,
        "created": created,
        "status": status,
        "xform_error": "",
    }


def _all_high_objs(root):
    objs = _scene_objs()
    if root is not None:
        tree = []
        try:
            _walk(root, tree)
        except Exception:
            tree = []
        if len(tree) > 1:
            seen = set(_node_id(obj) for obj in objs)
            for obj in tree:
                key = _node_id(obj)
                if key not in seen:
                    seen.add(key)
                    objs.append(obj)
    scored = []
    stats = {
        "objs": len(objs),
        "geom": 0,
        "mods": 0,
        "vis": 0,
        "phys": 0,
        "high": 0,
    }
    for obj in objs:
        if not _is_geometry(obj):
            continue
        stats["geom"] += 1
        if _user_prop(obj, "GIMS_XMLPart") == "physics":
            stats["phys"] += 1
            continue
        hidden = _hidden(obj)
        if not hidden:
            stats["vis"] += 1
        mod = _mesh_mod(obj)
        if mod is not None:
            stats["mods"] += 1
        lod = _lod_of(obj, mod)
        # 1 = High from modifier/user-prop/name. 0 = unknown (collapsed stack).
        if lod in (2, 3, 4):
            continue
        if lod == 1:
            scored.append((0, obj, mod))
        elif not hidden:
            scored.append((1, obj, mod))
    scored.sort(key=lambda item: item[0])
    high = []
    if scored:
        best = scored[0][0]
        # Prefer tagged High meshes. If none exist, bake visible non-physics meshes.
        for rank, obj, mod in scored:
            if best == 0 and rank != 0:
                break
            high.append((obj, mod))
    stats["high"] = len(high)
    return high, stats


def _count_shaders(xml):
    start = xml.find("<Shaders>")
    end = xml.find("</Shaders>", start)
    if start < 0 or end < 0:
        return 0
    count = 0
    for line in xml[start:end].splitlines():
        if line == "    <Item>":
            count += 1
    return count


def _pad_shader_xml():
    return (
        "    <Item>\n"
        "     <Name>vehicle_mesh</Name>\n"
        "     <FileName>vehicle_mesh.sps</FileName>\n"
        '     <RenderBucket value="0" />\n'
        "     <Parameters>\n"
        '      <Item name="DiffuseSampler" type="Texture">\n'
        "       <Name>technical_gun</Name>\n"
        "      </Item>\n"
        '      <Item name="DamageSampler" type="Texture" />\n'
        '      <Item name="DirtSampler" type="Texture">\n'
        "       <Name>vehicle_genericmud_car</Name>\n"
        "      </Item>\n"
        '      <Item name="BumpSampler" type="Texture">\n'
        "       <Name>technical_gun_n</Name>\n"
        "      </Item>\n"
        '      <Item name="SpecSampler" type="Texture">\n'
        "       <Name>technical_gun_s</Name>\n"
        "      </Item>\n"
        '      <Item name="envEffTexTileUV" type="Vector" x="8" y="0" z="0" w="0" />\n'
        '      <Item name="envEffScale" type="Vector" x="1" y="0.001" z="0" w="0" />\n'
        '      <Item name="envEffThickness" type="Vector" x="25" y="0" z="0" w="0" />\n'
        '      <Item name="reflectivePower" type="Vector" x="0.45" y="0" z="0" w="0" />\n'
        '      <Item name="specular2Color_DirLerp" type="Vector" x="0" y="0.5" z="0" w="0" />\n'
        '      <Item name="dirtColor" type="Vector" x="0.231372" y="0.223529" z="0.203921" w="0" />\n'
        '      <Item name="dirtLevelMod" type="Vector" x="1" y="1" z="1" w="1" />\n'
        '      <Item name="matDiffuseColor" type="Vector" x="2" y="5" z="5" w="0" />\n'
        '      <Item name="DamagedWheelOffsets" type="Array">\n'
        '       <Value x="0" y="0" z="0" w="0" />\n'
        '       <Value x="0" y="0" z="0" w="0" />\n'
        "      </Item>\n"
        '      <Item name="DamageTextureOffset" type="Vector" x="0" y="0" z="0" w="0" />\n'
        '      <Item name="DamageMultiplier" type="Vector" x="0" y="0" z="0" w="0" />\n'
        '      <Item name="BoundRadius" type="Vector" x="0" y="0" z="0" w="0" />\n'
        "     </Parameters>\n"
        "    </Item>\n"
    )


def _ensure_shaders(xml, max_index):
    if max_index < 0:
        return xml
    needed = max_index + 1
    have = _count_shaders(xml)
    extra = []
    while have < needed:
        extra.append(_pad_shader_xml())
        have += 1
    if not extra:
        return xml
    marker = "   </Shaders>"
    pos = xml.find(marker)
    if pos < 0:
        return xml
    return xml[:pos] + "".join(extra) + xml[pos:]


def export_high(src_path, dst_path, node_name):
    named_root = None
    if node_name:
        try:
            named_root = rt.getNodeByName(node_name)
        except Exception:
            named_root = None
    root = named_root if named_root is not None else _find_root(node_name)
    inv_tm = _inv_tm(root) if root is not None else rt.matrix3(1)
    high_objs, stats = _all_high_objs(root)
    # Read the file up front (rather than after baking) so we have a real
    # name->index map from the CURRENT skeleton to bind vertices against -
    # bone order/count doesn't change from this point on, only transforms do.
    path = dst_path if dst_path else src_path
    with open(path, "r", encoding="utf-8", errors="replace") as handle:
        original = handle.read()
    bone_index_map = _bone_index_map(original)
    geoms = []
    mask = 255
    for obj, mod in high_objs:
        try:
            mask = int(mod.Mask)
        except Exception:
            mask = 255
        data = _mesh_data(obj, inv_tm, bone_index_map)
        if not data:
            continue
        shaders = list(data["groups"].keys())
        shaders.sort()
        for shader in shaders:
            xml = _geom_xml(
                shader,
                data["positions"],
                data["normals"],
                data["uvs"],
                data["colors"],
                data["blend_weights"],
                data["blend_indices"],
                data["groups"][shader],
            )
            if xml:
                geoms.append(xml)
    updated = original
    if geoms:
        max_shader = 0
        for chunk in geoms:
            marker = '<ShaderIndex value="'
            pos = chunk.find(marker)
            if pos < 0:
                continue
            start = pos + len(marker)
            end = chunk.find('"', start)
            try:
                val = int(chunk[start:end])
            except Exception:
                val = 0
            if val > max_shader:
                max_shader = val
        high_xml = "<DrawableModelsHigh>\n" + _model_xml(geoms, mask) + "  </DrawableModelsHigh>"
        updated = _ensure_shaders(updated, max_shader)
        shader_count = _count_shaders(updated)
        if shader_count > 0 and max_shader >= shader_count:
            old = '<ShaderIndex value="%d" />' % max_shader
            new = '<ShaderIndex value="%d" />' % (shader_count - 1)
            high_xml = high_xml.replace(old, new)
        updated = _replace_high(updated, high_xml)
    updated, bone_info = _replace_skeleton(updated, root, mesh_candidates=[o for o, _ in high_objs])
    bone_status = bone_info["status"]
    if node_name and named_root is None:
        bone_status = "missing_hierarchy_root"
    try:
        rt.GIMS_CW_BONE_STATUS = bone_status
    except Exception:
        pass
    try:
        info_txt = (
            "patched=%d;created=%d;scene=%d;skin=%d;skeleton_blocks=%d"
            % (
                int(bone_info["patched"]),
                int(bone_info["created"]),
                int(bone_info["scene_bones"]),
                int(bone_info["skin_bones"]),
                int(bone_info["skeleton_blocks"]),
            )
        )
        xform_error = bone_info.get("xform_error") or ""
        if xform_error:
            # Surface the real MAXScript error instead of swallowing it -
            # this is the whole reason "transforms could not be read" used
            # to give zero clue about which bone or why.
            info_txt += ";xform_error=" + xform_error[:200]
        rt.GIMS_CW_BONE_INFO = info_txt
    except Exception:
        pass
    if not geoms and int(bone_info["patched"]) == 0 and int(bone_info["created"]) == 0:
        return "no_high_meshes:objs=%(objs)d;geom=%(geom)d;mods=%(mods)d;vis=%(vis)d;phys=%(phys)d" % stats
    tmp = path + ".tmp"
    with open(tmp, "w", encoding="utf-8", newline="\n") as handle:
        handle.write(updated)
        handle.flush()
    try:
        import os
        if os.path.exists(path):
            os.remove(path)
        os.rename(tmp, path)
    except Exception:
        with open(path, "w", encoding="utf-8", newline="\n") as handle:
            handle.write(updated)
    return "ok"


def main():
    status = "python_failed"
    try:
        if rt is None:
            status = "no_pymxs"
        else:
            src = ""
            dst = ""
            name = ""
            try:
                src = _s(rt.GIMS_CW_SRC)
            except Exception:
                src = ""
            try:
                dst = _s(rt.GIMS_CW_DST)
            except Exception:
                dst = ""
            try:
                name = _s(rt.GIMS_CW_NODE)
            except Exception:
                name = ""
            if not dst and src:
                dst = src
            if not dst:
                status = "no_output_path"
            else:
                status = export_high(src, dst, name)
    except Exception as exc:
        status = "exception:" + str(exc)
    try:
        rt.GIMS_CW_STATUS = status
    except Exception:
        pass
    try:
        if getattr(rt, "GIMS_CW_BONE_STATUS", None) is None:
            rt.GIMS_CW_BONE_STATUS = "unknown"
    except Exception:
        pass


main()