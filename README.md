# GIMS Evo Redux | For GTA V Modding

This is a personal fork of **GIMS Evo**, the 3ds Max plugin used for GTA V modding, with a with CodeWalker-XML
support.

Direct XML workflow. No more routing everything through OpenIV's conversion step first — you can open and edit CodeWalker's native .xml exports (YFT/YDR) in 3ds Max directly. One less conversion layer between you and the model.
All four LODs, not just one. It reads and writes the full detail chain — High, Medium, Low, Very Low — so a change you make doesn't just apply to the version you're staring at; it stays consistent across every distance tier the game will actually render.
Collision geometry included. Bounds (the invisible physics shapes) import and export alongside the visible mesh, so you're not maintaining two separate pipelines for "what you see" versus "what you bump into."
Full skeleton fidelity. The entire bone hierarchy round-trips intact, which matters for anything rigged — vehicles, weapons, peds. You're not stuck rebuilding bones by hand after every import.
Joint rotation limits, not just positions. It captures the min/max rotation constraints on each bone — the thing that actually governs how far a door swings or how far a turret can rotate before it's physically stopped. Easy to overlook, but it's the difference between a part that just sits there and one that behaves correctly in-engine.
Materials and shader assignments, with a safety net. Textures come through with the mesh, and if one's missing, it now generates a placeholder automatically instead of failing the whole import outright.
Selective patching, not full re-export. This is the standout: instead of regenerating an entire file every time you touch one thing, it can patch just the piece that changed — the high-poly mesh, the skeleton, whatever — directly into the existing XML, leaving the rest of the file untouched. Faster, and lower risk of clobbering something that was already fine.

## Installation

1. Copy `GIMS Evo/Startup/*` into `<3ds Max root>\scripts\Startup\`.
2. Copy `GIMS Evo/GIMS/*` into `%LOCALAPPDATA%\GIMS\`
   (i.e. `C:\Users\<you>\AppData\Local\GIMS\`), merging with/overwriting
   your existing install.
3. Launch 3ds Max - `GIMS.ms` in `Startup\` runs automatically and loads
   the rest from the `GIMS\` data folder.

Please report any issues if you have any.

Credits:

3Doomer - Creator of GIMS Evo
Sollumz Team
