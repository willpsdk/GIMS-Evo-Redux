/*#PC*DEFINE	CurrentGame	V*/
(
/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
/*<ERRHANDLERSTART>*/try (
	
/*Bounds*/
	
	struct /*#PC*PATH	GIMS.CurrentGame.Core.TypeLibrary.Bounds*/strBounds (
		GIMSObjectLink = "GIMS.CurrentGame.Core.TypeLibrary.Bounds",
		AABB = (GIMS.Core.TypeLibrary.AABB()),
		Center = unsupplied,
		Centroid = unsupplied,
		CenterOfMass = unsupplied,
		Radius = unsupplied,
		fn Write BufferID TabString = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	WriteVal = GIMS.Core.BufferMgr.WriteVal,
						ValueOps = GIMS.Core.ValueOps,
						AsoFText = ValueOps.AsoFText
				WriteVal BufferID (AsoFText AABB.bMin TabString:(TabString + "AABBMin "))
				WriteVal BufferID (AsoFText AABB.bMax TabString:(TabString + "AABBMax "))
				if Supplied Radius then
					WriteVal BufferID (ValueOps.FormatText v1:TabString v2:"Radius " v3:Radius)
				if Supplied Centroid then
					WriteVal BufferID (AsoFText Centroid TabString:(TabString + "Centroid "))
				if Supplied Center then
					WriteVal BufferID (AsoFText Center TabString:(TabString + "Center "))
				if Supplied CenterOfMass then
					WriteVal BufferID (AsoFText CenterOfMass TabString:(TabString + "CG "))
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn CalculateCentroid = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	bMin = AABB.bMin
				Centroid = (bMin + ((AABB.bMax - bMin) / 2))
				OK
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn CalculateWorldRadius = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	bMin = AABB.bMin,
						bMax = AABB.bMax,
						wMin = [bMin.x, bMin.y, 0],
						wMax = [bMax.x, bMax.y, 0]
				Radius = ((Distance wMin wMax) / 2)
				OK
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn CalculateRadius = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				Radius = ((Distance AABB.bMin AABB.bMax) / 2)
				OK
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		)
	)
	
/*phBound*/
	
	struct /*#PC*PATH	GIMS.CurrentGame.Core.TypeLibrary.grcPhBound*/ strPhBound (
		GIMSObjectLink = "GIMS.CurrentGame.Core.TypeLibrary.grcPhBound",
		DiskPath,
		ObjName,
		Extension = ".obn",
		Version = [43, 31],
		SourceFormat = #OpenFormats,
		SourceXMLPath = unsupplied,
		Type,
		KnownTypes = #(	--HINT: sorted MHL, don't fuck with this
			#(
				#BoundBox,
				#BoundBVH,
				#BoundCapsule,
				#BoundComposite,
				#BoundCylinder,
				#BoundDisc,
				#BoundGeometry,
				#BoundPlane,
				#BoundSphere
			), #(
				"BoundBox",
				"BoundBVH",
				"BoundCapsule",
				"BoundComposite",
				"BoundCylinder",
				"BoundDisc",
				"BoundGeometry",
				"BoundPlane",
				"BoundSphere"
			)
		),
		Bounds = GIMS.CurrentGame.Core.TypeLibrary.Bounds(),
		Margin = unsupplied,
		Shrunk = unsupplied,
		FaceMatIDs = #(),
		Faces = #(),
		Siblings = #(),
		Primitives = #(),
		Vertices = #(),
		VertexOffset,
		VertexOffset_UnkPart,
		Materials = #(),
		VertexColors = unsupplied,
		MaterialColors = unsupplied,
		CapsuleHalfHeight = unsupplied,
		ChildFlags = unsupplied,
		Children = #(),
		ChildTransforms = #(),
		KnownChildFlags = #(	--HINT: sorted, don't fuck with this
			#ANIMAL             ,
			#ANIMAL_RAGDOLL     ,
			#EXPLOSION          ,
			#Foliage            ,
			#FORKLIFT_FORKS     ,
			#Glass              ,
			#MAP_ANIMAL         ,
			#MAP_COVER          ,
			#MAP_DEEP_SURFACE   ,
			#MAP_DYNAMIC        ,
			#MAP_RIVER          ,
			#MAP_STAIRS         ,
			#MAP_VEHICLE        ,
			#MAP_WEAPON         ,
			#object             ,
			#OBJECT_ENV_CLOTH   ,
			#PED                ,
			#PICKUP             ,
			#PLANT              ,
			#PROJECTILE         ,
			#ragdoll            ,
			#Smoke              ,
			#TEST_AI            ,
			#TEST_CAMERA        ,
			#TEST_SCRIPT        ,
			#TEST_VEHICLE_WHEEL ,
			#TEST_WEAPON        ,
			#UNKNOWN            ,
			#UNSMASHED          ,
			#VEHICLE_BOX        ,
			#VEHICLE_BVH        ,
			#VEHICLE_NOT_BVH
		),
		KnownPolyFlags = #(	--HINT: sorted, don't fuck with this
			#FLAG_NO_CAM_COLLISION                ,
			#FLAG_NO_CAM_COLLISION_ALLOW_CLIPPING ,
			#FLAG_NO_DECAL                        ,
			#FLAG_NO_NAVMESH                      ,
			#FLAG_NO_NETWORK_SPAWN                ,
			#FLAG_NO_PTFX                         ,
			#FLAG_NO_RAGDOLL                      ,
			#FLAG_NOT_CLIMBABLE                   ,
			#FLAG_NOT_COVER                       ,
			#FLAG_SEE_THROUGH                     ,
			#FLAG_SHOOT_THROUGH                   ,
			#FLAG_SHOOT_THROUGH_FX                ,
			#FLAG_STAIRS                          ,
			#FLAG_TOO_STEEP_FOR_PLAYER            ,
			#FLAG_VEHICLE_WHEEL                   ,
			#FLAG_WALKABLE_PATH
		),
		fn GetCreateProgressStepCount ObjectMgr = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if Type == #BoundComposite then (
					local	Result = 0
					for ChildID = 1 to Children.Count do (
						local	Child = Children[ChildID]
						if Have Child then
							Result += (Child.GetCreateProgressStepCount ObjectMgr)
					)
					Result
				) else (
					if
						Type == #BoundBVH or
						Type == #BoundGeometry
					then
						(ObjectMgr.CreateMesh_ProgressStepCount + Primitives.Count)
					else
						1
				)
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#DiskPath, #ObjName, #Extension), #(DiskPath, ObjName, Extension)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn ParseTag BufferID tLine \
			BufferMgr \
			DiskPathWithObjName \
			Skip \
			ReadVal \
			TypeCast \
			oFTypeExec \
			GetProgress \
			UpdateProgress \
			ReportProgress \
			FormatText \
			NotEOF \
			grcPhBound \
			ValueOps \
			AppendMHL \
			FetchMHL \
			QuickSearch \
			ObjectNames \
			NoCaseOrderComparator \
			UpdateMatrix = \
		(
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
			
				/*TODO remove, debug*	LogProfiler #PlainInfo "tLine:\t" AddParam:tLine	/**/
											
				local	Tag = (TypeCast tLine[1] name BufferID:BufferID),
						Result = true
						
				--Format "@ %\tTag \"%\"\tLine \"%\"\n" (BufferMgr.TellPos BufferID) Tag tLine --TODO remove, debug

				case Tag of (
					#Version: (
						if (oFTypeExec tLine #P2 IDMask:#{2, 3} BufferID:BufferID) != Version then (
							GIMS.Core.SystemMgr.AddResult #Error  (
								FormatText \
									v1:"Wrong version resource \"" \
									v2:DiskPathWithObjName \
									v3:Extension \
									v4:"\""
							)
							Result = false
						)
						Skip BufferID 1 /* skip start */
					)
					#PhBound: (
						if
							(tLine.Count < 2) or
							(TypeCast tLine[2] Name BufferID:BufferID) != #NULL
						then
							Skip BufferID 1 /*skip start*/
						else
							Result = false
					)
					#Type: (
						Type = (FetchMHL KnownTypes tLine[2] ReturnHashOnFail:false Comparator:NoCaseOrderComparator)
						if No Type then (
							GIMS.Core.SystemMgr.AddResult #Error  (
								FormatText \
									v1:"Unknown PhBound type \"" \
									v2:tLine[2] \
									v3:"\" in file \"" \
									v4:DiskPathWithObjName \
									v5:Extension \
									v6:"\" found at " \
									v7:(BufferMgr.GetErrorInfo BufferID) \
							)
							Result = false
						)
					)
					#Radius:
						Bounds.Radius = (TypeCast tLine[2] Float BufferID:BufferID)
					#AABBMax:
						Bounds.AABB.bMax = (oFTypeExec tLine #P3 IDMask:#{2..4} BufferID:BufferID)
					#AABBMin:
						Bounds.AABB.bMin = (oFTypeExec tLine #P3 IDMask:#{2..4} BufferID:BufferID)
					#Centroid:
						Bounds.Centroid = (oFTypeExec tLine #P3 IDMask:#{2..4} BufferID:BufferID)
					#CG:
						Bounds.CenterOfMass = (oFTypeExec tLine #P3 IDMask:#{2..4} BufferID:BufferID)
					#Margin:
						Margin = (TypeCast tLine[2] Float BufferID:BufferID)
					#CapsuleHalfHeight:
						CapsuleHalfHeight = (TypeCast tLine[2] Float BufferID:BufferID)
					#GeometryCenter: (
						VertexOffset = (oFTypeExec tLine #P3 IDMask:#{2..4} BufferID:BufferID)
						VertexOffset_UnkPart = (TypeCast tLine[5] Float BufferID:BufferID)
					)
					#ChildTransforms: (
						local	count = (TypeCast tLine[2] Integer BufferID:BufferID)
						ChildTransforms.Count = count
						Skip BufferID 1 /*skip start*/
						for i = 1 to count do (
							Skip BufferID 1 /*skip header*/
							Skip BufferID 1 /*skip start*/
							ChildTransforms[i] = (
								Matrix3	(oFTypeExec (ReadVal BufferID) #P3 BufferID:BufferID) \
											(oFTypeExec (ReadVal BufferID) #P3 BufferID:BufferID) \
											(oFTypeExec (ReadVal BufferID) #P3 BufferID:BufferID) \
											(oFTypeExec (ReadVal BufferID) #P3 BufferID:BufferID)
							)
							Skip BufferID 1 /*skip end*/
						)
						Skip BufferID 1 /*skip end*/
					)
					#ChildFlags: (
						local	strCount = tLine[2]
						if (TypeCast strCount Name BufferID:BufferID) != #null then (
							Skip BufferID 1 /*skip start*/
							local	count = (TypeCast strCount Integer BufferID:BufferID)
									ChildFlagsIndex = 0
							ChildFlags = #()
							ChildFlags.Count = count					
							while
								Result and
								(cfhLine = (ReadVal BufferID FilterStr:"\t "))[1] != "}"
							do ( /*skips end*/
								local	Flags1 = #(),
										Flags2 = #()
								for i = KnownChildFlags.Count to 1 by -1 do (
									Flags1[i] = false
									Flags2[i] = false
								)
								local	cfhName = cfhLine[1],
										cfhTag = (TypeCast cfhName name BufferID:BufferID)
								case cfhTag of (
									#Item: (
										Skip BufferID 1 /*skip start*/
										while
											Result and
											(cfLine = (ReadVal BufferID FilterStr:"\t "))[1] != "}"
										do ( /*skips end*/
											local	cfTag = (TypeCast cfLine[1] name BufferID:BufferID)
											case cfTag of (
												#Flags1: (
													if (TypeCast cfLine[2] name BufferID:BufferID) != #FORMATS_EMPTY_FLAGS then (
														local	TempFlags = (oFTypeExec cfLine #NameArray IDMask:#{2..cfLine.Count} BufferID:BufferID),
																FlagID
														for Flag in TempFlags do (
															FlagID = (QuickSearch KnownChildFlags Flag)
															if FlagID != 0 then
																Flags1[FlagID] = true
															else (
																GIMS.Core.SystemMgr.AddResult #Error  (
																	GIMS.Core.ValueOps.FormatText \
																		v1:"Unknown ChildFlag \"" \
																		v2:Flag \
																		v3:"\" in object \"" \
																		v4:ObjName \
																		v5:"\" found at " \
																		v6:(BufferMgr.GetErrorInfo BufferID) \
																)
																Result = false;
															)
														)
													)
												)
												#Flags2: (
													if (TypeCast cfLine[2] name BufferID:BufferID) != #FORMATS_EMPTY_FLAGS then (
														local	TempFlags = (oFTypeExec cfLine #NameArray IDMask:#{2..cfLine.Count} BufferID:BufferID),
																FlagID
														for Flag in TempFlags do (
															FlagID = (QuickSearch KnownChildFlags Flag)
															if FlagID != 0 then
																Flags2[FlagID] = true
															else (
																GIMS.Core.SystemMgr.AddResult #Error  (
																	GIMS.Core.ValueOps.FormatText \
																		v1:"Unknown ChildFlag \"" \
																		v2:Flag \
																		v3:"\" in object \"" \
																		v4:ObjName \
																		v5:"\" found at " \
																		v6:(BufferMgr.GetErrorInfo BufferID) \
																)
																Result = false;
															)
														)
													)
												)
												default: (
													GIMS.Core.SystemMgr.AddResult #Error  (
														FormatText \
															v1:"Unknown ChildFlags.Item tag \"" \
															v2:cfLine[1] \
															v3:"\" in file \"" \
															v4:DiskPathWithObjName \
															v5:Extension \
															v6:"\" found at " \
															v7:(BufferMgr.GetErrorInfo BufferID) \
													)
													Result = false
												)
											)
										)
									)
									default: (
										GIMS.Core.SystemMgr.AddResult #Error  (
											FormatText \
												v1:"Unknown ChildFlags tag \"" \
												v2:cfhName \
												v3:"\" in file \"" \
												v4:DiskPathWithObjName \
												v5:Extension \
												v6:"\" found at " \
												v7:(BufferMgr.GetErrorInfo BufferID) \
										)
										Result = false
									)
								)
								ChildFlagsIndex += 1
								ChildFlags[ChildFlagsIndex] = #(Flags1, Flags2)
							)
							if not Result then
								Skip BufferID 1 /*skip end*/
							ChildFlags.Count = ChildFlagsIndex
						)
					)
					#Vertices: (
						local	count = (TypeCast tLine[2] Integer BufferID:BufferID)
						Vertices.Count = count
						Skip BufferID 1 /*skip start*/
						for i = 1 to count do
							Vertices[i] = (oFTypeExec (ReadVal BufferID) #P3 BufferID:BufferID)
						Skip BufferID 1 /*skip end*/
					)
					#Shrunk: (
						local	count = (TypeCast tLine[2] Integer BufferID:BufferID)
						Shrunk = #()
						Shrunk.Count = count
						Skip BufferID 1 /*skip start*/
						for i = 1 to count do
							Shrunk[i] = (oFTypeExec (ReadVal BufferID) #P3 BufferID:BufferID)
						Skip BufferID 1 /*skip end*/
					)
					#ComputePolyNeighbors: ()	--SKIP
					#Polygons: (
						local	PolyCount = (TypeCast tLine[2] Integer BufferID:BufferID),
								FaceIndex = 0,
								PrimitiveIndex = 0
						if PolyCount != 0 then (
							FaceMatIDs.Count = PolyCount
							Faces.Count = PolyCount
							Siblings.Count = PolyCount
							Primitives.Count = PolyCount
							Skip BufferID 1 /*skip start*/
							local	PolyHeaderLine, PolyLine
							while
								Result and
								(PolyHeaderLine = (ReadVal BufferID FilterStr:"\t "))[1] != "}"
							do ( /*skips end*/
								local	PolyName = PolyHeaderLine[1],
										PolyHeaderTag = (TypeCast PolyName name BufferID:BufferID)
								case PolyHeaderTag of (
									#Tri: (
										Skip BufferID 1 /*skip start*/
										FaceIndex += 1
										while
											Result and
											(PolyLine = (ReadVal BufferID FilterStr:"\t "))[1] != "}"
										do ( /*skips end*/
											local	PolyTag = (TypeCast PolyLine[1] name BufferID:BufferID)
											case PolyTag of (
												#Vertices: (
													local	VertIndices = (oFTypeExec PolyLine #P3 IDMask:#{2..4} BufferID:BufferID)
													Faces[FaceIndex] = [VertIndices.x + 1, VertIndices.y + 1, VertIndices.z + 1]
												)
												#MaterialIndex:
													FaceMatIDs[FaceIndex] = ((TypeCast PolyLine[2] Integer BufferID:BufferID) + 1)
												#Siblings: (
													local	FaceIndices = (oFTypeExec PolyLine #P3 IDMask:#{2..4} BufferID:BufferID)
													Siblings[FaceIndex] = [FaceIndices.x + 1, FaceIndices.y + 1, FaceIndices.z + 1]
												)
												default: (
													GIMS.Core.SystemMgr.AddResult #Error  (
														FormatText \
															v1:"Unknown Polygon.Tri tag \"" \
															v2:PolyLine[1] \
															v3:"\" in file \"" \
															v4:DiskPathWithObjName \
															v5:Extension \
															v6:"\" found at " \
															v7:(BufferMgr.GetErrorInfo BufferID) \
													)
													Result = false
												)
											)
										)
									)
									#Sphere: (
										Skip BufferID 1 /*skip start*/
										local	PrimitiveMaterialIndex = unsupplied,
												PrimitiveCenter = unsupplied,
												PrimitiveRadius = unsupplied,
												PrimName = (
													FormatText \
														v1:PolyName \
														v2:"_" \
														v3:PolyHeaderLine[2] \
												)
										while
											Result and
											(PolyLine = (ReadVal BufferID FilterStr:"\t "))[1] != "}"
										do ( /*skips end*/
											local	PolyTag = (TypeCast PolyLine[1] name BufferID:BufferID)
											case PolyTag of (
												#MaterialIndex:
													PrimitiveMaterialIndex = ((TypeCast PolyLine[2] Integer BufferID:BufferID) + 1)
												#Center:
													PrimitiveCenter = ((TypeCast PolyLine[2] Integer BufferID:BufferID) + 1)
												#Radius:
													PrimitiveRadius = (TypeCast PolyLine[2] Float BufferID:BufferID)
												default: (
													GIMS.Core.SystemMgr.AddResult #Error  (
														FormatText \
															v1:"Unknown Polygon.Cylinder tag \"" \
															v2:PolyLine[1] \
															v3:"\" in file \"" \
															v4:DiskPathWithObjName \
															v5:Extension \
															v6:"\" found at " \
															v7:(BufferMgr.GetErrorInfo BufferID) \
													)
													Result = false
												)
											)
										)
										PrimitiveIndex += 1
										Primitives[PrimitiveIndex] = #(PolyHeaderTag, PrimName, PrimitiveMaterialIndex, PrimitiveCenter, PrimitiveRadius)
									)
									#Capsule: (
										Skip BufferID 1 /*skip start*/
										local	PrimitiveMaterialIndex = unsupplied,
												PrimitiveCenterTop = unsupplied,
												PrimitiveCenterBottom = unsupplied,
												PrimitiveRadius = unsupplied,
												PrimName = (
													FormatText \
														v1:PolyName \
														v2:"_" \
														v3:PolyHeaderLine[2] \
												)
										while
											Result and
											(PolyLine = (ReadVal BufferID FilterStr:"\t "))[1] != "}"
										do ( /*skips end*/
											local	PolyTag = (TypeCast PolyLine[1] name BufferID:BufferID)
											case PolyTag of (
												#MaterialIndex:
													PrimitiveMaterialIndex = ((TypeCast PolyLine[2] Integer BufferID:BufferID) + 1)
												#CenterTop:
													PrimitiveCenterTop = ((TypeCast PolyLine[2] Integer BufferID:BufferID) + 1)
												#CenterBottom:
													PrimitiveCenterBottom = ((TypeCast PolyLine[2] Integer BufferID:BufferID) + 1)
												#Radius:
													PrimitiveRadius = (TypeCast PolyLine[2] Float BufferID:BufferID)
												default: (
													GIMS.Core.SystemMgr.AddResult #Error  (
														FormatText \
															v1:"Unknown Polygon.Capsule tag \"" \
															v2:PolyLine[1] \
															v3:"\" in file \"" \
															v4:DiskPathWithObjName \
															v5:Extension \
															v6:"\" found at " \
															v7:(BufferMgr.GetErrorInfo BufferID) \
													)
													Result = false
												)
											)
										)
										PrimitiveIndex += 1
										Primitives[PrimitiveIndex] = #(PolyHeaderTag, PrimName, PrimitiveMaterialIndex, PrimitiveCenterTop, PrimitiveCenterBottom, PrimitiveRadius)
									)
									#Box: (
										Skip BufferID 1 /*skip start*/
										local	PrimitiveMaterialIndex = unsupplied,
												PrimitiveVertIndices = unsupplied,
												PrimName = (
													FormatText \
														v1:PolyName \
														v2:"_" \
														v3:PolyHeaderLine[2] \
												)
										while
											Result and
											(PolyLine = (ReadVal BufferID FilterStr:"\t "))[1] != "}"
										do ( /*skips end*/
											local	PolyTag = (TypeCast PolyLine[1] name BufferID:BufferID)
											case PolyTag of (
												#MaterialIndex:
													PrimitiveMaterialIndex = ((TypeCast PolyLine[2] Integer BufferID:BufferID) + 1)
												#Vertices: (
													PrimitiveVertIndices = #(
														((TypeCast PolyLine[2] Integer BufferID:BufferID) + 1),
														((TypeCast PolyLine[3] Integer BufferID:BufferID) + 1),
														((TypeCast PolyLine[4] Integer BufferID:BufferID) + 1),
														((TypeCast PolyLine[5] Integer BufferID:BufferID) + 1)
													)
												)
												default: (
													GIMS.Core.SystemMgr.AddResult #Error  (
														FormatText \
															v1:"Unknown Polygon.Box tag \"" \
															v2:PolyLine[1] \
															v3:"\" in file \"" \
															v4:DiskPathWithObjName \
															v5:Extension \
															v6:"\" found at " \
															v7:(BufferMgr.GetErrorInfo BufferID) \
													)
													Result = false
												)
											)
										)
										PrimitiveIndex += 1
										Primitives[PrimitiveIndex] = #(PolyHeaderTag, PrimName, PrimitiveMaterialIndex, PrimitiveVertIndices)
									)
									#Cylinder: (
										Skip BufferID 1 /*skip start*/
										local	PrimitiveMaterialIndex = unsupplied,
												PrimitiveCenterTop = unsupplied,
												PrimitiveCenterBottom = unsupplied,
												PrimitiveRadius = unsupplied,
												PrimName = (
													FormatText \
														v1:PolyName \
														v2:"_" \
														v3:PolyHeaderLine[2] \
												)
										while
											Result and
											(PolyLine = (ReadVal BufferID FilterStr:"\t "))[1] != "}"
										do ( /*skips end*/
											local	PolyTag = (TypeCast PolyLine[1] name BufferID:BufferID)
											case PolyTag of (
												#MaterialIndex:
													PrimitiveMaterialIndex = ((TypeCast PolyLine[2] Integer BufferID:BufferID) + 1)
												#CenterTop:
													PrimitiveCenterTop = ((TypeCast PolyLine[2] Integer BufferID:BufferID) + 1)
												#CenterBottom:
													PrimitiveCenterBottom = ((TypeCast PolyLine[2] Integer BufferID:BufferID) + 1)
												#Radius:
													PrimitiveRadius = (TypeCast PolyLine[2] Float BufferID:BufferID)
												default: (
													GIMS.Core.SystemMgr.AddResult #Error  (
														FormatText \
															v1:"Unknown Polygon.Cylinder tag \"" \
															v2:PolyLine[1] \
															v3:"\" in file \"" \
															v4:DiskPathWithObjName \
															v5:Extension \
															v6:"\" found at " \
															v7:(BufferMgr.GetErrorInfo BufferID) \
													)
													Result = false
												)
											)
										)
										PrimitiveIndex += 1
										Primitives[PrimitiveIndex] = #(PolyHeaderTag, PrimName, PrimitiveMaterialIndex, PrimitiveCenterTop, PrimitiveCenterBottom, PrimitiveRadius)
									)
									default: (
										GIMS.Core.SystemMgr.AddResult #Error  (
											FormatText \
												v1:"Unknown Polygon tag \"" \
												v2:PolyHeaderLine[1] \
												v3:"\" in file \"" \
												v4:DiskPathWithObjName \
												v5:Extension \
												v6:"\" found at " \
												v7:(BufferMgr.GetErrorInfo BufferID) \
										)
										Result = false
									)
								)
							)
							FaceMatIDs.Count = FaceIndex
							Faces.Count = FaceIndex
							Primitives.Count = PrimitiveIndex
						)
					)
					#Materials: (
						local	count = (TypeCast tLine[2] Integer BufferID:BufferID)
						if (count != 0) then (
							Materials.Count = count
							Skip BufferID 1 /*skip start*/
							for i = 1 to count while Result do (
								Skip BufferID 1 /*skip material header*/
								Skip BufferID 1 /*skip material start*/
								local	Mat_Index = 0,
										ProcId = 0,
										RoomId = 0,
										PedDensity = 0,
										PolyFlags = 0,
										MaterialColorIndex = 0,
										MatLine
								while
									Result and
									(MatLine = (ReadVal BufferID FilterStr:"\t "))[1] != "}"
								do ( /*skips material end*/
									local	MatTag = (TypeCast MatLine[1] name BufferID:BufferID)
									case MatTag of (
										#MaterialIndex:
											Mat_Index = ((TypeCast MatLine[2] Integer BufferID:BufferID) + 1)
										#ProcId:
											ProcId = (TypeCast MatLine[2] Integer BufferID:BufferID)
										#RoomId:
											RoomId = (TypeCast MatLine[2] Integer BufferID:BufferID)
										#PedDensity:
											PedDensity = (TypeCast MatLine[2] Integer BufferID:BufferID)
										#PolyFlags: (
											if (TypeCast MatLine[2] name BufferID:BufferID) != #FORMATS_EMPTY_FLAGS then (
												local	TempFlags = (oFTypeExec MatLine #NameArray IDMask:#{2..MatLine.Count} BufferID:BufferID),
														FlagID,
														BitSet = Bit.Set
												for Flag in TempFlags do (
													FlagID = (QuickSearch KnownPolyFlags Flag)
													if FlagID != 0 then
														PolyFlags = (BitSet PolyFlags FlagID true)
													else (
														GIMS.Core.SystemMgr.AddResult #Error  (
															GIMS.Core.ValueOps.FormatText \
																v1:"Unknown flag \"" \
																v2:Flag \
																v3:"\" in object \"" \
																v4:ObjName \
																v5:"\" found at " \
																v6:(BufferMgr.GetErrorInfo BufferID) \
														)
														Result = false;
													)
												)
											)
										)
										#MaterialColorIndex:
											MaterialColorIndex = (TypeCast MatLine[2] Integer BufferID:BufferID)
										default: (
											GIMS.Core.SystemMgr.AddResult #Error  (
												FormatText \
													v1:"Unknown Material tag \"" \
													v2:MatLine[1] \
													v3:"\" in file \"" \
													v4:DiskPathWithObjName \
													v5:Extension \
													v6:"\" found at " \
													v7:(BufferMgr.GetErrorInfo BufferID) \
											)
											Result = false
										)
									)
								)
								if not Result then
									Skip BufferID 1 /*skip end*/
								Materials[i] = #(Mat_Index, PolyFlags, MaterialColorIndex, ProcId, RoomId, PedDensity)
							)
							Skip BufferID 1 /*skip end*/
						)
					)
					#Material: (
						Skip BufferID 1 /*skip start*/
						local	Mat_Index = 0,
								ProcId = 0,
								RoomId = 0,
								PedDensity = 0,
								PolyFlags = 0,
								MaterialColorIndex = 0,
								MatLine
						while
							Result and
							(MatLine = (ReadVal BufferID FilterStr:"\t "))[1] != "}"
						do ( /*skips end*/
							local	MatTag = (TypeCast MatLine[1] name BufferID:BufferID)
							case MatTag of (
								#MaterialIndex:
									Mat_Index = ((TypeCast MatLine[2] Integer BufferID:BufferID) + 1)
								#ProcId:
									ProcId = (TypeCast MatLine[2] Integer BufferID:BufferID)
								#RoomId:
									RoomId = (TypeCast MatLine[2] Integer BufferID:BufferID)
								#PedDensity:
									PedDensity = (TypeCast MatLine[2] Integer BufferID:BufferID)
								#PolyFlags: (
									if (TypeCast MatLine[2] name BufferID:BufferID) != #FORMATS_EMPTY_FLAGS then (
										local	TempFlags = (oFTypeExec MatLine #NameArray IDMask:#{2..MatLine.Count} BufferID:BufferID),
												FlagID,
												BitSet = Bit.Set
										for Flag in TempFlags do (
											FlagID = (QuickSearch KnownPolyFlags Flag)
											if FlagID != 0 then
												PolyFlags = (BitSet PolyFlags FlagID true)
											else (
												GIMS.Core.SystemMgr.AddResult #Error  (
													GIMS.Core.ValueOps.FormatText \
														v1:"Unknown flag \"" \
														v2:Flag \
														v3:"\" in object \"" \
														v4:ObjName \
														v5:"\" found at " \
														v6:(BufferMgr.GetErrorInfo BufferID) \
												)
												Result = false;
											)
										)
									)
								)
								#MaterialColorIndex:
									MaterialColorIndex = (TypeCast MatLine[2] Integer BufferID:BufferID)
								default: (
									GIMS.Core.SystemMgr.AddResult #Error  (
										FormatText \
											v1:"Unknown Material tag \"" \
											v2:MatLine[1] \
											v3:"\" in file \"" \
											v4:DiskPathWithObjName \
											v5:Extension \
											v6:"\" found at " \
											v7:(BufferMgr.GetErrorInfo BufferID) \
									)
									Result = false
								)
							)
						)
						if not Result then
							Skip BufferID 1 /*skip end*/
						Append Materials #(Mat_Index, PolyFlags, MaterialColorIndex, ProcId, RoomId, PedDensity)
					)
					#VertexColors: (
						local	param2 = tLine[2]
						if (TypeCast param2 Name BufferID:BufferID) != #null then (
							local	count = (TypeCast param2 Integer BufferID:BufferID)
							VertexColors = #()
							VertexColors.Count = count
							Skip BufferID 1 /*skip start*/
							for i = 1 to count do
								VertexColors[i] = ((oFTypeExec (ReadVal BufferID) #P4 BufferID:BufferID) / 255)
							Skip BufferID 1 /*skip end*/
						)
					)
					#MaterialColors: (
						local	param2 = tLine[2]
						if (TypeCast param2 Name BufferID:BufferID) != #null then (
							local	count = (TypeCast param2 Integer BufferID:BufferID)
							if (count != 0) then (
								MaterialColors = #()
								MaterialColors.Count = count
								Skip BufferID 1 /*skip start*/
								for i = 1 to count do
									MaterialColors[i] = (oFTypeExec (ReadVal BufferID) #Color BufferID:BufferID)
								Skip BufferID 1 /*skip end*/
							)
						)
					)
					#Children: (
						Skip BufferID 1 /*skip start*/
						Children.Count = (TypeCast tLine[2] Integer BufferID:BufferID)
						local	ChildIndex = 1,
								ChildDiskPathWithObjName = (
									FormatText \
										v1:DiskPathWithObjName \
										v2:"." \
										v3:ObjName
								),
								HaveOKChildren = false,
								ChildOK = true
						while
							ChildOK and
							(ReadVal BufferID FilterStr:"\t " NoSeek:true)[1] != "}"
						do (
							local	NewItem = (grcPhBound DiskPath:ChildDiskPathWithObjName ObjName:(ChildIndex as String))
							if (
								NewItem.Read BufferID:BufferID \
									ReportProgress:ReportProgress \
									BufferMgr:BufferMgr \
									DiskPathWithObjName:ChildDiskPathWithObjName \
									Skip:Skip \
									ReadVal:ReadVal \
									TypeCast:TypeCast \
									oFTypeExec:oFTypeExec \
									GetProgress:GetProgress \
									UpdateProgress:UpdateProgress \
									FormatText:FormatText \
									NotEOF:NotEOF \
									grcPhBound:grcPhBound \
									ValueOps:ValueOps \
									AppendMHL:AppendMHL \
									FetchMHL:FetchMHL \
									QuickSearch:QuickSearch \
									ObjectNames:ObjectNames \
									NoCaseOrderComparator:NoCaseOrderComparator \
									UpdateMatrix:UpdateMatrix
							) then (
								HaveOKChildren = true
								Children[ChildIndex] = NewItem
							) else
								ChildOK = false
							ChildIndex += 1
						)
						if not HaveOKChildren then
							Result = false
						Skip BufferID 1 /*skip end*/
					)
					default: (
						GIMS.Core.SystemMgr.AddResult #Error  (
							FormatText \
								v1:"Unknown PhBound tag \"" \
								v2:tLine[1] \
								v3:"\" in file \"" \
								v4:DiskPathWithObjName \
								v5:Extension \
								v6:"\" found at " \
								v7:(BufferMgr.GetErrorInfo BufferID) \
						)
						Result = false
					)
				)
				Result
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#BufferID, #tLine, #DiskPath, #ObjName, #Extension, #DiskPathWithObjName), #(BufferID, tLine, DiskPath, ObjName, Extension, DiskPathWithObjName)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn ReadCodeWalkerMaterial ItemNode = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	CWXML = GIMS.CurrentGame.Core.TypeLibrary.CWXML,
						Mat_Index = ((CWXML.GetChildInt ItemNode "Type" DefaultVal:0) + 1),
						ProcId = (CWXML.GetChildInt ItemNode "ProceduralID" DefaultVal:0),
						RoomId = (CWXML.GetChildInt ItemNode "RoomID" DefaultVal:0),
						PedDensity = (CWXML.GetChildInt ItemNode "PedDensity" DefaultVal:0),
						MaterialColorIndex = (CWXML.GetChildInt ItemNode "MaterialColourIndex" DefaultVal:0),
						PolyFlags = (CWXML.ParsePolyFlags (CWXML.GetChildText ItemNode "Flags") KnownPolyFlags)
				#(Mat_Index, PolyFlags, MaterialColorIndex, ProcId, RoomId, PedDensity)
			/*<ERRHANDLER>*/) catch #(1, 0, 0, 0, 0, 0)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn ReadCodeWalkerFromNode BoundNode ChildName:unsupplied = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if No BoundNode then
					return false
				local	CWXML = GIMS.CurrentGame.Core.TypeLibrary.CWXML,
						TypeStr = (CWXML.GetAttr BoundNode "type")
				Type = (CWXML.MapBoundType TypeStr)
				if No Type then (
					GIMS.Core.SystemMgr.AddResult #Warning (
						GIMS.Core.ValueOps.FormatText \
							v1:"Skipped unknown CodeWalker bound type \"" \
							v2:TypeStr \
							v3:"\" in \"" \
							v4:ObjName \
							v5:"\"."
					)
					return false
				)
				ObjName = (CWXML.CleanResourceName ObjName)
				if Supplied ChildName then (
					if
						Have ChildName and
						ChildName.Count != 0
					then
						ObjName = ChildName
				)
				local	BoundName = (CWXML.GetChildText BoundNode "Name")
				if
					Have BoundName and
					BoundName.Count != 0
				then
					ObjName = BoundName
				Bounds.AABB.bMin = (CWXML.GetVec3 BoundNode "BoxMin" DefaultVal:[0, 0, 0])
				Bounds.AABB.bMax = (CWXML.GetVec3 BoundNode "BoxMax" DefaultVal:[0, 0, 0])
				Bounds.Centroid = (CWXML.GetVec3 BoundNode "BoxCenter" DefaultVal:[0, 0, 0])
				Bounds.Center = (CWXML.GetVec3 BoundNode "SphereCenter" DefaultVal:[0, 0, 0])
				Bounds.Radius = (CWXML.GetChildFloat BoundNode "SphereRadius" DefaultVal:0.0)
				Margin = (CWXML.GetChildFloat BoundNode "Margin" DefaultVal:0.0)
				if Type == #BoundCapsule then
					CapsuleHalfHeight = ((Bounds.AABB.bMax.z - Bounds.AABB.bMin.z) / 2)
				local	GeomCenterNode = (CWXML.GetChild BoundNode "GeometryCenter")
				if Have GeomCenterNode then (
					VertexOffset = (CWXML.GetVec3 BoundNode "GeometryCenter" DefaultVal:[0, 0, 0])
					VertexOffset_UnkPart = (CWXML.GetAttrFloat GeomCenterNode "w" DefaultVal:(CWXML.GetChildFloat BoundNode "UnkFloat1" DefaultVal:0.0))
				)
				local	MatsNode = (CWXML.GetChild BoundNode "Materials")
				if Have MatsNode then (
					local	MatItems = (MatsNode.SelectNodes "Item"),
							MatCount = MatItems.Count
					Materials.Count = MatCount
					for i = 0 to (MatCount - 1) do
						Materials[i + 1] = (ReadCodeWalkerMaterial (MatItems.Item[i]))
				)
				if Materials.Count == 0 then (
					local	PolyFlagsNode = (CWXML.GetChild BoundNode "PolyFlags"),
							PolyFlags = 0
					if Have PolyFlagsNode then (
						local	FlagValue = (CWXML.GetAttr PolyFlagsNode "value" DefaultVal:undefined)
						if Have FlagValue then
							PolyFlags = (GIMS.Core.ValueOps.TypeCast FlagValue Integer)
						else
							PolyFlags = (CWXML.ParsePolyFlags PolyFlagsNode.InnerText KnownPolyFlags)
					)
					Materials[1] = #(
						((CWXML.GetChildInt BoundNode "MaterialIndex" DefaultVal:0) + 1),
						PolyFlags,
						(CWXML.GetChildInt BoundNode "MaterialColourIndex" DefaultVal:0),
						(CWXML.GetChildInt BoundNode "ProceduralID" DefaultVal:0),
						(CWXML.GetChildInt BoundNode "RoomID" DefaultVal:0),
						(CWXML.GetChildInt BoundNode "PedDensity" DefaultVal:0)
					)
				)
				local	VertsNode = (CWXML.GetChild BoundNode "Vertices")
				if Have VertsNode then
					Vertices = (CWXML.ParseVec3Array VertsNode.InnerText)
				local	ColoursNode = (CWXML.GetChild BoundNode "VertexColours")
				if Have ColoursNode then (
					local	ColourFloats = (CWXML.ParseFloatList ColoursNode.InnerText),
							ColourCount = (ColourFloats.Count / 4)
					if ColourCount != 0 then (
						VertexColors = #()
						VertexColors.Count = ColourCount
						local	Src = 1
						for i = 1 to ColourCount do (
							VertexColors[i] = [ColourFloats[Src], ColourFloats[Src + 1], ColourFloats[Src + 2]]
							Src += 4
						)
					)
				)
				local	PolygonsNode = (CWXML.GetChild BoundNode "Polygons")
				if Have PolygonsNode then (
					local	PolyNodes = PolygonsNode.ChildNodes,
							FaceIndex = 0,
							PrimitiveIndex = 0,
							PolyCount = PolyNodes.Count
					FaceMatIDs.Count = PolyCount
					Faces.Count = PolyCount
					Primitives.Count = PolyCount
					for i = 0 to (PolyCount - 1) do (
						local	PolyNode = (PolyNodes.Item[i])
						if Have PolyNode then (
							local	TypeName = (ToUpper PolyNode.Name)
							if
								TypeName != "#TEXT" and
								TypeName != "#COMMENT" and
								TypeName != "#WHITESPACE"
							then (
								local	MtlID = ((CWXML.GetAttrInt PolyNode "m" DefaultVal:0) + 1)
								case TypeName of (
									"TRIANGLE": (
										FaceIndex += 1
										Faces[FaceIndex] = [(CWXML.GetAttrInt PolyNode "v1") + 1, (CWXML.GetAttrInt PolyNode "v2") + 1, (CWXML.GetAttrInt PolyNode "v3") + 1]
										FaceMatIDs[FaceIndex] = MtlID
									)
									"SPHERE": (
										PrimitiveIndex += 1
										Primitives[PrimitiveIndex] = #(#Sphere, ("Sphere_" + (PrimitiveIndex as String)), MtlID, (CWXML.GetAttrInt PolyNode "v") + 1, (CWXML.GetAttrFloat PolyNode "radius"))
									)
									"CAPSULE": (
										PrimitiveIndex += 1
										Primitives[PrimitiveIndex] = #(#Capsule, ("Capsule_" + (PrimitiveIndex as String)), MtlID, (CWXML.GetAttrInt PolyNode "v1") + 1, (CWXML.GetAttrInt PolyNode "v2") + 1, (CWXML.GetAttrFloat PolyNode "radius"))
									)
									"BOX": (
										PrimitiveIndex += 1
										Primitives[PrimitiveIndex] = #(#Box, ("Box_" + (PrimitiveIndex as String)), MtlID, #((CWXML.GetAttrInt PolyNode "v1") + 1, (CWXML.GetAttrInt PolyNode "v2") + 1, (CWXML.GetAttrInt PolyNode "v3") + 1, (CWXML.GetAttrInt PolyNode "v4") + 1))
									)
									"CYLINDER": (
										PrimitiveIndex += 1
										Primitives[PrimitiveIndex] = #(#Cylinder, ("Cylinder_" + (PrimitiveIndex as String)), MtlID, (CWXML.GetAttrInt PolyNode "v1") + 1, (CWXML.GetAttrInt PolyNode "v2") + 1, (CWXML.GetAttrFloat PolyNode "radius"))
									)
									default: (
										GIMS.Core.SystemMgr.AddResult #Warning (
											GIMS.Core.ValueOps.FormatText \
												v1:"Skipped unknown CodeWalker polygon \"" \
												v2:PolyNode.Name \
												v3:"\" in \"" \
												v4:ObjName \
												v5:"\"."
										)
									)
								)
							)
						)
					)
					FaceMatIDs.Count = FaceIndex
					Faces.Count = FaceIndex
					Primitives.Count = PrimitiveIndex
				)
				if Type == #BoundComposite then (
					local	ChildrenNode = (CWXML.GetChild BoundNode "Children"),
							grcPhBound = GIMS.CurrentGame.Core.TypeLibrary.grcPhBound
					Children = #()
					ChildTransforms = #()
					ChildFlags = #()
					if Have ChildrenNode then (
						local	ChildItems = (ChildrenNode.SelectNodes "Item"),
								ChildCount = ChildItems.Count
						Children.Count = ChildCount
						ChildTransforms.Count = ChildCount
						ChildFlags.Count = ChildCount
						for i = 0 to (ChildCount - 1) do (
							local	ChildItem = (ChildItems.Item[i]),
									ChildBound = (grcPhBound DiskPath:DiskPath ObjName:(ObjName + "_child_" + ((i + 1) as String)) Extension:Extension),
									ChildTMNode = (CWXML.GetChild ChildItem "CompositeTransform"),
									Flags1Text = (CWXML.GetChildText ChildItem "CompositeFlags1"),
									Flags2Text = (CWXML.GetChildText ChildItem "CompositeFlags2")
							if (ChildBound.ReadCodeWalkerFromNode ChildItem) then
								Children[i + 1] = ChildBound
							else
								Children[i + 1] = undefined
							if Have ChildTMNode then
								ChildTransforms[i + 1] = (CWXML.ParseMatrix4 ChildTMNode.InnerText)
							else
								ChildTransforms[i + 1] = (Matrix3 1)
							ChildFlags[i + 1] = #(
								(CWXML.ParseChildFlagBools Flags1Text KnownChildFlags),
								(CWXML.ParseChildFlagBools Flags2Text KnownChildFlags)
							)
						)
					)
				)
				true
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#DiskPath, #ObjName, #Extension, #Type), #(DiskPath, ObjName, Extension, Type)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn ReadCodeWalkerXML = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	CWXML = GIMS.CurrentGame.Core.TypeLibrary.CWXML,
						FilePath = (DiskPath + ObjName + Extension),
						XMLDoc = (CWXML.LoadDocument FilePath)
				if No XMLDoc then
					return false
				SourceFormat = #XML
				SourceXMLPath = (CWXML.CacheSourceXML FilePath)
				Extension = (CWXML.GetKindExtension #Bound)
				local	Root = XMLDoc.DocumentElement,
						BoundNode = Root
				if Have Root then (
					local	RootName = (ToUpper Root.Name)
					if RootName == "BOUNDSFILE" then
						BoundNode = (CWXML.GetChild Root "Bounds")
				)
				(ReadCodeWalkerFromNode BoundNode)
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#DiskPath, #ObjName, #Extension), #(DiskPath, ObjName, Extension)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Read BufferID:unsupplied \
			ReportProgress:true \
			BufferMgr:unsupplied \
			DiskPathWithObjName:unsupplied \
			Skip:unsupplied \
			ReadVal:unsupplied \
			TypeCast:unsupplied \
			oFTypeExec:unsupplied \
			GetProgress:unsupplied \
			UpdateProgress:unsupplied \
			FormatText:unsupplied \
			NotEOF:unsupplied \
			grcPhBound:unsupplied \
			ValueOps:unsupplied \
			AppendMHL:unsupplied \
			FetchMHL:unsupplied \
			QuickSearch:unsupplied \
			ObjectNames:unsupplied \
			NoCaseOrderComparator:unsupplied \
			UpdateMatrix:unsupplied = \
		(
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	Separate = false,
						Result = true
				if not Supplied ValueOps then (
					local	StringOps = GIMS.Core.StringOps,
							ArrayOps = GIMS.Core.ArrayOps
					ValueOps = GIMS.Core.ValueOps
					grcPhBound = GIMS.CurrentGame.Core.TypeLibrary.grcPhBound
					BufferMgr = GIMS.Core.BufferMgr
					TypeCast = ValueOps.TypeCast
					UpdateProgress = GIMS.Core.GUIMgr.UpdateProgress
					FormatText = ValueOps.FormatText
					UpdateMatrix = ValueOps.UpdateMatrix
					Skip = BufferMgr.Skip
					ReadVal = BufferMgr.ReadVal
					oFTypeExec = StringOps.oFTypeExec
					GetProgress = BufferMgr.GetProgress
					NotEOF = BufferMgr.NotEOF
					AppendMHL = ArrayOps.AppendMHL
					FetchMHL = ArrayOps.FetchMHL
					QuickSearch = ArrayOps.QuickSearch
					NoCaseOrderComparator = StringOps.NoCaseOrderComparator
					ObjectNames = GIMS.CurrentGame.Core.DB.ObjectNames
				)
				if not Supplied DiskPathWithObjName then
					DiskPathWithObjName = (DiskPath + ObjName)
				if not Supplied BufferID then (
					local	FilePath = (DiskPathWithObjName + Extension),
							ExtName = (ToUpper (SubstituteString Extension "." ""))
					if
						(MatchPattern ExtName Pattern:"XML") or
						(GIMS.CurrentGame.Core.TypeLibrary.CWXML.IsXMLFile FilePath)
					then
						return (ReadCodeWalkerXML())
					BufferID = (BufferMgr.ReadFile FilePath Mode:#TxtLines)
					Separate = true
				)
				if BufferID == false then
					Result = false
				else (
					local	ObjHash = (
						try
							(ObjName + "L") as Integer64
						catch
							undefined
					)
					if Have ObjHash then
						ObjName = (FetchMHL ObjectNames ObjHash)
					else
						AppendMHL ObjectNames ObjName
					local	tLine
					while
						Result and
						(NotEOF BufferID) and
						(tLine = (ReadVal BufferID FilterStr:"\t "))[1] != "}"
					do (	/*skips end*/
						if ReportProgress then
							UpdateProgress #Progress (GetProgress BufferID)
						else
							UpdateProgress #None 0
						Result = (
							ParseTag BufferID tLine \
								BufferMgr \
								DiskPathWithObjName \
								Skip \
								ReadVal \
								TypeCast \
								oFTypeExec \
								GetProgress \
								UpdateProgress \
								ReportProgress \
								FormatText \
								NotEOF \
								grcPhBound \
								ValueOps \
								AppendMHL \
								FetchMHL \
								QuickSearch \
								ObjectNames \
								NoCaseOrderComparator \
								UpdateMatrix
						)
					)
					if Separate then
						BufferMgr.ClearBuffer BufferID
				)
				Result
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#DiskPath, #ObjName, #Extension, #DiskPathWithObjName, #Type), #(DiskPath, ObjName, Extension, DiskPathWithObjName, Type)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn _WriteMaterial BufferID Mtl TabString WriteVal FormatText TypeCast Index:unsupplied = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if Supplied Index then
					WriteVal BufferID (FormatText v1:TabString v2:"Material " v3:(Index - 1))
				else
					WriteVal BufferID (TabString + "Material")
				WriteVal BufferID (TabString + "{")
				WriteVal BufferID (FormatText v1:TabString v2:"\tMaterialIndex " v3:(TypeCast (Mtl[1] - 1) Integer BufferID:BufferID))
				WriteVal BufferID (FormatText v1:TabString v2:"\tProcId " v3:(TypeCast Mtl[4] Integer BufferID:BufferID))
				WriteVal BufferID (FormatText v1:TabString v2:"\tRoomId " v3:(TypeCast Mtl[5] Integer BufferID:BufferID))
				WriteVal BufferID (FormatText v1:TabString v2:"\tPedDensity " v3:(TypeCast Mtl[6] Integer BufferID:BufferID))
				local	ToHighReg = GIMS.Core.StringOps.ToHighReg,
						PolyFlags = Mtl[2],
						BitGet = Bit.Get,
						FlagWritten = false
				WriteVal BufferID (TabString + "\tPolyFlags")
				for i = 1 to KnownPolyFlags.Count where (BitGet PolyFlags i) do (
					WriteVal BufferID (" " + (ToHighReg (KnownPolyFlags[i] as String))) AppendLast:true
					FlagWritten = true
				)
				if not FlagWritten then
					WriteVal BufferID " FORMATS_EMPTY_FLAGS" AppendLast:true
				WriteVal BufferID (FormatText v1:TabString v2:"\tMaterialColorIndex " v3:(TypeCast Mtl[3] Integer BufferID:BufferID))
				WriteVal BufferID (TabString + "}")
				OK
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#Mtl), #(Mtl)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn WriteCodeWalkerNode SS Tab TagName CompositeTM:unsupplied CompositeFlags:unsupplied = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	CWXML = GIMS.CurrentGame.Core.TypeLibrary.CWXML,
						Inner = (Tab + " "),
						Inner2 = (Inner + " "),
						TypeStr = (CWXML.BoundTypeXML Type),
						AABBMin = [0, 0, 0],
						AABBMax = [0, 0, 0],
						Centroid = [0, 0, 0],
						Center = [0, 0, 0],
						Radius = 0.0
				if Have Bounds then (
					if Have Bounds.AABB then (
						if (Supplied Bounds.AABB.bMin) then
							AABBMin = Bounds.AABB.bMin
						if (Supplied Bounds.AABB.bMax) then
							AABBMax = Bounds.AABB.bMax
					)
					if (Supplied Bounds.Centroid) then
						Centroid = Bounds.Centroid
					if (Supplied Bounds.Center) then
						Center = Bounds.Center
					if (Supplied Bounds.Radius) then
						Radius = Bounds.Radius
				)
				Format "%" (Tab + "<" + TagName + " type=\"" + TypeStr + "\">\n") To:SS
				Format "%" (Inner + "<Name>" + (CWXML.XMLEscape ObjName) + "</Name>\n") To:SS
				Format "%" (CWXML.Vec3Tag Inner "BoxMin" AABBMin) To:SS
				Format "%" (CWXML.Vec3Tag Inner "BoxMax" AABBMax) To:SS
				Format "%" (CWXML.Vec3Tag Inner "BoxCenter" Centroid) To:SS
				Format "%" (CWXML.Vec3Tag Inner "SphereCenter" Center) To:SS
				Format "%" (CWXML.ValueTag Inner "SphereRadius" Radius) To:SS
				if Supplied Margin then
					Format "%" (CWXML.ValueTag Inner "Margin" Margin) To:SS
				if Have VertexOffset then (
					local	Unk = VertexOffset_UnkPart
					if No Unk then
						Unk = 0
					Format "%" (Inner + "<GeometryCenter " + (CWXML.Vec3Attrs VertexOffset) + " w=\"" + (CWXML.FormatFloat Unk) + "\" />\n") To:SS
				)
				if Materials.Count != 0 then (
					Format "%" (Inner + "<Materials>\n") To:SS
					for Mtl in Materials do (
						local	MatIndex = 0,
								PolyFlags = 0,
								MatColor = 0,
								ProcId = 0,
								RoomId = 0,
								PedDensity = 0
						if Have Mtl then (
							if Have Mtl[1] then MatIndex = ((Mtl[1] as Integer) - 1)
							if Have Mtl[2] then PolyFlags = Mtl[2]
							if Have Mtl[3] then MatColor = Mtl[3]
							if Have Mtl[4] then ProcId = Mtl[4]
							if Have Mtl[5] then RoomId = Mtl[5]
							if Have Mtl[6] then PedDensity = Mtl[6]
						)
						if MatIndex < 0 then
							MatIndex = 0
						Format "%" (Inner2 + "<Item>\n") To:SS
						Format "%" (CWXML.ValueTag (Inner2 + " ") "Type" MatIndex) To:SS
						Format "%" (CWXML.ValueTag (Inner2 + " ") "ProceduralID" ProcId) To:SS
						Format "%" (CWXML.ValueTag (Inner2 + " ") "RoomID" RoomId) To:SS
						Format "%" (CWXML.ValueTag (Inner2 + " ") "PedDensity" PedDensity) To:SS
						Format "%" (CWXML.ValueTag (Inner2 + " ") "MaterialColourIndex" MatColor) To:SS
						Format "%" ((Inner2 + " ") + "<Flags>" + (CWXML.FormatFlagBitArray PolyFlags KnownPolyFlags) + "</Flags>\n") To:SS
						Format "%" (Inner2 + "</Item>\n") To:SS
					)
					Format "%" (Inner + "</Materials>\n") To:SS
				)
				if Vertices.Count != 0 then (
					Format "%" (Inner + "<Vertices>\n") To:SS
					for Vert in Vertices do (
						local	P = Vert
						if No P then
							P = [0, 0, 0]
						Format "%" (Inner2 + (CWXML.FormatFloat P.x) + " " + (CWXML.FormatFloat P.y) + " " + (CWXML.FormatFloat P.z) + "\n") To:SS
					)
					Format "%" (Inner + "</Vertices>\n") To:SS
				)
				if
					(Supplied VertexColors) and
					Have VertexColors and
					VertexColors.Count != 0
				then (
					Format "%" (Inner + "<VertexColours>\n") To:SS
					for Clr in VertexColors do (
						local	P = Clr
						if No P then
							P = [255, 255, 255]
						Format "%" (Inner2 + (CWXML.FormatFloat P.x) + " " + (CWXML.FormatFloat P.y) + " " + (CWXML.FormatFloat P.z) + " 255\n") To:SS
					)
					Format "%" (Inner + "</VertexColours>\n") To:SS
				)
				if
					Faces.Count != 0 or
					Primitives.Count != 0
				then (
					Format "%" (Inner + "<Polygons>\n") To:SS
					for i = 1 to Faces.Count do (
						local	Face = Faces[i],
								MtlID = 0
						if Have FaceMatIDs[i] then
							MtlID = ((FaceMatIDs[i] as Integer) - 1)
						if MtlID < 0 then
							MtlID = 0
						if Have Face then
							Format "%" (Inner2 + "<Triangle m=\"" + (MtlID as String) + "\" v1=\"" + (((Face.x as Integer) - 1) as String) + "\" v2=\"" + (((Face.y as Integer) - 1) as String) + "\" v3=\"" + (((Face.z as Integer) - 1) as String) + "\" />\n") To:SS
					)
					for Prim in Primitives do (
						if Have Prim then (
							local	PType = Prim[1],
									MtlID = 0
							if Have Prim[3] then
								MtlID = ((Prim[3] as Integer) - 1)
							if MtlID < 0 then
								MtlID = 0
							case PType of (
								#Sphere:
									Format "%" (Inner2 + "<Sphere m=\"" + (MtlID as String) + "\" v=\"" + (((Prim[4] as Integer) - 1) as String) + "\" radius=\"" + (CWXML.FormatFloat Prim[5]) + "\" />\n") To:SS
								#Capsule:
									Format "%" (Inner2 + "<Capsule m=\"" + (MtlID as String) + "\" v1=\"" + (((Prim[4] as Integer) - 1) as String) + "\" v2=\"" + (((Prim[5] as Integer) - 1) as String) + "\" radius=\"" + (CWXML.FormatFloat Prim[6]) + "\" />\n") To:SS
								#Cylinder:
									Format "%" (Inner2 + "<Cylinder m=\"" + (MtlID as String) + "\" v1=\"" + (((Prim[4] as Integer) - 1) as String) + "\" v2=\"" + (((Prim[5] as Integer) - 1) as String) + "\" radius=\"" + (CWXML.FormatFloat Prim[6]) + "\" />\n") To:SS
								#Box: (
									local	Verts = Prim[4]
									if Have Verts then
										Format "%" (Inner2 + "<Box m=\"" + (MtlID as String) + "\" v1=\"" + (((Verts[1] as Integer) - 1) as String) + "\" v2=\"" + (((Verts[2] as Integer) - 1) as String) + "\" v3=\"" + (((Verts[3] as Integer) - 1) as String) + "\" v4=\"" + (((Verts[4] as Integer) - 1) as String) + "\" />\n") To:SS
								)
								default: ()
							)
						)
					)
					Format "%" (Inner + "</Polygons>\n") To:SS
				)
				if Type == #BoundComposite then (
					Format "%" (Inner + "<Children>\n") To:SS
					for i = 1 to Children.Count do (
						local	Child = Children[i]
						if Have Child then (
							local	ChildTM = (if i <= ChildTransforms.Count then ChildTransforms[i] else (Matrix3 1)),
									ChildFl = unsupplied
							if
								Supplied ChildFlags and
								i <= ChildFlags.Count
							then
								ChildFl = ChildFlags[i]
							Child.WriteCodeWalkerNode SS Inner2 "Item" CompositeTM:ChildTM CompositeFlags:ChildFl
						) else
							Format "%" (Inner2 + "<Item />\n") To:SS
					)
					Format "%" (Inner + "</Children>\n") To:SS
				)
				if Supplied CompositeTM then
					Format "%" (Inner + "<CompositeTransform>" + (CWXML.FormatMatrix4 CompositeTM) + "</CompositeTransform>\n") To:SS
				if Supplied CompositeFlags then (
					local	Flags1 = "",
							Flags2 = ""
					if Have CompositeFlags[1] then
						Flags1 = (CWXML.FormatBoolFlags CompositeFlags[1] KnownChildFlags)
					if Have CompositeFlags[2] then
						Flags2 = (CWXML.FormatBoolFlags CompositeFlags[2] KnownChildFlags)
					Format "%" (Inner + "<CompositeFlags1>" + Flags1 + "</CompositeFlags1>\n") To:SS
					Format "%" (Inner + "<CompositeFlags2>" + Flags2 + "</CompositeFlags2>\n") To:SS
				)
				Format "%" (Tab + "</" + TagName + ">\n") To:SS
				OK
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn WriteCodeWalkerXML = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	CWXML = GIMS.CurrentGame.Core.TypeLibrary.CWXML,
						FilePath = (DiskPath + ObjName + Extension),
						SS = (StringStream "")
				Format "%" "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" To:SS
				WriteCodeWalkerNode SS "" "Bounds"
				CWXML.WriteXMLFile FilePath (SS as String)
				Free SS
				OK
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#DiskPath, #ObjName, #Extension), #(DiskPath, ObjName, Extension)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Write \
			BufferID:unsupplied \
			BaseTabString:"" \
			NoCaseOrderComparator:unsupplied \
			ToHighReg:unsupplied \
			BufferMgr:unsupplied \
			WriteVal:unsupplied \
			ValueOps:unsupplied \
			FormatText:unsupplied \
			AsoFText:unsupplied \
			TypeCast:unsupplied \
			UpdateProgress:unsupplied \
			ArrayOps:unsupplied \
			Modify:unsupplied \
			ReportProgress:true \
			Progress:unsupplied = \
		(
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if No Type then
					throw "No type assigned to phBound " ObjName
				if
					(not Supplied BufferID) and
					(GIMS.CurrentGame.Core.TypeLibrary.CWXML.IsXMLExport Extension SourceFormat:SourceFormat)
				then
					return (WriteCodeWalkerXML())
				if not Supplied BufferMgr then (
					BufferMgr = GIMS.Core.BufferMgr
					WriteVal = BufferMgr.WriteVal
					ValueOps = GIMS.Core.ValueOps
					FormatText = ValueOps.FormatText
					AsoFText = ValueOps.AsoFText
					TypeCast = ValueOps.TypeCast
					UpdateProgress = GIMS.Core.GUIMgr.UpdateProgress
					ArrayOps = GIMS.Core.ArrayOps
					Modify = ArrayOps.Modify
					local	StringOps = GIMS.Core.StringOps
					NoCaseOrderComparator = StringOps.NoCaseOrderComparator
					ToHighReg = StringOps.ToHighReg
				)
				local	IsComposite = (Type == #BoundComposite),
						FilePath
				if ReportProgress then (
					if not Supplied Progress then (
						Progress = (
							if IsComposite then
								[0, 0, 4 + Children.Count * 4]
							else
								[0, 0, 4]
						)
					)
					UpdateProgress #Progress Progress
				) else
					UpdateProgress #None 0
				local	IsSeparate = (not Supplied BufferID),
						TypeString = (ArrayOps.FetchMHL KnownTypes Type ReturnHashOnFail:false KeyValueItemIDs:[1, 2] Comparator:NoCaseOrderComparator)
				if No TypeString then
					EGIMS_EHAbort "Unknown phBound Type " Param1:Type BufferID:BufferID
				if IsSeparate then (
					FilePath = (
						FormatText \
							v1:DiskPath \
							v2:ObjName \
							v3:Extension
					)
					BufferID = (BufferMgr.Create Mode:#TxtLines FilePath:FilePath)
					WriteVal BufferID (AsoFText Version TypeHook:Integer TabString:(BaseTabString + "Version "))
				) else
					WriteVal BufferID (BaseTabString + "phBound")
				WriteVal BufferID (BaseTabString + "{")
				local	TabString = (BaseTabString + "\t"),
						SubTabString = (TabString + "\t"),
						SubSubTabString = (SubTabString + "\t"),
						ChildTransformsTabString = (TabString + "ChildTransforms "),
						ChildrenTabString = (TabString + "Children "),
						ChildFlagsTabString = (TabString + "ChildFlags "),
						ChildFlagsItemTabString = (SubTabString + "Item"),
						ChildFlags1TabString = (SubSubTabString + "Flags1"),
						ChildFlags2TabString = (SubSubTabString + "Flags2"),
						BlockStartTabString = (TabString + "{"),
						BlockEndTabString = (TabString + "}"),
						SubBlockStartTabString = (SubTabString + "{"),
						SubBlockEndTabString = (SubTabString + "}")
				WriteVal BufferID (
					FormatText \
						v1:TabString \
						v2:"Type " \
						v3:TypeString
				)
				Bounds.Write BufferID TabString
				if Supplied Margin then
					WriteVal BufferID (FormatText v1:TabString v2:"Margin " v3:Margin)
				if Supplied CapsuleHalfHeight then
					WriteVal BufferID (FormatText v1:TabString v2:"CapsuleHalfHeight " v3:CapsuleHalfHeight)
				if Have VertexOffset then (
					WriteVal BufferID (
						FormatText \
							v1:(AsoFText VertexOffset TabString:(TabString + "GeometryCenter ")) \
							v2:" " \
							v3:(VertexOffset_UnkPart as String)
					)
				)
				local	MatCount = Materials.Count
				if MatCount != 0 then (
					if
						Type == #BoundBVH or
						Type == #BoundGeometry
					then (
						WriteVal BufferID (FormatText v1:TabString v2:"Materials " v3:MatCount)
						WriteVal BufferID (TabString + "{")
						for i = 1 to MatCount do
							_WriteMaterial BufferID Materials[i] SubTabString WriteVal FormatText TypeCast Index:i
						WriteVal BufferID (TabString + "}")
					) else
						_WriteMaterial BufferID Materials[1] TabString WriteVal FormatText TypeCast
				)
				if Supplied VertexColors then (
					WriteVal BufferID (FormatText v1:TabString v2:"VertexColors " v3:VertexColors.Count)
					WriteVal BufferID (TabString + "{")
					/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
					/*<ERRHANDLERSTART>*/try (
					for Clr in VertexColors do
						WriteVal BufferID (AsoFText (Clr * 255) TypeHook:Integer TabString:SubTabString)
					/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#VertexColors), #(VertexColors)))/*<ERRHANDLEREND>*/
					/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
					WriteVal BufferID (TabString + "}")
				) else
					WriteVal BufferID (TabString + "VertexColors null")
				if Supplied MaterialColors then (
					WriteVal BufferID (FormatText v1:TabString v2:"MaterialColors " v3:MaterialColors.Count)
					WriteVal BufferID (TabString + "{")
					/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
					/*<ERRHANDLERSTART>*/try (
					for Clr in MaterialColors do
						WriteVal BufferID (AsoFText Clr TypeHook:Integer TabString:SubTabString)
					/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
					/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
					WriteVal BufferID (TabString + "}")
				) else
					WriteVal BufferID (TabString + "MaterialColors null")
				if ReportProgress then (
					Progress.x += 1
					UpdateProgress #Progress Progress
				) else
					UpdateProgress #None 0
				local	FaceCount = Faces.Count,
						PolyCount = (Primitives.Count + FaceCount)
				if PolyCount != 0 then (
					WriteVal BufferID (
						FormatText \
							v1:TabString \
							v2:"Polygons " \
							v3:PolyCount
					)
					WriteVal BufferID (TabString + "{")
					local	PolyObjIndex = 0,
							TriTabString = (SubTabString + "Tri "),
							SphereTabString = (SubTabString + "Sphere "),
							BoxTabString = (SubTabString + "Box "),
							CapsuleTabString = (SubTabString + "Capsule "),
							CylinderTabString = (SubTabString + "Cylinder "),
							MaterialIndexTabString = (SubSubTabString + "MaterialIndex "),
							CenterTabString = (SubSubTabString + "Center "),
							RadiusTabString = (SubSubTabString + "Radius "),
							CenterTopTabString = (SubSubTabString + "CenterTop "),
							CenterBottomTabString = (SubSubTabString + "CenterBottom "),
							VerticesTabString = (SubSubTabString + "Vertices "),
							SiblingsTabString = (SubSubTabString + "Siblings "),
							P3Mod = [-1, -1, -1],
							SuppliedSiblings = (Supplied Siblings)
					/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
					/*<ERRHANDLERSTART>*/try (
					for Prim in Primitives do (
						local	PrimTag = Prim[1]
						case PrimTag of (
							#Sphere: (
								WriteVal BufferID (SphereTabString + (PolyObjIndex as String))
								WriteVal BufferID SubBlockStartTabString
								WriteVal BufferID (MaterialIndexTabString + ((Prim[3] - 1) as String))
								WriteVal BufferID (CenterTabString + ((Prim[4] - 1) as String))
								WriteVal BufferID (RadiusTabString + (Prim[5] as String))
							)
							#Capsule: (
								WriteVal BufferID (CapsuleTabString + (PolyObjIndex as String))
								WriteVal BufferID SubBlockStartTabString
								WriteVal BufferID (MaterialIndexTabString + ((Prim[3] - 1) as String))
								WriteVal BufferID (CenterTopTabString + ((Prim[4] - 1) as String))
								WriteVal BufferID (CenterBottomTabString + ((Prim[5] - 1) as String))
								WriteVal BufferID (RadiusTabString + (Prim[6] as String))
							)
							#Box: (
								WriteVal BufferID (BoxTabString + (PolyObjIndex as String))
								WriteVal BufferID SubBlockStartTabString
								WriteVal BufferID (MaterialIndexTabString + ((Prim[3] - 1) as String))
								WriteVal BufferID (AsoFText (Modify Prim[4] -1 #Add) TabString:VerticesTabString)
							)
							#Cylinder: (
								WriteVal BufferID (CylinderTabString + (PolyObjIndex as String))
								WriteVal BufferID SubBlockStartTabString
								WriteVal BufferID (MaterialIndexTabString + ((Prim[3] - 1) as String))
								WriteVal BufferID (CenterTopTabString + ((Prim[4] - 1) as String))
								WriteVal BufferID (CenterBottomTabString + ((Prim[5] - 1) as String))
								WriteVal BufferID (RadiusTabString + (Prim[6] as String))
							)
							default:
								EGIMS_EHAbort "Unknown Polygon primitive tag " Param1:PrimTag BufferID:BufferID
						)
						WriteVal BufferID SubBlockEndTabString
						PolyObjIndex += 1
					)
					/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
					/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
					/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
					/*<ERRHANDLERSTART>*/try (
					if SuppliedSiblings then (
						for i = 1 to FaceCount do (
							WriteVal BufferID (TriTabString + (PolyObjIndex as String))
							WriteVal BufferID SubBlockStartTabString
							WriteVal BufferID (AsoFText (Faces[i] + P3Mod) TypeHook:Integer TabString:VerticesTabString)
							WriteVal BufferID (AsoFText (Siblings[i] + P3Mod) TypeHook:Integer TabString:SiblingsTabString)
							WriteVal BufferID (MaterialIndexTabString + ((FaceMatIDs[i] - 1) as String))
							WriteVal BufferID SubBlockEndTabString
							PolyObjIndex += 1
						)
					) else (
						local	FakeSiblings = (SiblingsTabString + "-1 -1 -1")
						for i = 1 to FaceCount do (
							WriteVal BufferID (TriTabString + (PolyObjIndex as String))
							WriteVal BufferID SubBlockStartTabString
							WriteVal BufferID (AsoFText (Faces[i] + P3Mod) TypeHook:Integer TabString:VerticesTabString)
							WriteVal BufferID FakeSiblings
							WriteVal BufferID (MaterialIndexTabString + ((FaceMatIDs[i] - 1) as String))
							WriteVal BufferID SubBlockEndTabString
							PolyObjIndex += 1
						)
					)
					/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
					/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
					WriteVal BufferID (TabString + "}")
					if not SuppliedSiblings then
						WriteVal BufferID (TabString + "ComputePolyNeighbors True")
				)
				if ReportProgress then (
					Progress.x += 1
					UpdateProgress #Progress Progress
				) else
					UpdateProgress #None 0
				local	VerticesCount = Vertices.Count
				if VerticesCount != 0 then (
					WriteVal BufferID (
						FormatText \
							v1:TabString \
							v2:"Vertices " \
							v3:VerticesCount
					)
					WriteVal BufferID (TabString + "{")
					/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
					/*<ERRHANDLERSTART>*/try (
					for Vert in Vertices do
						WriteVal BufferID (AsoFText Vert TabString:SubTabString)
					/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
					/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
					WriteVal BufferID (TabString + "}")
				)
				if Supplied Shrunk then (
					local	ShrunkCount = Shrunk.Count
					if ShrunkCount != 0 then (
						WriteVal BufferID (
							FormatText \
								v1:TabString \
								v2:"Shrunk " \
								v3:ShrunkCount
						)
						WriteVal BufferID (TabString + "{")
						/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
						/*<ERRHANDLERSTART>*/try (
						for Vert in Shrunk do
							WriteVal BufferID (AsoFText Vert TabString:SubTabString)
						/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
						/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
						WriteVal BufferID (TabString + "}")
					)
				)
				if ReportProgress then (
					Progress.x += 1
					UpdateProgress #Progress Progress
				) else
					UpdateProgress #None 0
				if IsComposite then (
					
					local	ChildTransformsCount = ChildTransforms.Count
					if ChildTransformsCount != 0 then (
						WriteVal BufferID (AsoFText ChildTransformsCount TabString:ChildTransformsTabString)
						WriteVal BufferID (TabString + "{")
						/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
						/*<ERRHANDLERSTART>*/try (
						for i = 1 to ChildTransformsCount do (
							WriteVal BufferID (
								FormatText \
									v1:SubTabString \
									v2:"Matrix " \
									v3:(i - 1)
							)
							WriteVal BufferID (SubTabString + "{")
							WriteVal BufferID (AsoFText ChildTransforms[i] TabString:SubSubTabString)
							WriteVal BufferID (SubTabString + "}")
						)
						/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
						/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
						WriteVal BufferID (TabString + "}")
					) else
						WriteVal BufferID (ChildTransformsTabString + "null")
					
					if Supplied ChildFlags then (
						local	ChildFlagsCount = ChildFlags.Count
						if ChildFlagsCount != 0 then (
							WriteVal BufferID (AsoFText ChildFlagsCount TabString:ChildFlagsTabString)
							WriteVal BufferID BlockStartTabString
							for ChildFlag in ChildFlags do (
								WriteVal BufferID ChildFlagsItemTabString
								WriteVal BufferID SubBlockStartTabString
								local	Flags1 = ChildFlag[1],
										Flags2 = ChildFlag[2],
										FlagWritten = false
								WriteVal BufferID ChildFlags1TabString
								for i = 1 to Flags1.Count where Flags1[i] do (
									WriteVal BufferID (" " + (ToHighReg (KnownChildFlags[i] as String))) AppendLast:true
									FlagWritten = true
								)
								if not FlagWritten then
									WriteVal BufferID " FORMATS_EMPTY_FLAGS" AppendLast:true
									
								FlagWritten = false
								WriteVal BufferID ChildFlags2TabString
								for i = 1 to Flags2.Count where Flags2[i] do (
									WriteVal BufferID (" " + (ToHighReg (KnownChildFlags[i] as String))) AppendLast:true
									FlagWritten = true
								)
								if not FlagWritten then
									WriteVal BufferID " FORMATS_EMPTY_FLAGS" AppendLast:true
								WriteVal BufferID SubBlockEndTabString
							)
							WriteVal BufferID BlockEndTabString
						)
					) else
						WriteVal BufferID (ChildFlagsTabString + "null")
						
					if ReportProgress then (
						Progress.x += 1
						UpdateProgress #Progress Progress
					) else
						UpdateProgress #None 0
					local	ChildrenCount = Children.Count
					if ChildrenCount != 0 then (
						WriteVal BufferID (AsoFText ChildrenCount TabString:ChildrenTabString)
						WriteVal BufferID (TabString + "{")
						/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
						/*<ERRHANDLERSTART>*/try (
						for ChildID = 1 to ChildrenCount do (
							local Child = Children[ChildID]
							if Have Child then (
								Child.Write \
									BufferID:BufferID \
									BaseTabString:SubTabString \
									NoCaseOrderComparator:NoCaseOrderComparator \
									ToHighReg:ToHighReg \
									BufferMgr:BufferMgr \
									WriteVal:WriteVal \
									ValueOps:ValueOps \
									FormatText:FormatText \
									AsoFText:AsoFText \
									TypeCast:TypeCast \
									UpdateProgress:UpdateProgress \
									ArrayOps:ArrayOps \
									Modify:Modify \
									ReportProgress:ReportProgress \
									Progress:Progress
							) else
								WriteVal BufferID (SubTabString + "phBound null")
						)
						/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
						/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/				
						WriteVal BufferID (TabString + "}")
					) else
						WriteVal BufferID (ChildrenTabString + "null")
				)
				WriteVal BufferID (BaseTabString + "}")
				if IsSeparate then (
					BufferMgr.WriteFile BufferID FilePath:FilePath
					BufferMgr.ClearBuffer BufferID
				)
				OK
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(
				#(
					#DiskPath,
					#ObjName,
					#Type,
					#Margin,
					#Shrunk,
					#FaceMatIDs,
					#Faces,
					#Siblings,
					#Primitives,
					#Vertices,
					#VertexOffset,
					#VertexOffset_UnkPart,
					#Materials,
					#VertexColors,
					#MaterialColors,
					#CapsuleHalfHeight,
					#ChildFlags,
					#Children,
					#ChildTransforms
				), #(
					DiskPath,
					ObjName,
					Type,
					Margin,
					Shrunk,
					FaceMatIDs,
					Faces,
					Siblings,
					Primitives,
					Vertices,
					VertexOffset,
					VertexOffset_UnkPart,
					Materials,
					VertexColors,
					MaterialColors,
					CapsuleHalfHeight,
					ChildFlags,
					Children,
					ChildTransforms
				)
			))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn _GetCylinderDimensions = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	AABB = Bounds.AABB,
						AABBMax = AABB.bMax,
						AABBMin = AABB.bMin,
						lx = (AABBMax.x - AABBMin.x),
						ly = (AABBMax.y - AABBMin.y),
						lz = (AABBMax.z - AABBMin.z),
						IsEq_lxly = (lx == ly),
						Radius, Height
				if
					IsEq_lxly or
					(lx == lz)
				then (
					Radius = (lx / 2)
					if
						(not IsEq_lxly) and
						(ly != lz)
					then
						Height = ly
					else
						Height = lz
				) else (
					Radius = (ly / 2)
					Height = lx
				)
				[Radius, Height]
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#DiskPath, #ObjName, #Extension), #(DiskPath, ObjName, Extension)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn _CalculateBoxVector Centroid v0 v2 = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				(Normalize ((v0 + ((v2 - v0) / 2)) - Centroid))
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#DiskPath, #ObjName, #Extension), #(DiskPath, ObjName, Extension)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn _GetBoxPlacementFromDiagonals VertIndices = (
		--fn _GetBoxPlacementFromDiagonals VertIndices PrimName = (	--<TODO> remove, debug
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	v0 = Vertices[VertIndices[1]],
						v1 = Vertices[VertIndices[2]],
						v2 = Vertices[VertIndices[3]],
						v3 = Vertices[VertIndices[4]],
						
						BoxVector = (((v0 + v3) / 2) - ((v1 + v2) / 2)),
						tv0 = (v0 - BoxVector),
						tv1 = (v1 + BoxVector),
						tv3 = (v3 - BoxVector),
						
						Centroid = ((v2 + tv1) / 2),
						
						UpNormal = (_CalculateBoxVector Centroid v1 v0),
						FrontNormal = (_CalculateBoxVector Centroid v2 v1),
						RightNormal = (_CalculateBoxVector Centroid tv3 tv1),
						
						H = (Distance v2 tv0),
						W = (Distance tv0 v1),
						L = (Distance tv3 v3)
						
				if W > H then (
					Swap H W
					Swap UpNormal RightNormal
				)
				if L > W then (
					Swap L W
					Swap FrontNormal RightNormal
				)
				if W > H then (
					Swap H W
					Swap UpNormal RightNormal
				)
				local	BaseNormal = UpNormal,
						BaseRotateNormal = RightNormal,
						CheckingNormal = FrontNormal
				
				/*RESTORE VECTORS*		
				local	VecDiff_UF = (Dot UpNormal FrontNormal),
						VecDiff_UR = (Dot UpNormal RightNormal),
						VecDiff_FR = (Dot FrontNormal RightNormal),
						Compare = GIMS.Core.ValueOps.Compare,
						AreBaseVecs_UF = (Compare VecDiff_UF 0.0 MaxDiff:0.01),
						AreBaseVecs_UR = (Compare VecDiff_UR 0.0 MaxDiff:0.01),
						AreBaseVecs_FR = (Compare VecDiff_FR 0.0 MaxDiff:0.01)
				Format "%:\n\tUF UR FR	% % %	% % %\n" PrimName AreBaseVecs_UF AreBaseVecs_UR AreBaseVecs_FR VecDiff_UF VecDiff_UR VecDiff_FR	--<TODO> remove, debug
				for i = 1 to 2 while
					not AreBaseVecs_UF or
					not AreBaseVecs_UR or
					not AreBaseVecs_FR
				do (
					if
						(
							not AreBaseVecs_UF or
							not AreBaseVecs_UR
						) and
						AreBaseVecs_FR
					then (
						UpNormal = (Cross RightNormal FrontNormal)
						AreBaseVecs_UF = true
						AreBaseVecs_UR = true
					)
					if
						(
							not AreBaseVecs_UF or
							not AreBaseVecs_FR
						) and
						AreBaseVecs_UR
					then (
						FrontNormal = (Cross UpNormal RightNormal)
						AreBaseVecs_UF = true
						AreBaseVecs_FR = true
					)
					if
						(
							not AreBaseVecs_UR or
							not AreBaseVecs_FR
						) and
						AreBaseVecs_UF
					then (
						RightNormal = (Cross FrontNormal UpNormal)
						AreBaseVecs_UR = true
						AreBaseVecs_FR = true
					)
					Format "\tUF UR FR	% % %	% % %\n" AreBaseVecs_UF AreBaseVecs_UR AreBaseVecs_FR (Dot UpNormal FrontNormal) (Dot UpNormal RightNormal) (Dot FrontNormal RightNormal)	--<TODO> remove, debug
				)
				/**/
				
				local	NormalTrans = (MatrixFromNormal BaseNormal),
						ModAngle = (((EulerAngles 0 90 0) as Quat) * NormalTrans),
						RotatedUpNormal = (Normalize (BaseNormal * ModAngle)),
						AngleDiff = (
							local AD = ACos(Dot RotatedUpNormal BaseRotateNormal)
								if not bit.isFinite AD then 180 else AD),
						RotPlusTrans = ((RotateZMatrix AngleDiff) * NormalTrans),
						RotMinusTrans = ((RotateZMatrix (-AngleDiff)) * NormalTrans),
						RotPlusDistance = (Length (Cross CheckingNormal ([0, 1, 0] * RotPlusTrans))),
						RotMinusDistance = (Length (Cross CheckingNormal ([0, 1, 0] * RotMinusTrans))),
						ResultTrans = (
							if RotPlusDistance < RotMinusDistance then
								RotPlusTrans
							else
								RotMinusTrans
						)
				ResultTrans.Position = Centroid
				#(L, W, H, ResultTrans)
				--#(L, W, H, ResultTrans, Centroid, BaseNormal, BaseRotateNormal, CheckingNormal, v0, v1, v2 ,v3, tv0, tv1, tv3, UpNormal, FrontNormal, RightNormal, [UpVec[1], UpVec[2], UpVec[3]], [FrontVec[1], FrontVec[2], FrontVec[3]], [RightVec[1], RightVec[2], RightVec[3]])	--<TODO> remove, debug
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#DiskPath, #ObjName, #Extension), #(DiskPath, ObjName, Extension)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Create ParentNode ReportProgress:true Progress:unsupplied IsSeparate:true \
			UpdateProgress:unsupplied \
			ObjectMgr:unsupplied \
			NodeChildFlags:unsupplied \
			CreateIfUnique:unsupplied = \
		(
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if not Supplied ObjectMgr then (
					UpdateProgress = GIMS.Core.GUIMgr.UpdateProgress
					ObjectMgr = GIMS.Core.ObjectMgr
					CreateIfUnique = ObjectMgr.CreateIfUnique
				)
				if
					ReportProgress and
					not Supplied Progress
				then
					Progress = [0, 0, GetCreateProgressStepCount ObjectMgr]
				local	ParentTM = (
							--if IsSeparate then (
								if ParentNode == RootNode then
									(Matrix3 1)
								else
									ParentNode.Transform
							--)
						),
						TargetPos = (
							if
								(Supplied Bounds.Centroid) and
								Type != #BoundComposite and
								Type != #BoundBVH and
								Type != #BoundGeometry
							then
								Bounds.Centroid
							else
								[0, 0, 0]
						)
				if ReportProgress then (
					Progress.x += 1
					UpdateProgress #Progress Progress
				) else
					UpdateProgress #None 0
				local	Result,
						ParamHolder = unsupplied
				/*TODO remove, debug*	LogProfiler #PlainInfo "Collision" AddParam:#(Type, ObjName)	/**/
				case Type of (
					#BoundComposite: (
						local	ChildrenCount = Children.Count,
								HaveChildFlags = (Supplied ChildFlags),
								ChildFlagCount = (if HaveChildFlags then ChildFlags.Count)
						Result = (CreateIfUnique ObjName ParentNode:ParentNode AllowSearch:false NodeType:EGIMS_V_Col_Composite)
						Result.UseChildFlags = HaveChildFlags
						if ReportProgress then (
							Progress.x += 1
							UpdateProgress #Progress Progress
						) else
							UpdateProgress #None 0
							
						for ChildID = 1 to ChildrenCount where Have Children[ChildID] do (
							if ReportProgress then (
								Progress.x += 1
								UpdateProgress #Progress Progress
							) else
								UpdateProgress #None 0
							local	TempChildSource = Children[ChildID]
							if Have TempChildSource then (
								local	TempChild = (
											TempChildSource.Create \
												Result \
												ReportProgress:ReportProgress \
												Progress:Progress \
												IsSeparate:true \
												UpdateProgress:UpdateProgress \
												ObjectMgr:ObjectMgr \
												CreateIfUnique:CreateIfUnique \
												NodeChildFlags:(if HaveChildFlags then ChildFlags[ChildID] else unsupplied)
										)
								TempChild.Transform = (ChildTransforms[ChildID] * ParentTM)
								if TempChildSource.Type == #Plane then
									TempChild.Dir = (TempChildSource.CenterOfMass * ParentTM)
							)
						)
					)
					#BoundPlane: (
						Result = (CreateIfUnique ObjName AllowSearch:false ParentNode:ParentNode NodeType:EGIMS_V_Col_Plane)
						local	CenterOfMass = Bounds.CenterOfMass
						if Supplied CenterOfMass then
							Result.Dir = CenterOfMass
					)
					#BoundBox: (
						Result = (CreateIfUnique ObjName AllowSearch:false ParentNode:ParentNode NodeType:EGIMS_V_Col_Box)
						local	AABB = Bounds.AABB,
								bMin = AABB.bMin,
								bMax = AABB.bMax
						Result.SuspendMeshBuilding()
						Result.Width = (bMax.x - bMin.x)
						Result.Depth = (bMax.y - bMin.y)
						Result.Height = (bMax.z - bMin.z)
						Result.ResumeMeshBuilding()
					)
					#BoundSphere: (
						Result = (CreateIfUnique ObjName AllowSearch:false ParentNode:ParentNode NodeType:EGIMS_V_Col_Sphere)
						local	SphereR = Bounds.Radius
						if not Supplied SphereR then
							SphereR = 0.04
						Result.Radius = SphereR
					)
					#BoundCapsule: (
						Result = (CreateIfUnique ObjName AllowSearch:false ParentNode:ParentNode NodeType:EGIMS_V_Col_Capsule)
						local	CapRadius = (if Supplied Margin then Margin else 0.04),
								CapSphere = (if Supplied Bounds.Radius then Bounds.Radius else (CapRadius + 0.01)),
								CapHeight = ((CapSphere - CapRadius) * 2),
								CapHalf = CapsuleHalfHeight
						if CapHeight < 0.001 then
							CapHeight = 0.001
						if not Supplied CapHalf then (
							if Have Bounds.AABB then
								CapHalf = ((Bounds.AABB.bMax.z - Bounds.AABB.bMin.z) / 2)
							else
								CapHalf = (CapHeight / 2)
						)
						Result.CapsuleHalfHeight = CapHalf
						Result.SuspendMeshBuilding()
						Result.Radius = CapRadius
						Result.Height = CapHeight
						Result.ResumeMeshBuilding()
					)
					#BoundDisc: (
						Result = (CreateIfUnique ObjName AllowSearch:false ParentNode:ParentNode NodeType:EGIMS_V_Col_Disc)
						local	CylinderDimensions = (_GetCylinderDimensions())
						Result.SuspendMeshBuilding()
						Result.Radius = CylinderDimensions.x
						Result.Height = CylinderDimensions.y	--or (Margin * 2)
						Result.ResumeMeshBuilding()
					)
					#BoundCylinder: (
						Result = (CreateIfUnique ObjName AllowSearch:false ParentNode:ParentNode NodeType:EGIMS_V_Col_Cylinder)
						local	CylinderDimensions = (_GetCylinderDimensions())
						Result.SuspendMeshBuilding()
						Result.Radius = CylinderDimensions.x
						Result.Height = CylinderDimensions.y
						Result.ResumeMeshBuilding()
					)
					default: (
						local	IsBVH = (Type == #BoundBVH)
						if
							IsBVH or
							(Type == #BoundGeometry)
						then (
							GIMS.Core.ArrayOps.Modify Vertices VertexOffset #Add CopyArray:false
							Result = (
								ObjectMgr.CreateMesh \
									Vertices \
									Faces \
									ObjName:ObjName \
									VertColors:VertexColors \
									MaterialIDs:FaceMatIDs \
									SG:#Remove \
									Parent:ParentNode \
									Progress:Progress
							)
							
							/*<TODO> remove this block, shrunk test import*
							
							if Supplied Shrunk then (
								GIMS.Core.ArrayOps.Modify Shrunk VertexOffset #Add CopyArray:false
								local	ShrinkVecs = unsupplied,
										ShrunkCount = Shrunk.Count,
										VertCount = Vertices.Count,
										Normals = #()
								for i = VertCount to 1 by -1 do
									Normals[i] = [0, 0, 0]
								
								--collect normals and face centers
								EGIMS_ResumeMAX()
								OldSelection = (Selection as Array)
								Select Result
								MAX Modify Mode
								local	NormalsMod = (Edit_Normals())
								AddModifier Result NormalsMod
								EGIMS_SelectModifier NormalsMod
								local	NMGetNormalID = NormalsMod.GetNormalID,
										NMGetNormal = NormalsMod.GetNormal,
										NMGetFaceDegree = NormalsMod.GetFaceDegree,
										ShrunkFaceOffsets = #()
								for FaceID = Faces.Count to 1 by -1 do (
									local	Face = Faces[FaceID],
											FaceDegree = (NMGetFaceDegree FaceID),
											NormalFaceCenter = [0, 0, 0],
											ShrunkFaceCenter = [0, 0, 0]
									for CornerID = FaceDegree to 1 by -1 do (
										local	NormID = (NMGetNormalID FaceID CornerID),
												VertID = Face[CornerID]
										NormalFaceCenter += Vertices[VertID]
										ShrunkFaceCenter += Shrunk[VertID]
										Normals[VertID] += (NMGetNormal NormID)
									)
									ShrunkFaceOffsets[FaceID] = (Distance (NormalFaceCenter / 3) (ShrunkFaceCenter / 3))
								)
								DeleteModifier Result NormalsMod
								Sort ShrunkFaceOffsets
								Format "Sorted shrunk face center offsets:\t[%..%]\t%\n" ShrunkFaceOffsets[1] ShrunkFaceOffsets[ShrunkFaceOffsets.Count] ShrunkFaceOffsets
								
								--create normal vectors and fix normal data
								local	tLine = (SplineShape Name:"VertNormals" Parent:Result WireColor:Blue),
										SplineCount = 0
								for i = 1 to VertCount do (
								
									--fix normal data
									local	Normal = (Normalize (Normals[i] / 3))
									Normals[i] = Normal
									
									--add line
									AddNewSpline tLine
									SplineCount += 1
									local	BasePoint = Vertices[i]
									AddKnot tLine SplineCount #Corner #Line BasePoint
									AddKnot tLine SplineCount #Corner #Line (BasePoint + (Normal * 0.02))
								)
								UpdateShape tLine
								
								--print minimum vertex distances
								local	MinDist = (Distance Result.Max Result.Min)
								for i = 1 to (VertCount - 1) do (
									for j = (i + 1) to VertCount do (
										local	Dist = (Distance Vertices[i] Vertices[j])
										if Dist < MinDist then
											MinDist = Dist
									)
								)
								Format "Minimum mesh intervertex distance is\t%\n" MinDist
								local	MinDist = (Distance Result.Max Result.Min)
								for i = 1 to (ShrunkCount - 1) do (
									for j = (i + 1) to ShrunkCount do (
										local	Dist = (Distance Shrunk[i] Shrunk[j])
										if Dist < MinDist then
											MinDist = Dist
									)
								)
								Format "Minimum shrunk intervertex distance is\t%\n" MinDist
										
								--print data
								if ShrunkCount == VertCount then (
									Format "Vertex\tShrunk\tShrinkVec\tNormal\tLenShrinkVec\tLenNormal\n"
									ShrinkVecs = #()
									ShrinkVecs.Count = ShrunkCount
									for i = 1 to ShrunkCount do (
										local	v = Vertices[i],
												s = Shrunk[i],
												n = Normals[i],
												sv = (v - s),
												lsv = (Length sv),
												ln = (Length n)
										ShrinkVecs[i] = sv
										Format "%\t%\t%\t%\t%\t%\n" \
											(FormattedPrint v Format:"0.4f") \
											(FormattedPrint s Format:"0.4f") \
											(FormattedPrint sv Format:"0.4f") \
											(FormattedPrint n Format:"0.4f") \
											(FormattedPrint lsv Format:"0.4f") \
											(FormattedPrint ln Format:"0.4f") \
									)
								) else
									Format "Shrunk count % != Vertex count %\n" ShrunkCount VertCount
								
								--create shrunk mesh
								Result.XRay = true
								local	ShrunkMesh = (
											ObjectMgr.CreateMesh \
												Shrunk \
												Faces \
												ObjName:"Shrunk" \
												VertColors:VertexColors \
												MaterialIDs:FaceMatIDs \
												VertTangents:ShrinkVecs \
												TangentLenMult:1 \
												SG:#Remove \
												Parent:Result
										)
								
							) else (
								if ReportProgress then (
									Progress.x += ObjectMgr.CreateMesh_ProgressStepCount
									UpdateProgress #Progress Progress
								) else
									UpdateProgress #None 0
							)
							
							/**/
							
							ParamHolder = (EGIMS_V_CollisionMesh Type:(Ternary IsBVH 1 2) VertexOffset_UnkPart:VertexOffset_UnkPart SaveOp:false)
							AddModifier Result ParamHolder
							
							--create primitives
							local	TypeCast = GIMS.Core.ValueOps.TypeCast,
									CurrentProgress
							if ReportProgress then
								CurrentProgress = Progress.x
							for Prim in Primitives do (
								if ReportProgress then (
									local	ProgressX = (Progress.x += 1)
									if (ProgressX - CurrentProgress) >= 50 then (
										CurrentProgress = ProgressX
										UpdateProgress #Progress Progress
									)
								) else
									UpdateProgress #None 0
								local	PrimType = (TypeCast Prim[1] name BufferID:BufferID)
								/*TODO remove, debug*	LogProfiler #PlainInfo "\tPrimitive" AddParam:Prim	/**/
								case PrimType of (
									#Sphere: (
										local	PrimObj = (CreateIfUnique Prim[2] AllowSearch:false ParentNode:Result NodeType:EGIMS_V_Col_PrimSphere)
										PrimObj.Pos = Vertices[Prim[4]]
										PrimObj.SuspendMeshBuilding()
										PrimObj.MtlID = Prim[3]
										PrimObj.Radius = Prim[5]
										PrimObj.ResumeMeshBuilding()
									)
									#Capsule: (
										local	PrimObj = (CreateIfUnique Prim[2] AllowSearch:false ParentNode:Result NodeType:EGIMS_V_Col_PrimCapsule),
												TopVert = Vertices[Prim[4]],
												BottomVert = Vertices[Prim[5]],
												Dir = (BottomVert - TopVert)
										PrimObj.Pos = (BottomVert - (Dir / 2))
										PrimObj.Dir = Dir
										PrimObj.SuspendMeshBuilding()
										PrimObj.MtlID = Prim[3]
										PrimObj.Height = (Distance TopVert BottomVert)
										PrimObj.Radius = Prim[6]
										PrimObj.ResumeMeshBuilding()
									)
									#Box: (
										local	PrimObj = (CreateIfUnique Prim[2] AllowSearch:false ParentNode:Result NodeType:EGIMS_V_Col_PrimBox),
												BoxData = (_GetBoxPlacementFromDiagonals Prim[4])
												--BoxData = (_GetBoxPlacementFromDiagonals Prim[4] PrimObj.Name)	--<TODO> remove, debug
										PrimObj.Transform = BoxData[4]
										PrimObj.SuspendMeshBuilding()
										PrimObj.MtlID = Prim[3]
										PrimObj.Depth = BoxData[1]
										PrimObj.Width = BoxData[2]
										PrimObj.Height = BoxData[3]
										PrimObj.ResumeMeshBuilding()
										
										/*<TODO> remove, debug*
										GeoSphere Name:"v0"					Radius:0.05 Parent:PrimObj	Segs:1 BaseType:1 Pos:Vertices[Prim[4][1]]					WireColor:Red
										GeoSphere Name:"v1"					Radius:0.05 Parent:PrimObj	Segs:1 BaseType:1 Pos:Vertices[Prim[4][2]]					WireColor:Green
										GeoSphere Name:"v2"					Radius:0.05 Parent:PrimObj	Segs:1 BaseType:1 Pos:Vertices[Prim[4][3]]					WireColor:Blue
										GeoSphere Name:"v3"					Radius:0.05 Parent:PrimObj	Segs:1 BaseType:1 Pos:Vertices[Prim[4][4]]					WireColor:White
										/**/
										
										/*<TODO> remove, debug*
										GeoSphere Name:"Center"				Radius:0.05 Parent:PrimObj	Segs:1 BaseType:1 Pos:BoxData[5]					WireColor:White
										GeoSphere Name:"Base" 				Radius:0.05 Parent:PrimObj	Segs:1 BaseType:1 Pos:(BoxData[6] + BoxData[5])		WireColor:Blue
										GeoSphere Name:"BaseRotate"			Radius:0.05 Parent:PrimObj	Segs:1 BaseType:1 Pos:(BoxData[7] + BoxData[5])		WireColor:Green
										GeoSphere Name:"Checking"			Radius:0.05 Parent:PrimObj	Segs:1 BaseType:1 Pos:(BoxData[8] + BoxData[5])		WireColor:Red
										
										GeoSphere Name:"Up" 				Radius:0.05 Parent:PrimObj	Segs:1 BaseType:1 Pos:(BoxData[16] + BoxData[5])	WireColor:Blue
										GeoSphere Name:"Front"				Radius:0.05 Parent:PrimObj	Segs:1 BaseType:1 Pos:(BoxData[17] + BoxData[5])	WireColor:Green
										GeoSphere Name:"Right"				Radius:0.05 Parent:PrimObj	Segs:1 BaseType:1 Pos:(BoxData[18] + BoxData[5])	WireColor:Red
										
										GeoSphere Name:"UpVec" 				Radius:0.05 Parent:PrimObj	Segs:1 BaseType:1 Pos:(BoxData[19] + BoxData[5])	WireColor:Blue
										GeoSphere Name:"FrontVec"			Radius:0.05 Parent:PrimObj	Segs:1 BaseType:1 Pos:(BoxData[20] + BoxData[5])	WireColor:Green
										GeoSphere Name:"RightVec"			Radius:0.05 Parent:PrimObj	Segs:1 BaseType:1 Pos:(BoxData[21] + BoxData[5])	WireColor:Red
										
										/**/
										
										/*<TODO> remove, debug*
										GeoSphere Name:"v0"					Radius:0.05 Parent:PrimObj	Segs:1 BaseType:1 Pos:BoxData[9]					WireColor:Yellow
										GeoSphere Name:"v1"					Radius:0.05 Parent:PrimObj	Segs:1 BaseType:1 Pos:BoxData[10]					WireColor:Yellow
										GeoSphere Name:"v2"					Radius:0.05 Parent:PrimObj	Segs:1 BaseType:1 Pos:BoxData[11]					WireColor:Yellow
										GeoSphere Name:"v3"					Radius:0.05 Parent:PrimObj	Segs:1 BaseType:1 Pos:BoxData[12]					WireColor:Yellow
										GeoSphere Name:"tv0"				Radius:0.05 Parent:PrimObj	Segs:1 BaseType:1 Pos:BoxData[13]					WireColor:Yellow
										GeoSphere Name:"tv1"				Radius:0.05 Parent:PrimObj	Segs:1 BaseType:1 Pos:BoxData[14]					WireColor:Yellow
										GeoSphere Name:"tv3"				Radius:0.05 Parent:PrimObj	Segs:1 BaseType:1 Pos:BoxData[15]					WireColor:Yellow
										/**/
										
									)
									#Cylinder: (
										local	PrimObj = (CreateIfUnique Prim[2] AllowSearch:false ParentNode:Result NodeType:EGIMS_V_Col_PrimCylinder),
												TopVert = Vertices[Prim[4]],
												BottomVert = Vertices[Prim[5]],
												Dir = (TopVert - BottomVert)
										PrimObj.Pos = (BottomVert + (Dir / 2))
										PrimObj.Dir = Dir
										PrimObj.SuspendMeshBuilding()
										PrimObj.MtlID = Prim[3]
										PrimObj.Height = (Distance TopVert BottomVert)
										PrimObj.Radius = Prim[6]
										PrimObj.ResumeMeshBuilding()
									)
									default:
										EGIMS_EHAbort "Unknown Primitive type: " Param1:Prim[1] BufferID:BufferID
								)
							)
							
							--delete unused verts
							local	UnusedVerts = #{}
							for i = Vertices.Count to 1 by -1 do
								UnusedVerts[i] = true
							UnusedVerts.Count = Vertices.Count
							for Face in Faces do (
								for i = 1 to 3 do
									UnusedVerts[Face[i]] = false
							)
							if UnusedVerts.NumberSet != 0 then
								MeshOp.DeleteVerts Result UnusedVerts
							Free UnusedVerts
						) else
							EGIMS_EHAbort "Unknown phBound type: " Param1:Type BufferID:BufferID
					)
				)
				if Have Result then (
					--if IsSeparate then (
						Result.Name = ObjName
						if not Supplied TargetPos then
							TargetPos = [0, 0, 0]
						Result.Pos = (TargetPos * ParentTM)
					--)
					
					--apply childflags
					/*
					Select Result
					MAX Modify Mode
					local	mod = modPanel.getCurrentObject()
					MAX Create Mode
					ClearSelection()
					*/
					if not Supplied ParamHolder then
						ParamHolder = Result
					if Supplied NodeChildFlags then (
						ParamHolder.Flags1 = NodeChildFlags[1]
						ParamHolder.Flags2 = NodeChildFlags[2]
					)
					--set material
					if Type != #BoundComposite then (
						local	MaterialCount = Materials.Count,
								MaterialList = #(),
								MaterialIDList = #(),
								MaterialNameList = #(),
								DBMaterialNames = GIMS.CurrentGame.Core.DB.Materials[1],
								UpdateMatrix = GIMS.Core.ValueOps.UpdateMatrix
						for i = MaterialCount to 1 by -1 do (
							local	MaterialData = Materials[i],
									MatIndex = MaterialData[1],
									MtlName = DBMaterialNames[MatIndex],
									Mtl = (EGIMS_V_Material Name:MtlName ShowInViewport:true),
									Opacity = 100,
									MaterialColorIndex = MaterialData[3],
									HaveColorFlag = 0
							if
								(Supplied MaterialColors) and
								(MaterialColorIndex != 0)
							then (
								local	Clr = MaterialColors[MaterialColorIndex]
								Mtl.CollisionData = (UpdateMatrix Mtl.CollisionData 1 (TypeCast Clr Point3 BufferID:BufferID))
								Opacity = Clr.a
								HaveColorFlag = 1
							)
							Mtl.CollisionData = (UpdateMatrix Mtl.CollisionData 2 [Opacity, MatIndex, HaveColorFlag])
							Mtl.CollisionData = (UpdateMatrix Mtl.CollisionData 3 [MaterialData[2], MaterialData[4], MaterialData[5]])
							MaterialList[i] = Mtl
							MaterialIDList[i] = i
							MaterialNameList[i] = MtlName
						)
						local	Mtl = (
									MultiMaterial \
										Name:ObjName \
										MaterialList:MaterialList \
										MaterialIDList:MaterialIDList \
										Names:MaterialNameList
								)
						Result.Material = Mtl
						Result.Children.Material = Mtl
					)
				)
				GIMS.CurrentGame.Core.TypeLibrary.CWXML.TagSceneNode Result SourceFormat Extension Kind:#Bound SourceXML:SourceXMLPath
				Result
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#DiskPath, #ObjName, #Extension, #Type), #(DiskPath, ObjName, Extension, Type)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		)
	)
	struct /*#PC*PATH	GIMS.CurrentGame.Core.TypeLibrary.grcPhBoundDictionary*/ strPhBoundDictionary (
		GIMSObjectLink = "GIMS.CurrentGame.Core.TypeLibrary.grcPhBoundDictionary",
		DiskPath,
		ObjName,
		Extension = ".obd",
		Version = [43, 31],
		SourceFormat = #OpenFormats,
		SourceXMLPath = unsupplied,
		Items = #(),
		fn PostCacheLoad CachePath = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#CachePath), #(CachePath)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn ReadCodeWalkerXML = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	CWXML = GIMS.CurrentGame.Core.TypeLibrary.CWXML,
						FilePath = (DiskPath + ObjName + Extension),
						XMLDoc = (CWXML.LoadDocument FilePath)
				if No XMLDoc then
					return false
				SourceFormat = #XML
				SourceXMLPath = (CWXML.CacheSourceXML FilePath)
				ObjName = (CWXML.CleanResourceName ObjName)
				Extension = (CWXML.GetKindExtension #BoundDictionary)
				local	Root = XMLDoc.DocumentElement,
						ItemNodes = (Root.SelectNodes "Item"),
						grcPhBound = GIMS.CurrentGame.Core.TypeLibrary.grcPhBound
				if ItemNodes.Count == 0 then
					ItemNodes = (Root.SelectNodes "Bounds")
				local	ItemCount = ItemNodes.Count
				Items.Count = ItemCount
				for i = 0 to (ItemCount - 1) do (
					local	ItemNode = (ItemNodes.Item[i]),
							BoundNode = ItemNode,
							InnerBounds = (CWXML.GetChild ItemNode "Bounds"),
							ItemName = (CWXML.GetChildText ItemNode "Name" DefaultVal:(ObjName + "_" + ((i + 1) as String)))
					if Have InnerBounds then
						BoundNode = InnerBounds
					local	NewItem = (grcPhBound DiskPath:DiskPath ObjName:ItemName Extension:Extension)
					if not (NewItem.ReadCodeWalkerFromNode BoundNode ChildName:ItemName) then
						return false
					Items[i + 1] = NewItem
				)
				true
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#DiskPath, #ObjName, #Extension), #(DiskPath, ObjName, Extension)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Read ReportProgress:true CachePath:undefined = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	ValueOps = GIMS.Core.ValueOps,
						FormatText = ValueOps.FormatText,
						FilePath = (
							FormatText \
								v1:DiskPath \
								v2:ObjName \
								v3:Extension
						),
						ExtName = (ToUpper (SubstituteString Extension "." ""))
				if
					(MatchPattern ExtName Pattern:"XML") or
					(GIMS.CurrentGame.Core.TypeLibrary.CWXML.IsXMLFile FilePath)
				then
					return (ReadCodeWalkerXML())
				local	Result = true,
						tLine,
						BufferMgr = GIMS.Core.BufferMgr,
						ReadVal = BufferMgr.ReadVal,
						Skip = BufferMgr.Skip,
						NotEOF = BufferMgr.NotEOF,
						StringOps = GIMS.Core.StringOps,
						oFTypeExec = StringOps.oFTypeExec,
						NoCaseOrderComparator = StringOps.NoCaseOrderComparator,
						UpdateMatrix = ValueOps.UpdateMatrix,
						TypeCast = ValueOps.TypeCast,
						\
						grcPhBound = GIMS.CurrentGame.Core.TypeLibrary.grcPhBound,
						GetProgress = BufferMgr.GetProgress,
						UpdateProgress = GIMS.Core.GUIMgr.UpdateProgress,
						ArrayOps = GIMS.Core.ArrayOps,
						AppendMHL = ArrayOps.AppendMHL,
						FetchMHL = ArrayOps.FetchMHL,
						QuickSearch = ArrayOps.QuickSearch,
						ObjectNames = GIMS.CurrentGame.Core.DB.ObjectNames,
						BufferID = (BufferMgr.ReadFile FilePath Mode:#TxtLines)
				local	ObjHash = (
					try
						(ObjName + "L") as Integer64
					catch
						undefined
				)
				if Have ObjHash then
					ObjName = (FetchMHL ObjectNames ObjHash)
				else
					AppendMHL ObjectNames ObjName
				if BufferID == false then
					Result = false
				else (
					local	ItemCount = 0
					Items.Count = 20
					while
						Result and
						(NotEOF BufferID) and
						(tLine = (ReadVal BufferID FilterStr:"\t "))[1] != "}"
					do ( /* skips end */
						local	Tag = (TypeCast tLine[1] name BufferID:BufferID)
						case Tag of (
							#Version: (
								if (oFTypeExec tLine #P2 IDMask:#{2, 3} BufferID:BufferID) != Version then (
									GIMS.Core.SystemMgr.AddResult #Error  (
										FormatText \
											v1:"Wrong version resource \"" \
											v2:DiskPath \
											v3:ObjName \
											v4:Extension \
											v5:"\""
									)
									Result = false
								)
								Skip BufferID 1 /* skip dict start */
							)
							Default: (
								local	SubPath = tLine[1],
										NewItem = (grcPhBound DiskPath:(DiskPath + (GetFileNamePath SubPath)) ObjName:(GetFileNameFile SubPath))
								if (
									NewItem.Read \
										ReportProgress:false \
										BufferMgr:BufferMgr \
										Skip:Skip \
										ReadVal:ReadVal \
										TypeCast:TypeCast \
										oFTypeExec:oFTypeExec \
										GetProgress:GetProgress \
										UpdateProgress:UpdateProgress \
										FormatText:FormatText \
										NotEOF:NotEOF \
										grcPhBound:grcPhBound \
										ValueOps:ValueOps \
										AppendMHL:AppendMHL \
										FetchMHL:FetchMHL \
										QuickSearch:QuickSearch \
										ObjectNames:ObjectNames \
										NoCaseOrderComparator:NoCaseOrderComparator \
										UpdateMatrix:UpdateMatrix
								) then (
									ItemCount += 1
									Items[ItemCount] = NewItem
								) else
									Result = false
							)
						)
						if ReportProgress then
							UpdateProgress #Progress (GetProgress BufferID)
						else
							UpdateProgress #None 0
					)
					Items.Count = ItemCount
					BufferMgr.ClearBuffer BufferID
				)
				Result
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#DiskPath, #ObjName, #Extension), #(DiskPath, ObjName, Extension)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn WriteCodeWalkerXML = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	CWXML = GIMS.CurrentGame.Core.TypeLibrary.CWXML,
						FilePath = (DiskPath + ObjName + Extension),
						SS = (StringStream "")
				Format "%" "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" To:SS
				Format "%" "<BoundDictionary>\n" To:SS
				for Item in Items do (
					if Have Item then
						Item.WriteCodeWalkerNode SS " " "Item"
				)
				Format "%" "</BoundDictionary>\n" To:SS
				CWXML.WriteXMLFile FilePath (SS as String)
				Free SS
				OK
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#DiskPath, #ObjName, #Extension), #(DiskPath, ObjName, Extension)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Write ReportProgress:true = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if (GIMS.CurrentGame.Core.TypeLibrary.CWXML.IsXMLExport Extension SourceFormat:SourceFormat) then
					return (WriteCodeWalkerXML())
				local	UpdateProgress = GIMS.Core.GUIMgr.UpdateProgress,
						ArrayOps = GIMS.Core.ArrayOps,
						Modify = ArrayOps.Modify,
						BufferMgr = GIMS.Core.BufferMgr,
						WriteVal = BufferMgr.WriteVal,
						ValueOps = GIMS.Core.ValueOps,
						AsoFText = ValueOps.AsoFText,
						TypeCast = ValueOps.TypeCast,
						FormatText = ValueOps.FormatText,
						StringOps = GIMS.Core.StringOps,
						NoCaseOrderComparator = StringOps.NoCaseOrderComparator,
						ToHighReg = StringOps.ToHighReg,
						ObjDir = (DiskPath + ObjName),
						FilePath = (ObjDir + Extension),
						BufferID = (BufferMgr.Create Mode:#TxtLines FilePath:FilePath),
						TabString = "\t",
						SubDir = (ObjName + "\\"),
						SubPath = (DiskPath + SubDir),
						ItemHeader = (TabString + SubDir),
						EntryCount = (Items.Count * 4),
						ChildCount, Progress
				GIMS.Core.SystemMgr.CreateDir SubPath
				if ReportProgress then (
					for Item in Items where (TypeCast Item.Type Name BufferID:BufferID) == #BoundComposite do
						EntryCount += (Item.Children.Count * 4)
					Progress = [0, 0, EntryCount]
				)
				WriteVal BufferID (AsoFText Version TypeHook:Integer TabString:"Version ")
				WriteVal BufferID "{"
				for Item in Items do (
					WriteVal BufferID (
						FormatText \
							v1:ItemHeader \
							v2:Item.ObjName \
							v3:Item.Extension
					)
					Item.DiskPath = SubPath
					Item.Write \
						NoCaseOrderComparator:NoCaseOrderComparator \
						ToHighReg:ToHighReg \
						BufferMgr:BufferMgr \
						WriteVal:WriteVal \
						ValueOps:ValueOps \
						FormatText:FormatText \
						AsoFText:AsoFText \
						TypeCast:TypeCast \
						UpdateProgress:UpdateProgress \
						ArrayOps:ArrayOps \
						Modify:Modify \
						Progress:Progress \
						ReportProgress:ReportProgress
				)
				WriteVal BufferID "}"
				BufferMgr.WriteFile BufferID FilePath:FilePath
				BufferMgr.ClearBuffer BufferID
				OK
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#DiskPath, #ObjName, #Extension), #(DiskPath, ObjName, Extension)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Create ParentNode ReportProgress:true = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	ObjectMgr = GIMS.Core.ObjectMgr,
						CreateIfUnique = ObjectMgr.CreateIfUnique,
						Result = (CreateIfUnique ObjName ParentNode:ParentNode AllowSearch:false NodeType:EGIMS_V_CollisionDict),
						ItemCount = Items.Count,
						ParentTM = (
							if ParentNode == RootNode then
								(Matrix3 1)
							else
								ParentNode.Transform
						),
						ProgressStepCount = 0
				if ReportProgress then (
					for TheItem in Items do
						ProgressStepCount += (TheItem.GetCreateProgressStepCount ObjectMgr)
				)
				local	Progress = [0, 0, ProgressStepCount],
						UpdateProgress = GIMS.Core.GUIMgr.UpdateProgress
				for i = 1 to ItemCount do (
					local	Item = Items[i]
					if Have Item then (
						Item.Create Result ReportProgress:ReportProgress Progress:Progress IsSeparate:false \
							UpdateProgress:UpdateProgress \
							ObjectMgr:ObjectMgr \
							CreateIfUnique:CreateIfUnique
					)
				)
				if
					Have Result and
					ParentNode != RootNode
				then
					Result.Transform = ParentNode.Transform
				GIMS.CurrentGame.Core.TypeLibrary.CWXML.TagSceneNode Result SourceFormat Extension Kind:#BoundDictionary SourceXML:SourceXMLPath
				Result
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#DiskPath, #ObjName, #Extension), #(DiskPath, ObjName, Extension)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		)
	)
	
/* oF drawable */

	struct /*#PC*PATH	GIMS.CurrentGame.Core.TypeLibrary.grcMeshVertex*/ strMeshVertex (
		Position,
		Normal,
		TheColor,
		TheColor2,
		Tangent,
		SkinBones = unsupplied,
		SkinWeights = unsupplied,
		UVCoords = unsupplied,
		CollectionIndex = #NoCollectionIndex,
		HashValue,
		fn GetHash = (
			/*<PROFILERSTART>*//*LogProfiler #Start "V.MeshVertex.GetHash"; local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if No HashValue then (
					local	ResultStream = (StringStream ""),
							FmtStr = "%,",
							FloatFmtStr = "0.6f"
					Format FmtStr (FormattedPrint Position Format:FloatFmtStr) To:ResultStream
					Format FmtStr (FormattedPrint Normal Format:FloatFmtStr) To:ResultStream
					Format FmtStr (FormattedPrint Tangent Format:FloatFmtStr) To:ResultStream
					Format FmtStr (FormattedPrint TheColor Format:FloatFmtStr) To:ResultStream
					Format FmtStr (FormattedPrint TheColor2 Format:FloatFmtStr) To:ResultStream
					if Supplied UVCoords then (
						for Val in UVCoords do
							Format FmtStr (FormattedPrint Val Format:FloatFmtStr) To:ResultStream
					)
					if Supplied SkinWeights then (
						for Val in SkinWeights do
							Format FmtStr (FormattedPrint Val Format:FloatFmtStr) To:ResultStream
					)
					if Supplied SkinBones then (
						for Val in SkinBones do
							Format FmtStr (FormattedPrint Val Format:FloatFmtStr) To:ResultStream
					)
					local	HashString = (ResultStream as String)
					Free ResultStream
					HashValue = (GIMS.Core.ValueOps.GetHash HashString)
				)
				HashValue
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Dispose = (
			Free UVCoords
		)
	)
	struct /*#PC*PATH	GIMS.CurrentGame.Core.TypeLibrary.grcLODMeshGeometry*/ strLODMeshGeometry (
		GIMSObjectLink = "GIMS.CurrentGame.Core.TypeLibrary.grcLODMeshGeometry",
		ShaderIndex,
		Idx = #(),
		Positions = #(),
		Flags = #{},
		KnownFlags = #(
			#FLAG_VB_DYNAMIC,
			#FLAG_VB_READ_WRITE,
			#FLAG_COMPACT_BONE_MAPPING
		),
		Normals = unsupplied,
		Colors = unsupplied,
		Colors2 = unsupplied,
		Tangents = unsupplied,
		SkinBones = unsupplied,
		SkinWeights = unsupplied,
		VertClothSkins = unsupplied,
		UVCoords = unsupplied,
		fn GetVertexDeclaration Skinned ShadingGroup NeededLength:-1 PreferLonger:false &vdName:unsupplied = (
			local	SPSName
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				SPSName = ShadingGroup.Mtls[ShaderIndex].SPSName
				local	SPS = (GIMS.CurrentGame.Core.DB.GetShaderByName SPSName),
						VertexDeclarations = SPS.VertexDeclarations,
						VertexDeclaration = unsupplied
				/*TODO remove, debug*	LogProfiler #PlainInfo #(#(#Skinned, #NeededLength, #vdName, #SPS), #(Skinned, NeededLength, vdName, SPS))	/**/
				if 
					(NeededLength != -1) or
					PreferLonger
				then (
					if PreferLonger then (	--search the most informative VD
						local	MaxLenVD = unsupplied,
								MaxLen = -1
						for VD in VertexDeclarations where VD.Skinned == Skinned do (
							local	Elements = VD.Elements,
									ElementCount = Elements.Count
							if ElementCount > MaxLen then (
								MaxLen = ElementCount
								MaxLenVD = VD
							)
						)
						if MaxLen != -1 then (
							if Supplied vdName then
								vdName = MaxLenVD.aName
							VertexDeclaration = MaxLenVD.Elements
						)
					) else (	--search VD with predefined length
						if Supplied vdName then (
							for VD in VertexDeclarations where
								(VD.aName == vdName) and
								(VD.Skinned == Skinned)
							while not Supplied VertexDeclaration do (
								local	Elements = VD.Elements
								if Elements.Count == NeededLength then
									VertexDeclaration = Elements
							)
						) else (
							for VD in VertexDeclarations where (VD.Skinned == Skinned) while not Supplied VertexDeclaration do (
								local	Elements = VD.Elements
								if Elements.Count == NeededLength then
									VertexDeclaration = Elements
							)
						)
					)
				) else (	--simple search
					if Supplied vdName then (
						for VD in VertexDeclarations where
							(VD.aName == vdName) and
							(VD.Skinned == Skinned)
						while not Supplied VertexDeclaration do
							VertexDeclaration = VD.Elements
					) else (
						for VD in VertexDeclarations where VD.Skinned == Skinned while not Supplied VertexDeclaration do
							VertexDeclaration = VD.Elements
					)
				)
				VertexDeclaration
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#Skinned, #ShaderIndex, #SPSName), #(Skinned, ShaderIndex, SPSName)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Read BufferID Skinned ShadingGroup = (
			local	VDUsage = unsupplied,
					VertLine
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if No ShadingGroup then
					throw "Can't find ShadingGroup"
				local	tLine,
						BufferMgr = GIMS.Core.BufferMgr,
						ReadVal = BufferMgr.ReadVal,
						Skip = BufferMgr.Skip,
						oFTypeExec = GIMS.Core.StringOps.oFTypeExec,
						Modify = GIMS.Core.ArrayOps.Modify,
						ValueOps = GIMS.Core.ValueOps,
						TypeCast = ValueOps.TypeCast,
						\
						SPSToGIMSParamType = GIMS.CurrentGame.Core.MAXFactory.ObjectMgr.SPSToGIMSParamType,
						vdName = unsupplied,
						Result = true
				GIMS.Core.GUIMgr.UpdateProgress #None 0
				Skip BufferID 1 /* skip start */
				while 
					Result and
					(tLine = (ReadVal BufferID FilterStr:"\t "))[1] != "}" 
				do ( /* skips end */
					local	Tag = (TypeCast tLine[1] name BufferID:BufferID)
					case Tag of (
						#ShaderIndex:
							ShaderIndex = ((TypeCast tLine[2] Integer BufferID:BufferID) + 1)
						#Flags: (
							if tLine[2] != "-" then (
								for i = 2 to tLine.Count do (
									local	ID = (FindItem KnownFlags (TypeCast tLine[i] name BufferID:BufferID))
									if ID == 0 then
										EGIMS_EHAbort ("Unknown UsageFlag \"" + tLine[i] as String + "\" in object \"" + ObjName + "\" found!") BufferID:BufferID
									Flags[ID] = true
								)
							)
						)
						#VertexDeclaration:
							vdName = (TypeCast tLine[2] Name BufferID:BufferID)
						#Indices: (
							/*<PROFILERSTART>*//*LogProfiler #Start "Read indices"; local PWS = (*//*<PROFILERSTARTED>*/
							
							local	IdxCount = (TypeCast tLine[2] Integer BufferID:BufferID),
									StartIdxIndex = 1
							Idx.Count = (IdxCount / 3)
							Skip BufferID 1 /* skip start */
							while (tLine = (ReadVal BufferID FilterStr:"\t "))[1] != "}" do ( /* skips end */
								local	TempIdx = (oFTypeExec tLine #IntArray BufferID:BufferID),
										NewIdxCount = (TempIdx.Count / 3),
										NewIdxOffset = 1
								for IdxOffset = 0 to (NewIdxCount - 1) do (
									Idx[StartIdxIndex + IdxOffset] = [ \
										TempIdx[NewIdxOffset] + 1, \
										TempIdx[NewIdxOffset + 1] + 1, \
										TempIdx[NewIdxOffset + 2] + 1 \
									]
									NewIdxOffset += 3
								)
								StartIdxIndex += NewIdxCount
							)
							
							/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
						)
						#Vertices: (
							Skip BufferID 1 /* skip start */
							
							--calculate param count
							local	ParamSeparator = "/",
									FirstVertexLine = (ReadVal BufferID),
									NeededLength = 1
							for i = 1 to FirstVertexLine.Count where FirstVertexLine[i] == ParamSeparator do
								NeededLength += 1
							Skip BufferID -1 /* return back to the 1st vertex */
							
							--prepare info
							local	VertexDeclaration = (GetVertexDeclaration Skinned ShadingGroup NeededLength:NeededLength vdName:vdName)
							if Supplied VertexDeclaration then (
								local	VertexDeclarationCount = VertexDeclaration.Count,
										VDGIMSParamTypes = #(),
										VertCount = (TypeCast tLine[2] Integer BufferID:BufferID),
										HaveUV = false,
										HaveColors = false,
										HaveColors2 = false,
										HaveNormals = false,
										HaveTangents = false,
										HaveBones = false,
										HaveWeights = false,
										UVCount = 0
										
								--read
								/*<PROFILERSTART>*//*LogProfiler #Start "Init vertices"; local PWS = (*//*<PROFILERSTARTED>*/
								for ParamID = VertexDeclarationCount to 1 by -1 do (
									local	VD = VertexDeclaration[ParamID],
											Type = (SPSToGIMSParamType VD.aType)
									VDGIMSParamTypes[ParamID] = Type
									case VD.Usage of (
										#D3DDECLUSAGE_POSITION: ()
										#D3DDECLUSAGE_TEXCOORD: (
											HaveUV = true
											UVCount += (
												case Type of (
													#Float:
														1
													#P2:
														1
													#P3:
														2
													#P4:
														2
													default:
														throw "Unknown UV type: " Type BufferID:BufferID
												)
											)
										)
										#D3DDECLUSAGE_COLOR: (
											if HaveColors then (
												if not HaveColors2 then
													HaveColors2 = true
												else (
													UVCount += (
														case Type of (
															#Float:
																1
															#P2:
																1
															#P3:
																2
															#P4:
																2
															default:
																throw "Unknown Color type: " Type BufferID:BufferID
														)
													)
												)
											) else
												HaveColors = true
										)
										#D3DDECLUSAGE_NORMAL:
											HaveNormals = true
										#D3DDECLUSAGE_TANGENT:
											HaveTangents = true
										#D3DDECLUSAGE_BLENDINDICES:
											HaveBones = true
										#D3DDECLUSAGE_BLENDWEIGHT:
											HaveWeights = true
										Default:
											throw "Unknown vertex declaration element: " VD.Usage BufferID:BufferID
									)
								)
								Positions.Count = VertCount
								if HaveUV then (
									UVCoords = #()
									UVCoords.Count = UVCount
									local	UVID = 0,
											UVDummy = #()
									UVDummy.Count = VertCount
									for ParamID = 1 to VertexDeclarationCount do (
										if VertexDeclaration[ParamID].Usage == #D3DDECLUSAGE_TEXCOORD then (
											UVID += 1
											UVCoords[UVID] = (DeepCopy UVDummy)
											local	MAXParamType = VDGIMSParamTypes[ParamID]
											if
												(MAXParamType == #P3) or
												(MAXParamType == #P4)
											then (
												UVID += 1
												UVCoords[UVID] = (DeepCopy UVDummy)
											)
										)
									)
								)
								if HaveColors then (
									Colors = #()
									Colors.Count = VertCount
								)
								if HaveColors2 then (
									Colors2 = #()
									Colors2.Count = VertCount
								)
								if HaveNormals then (
									Normals = #()
									Normals.Count = VertCount
								)
								if HaveTangents then (
									Tangents = #()
									Tangents.Count = VertCount
								)
								if Skinned then (
									if HaveBones then (
										SkinBones = #()
										SkinBones.Count = VertCount
										VertClothSkins = #{}
										VertClothSkins.Count = VertCount
									)
									if HaveWeights then (
										SkinWeights = #()
										SkinWeights.Count = VertCount
									)
								)
								
								/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
								/*<PROFILERSTART>*//*LogProfiler #Start "Read vertices"; local PWS = (*//*<PROFILERSTARTED>*/
								
								for VertID = 1 to VertCount do (
									VertLine = (ReadVal BufferID FilterStr:ParamSeparator)
									local	UVID = 1,
											ColorID = 1
									for ParamID = 1 to VertexDeclarationCount do (
										local	VD = VertexDeclaration[ParamID],
												Type = VDGIMSParamTypes[ParamID]
										VDUsage = VD.Usage
										case VDUsage of (
											#D3DDECLUSAGE_POSITION:
												Positions[VertID] = (oFTypeExec VertLine[ParamID] Type BufferID:BufferID)
											#D3DDECLUSAGE_TEXCOORD: (
												local	UVCoord = (oFTypeExec VertLine[ParamID] Type BufferID:BufferID)
												case Type of (
													#Float: (
														UVCoords[UVID][VertID] = [UVCoord, 0]
														UVID += 1
													)
													#P2: (
														UVCoords[UVID][VertID] = [UVCoord[1], -UVCoord[2]]
														UVID += 1
													)
													#P3: (
														UVCoords[UVID][VertID] = [UVCoord[1], -UVCoord[2]]
														UVCoords[UVID + 1][VertID] = [UVCoord[3], 0]
														UVID += 2
													)
													#P4: (
														UVCoords[UVID][VertID] = [UVCoord[1], -UVCoord[2]]
														UVCoords[UVID + 1][VertID] = [UVCoord[3], -UVCoord[4]]
														UVID += 2
													)
													default:
														throw "Unknown UV type: " Type BufferID:BufferID
												)
											)
											#D3DDECLUSAGE_COLOR: (
												case ColorID of (
													1:
														Colors[VertID] = ((oFTypeExec VertLine[ParamID] Type BufferID:BufferID) / 255)
													2:
														Colors2[VertID] = ((oFTypeExec VertLine[ParamID] Type BufferID:BufferID) / 255)
													default: (
														local	UVCoord = (oFTypeExec VertLine[ParamID] Type BufferID:BufferID)
														case Type of (
															#Float: (
																UVCoords[UVID][VertID] = [UVCoord, 0]
																UVID += 1
															)
															#P2: (
																UVCoords[UVID][VertID] = UVCoord
																UVID += 1
															)
															#P3: (
																UVCoords[UVID][VertID] = [UVCoord[1], UVCoord[2]]
																UVCoords[UVID + 1][VertID] = [UVCoord[3], 0]
																UVID += 2
															)
															#P4: (
																UVCoords[UVID][VertID] = [UVCoord[1], UVCoord[2]]
																UVCoords[UVID + 1][VertID] = [UVCoord[3], UVCoord[4]]
																UVID += 2
															)
															default:
																throw "Unknown Color type: " Type BufferID:BufferID
														)
													)
												)
												ColorID += 1
											)
											#D3DDECLUSAGE_NORMAL:
												Normals[VertID] = (oFTypeExec VertLine[ParamID] Type BufferID:BufferID)
											#D3DDECLUSAGE_TANGENT:
												Tangents[VertID] = (oFTypeExec VertLine[ParamID] Type BufferID:BufferID)
											#D3DDECLUSAGE_BLENDINDICES: (
												local	BoneIDs = (Modify (TypeCast (oFTypeExec VertLine[ParamID] Type BufferID:BufferID) #Array BufferID:BufferID) 1 #Add CopyArray:false)
												SkinBones[VertID] = BoneIDs
												if BoneIDs[3] == 256 then
													VertClothSkins[VertID] = true
											)
											#D3DDECLUSAGE_BLENDWEIGHT:
												SkinWeights[VertID] = (TypeCast (oFTypeExec VertLine[ParamID] Type BufferID:BufferID) #Array BufferID:BufferID)
											Default:
												throw "Unknown vertex declaration element: " VD.Usage BufferID:BufferID
										)
									)
								)
								
								/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
							
							) else (
								GIMS.Core.SystemMgr.AddResult #Error  (
									ValueOps.FormatText \
										v1:"Can't find a vertex declaration with name \"" \
										v2:(vdName as String) \
										v3:"\" for material #" \
										v4:(
											if Have ShaderIndex then
												(ShaderIndex as String)
											else
												"<UNKNOWN>"
										) \
										v5:". Mesh can't be read and will be skipped." \
								)
								Result = false
							)
							Skip BufferID 1 /* skip end */
						)
						default:
							EGIMS_EHAbort "Unknown strLODMeshPrim tag: " Param1:tLine[1] BufferID:BufferID
					)
				)
				Result
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(
				#(
					#VDUsage,
					#VertLine,
					#Idx,
					#Positions,
					#Normals,
					#Colors,
					#Colors2,
					#Tangents,
					#SkinBones,
					#VertClothSkins,
					#SkinWeights,
					#UVCoords
				), #(
					VDUsage,
					VertLine,
					Idx,
					Positions,
					Normals	 		,
					Colors 			,
					Colors2 		,
					Tangents 		,
					SkinBones 		,
					VertClothSkins	,
					SkinWeights 	,
					UVCoords 		
				)	
			))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn ReadCodeWalkerGeometry GeomNode LayoutType Skinned = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	CWXML = GIMS.CurrentGame.Core.TypeLibrary.CWXML,
						ShaderNode = (CWXML.GetChild GeomNode "ShaderIndex"),
						VBNode = (CWXML.GetChild GeomNode "VertexBuffer"),
						IBNode = (CWXML.GetChild GeomNode "IndexBuffer")
				ShaderIndex = (
					if Have ShaderNode then
						((CWXML.GetAttrInt ShaderNode "value") + 1)
					else
						1
				)
				if No VBNode then
					return false
				local	LayoutNode = (CWXML.GetChild VBNode "Layout"),
						DataNode = (CWXML.GetChild VBNode "Data")
				if No DataNode then
					DataNode = (CWXML.GetChild VBNode "Data2")
				if
					No LayoutNode or
					No DataNode
				then
					return false
				local	BonePalette = #(),
						BoneIDsNode = (CWXML.GetChild GeomNode "BoneIDs")
				if Have BoneIDsNode then (
					local	PalTokens = (CWXML.SplitTokens (SubstituteString BoneIDsNode.InnerText "," " "))
					BonePalette.Count = PalTokens.Count
					for p = 1 to PalTokens.Count do
						BonePalette[p] = ((GIMS.Core.ValueOps.TypeCast PalTokens[p] Integer) + 1)
				)
				local	LayoutTags = #(),
						LayoutChildren = LayoutNode.ChildNodes
				for i = 0 to (LayoutChildren.Count - 1) do (
					local	Child = (LayoutChildren.Item[i])
					if
						Have Child and
						Have Child.Name and
						Child.Name.Count != 0 and
						Child.Name[1] != "#"
					then
						Append LayoutTags Child.Name
				)
				local	IsGTAV2 = ((CWXML.GetAttr LayoutNode "type") == "GTAV2"),
						Tokens = (CWXML.SplitTokens DataNode.InnerText),
						AttrSizes = #(),
						HaveUV = false,
						HaveColors = false,
						HaveColors2 = false,
						HaveNormals = false,
						HaveTangents = false,
						HaveBones = false,
						HaveWeights = false,
						UVCount = 0,
						Stride = 0
				AttrSizes.Count = LayoutTags.Count
				for i = 1 to LayoutTags.Count do (
					local	TagName = (ToUpper LayoutTags[i]),
							Size = 0
					case of (
						(TagName == "POSITION"):
							Size = 3
						(TagName == "NORMAL"):
							Size = (if IsGTAV2 then 4 else 3)
						(TagName == "TANGENT"):
							Size = 4
						(TagName == "BINORMAL"):
							Size = 4
						(MatchPattern TagName Pattern:"TEXCOORD*"):
							Size = 2
						(MatchPattern TagName Pattern:"COLOUR*"):
							Size = 4
						(TagName == "BLENDWEIGHTS"):
							Size = 4
						(TagName == "BLENDINDICES"):
							Size = 4
						default:
							Size = 0
					)
					AttrSizes[i] = Size
					Stride += Size
				)
				if Stride == 0 then
					return false
				local	VertCount = (Tokens.Count / Stride)
				if VertCount < 1 then
					return false
				for i = 1 to LayoutTags.Count do (
					local	TagName = (ToUpper LayoutTags[i])
					case of (
						(TagName == "NORMAL"):
							HaveNormals = true
						(TagName == "TANGENT"):
							HaveTangents = true
						(MatchPattern TagName Pattern:"TEXCOORD*"): (
							HaveUV = true
							UVCount += 1
						)
						(TagName == "COLOUR0"):
							HaveColors = true
						(TagName == "COLOUR1"):
							HaveColors2 = true
						(TagName == "BLENDINDICES"):
							HaveBones = true
						(TagName == "BLENDWEIGHTS"):
							HaveWeights = true
						default: ()
					)
				)
				Positions.Count = VertCount
				if HaveUV then (
					UVCoords = #()
					UVCoords.Count = UVCount
					local	UVDummy = #()
					UVDummy.Count = VertCount
					for u = 1 to UVCount do
						UVCoords[u] = (DeepCopy UVDummy)
				)
				if HaveColors then (
					Colors = #()
					Colors.Count = VertCount
				)
				if HaveColors2 then (
					Colors2 = #()
					Colors2.Count = VertCount
				)
				if HaveNormals then (
					Normals = #()
					Normals.Count = VertCount
				)
				if HaveTangents then (
					Tangents = #()
					Tangents.Count = VertCount
				)
				if Skinned then (
					if HaveBones then (
						SkinBones = #()
						SkinBones.Count = VertCount
						VertClothSkins = #{}
						VertClothSkins.Count = VertCount
					)
					if HaveWeights then (
						SkinWeights = #()
						SkinWeights.Count = VertCount
					)
				)
				local	TokenID = 1,
						TypeCast = GIMS.Core.ValueOps.TypeCast
				for VertID = 1 to VertCount do (
					local	UVID = 1
					for AttrID = 1 to LayoutTags.Count do (
						local	TagName = (ToUpper LayoutTags[AttrID]),
								Size = AttrSizes[AttrID],
								Values = #()
						Values.Count = Size
						if
							Size != 0 and
							(TokenID + Size - 1) > Tokens.Count
						then
							return false
						for s = 1 to Size do (
							Values[s] = (TypeCast Tokens[TokenID] Float)
							TokenID += 1
						)
						case of (
							(TagName == "POSITION"):
								Positions[VertID] = [Values[1], Values[2], Values[3]]
							(TagName == "NORMAL"):
								Normals[VertID] = [Values[1], Values[2], Values[3]]
							(TagName == "TANGENT"):
								Tangents[VertID] = [Values[1], Values[2], Values[3]]
							(MatchPattern TagName Pattern:"TEXCOORD*"): (
								UVCoords[UVID][VertID] = [Values[1], -Values[2]]
								UVID += 1
							)
							(TagName == "COLOUR0"): (
								local	Div = (if (aMax Values) > 1.0 then 255.0 else 1.0),
										Alpha = (if Size > 3 then Values[4] else Div)
								Colors[VertID] = [Values[1] / Div, Values[2] / Div, Values[3] / Div, Alpha / Div]
							)
							(TagName == "COLOUR1"): (
								local	Div = (if (aMax Values) > 1.0 then 255.0 else 1.0),
										Alpha = (if Size > 3 then Values[4] else Div)
								Colors2[VertID] = [Values[1] / Div, Values[2] / Div, Values[3] / Div, Alpha / Div]
							)
							(TagName == "BLENDINDICES"): (
								if Skinned then (
									local	BoneIDs = #()
									BoneIDs.Count = 4
									for b = 1 to 4 do (
										local	PalIndex = ((TypeCast Values[b] Integer) + 1)
										if
											PalIndex >= 1 and
											PalIndex <= BonePalette.Count
										then
											BoneIDs[b] = BonePalette[PalIndex]
										else
											BoneIDs[b] = PalIndex
									)
									SkinBones[VertID] = BoneIDs
									if BoneIDs[3] == 256 then
										VertClothSkins[VertID] = true
								)
							)
							(TagName == "BLENDWEIGHTS"): (
								if Skinned then (
									local	Div = (if (aMax Values) > 1.0 then 255.0 else 1.0)
									SkinWeights[VertID] = #(Values[1] / Div, Values[2] / Div, Values[3] / Div, Values[4] / Div)
								)
							)
							default: ()
						)
					)
				)
				if Have IBNode then (
					local	IndexData = (CWXML.GetChild IBNode "Data")
					if Have IndexData then (
						local	IndexTokens = (CWXML.SplitTokens IndexData.InnerText),
								IndexCount = IndexTokens.Count,
								TriCount = (IndexCount / 3)
						Idx.Count = TriCount
						local	IndexID = 1
						for t = 1 to TriCount do (
							Idx[t] = [((TypeCast IndexTokens[IndexID] Integer) + 1), ((TypeCast IndexTokens[IndexID + 1] Integer) + 1), ((TypeCast IndexTokens[IndexID + 2] Integer) + 1)]
							IndexID += 3
						)
					)
				)
				true
			/*<ERRHANDLER>*/) catch (
				local	CET = (GetCurrentException())
				try (GIMS.Core.SystemMgr.AddResult #Warning ("Skipped a CodeWalker geometry: " + CET)) catch ()
				false
			)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn WriteCodeWalkerXML SS Tab Skinned = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	CWXML = GIMS.CurrentGame.Core.TypeLibrary.CWXML,
						Inner = (Tab + " "),
						Inner2 = (Inner + " "),
						Inner3 = (Inner2 + " "),
						VertCount = Positions.Count,
						HaveUV = (Supplied UVCoords and Have UVCoords and UVCoords.Count != 0),
						UVCount = (if HaveUV then UVCoords.Count else 0),
						HaveColors = (Supplied Colors and Have Colors),
						HaveColors2 = (Supplied Colors2 and Have Colors2),
						HaveNormals = (Supplied Normals and Have Normals),
						HaveTangents = (Supplied Tangents and Have Tangents),
						HaveBones = (Skinned and Supplied SkinBones and Have SkinBones),
						HaveWeights = (Skinned and Supplied SkinWeights and Have SkinWeights),
						Palette = #(),
						BMin = [0, 0, 0],
						BMax = [0, 0, 0]
				CWXML.XMLWrite SS (Tab + "<Item>\n")
				CWXML.XMLWrite SS (CWXML.ValueTag Inner "ShaderIndex" (ShaderIndex - 1))
				if VertCount != 0 then (
					BMin = Positions[1]
					BMax = Positions[1]
					if No BMin then (
						BMin = [0, 0, 0]
						BMax = [0, 0, 0]
					)
					for VertID = 2 to VertCount do (
						local	Pos = Positions[VertID]
						if Have Pos then (
							BMin = [(aMin BMin.x Pos.x), (aMin BMin.y Pos.y), (aMin BMin.z Pos.z)]
							BMax = [(aMax BMax.x Pos.x), (aMax BMax.y Pos.y), (aMax BMax.z Pos.z)]
						)
					)
				)
				CWXML.XMLWrite SS (CWXML.Vec4Tag Inner "BoundingBoxMin" [BMin.x, BMin.y, BMin.z, BMin.x])
				CWXML.XMLWrite SS (CWXML.Vec4Tag Inner "BoundingBoxMax" [BMax.x, BMax.y, BMax.z, BMax.x])
				if HaveBones then (
					for VertID = 1 to VertCount do (
						local	IDs = SkinBones[VertID]
						if Have IDs then (
							local	IDCount = IDs.Count
							for b = 1 to IDCount do (
								local	Bid = IDs[b]
								if
									Have Bid and
									Bid != 256 and
									Bid > 0 and
									((FindItem Palette Bid) == 0)
								then
									Append Palette Bid
							)
						)
					)
					if Palette.Count != 0 then (
						local	PalText = ((Palette[1] - 1) as String)
						for p = 2 to Palette.Count do
							PalText += (", " + ((Palette[p] - 1) as String))
						CWXML.XMLWrite SS (Inner + "<BoneIDs>" + PalText + "</BoneIDs>\n")
					)
				)
				CWXML.XMLWrite SS (Inner + "<VertexBuffer>\n")
				CWXML.XMLWrite SS (CWXML.ValueTag Inner2 "Flags" 0)
				CWXML.XMLWrite SS (Inner2 + "<Layout type=\"GTAV1\">\n")
				CWXML.XMLWrite SS (Inner3 + "<Position />\n")
				if Skinned then (
					CWXML.XMLWrite SS (Inner3 + "<BlendWeights />\n")
					CWXML.XMLWrite SS (Inner3 + "<BlendIndices />\n")
				)
				if HaveNormals then
					CWXML.XMLWrite SS (Inner3 + "<Normal />\n")
				if HaveTangents then
					CWXML.XMLWrite SS (Inner3 + "<Tangent />\n")
				if HaveColors then
					CWXML.XMLWrite SS (Inner3 + "<Colour0 />\n")
				if HaveColors2 then
					CWXML.XMLWrite SS (Inner3 + "<Colour1 />\n")
				for u = 1 to UVCount do
					CWXML.XMLWrite SS (Inner3 + "<TexCoord" + ((u - 1) as String) + " />\n")
				CWXML.XMLWrite SS (Inner2 + "</Layout>\n")
				CWXML.XMLWrite SS (Inner2 + "<Data>\n")
				for VertID = 1 to VertCount do (
					local	Line = Inner3,
							Pos = Positions[VertID]
					if No Pos then
						Pos = [0, 0, 0]
					Line += ((CWXML.FormatFloat Pos.x) + " " + (CWXML.FormatFloat Pos.y) + " " + (CWXML.FormatFloat Pos.z))
					if Skinned then (
						local	Wts = (if HaveWeights then SkinWeights[VertID] else undefined),
								WP = (CWXML.GetComp4 Wts [1, 0, 0, 0])
						Line += ("   " + ((CWXML.ScaledByte WP.x) as String) + " " + ((CWXML.ScaledByte WP.y) as String) + " " + ((CWXML.ScaledByte WP.z) as String) + " " + ((CWXML.ScaledByte WP.w) as String))
						local	IDs = (if HaveBones then SkinBones[VertID] else undefined),
								B0 = 0,
								B1 = 0,
								B2 = 0,
								B3 = 0
						if Have IDs then (
							local	Src = #(0, 0, 0, 0)
							for b = 1 to IDs.Count do (
								local	Bid = IDs[b]
								if Bid == 256 then
									Src[b] = 255
								else if Have Bid then (
									local	PalID = (FindItem Palette Bid)
									if PalID != 0 then
										Src[b] = (PalID - 1)
								)
							)
							B0 = Src[1]
							B1 = Src[2]
							B2 = Src[3]
							B3 = Src[4]
						)
						Line += ("   " + (B0 as String) + " " + (B1 as String) + " " + (B2 as String) + " " + (B3 as String))
					)
					if HaveNormals then (
						local	Nrm = Normals[VertID]
						if No Nrm then
							Nrm = [0, 0, 1]
						Line += ("   " + (CWXML.FormatFloat Nrm.x) + " " + (CWXML.FormatFloat Nrm.y) + " " + (CWXML.FormatFloat Nrm.z))
					)
					if HaveTangents then (
						local	Tng = (CWXML.GetComp4 (Tangents[VertID]) [1, 0, 0, 1])
						Line += ("   " + (CWXML.FormatFloat Tng.x) + " " + (CWXML.FormatFloat Tng.y) + " " + (CWXML.FormatFloat Tng.z) + " " + (CWXML.FormatFloat Tng.w))
					)
					if HaveColors then (
						local	Col = (CWXML.GetComp4 (Colors[VertID]) [1, 1, 1, 1])
						Line += ("   " + ((CWXML.ScaledByte Col.x) as String) + " " + ((CWXML.ScaledByte Col.y) as String) + " " + ((CWXML.ScaledByte Col.z) as String) + " " + ((CWXML.ScaledByte Col.w) as String))
					)
					if HaveColors2 then (
						local	Col2 = (CWXML.GetComp4 (Colors2[VertID]) [1, 1, 1, 1])
						Line += ("   " + ((CWXML.ScaledByte Col2.x) as String) + " " + ((CWXML.ScaledByte Col2.y) as String) + " " + ((CWXML.ScaledByte Col2.z) as String) + " " + ((CWXML.ScaledByte Col2.w) as String))
					)
					for u = 1 to UVCount do (
						local	UV = UVCoords[u][VertID]
						if No UV then
							UV = [0, 0]
						Line += ("   " + (CWXML.FormatFloat UV.x) + " " + (CWXML.FormatFloat (-UV.y)))
					)
					CWXML.XMLWrite SS (Line + "\n")
				)
				CWXML.XMLWrite SS (Inner2 + "</Data>\n")
				CWXML.XMLWrite SS (Inner + "</VertexBuffer>\n")
				CWXML.XMLWrite SS (Inner + "<IndexBuffer>\n")
				CWXML.XMLWrite SS (Inner2 + "<Data>\n")
				local	IdxLine = Inner3,
						Written = 0
				for Tri in Idx do (
					local	I1 = 0,
							I2 = 0,
							I3 = 0
					if Have Tri then (
						I1 = ((Tri.x as Integer) - 1)
						I2 = ((Tri.y as Integer) - 1)
						I3 = ((Tri.z as Integer) - 1)
					)
					if Written != 0 then
						IdxLine += " "
					IdxLine += ((I1 as String) + " " + (I2 as String) + " " + (I3 as String))
					Written += 1
					if Written == 8 then (
						CWXML.XMLWrite SS (IdxLine + "\n")
						IdxLine = Inner3
						Written = 0
					)
				)
				if Written != 0 then
					CWXML.XMLWrite SS (IdxLine + "\n")
				CWXML.XMLWrite SS (Inner2 + "</Data>\n")
				CWXML.XMLWrite SS (Inner + "</IndexBuffer>\n")
				CWXML.XMLWrite SS (Tab + "</Item>\n")
				OK
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Write BufferID TabString Skinned ShadingGroup = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	vdName = #NONE,
						VertexDeclaration = (GetVertexDeclaration Skinned ShadingGroup PreferLonger:true vdName:(&vdName))
				if not Supplied VertexDeclaration then
					return false;
				local	Modify = GIMS.Core.ArrayOps.Modify,
						BufferMgr = GIMS.Core.BufferMgr,
						WriteVal = BufferMgr.WriteVal,
						ValueOps = GIMS.Core.ValueOps,
						FormatText = ValueOps.FormatText,
						AsoFText = ValueOps.AsoFText,
						TypeCast = ValueOps.TypeCast,
						SubTabString = (TabString + "\t"),
						BraceOpen = "{",
						BraceClose = "}",
						SPSToGIMSParamType = GIMS.CurrentGame.Core.MAXFactory.ObjectMgr.SPSToGIMSParamType,
						SuppliedColors2 = (Supplied Colors2),
						NeedUVs = (Supplied UVCoords),
						UVCount = (if NeedUVs then UVCoords.Count else 0),
						P2Dummy = "0 0",
						P3Dummy = "0 0 0",
						P4Dummy = "0 0 0 0",
						ToHighReg = GIMS.Core.StringOps.ToHighReg
				GIMS.Core.GUIMgr.UpdateProgress #None 0
				WriteVal BufferID (
					FormatText \
						v1:TabString \
						v2:"ShaderIndex " \
						v3:(ShaderIndex - 1)
				)
				if Flags.NumberSet == 0 then
					WriteVal BufferID (TabString + "Flags -")
				else (
					WriteVal BufferID (TabString + "Flags")
					for Flag in Flags do
						WriteVal BufferID (" " + (ToHighReg (KnownFlags[Flag] as String))) AppendLast:true
				)
				WriteVal BufferID (
					FormatText \
						v1:TabString \
						v2:"VertexDeclaration " \
						v3:(ToHighReg (vdName as String))
				)
				WriteVal BufferID (
					FormatText \
						v1:TabString \
						v2:"Indices " \
						v3:(Idx.Count * 3)
				)
				WriteVal BufferID (TabString + BraceOpen)
				AsoFText (Modify Idx -1 #Add CopyArray:false) BufferID:BufferID SplitCount:5 TabString:SubTabString SplitString:" " SubSplitString:" " SubTypeHook:Integer
				WriteVal BufferID (TabString + BraceClose)
				local	VertCount = Positions.Count
				WriteVal BufferID (
					FormatText \
						v1:TabString \
						v2:"Vertices " \
						v3:VertCount
				)
				WriteVal BufferID (TabString + BraceOpen)
				local	EmptyParamSeparator = "",
						TheParamSeparator = " / "
				/*<PROFILERSTART>*//*LogProfiler #Start "Write+Vertices"; local PWS = (*//*<PROFILERSTARTED>*/
				
				--local	UsedBoneIndices = #{}	--<TODO>	remove, debug
				for VertID = 1 to VertCount do (
					WriteVal BufferID SubTabString
					local	IsFirstParam = true,
							UVID = 1,
							ColorID = 1,
							ParamID = 1,
							BoundParamID = (VertexDeclaration.Count + 1),
							ParamSeparator = EmptyParamSeparator
					do (
						local	VD = VertexDeclaration[ParamID],
								Type = (SPSToGIMSParamType VD.aType)
						case VD.Usage of (
							#D3DDECLUSAGE_POSITION: (
								local	Pos = Positions[VertID]
								if No Pos then
									Pos = [0, 0, 0]
								WriteVal BufferID (AsoFText (TypeCast Pos Type ReportCastFail:false BufferID:BufferID) TabString:ParamSeparator) AppendLast:true
							)
							#D3DDECLUSAGE_TEXCOORD: (
								if not NeedUVs then
									throw "VertexDeclaration has UV, but there isn't any in the mesh"
								if UVID > UVCount then (
									WriteVal BufferID (
										case Type of (
											#P2:
												P2Dummy
											#P3:
												P3Dummy
											#P4:
												P4Dummy
											Default:
												throw "Unknown UV value type: " Type BufferID:BufferID
										)
									) AppendLast:true
								) else (
									local	UVCoord = UVCoords[UVID][VertID]
									UVID += 1
									if Type == #P4 then (
										local	NextUVCoord = UVCoords[UVID][VertID]
										UVID += 1
										UVCoord = [UVCoord.x, -UVCoord.y, NextUVCoord.x, -NextUVCoord.y]
									) else
										UVCoord = (TypeCast [UVCoord.x, -UVCoord.y] Type BufferID:BufferID)
									WriteVal BufferID (AsoFText UVCoord TabString:ParamSeparator) AppendLast:true
								)
							)
							#D3DDECLUSAGE_COLOR: (
								if
									(ColorID != 1) and
									SuppliedColors2
								then (
									local	Col2 = Colors2[VertID]
									if No Col2 then
										Col2 = [1, 1, 1, 1]
									WriteVal BufferID (AsoFText (TypeCast (Col2 * 255) Type ReportCastFail:false BufferID:BufferID) TabString:ParamSeparator TypeHook:Integer) AppendLast:true
								) else (
									local	Col1 = Colors[VertID]
									if No Col1 then
										Col1 = [1, 1, 1, 1]
									WriteVal BufferID (AsoFText (TypeCast (Col1 * 255) Type ReportCastFail:false BufferID:BufferID) TabString:ParamSeparator TypeHook:Integer) AppendLast:true
								)
								ColorID += 1
							)
							#D3DDECLUSAGE_NORMAL: (
								local	Nrm = Normals[VertID]
								if No Nrm then
									Nrm = [0, 0, 1]
								WriteVal BufferID (AsoFText (TypeCast Nrm Type ReportCastFail:false BufferID:BufferID) TabString:ParamSeparator) AppendLast:true
							)
							#D3DDECLUSAGE_TANGENT: (
								local	Tng = Tangents[VertID]
								if No Tng then
									Tng = [1, 0, 0, 1]
								WriteVal BufferID (AsoFText (TypeCast Tng Type ReportCastFail:false BufferID:BufferID) TabString:ParamSeparator) AppendLast:true
							)
							#D3DDECLUSAGE_BLENDINDICES: (
								local	Bns = SkinBones[VertID]
								if No Bns then
									Bns = #(1, 1, 1, 1)
								WriteVal BufferID (AsoFText (TypeCast (Modify Bns -1 #Add CopyArray:true) Type ReportCastFail:false BufferID:BufferID) TabString:ParamSeparator TypeHook:Integer) AppendLast:true
							)
							#D3DDECLUSAGE_BLENDWEIGHT: (
								local	Wts = SkinWeights[VertID]
								if No Wts then
									Wts = [1, 0, 0, 0]
								WriteVal BufferID (AsoFText (TypeCast Wts Type ReportCastFail:false BufferID:BufferID) TabString:ParamSeparator) AppendLast:true
							)
							Default:
								throw "Unknown vertex declaration element: " VD.Usage BufferID:BufferID
						)
						ParamID += 1
						ParamSeparator = TheParamSeparator
					) while (ParamID < BoundParamID)
				)
				--Format "\t% unique bones\n"	UsedBoneIndices.NumberSet	--<TODO>	remove, debug
				
				/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
				WriteVal BufferID (TabString + BraceClose)
				true
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(
				#(
					#Idx,
					#Positions,
					#Normals,
					#Colors,
					#Colors2,
					#Tangents,
					#SkinBones,
					#VertClothSkins,
					#SkinWeights,
					#UVCoords
				), #(
					Idx,
					Positions,
					Normals	 		,
					Colors 			,
					Colors2 		,
					Tangents 		,
					SkinBones 		,
					VertClothSkins	,
					SkinWeights 	,
					UVCoords 		
				)	
			))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Create Skinned MMtl = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	UVCount = (if Supplied UVCoords then UVCoords.Count else 0),
						VertCount = Positions.Count,
						TheMesh, SkinData
				GIMS.Core.GUIMgr.UpdateProgress #None 0
				/*<PROFILERSTART>*//*LogProfiler #Start "Create mesh"; local PWS = (*//*<PROFILERSTARTED>*/
				
				TheMesh = (
					GIMS.Core.ObjectMgr.CreateMesh \
						Positions \
						Idx \
						MaterialIDs:ShaderIndex \
						VertColors:Colors \
						VertColors2:Colors2 \
						MapVerts:UVCoords \
						UVCount:UVCount \
						--VertTangents:Tangents	--TODO remove, tangents debug
				)
				
				/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
				/*<PROFILERSTART>*//*LogProfiler #Start "Calculate SkinData"; local PWS = (*//*<PROFILERSTARTED>*/
				
				if
					Skinned and
					Supplied SkinBones and
					Supplied SkinWeights
				then (
					SkinData = (
						local	NormalizeA = GIMS.Core.ArrayOps.NormalizeA,
								BoneIDs = #(),
								BoneWeights = #()
						for VertID = VertCount to 1 by -1 do (
							local	VertBoneIDs = SkinBones[VertID],
									VertBoneWeights = SkinWeights[VertID],
									VertBoneCount = VertBoneIDs.Count,
									NewVertBoneIDs = #(),
									NewVertBoneWeights = #(),
									NewVertBoneCount = 0
							for i = 1 to VertBoneCount do (
								local	BoneID = VertBoneIDs[i],
										BoneWeight = VertBoneWeights[i]
								if (BoneWeight > 0.0001) do (
									NewVertBoneCount += 1
									NewVertBoneIDs[NewVertBoneCount] = BoneID
									NewVertBoneWeights[NewVertBoneCount] = BoneWeight
								)
							)
							NewVertBoneIDs.Count = NewVertBoneCount
							NewVertBoneWeights.Count = NewVertBoneCount
							NormalizeA NewVertBoneWeights
							BoneIDs[VertID] = NewVertBoneIDs
							BoneWeights[VertID] = NewVertBoneWeights
						)
						#(BoneIDs, BoneWeights, VertClothSkins)
					)
				)
				
				#(TheMesh, SkinData, Normals, Idx, VertCount)
				/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(
				#(
					#Idx,
					#Positions,
					#Normals,
					#Colors,
					#Colors2,
					#Tangents,
					#SkinBones,
					#VertClothSkins,
					#SkinWeights,
					#UVCoords
				), #(
					Idx,
					Positions,
					Normals	 		,
					Colors 			,
					Colors2 		,
					Tangents 		,
					SkinBones 		,
					VertClothSkins	,
					SkinWeights 	,
					UVCoords 		
				)	
			))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		)
	)
	struct /*#PC*PATH	GIMS.CurrentGame.Core.TypeLibrary.grcLODMesh*/ strLODMesh (
		GIMSObjectLink = "GIMS.CurrentGame.Core.TypeLibrary.grcLODMesh",
		DiskPath,
		ObjName,
		Extension = ".mesh",
		Version = [165, 32],
		BoneID = 1,
		Locked = false,
		Skinned = false,
		BoneCount = 0,
		Mask,
		Bounds = #(),
		Geometries = #(),
		IsPhysics = false,
		PhysIndex = 0,
		fn Read ShadingGroup CachePath:undefined = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	tLine,
						BufferMgr = GIMS.Core.BufferMgr,
						ReadVal = BufferMgr.ReadVal,
						Skip = BufferMgr.Skip,
						oFTypeExec = GIMS.Core.StringOps.oFTypeExec,
						ValueOps = GIMS.Core.ValueOps,
						FormatText = ValueOps.FormatText,
						TypeCast = ValueOps.TypeCast,
						grcLODMeshGeometry = GIMS.CurrentGame.Core.TypeLibrary.grcLODMeshGeometry,
						AABB = GIMS.Core.TypeLibrary.AABB,
						FullFilePath = (
							FormatText \
								v1:DiskPath \
								v2:ObjName \
								v3:Extension
						),
						BufferID = (BufferMgr.ReadFile FullFilePath Mode:#TxtLines),
						NotEOF = BufferMgr.NotEOF,
						Result = true
				if BufferID == false then
					return false;
				while
					Result and
					(NotEOF BufferID) and
					(tLine = (ReadVal BufferID FilterStr:"\t "))[1] != "}"
				do ( /* skips end */
					local	Tag = (TypeCast tLine[1] Name BufferID:BufferID)
					case Tag of (
						#Version: (
							if (oFTypeExec tLine #P2 IDMask:#{2, 3} BufferID:BufferID) != Version then (
								GIMS.Core.SystemMgr.AddResult #Error  (
									FormatText \
										v1:"Wrong version resource \"" \
										v2:FullFilePath \
										v3:"\""
								)
								Result = false;
							)
							Skip BufferID 1 /* skip start */
						)
						#Locked:
							Locked = (TypeCast tLine[2] BooleanClass BufferID:BufferID)
						#Skinned:
							Skinned = (TypeCast tLine[2] BooleanClass BufferID:BufferID) 
						#BoneCount:
							BoneCount = (TypeCast tLine[2] Integer BufferID:BufferID) 
						#Mask:
							Mask = (TypeCast tLine[2] Integer BufferID:BufferID) 
						#Bounds: (
							Skip BufferID 1 /* skip start */
							local	BoundCount = 0
							Bounds.Count = 20
							while (tLine = (ReadVal BufferID FilterStr:"\t "))[1] != "}" do (	/* skips end */
								local	Tag = (TypeCast tLine[1] name BufferID:BufferID)
								case Tag of (
									#AABB: (
										Skip BufferID 1 /* skip start */
										tAABB = (AABB())
										while (tLine = (ReadVal BufferID FilterStr:"\t "))[1] != "}" do (	/* skips end */
											local	Tag = (TypeCast tLine[1] name BufferID:BufferID)
											case Tag of (
												#Min:
													tAABB.bMin = (oFTypeExec tLine #P3 IDMask:#{2..4} BufferID:BufferID)
												#Max:
													tAABB.bMax = (oFTypeExec tLine #P3 IDMask:#{2..4} BufferID:BufferID)
												default:
													EGIMS_EHAbort "Unknown strLODMesh.Bounds.AABB tag: " Param1:tLine[1] BufferID:BufferID
											)
										)
										BoundCount += 1
										Bounds[BoundCount] = tAABB
									)
									default:
										EGIMS_EHAbort "Unknown strLODMesh.Bounds tag: " Param1:tLine[1] BufferID:BufferID
								)
							)
							Bounds.Count = BoundCount
						)
						#Geometries: (
							Skip BufferID 1 /* skip start */
							Geometries.Count = 10
							local	AddedGeometries = 0
							while
								Result and
								(tLine = (ReadVal BufferID FilterStr:"\t "))[1] != "}"
							do (	/* skips end */
								local	Tag = (TypeCast tLine[1] name BufferID:BufferID)
								case Tag of (
									#Geometry: (
										local	Geom = (grcLODMeshGeometry())
										if (Geom.Read BufferID Skinned ShadingGroup) then (
											AddedGeometries += 1
											Geometries[AddedGeometries] = Geom
										) else
											Result = false
									)
									default:
										EGIMS_EHAbort "Unknown strLODMesh.Geometries tag: " Param1:tLine[1] BufferID:BufferID
								)
							)
							Geometries.Count = AddedGeometries
						)
						default:
							EGIMS_EHAbort "Unknown strLODMesh tag " Param1:tLine[1] BufferID:BufferID
					)
				)
				BufferMgr.ClearBuffer BufferID
				Result
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#DiskPath, #ObjName, #Extension, #Geometries), #(DiskPath, ObjName, Extension, Geometries)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn ReadCodeWalkerModel ModelNode = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	CWXML = GIMS.CurrentGame.Core.TypeLibrary.CWXML,
						HasSkinNode = (CWXML.GetChild ModelNode "HasSkin"),
						BoneIndexNode = (CWXML.GetChild ModelNode "BoneIndex"),
						MaskNode = (CWXML.GetChild ModelNode "RenderMask"),
						BoneCountNode = (CWXML.GetChild ModelNode "Unknown1"),
						GeomsNode = (CWXML.GetChild ModelNode "Geometries"),
						grcLODMeshGeometry = GIMS.CurrentGame.Core.TypeLibrary.grcLODMeshGeometry
				Skinned = (
					Have HasSkinNode and
					((CWXML.GetAttrInt HasSkinNode "value") != 0)
				)
				BoneID = (
					if Have BoneIndexNode then
						((CWXML.GetAttrInt BoneIndexNode "value") + 1)
					else
						1
				)
				Mask = (
					if Have MaskNode then
						(CWXML.GetAttrInt MaskNode "value" DefaultVal:255)
					else
						255
				)
				BoneCount = (
					if Have BoneCountNode then
						(CWXML.GetAttrInt BoneCountNode "value")
					else
						0
				)
				if Have GeomsNode then (
					local	GeomItems = (GeomsNode.SelectNodes "Item"),
							GeomCount = GeomItems.Count
					Geometries.Count = GeomCount
					local	Added = 0
					for i = 0 to (GeomCount - 1) do (
						local	Geom = (grcLODMeshGeometry())
						if (Geom.ReadCodeWalkerGeometry (GeomItems.Item[i]) "GTAV1" Skinned) then (
							Added += 1
							Geometries[Added] = Geom
						)
					)
					Geometries.Count = Added
				)
				true
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn WriteCodeWalkerXML SS Tab = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	CWXML = GIMS.CurrentGame.Core.TypeLibrary.CWXML,
						Inner = (Tab + " "),
						Inner2 = (Inner + " "),
						SkinVal = (if Skinned then 1 else 0),
						BoneIndex = ((BoneID as Integer) - 1),
						MaskVal = Mask,
						BoneCountVal = BoneCount
				if No MaskVal then
					MaskVal = 255
				if No BoneCountVal then
					BoneCountVal = 0
				if BoneIndex < 0 then
					BoneIndex = 0
				CWXML.XMLWrite SS (Tab + "<Item>\n")
				CWXML.XMLWrite SS (CWXML.ValueTag Inner "RenderMask" MaskVal)
				CWXML.XMLWrite SS (CWXML.ValueTag Inner "Flags" SkinVal)
				CWXML.XMLWrite SS (CWXML.ValueTag Inner "HasSkin" SkinVal)
				CWXML.XMLWrite SS (CWXML.ValueTag Inner "BoneIndex" BoneIndex)
				CWXML.XMLWrite SS (CWXML.ValueTag Inner "Unknown1" BoneCountVal)
				CWXML.XMLWrite SS (Inner + "<Geometries>\n")
				for Geom in Geometries do
					Geom.WriteCodeWalkerXML SS Inner2 Skinned
				CWXML.XMLWrite SS (Inner + "</Geometries>\n")
				CWXML.XMLWrite SS (Tab + "</Item>\n")
				OK
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Write ShadingGroup = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	BufferMgr = GIMS.Core.BufferMgr,
						ValueOps = GIMS.Core.ValueOps,
						FormatText = ValueOps.FormatText,
						AsoFText = ValueOps.AsoFText,
						TypeCast = ValueOps.TypeCast,
						WriteVal = BufferMgr.WriteVal,
						ObjDir = (DiskPath + ObjName),
						FilePath = (ObjDir + Extension),
						BufferID = (BufferMgr.Create Mode:#TxtLines FilePath:FilePath),
						TabString = "\t",
						SubTabString = (TabString + "\t"),
						DoubleSubTabString = (SubTabString + "\t"),
						BraceOpen = "{",
						BraceClose = "}",
						SubTabBraceOpen = (SubTabString + "{"),
						SubTabBraceClose = (SubTabString + "}"),
						TabBraceOpen = (TabString + BraceOpen),
						TabBraceClose = (TabString + BraceClose),
						SubTabBraceOpen = (SubTabString + BraceOpen),
						SubTabBraceClose = (SubTabString + BraceClose),
						AABBHeader = (SubTabString + "Aabb"),
						GeomHeader = (SubTabString + "Geometry")
				if BufferID != false then (
				
					/*get bone count*
					local	UsedBoneIndices = #{}
					for Geom in Geometries do (
						local	SkinBones = Geom.SkinBones
						if Have SkinBones then (
							for VertSkinBones in SkinBones do (
								for BoneIndex in VertSkinBones do
									UsedBoneIndices[BoneIndex] = true
							)
						)
					)
					BoneCount = UsedBoneIndices.NumberSet
					--Format "Mesh % with % unique bones\n" ObjName BoneCount	--TODO remove, debug
					/**/
					
					--write
					WriteVal BufferID (AsoFText Version TypeHook:Integer TabString:"Version ")
					WriteVal BufferID BraceOpen
					WriteVal BufferID (FormatText v1:TabString v2:"Locked " v3:Locked)
					WriteVal BufferID (FormatText v1:TabString v2:"Skinned " v3:Skinned)
					WriteVal BufferID (FormatText v1:TabString v2:"BoneCount " v3:BoneCount)
					WriteVal BufferID (FormatText v1:TabString v2:"Mask " v3:Mask)
					WriteVal BufferID (TabString + "Bounds")
					WriteVal BufferID TabBraceOpen
					for tAABB in Bounds do (
						WriteVal BufferID AABBHeader
						WriteVal BufferID SubTabBraceOpen
						WriteVal BufferID (AsoFText tAABB.bMin TabString:(DoubleSubTabString + "Min "))
						WriteVal BufferID (AsoFText tAABB.bMax TabString:(DoubleSubTabString + "Max "))
						WriteVal BufferID SubTabBraceClose
					)
					WriteVal BufferID TabBraceClose
					WriteVal BufferID (TabString + "Geometries")
					WriteVal BufferID TabBraceOpen
					for Geom in Geometries do (
						WriteVal BufferID GeomHeader
						WriteVal BufferID SubTabBraceOpen
						if not (Geom.Write BufferID DoubleSubTabString Skinned ShadingGroup) then (
							EGIMS_EHAbort ( \
								FormatText \
									v1:"Can't find a proper vertex declaration for a mesh \"" \
									v2:ObjDir \
									v3:"\" material " \
									v4:(
										local	ShaderIndex = Geom.ShaderIndex
										if Have ShaderIndex then
											(ShaderIndex as String)
										else
											""
									) \
									v5:".\nCheck if all of its materials can be skinned or not(depending on the selected shader)." \
							)
						)
						WriteVal BufferID SubTabBraceClose
					)
					WriteVal BufferID TabBraceClose
					WriteVal BufferID BraceClose
					BufferMgr.WriteFile BufferID FilePath:FilePath
					BufferMgr.ClearBuffer BufferID
				) else
					EGIMS_EHAbort ("Can't write file " + (TempFilePath as String))
				OK
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#DiskPath, #ObjName, #Extension, #Bounds, #Geometries, #BoneID, #Skinned, #BoneCount, #Mask), #(DiskPath, ObjName, Extension, Bounds, Geometries, BoneID, Skinned, BoneCount, Mask)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Create BoneNodes MMtl BoneIndexMap = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	Result = false,
						GeometryCount = Geometries.Count
				if GeometryCount != 0 then (
					local	BoneCount = BoneNodes.Count,
							Meshes = #(),
							SkinBones = #(),
							VertClothSkins = #{},
							SkinWeights = #(),
							Idx = unsupplied,
							Normals = unsupplied,
							NeedNormals = false,
							UsedBones = #{},
							IsFirstGeometry = true,
							Modify,
							InvalidNormalDummy,
							IdxOffset,
							VertClothSkinsOffset = 0
					UsedBones.Count = BoneCount
					Meshes.Count = GeometryCount
					local	MaxUV = 0
					for Geom in Geometries do (
						if
							Supplied Geom.UVCoords and
							Geom.UVCoords.Count > MaxUV
						then
							MaxUV = Geom.UVCoords.Count
					)
					if MaxUV > 0 then (
						for Geom in Geometries do (
							if not Supplied Geom.UVCoords then
								Geom.UVCoords = #()
							local	HaveCount = Geom.UVCoords.Count
							if HaveCount < MaxUV then (
								local	Dummy = #()
								Dummy.Count = Geom.Positions.Count
								for v = 1 to Dummy.Count do
									Dummy[v] = [0, 0]
								for u = (HaveCount + 1) to MaxUV do
									Geom.UVCoords[u] = (DeepCopy Dummy)
							)
						)
					)
					/*<PROFILERSTART>*//*LogProfiler #Start "Meshes creation"; local PWS = (*//*<PROFILERSTARTED>*/
					/*<ERRHANDLERSTART>*/try (
					for Geom in Geometries where Supplied Geom.Normals while not NeedNormals do
						NeedNormals = true
					if NeedNormals then (
						InvalidNormalDummy = [666, 666, 666]
						Modify = GIMS.Core.ArrayOps.Modify
					)
					Result = undefined
					for GeometryID = 1 to GeometryCount do (
					
						--create the mesh and get its data
						local	MeshData
						try (
							MeshData = (Geometries[GeometryID].Create Skinned MMtl)
						) catch (
							local	CET = (GetCurrentException())
							try (GIMS.Core.SystemMgr.AddResult #Warning ("Skipped CodeWalker mesh piece " + (GeometryID as String) + ": " + CET)) catch ()
							MeshData = undefined
						)
						if Have MeshData then (
						local	TheMesh = MeshData[1],
								SkinMeshData = MeshData[2],
								MeshNormals = MeshData[3],
								MeshIdx = MeshData[4],
								MeshVertCount = MeshData[5]
						Meshes[GeometryID] = TheMesh
						
						--accumulate data
						if IsFirstGeometry then (
							IsFirstGeometry = false
							Result = TheMesh
						
							--store normals data
							if NeedNormals then (
							
								--store data
								if Supplied MeshNormals then
									Normals = MeshNormals
								else (
									Normals = #()
									for i = MeshVertCount to 1 by -1 do
										Normals[i] = InvalidNormalDummy
								)
								Idx = MeshIdx

								--create offset
								IdxOffset = [MeshVertCount, MeshVertCount, MeshVertCount]
							)
							
							--store skin data
							if Have SkinMeshData then (
							
								--store data
								SkinBones = SkinMeshData[1]
								SkinWeights = SkinMeshData[2]
								
								--collect cloth skin vert IDs
								VertClothSkins.Count = MeshVertCount
								for VertClothSkin in SkinMeshData[3] do
									VertClothSkins[VertClothSkin] = true
									
								--create offset
								VertClothSkinsOffset = MeshVertCount
							)
						) else (
							local	AttachedOK = false
							try (
								Attach Result TheMesh
								AttachedOK = true
							) catch (
								local	CET = (GetCurrentException())
								try (GIMS.Core.SystemMgr.AddResult #Warning ("Kept CodeWalker mesh piece " + (GeometryID as String) + " separate: " + CET)) catch ()
								TheMesh.Name = (ObjName + "_" + (GeometryID as String))
								TheMesh.Parent = BoneNodes[BoneID]
							)
							if AttachedOK then (
							
							--accumulate normals data
							if NeedNormals then (
							
								--extend old data
								local	NewIdx = (Idx + (Modify MeshIdx IdxOffset #Add CopyArray:false)),
										NewNormals
								if Supplied MeshNormals then
									NewNormals = (Normals + MeshNormals)
								else (
									local	NormalsDummy = #()
									for i = MeshVertCount to 1 by -1 do
										NormalsDummy[i] = InvalidNormalDummy
									NewNormals = (Normals + NormalsDummy)
									Free NormalsDummy
								)
								Free Idx
								Free Normals
								Idx = NewIdx
								Normals = NewNormals

								--add offset
								IdxOffset += [MeshVertCount, MeshVertCount, MeshVertCount]
							)
							
							--accumulate skin data
							if Have SkinMeshData then (
							
								--extend old data
								local	NewSkinBones = (SkinBones + SkinMeshData[1]),
										NewSkinWeights = (SkinWeights + SkinMeshData[2])
								Free SkinBones
								Free SkinWeights
								SkinBones = NewSkinBones
								SkinWeights = NewSkinWeights
								
								--collect cloth skin vert IDs
								VertClothSkins.Count += MeshVertCount
								for VertClothSkin in SkinMeshData[3] do
									VertClothSkins[VertClothSkin + VertClothSkinsOffset] = true
									
								--add offset
								VertClothSkinsOffset += MeshVertCount
							)
							)
						)
						)
					)
					/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
					/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
					local	ParentNode = BoneNodes[BoneID],
							ParentTM = (
								if ParentNode == RootNode then
									(Matrix3 1)
								else
									ParentNode.Transform
							),
							NeedInteractiveUI = (
								NeedNormals or
								Skinned
							),
							OldSelection
					/*<PROFILERSTART>*//*LogProfiler #Start "Meshes attach"; local PWS = (*//*<PROFILERSTARTED>*/
					/*<ERRHANDLERSTART>*/try (
					if Have Result then (
					Result.Name = ObjName
					Result.Parent = ParentNode
					if NeedInteractiveUI then (
						EGIMS_ResumeMAX()
						OldSelection = (Selection as Array)
						Select Result
						MAX Modify Mode
					)
					if NeedNormals then (
						GIMS.Core.ObjectMgr.SetMeshNormals \
							Result \
							Normals \
							InvalidNormalDummy:InvalidNormalDummy \
							Faces:Idx \
						CollapseStack Result
						Free Idx
						Free Normals
					)
					)
					/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#GeometryCount, #Meshes), #(GeometryCount, Meshes)))/*<ERRHANDLEREND>*/
					/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
					if
						Have Result and
						Skinned
					then (
						/*<PROFILERSTART>*//*LogProfiler #Start "Apply skinning"; local PWS = (*//*<PROFILERSTARTED>*/
						/*<ERRHANDLERSTART>*/try (
						local	OldSelection = (Selection as array),
								SkinMod = (Skin WeightAllVertices:false)
						AddModifier Result SkinMod
						EGIMS_SelectModifier SkinMod
						local	AddBone = SkinOps.AddBone,
								SetInnerRadius = SkinOps.SetInnerRadius,
								SetOuterRadius = SkinOps.SetOuterRadius
						/*<PROFILERSTART>*//*LogProfiler #Start "Add bones"; local PWS = (*//*<PROFILERSTARTED>*/
						/*<ERRHANDLERSTART>*/try (
						for bid = 1 to BoneCount do (
							AddBone SkinMod BoneNodes[bid] 0
							SetInnerRadius SkinMod bid 1 0
							SetOuterRadius SkinMod bid 1 0
							SetInnerRadius SkinMod bid 2 0
							SetOuterRadius SkinMod bid 2 0
						)
						/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
						/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
						local	NumVerts = Result.NumVerts
						if Supplied BoneIndexMap then (

							--Print #ApplyWeights	--TODO remove, debug
						
							for VertID = 1 to NumVerts where not VertClothSkins[VertID] do (
								local	VertBones = SkinBones[VertID]
							
								--with printallelements true (Format "Replace\t%" VertBones)	--TODO remove, debug
							
								for i = 1 to VertBones.Count do (
									local	bid = VertBones[i]
									VertBones[i] = (BoneIndexMap[bid])
								)
							
								--with printallelements true (Format "\twith\t%\n" VertBones)	--TODO remove, debug
							
							)
						)
						local	UnNormalizeVertex = SkinOps.UnNormalizeVertex,
								GetVertexWeightCount = SkinOps.GetVertexWeightCount,
								GetVertexWeightBoneID = SkinOps.GetVertexWeightBoneID,
								ReplaceVertexWeights = SkinOps.ReplaceVertexWeights

						--Print #ApplyWeights	--TODO remove, debug

						/*<PROFILERSTART>*//*LogProfiler #Start "Apply weights"; local PWS = (*//*<PROFILERSTARTED>*/
						/*<ERRHANDLERSTART>*/try (
						for VertID = 1 to NumVerts do (
							if not VertClothSkins[VertID] then (	--TODO else apply cloth skinning
								UnNormalizeVertex SkinMod VertID false
								local	VertBones = SkinBones[VertID],
										VertWeights = SkinWeights[VertID],
										WeightCount = (GetVertexWeightCount SkinMod VertID)
								for WeightID = 1 to WeightCount do (
									local	BoneID = (GetVertexWeightBoneID SkinMod VertID WeightID)
									if (FindItem VertBones BoneID) == 0 then (
										Append VertBones BoneID
										Append VertWeights 0
									)
								)
								if VertBones.Count != 0 then (
									for BoneID in VertBones do
										UsedBones[BoneID] = true
									ReplaceVertexWeights SkinMod VertID VertBones VertWeights
								)
								
								--with printallelements true (Print (VertBones as String))	--TODO remove, debug
								
							)
						)
						/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
						/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
						/*<PROFILERSTART>*//*LogProfiler #Start "Delete unused bones"; local PWS = (*//*<PROFILERSTARTED>*/
						/*<ERRHANDLERSTART>*/try (
						local	SelectBone = SkinOps.SelectBone,
								RemoveBone = SkinOps.RemoveBone
						for bid = BoneCount to 1 by -1 where not UsedBones[bid] do (
							SelectBone SkinMod bid
							RemoveBone SkinMod
						)
						try (SkinMod.always_deform = false) catch ()
						/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
						/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
						/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
						/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
					) else (
						if Have Result then
							Result.Transform = ParentTM
					)
					if
						Have Result and
						NeedInteractiveUI
					then (
						Update Result
						MAX Create Mode
						Select OldSelection
						EGIMS_SuspendMAX()
					)
					if No Result then
						Result = false
				)
				Result
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#DiskPath, #ObjName, #Extension, #BoneNodes, #BoneIndexMap, #Meshes, #Geometries), #(DiskPath, ObjName, Extension, BoneNodes, BoneIndexMap, Meshes, Geometries)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		)
	)
	struct /*#PC*PATH	GIMS.CurrentGame.Core.TypeLibrary.grcLODGroup*/ strLODGroup (
		GIMSObjectLink = "GIMS.CurrentGame.Core.TypeLibrary.grcLODGroup",
		DiskPath,
		LODGroups = #(
			#(),
			#(),
			#(),
			#()
		),
		LODGroupNames = #(
			"High",
			"Med",
			"Low",
			"Vlow"
		),
		LODGroupValues = #(
			9998.0,
			9998.0,
			9998.0,
			9998.0
		),
		LODGrpTags = #(
			#High,
			#Med,
			#Low,
			#Vlow
		),
		fn Read BufferID ShadingGroup = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	tLine,
						BufferMgr = GIMS.Core.BufferMgr,
						ReadVal = BufferMgr.ReadVal,
						Skip = BufferMgr.Skip,
						oFTypeExec = GIMS.Core.StringOps.oFTypeExec,
						grcLODMesh = GIMS.CurrentGame.Core.TypeLibrary.grcLODMesh,
						TypeCast = GIMS.Core.ValueOps.TypeCast
				while (tLine = (ReadVal BufferID FilterStr:"\t "))[1] != "}" do ( /* skips end */
					local	Tag = (TypeCast tLine[1] name BufferID:BufferID),
							TagID = (FindItem LODGrpTags Tag)
					if TagID != 0 then (
						LODGroupValues[TagID] = (TypeCast tLine[2] Float BufferID:BufferID)
						if (ReadVal BufferID FilterStr:"\t " NoSeek:true)[1] == "{" then (
							Skip BufferID 1	/* skip mesh list start */
							local	LODGroup = LODGroups[TagID],
									LODGroupSize = LODGroup.Count
							LODGroup.Count = (LODGroupSize + 10)
							while (tLine = (ReadVal BufferID FilterStr:"\t "))[1] != "}" do ( /* skips mesh list end */
								local	MeshFilePath = tLine[1]
								for i = 2 to (tLine.Count - 1) do (
									Append MeshFilePath " "
									Append MeshFilePath tLine[i]
								)
								local	LODMesh = (
											grcLODMesh \
												BoneID:((TypeCast tLine[tLine.Count] Integer BufferID:BufferID) + 1) \
												DiskPath:(DiskPath + (GetFileNamePath MeshFilePath)) \
												ObjName:(GetFileNameFile MeshFilePath) \
												Extension:(GetFileNameType MeshFilePath) \
										)
								if not (LODMesh.Read ShadingGroup) then
									return false;
								LODGroupSize += 1
								LODGroup[LODGroupSize] = LODMesh
							)
							LODGroup.Count = LODGroupSize
						)
					) else (
						case Tag of (
							#Center: () /*skip*/
							#AABBMin: () /*skip*/
							#AABBMax: () /*skip*/
							#Radius: () /*skip*/
							default:
								EGIMS_EHAbort "Unknown strLODGroup tag: " Param1:tLine[1] BufferID:BufferID
						)
					)
				)
				true
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Write BufferID SubDir ShadingGroup = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	TabString = "\t\t",
						SubTabString = (TabString + "\t"),
						BufferMgr = GIMS.Core.BufferMgr,
						FormatText = GIMS.Core.ValueOps.FormatText,
						WriteVal = BufferMgr.WriteVal,
						LODGrpCount = LODGroups.Count,
						ExtendBound = GIMS.Core.ObjectMgr.ExtendBound,
						Bounds = (GIMS.CurrentGame.Core.TypeLibrary.Bounds()),
						AABB = Bounds.AABB,
						NoModels = true
				for LODGrpID = 1 to LODGrpCount do (
					local	LODGrp = LODGroups[LODGrpID],
							LODGrpSize = LODGrp.Count
					WriteVal BufferID (
						FormatText \
							v1:TabString \
							v2:LODGroupNames[LODGrpID] \
							v3:" " \
							v4:LODGroupValues[LODGrpID]
					)
					if LODGrpSize != 0 then (
						WriteVal BufferID (TabString + "{")
						for LODMesh in LODGrp do (
							local	Bounds = LODMesh.Bounds
							if
								NoModels and
								Bounds.Count != 0
							then
								NoModels = false
							for Bound in Bounds do
								ExtendBound AABB Bound
							WriteVal BufferID (
								FormatText \
									v1:SubTabString \
									v2:SubDir \
									v3:LODMesh.ObjName \
									v4:LODMesh.Extension \
									v5:" " \
									v6:(LODMesh.BoneID - 1) \
							)
							LODMesh.DiskPath = DiskPath
							LODMesh.Write ShadingGroup
						)
						WriteVal BufferID (TabString + "}")
					)
				)
				if NoModels then (
					AABB.bMax = [0, 0, 0]
					AABB.bMin = [0, 0, 0]
					Bounds.Center = [0, 0, 0]
					Bounds.Radius = 0.0
				) else (
					local	AABBMax = AABB.bMax,
							AABBMin = AABB.bMin,
							Center = (AABBMin + ((AABBMax - AABBMin) / 2))
					Bounds.Center = Center
					Bounds.Radius = (Length (AABBMax - Center))
				)
				Bounds.Write BufferID TabString
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Create BoneNodes ShadingGroup TheSkeleton HaveTheSkeleton TheSkeleton_FULL HaveTheSkeleton_FULL HaveActiveSkeleton = (
			local	Mtls, MMtl
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
			
				--create material
				MMtl = (
					if Have ShadingGroup then (
						Mtls = ShadingGroup.Mtls
						local	MtlNames = #(),
								MtlIDs = #()
						for i = Mtls.Count to 1 by -1 do (
							try (Mtls[i].ShowInViewport = true) catch ()
							MtlNames[i] = Mtls[i].Name
							MtlIDs[i] = i
						)
						local	NewMMtl = (MultiMaterial Name:ShadingGroup.ObjName Material:Mtls Names:MtlNames MaterialIDList:MtlIDs ShowInViewport:true)
						try (showTextureMap NewMMtl true) catch ()
						NewMMtl
					)
				)
				
				--get used bone count and set skinned meshes presence flag
				local	MaxBoneIndex = 0,
						HaveSkinned = false
				for LODGrp in LODGroups do (
					for tMesh in LODGrp do (
						local	MBoneID = tMesh.BoneID
						if MBoneID > MaxBoneIndex then
							MaxBoneIndex = MBoneID
						if tMesh.Skinned then (
							HaveSkinned = true
							for Geom in tMesh.Geometries do (
								local	SkinBones = Geom.SkinBones
								if Supplied SkinBones then (
									for BoneIndices in SkinBones where BoneIndices[3] != 256 do (
										for Index in BoneIndices where Index > MaxBoneIndex do
											MaxBoneIndex = Index
									)
								)
							)
						)
					)
				)
				
				--build BoneIndexMap
				local	BoneIndexMap = unsupplied,
						HaveBoneIndexMap = false
				if
					(
						HaveSkinned or
						MaxBoneIndex > 1
					) and
					HaveTheSkeleton and
					HaveTheSkeleton_FULL
				then (
					BoneIndexMap = #()
					BoneIndexMap.Count = MaxBoneIndex
					if (TheSkeleton.BuildBoneIndexMap BoneIndexMap TheSkeleton_FULL) then
						HaveBoneIndexMap = true
					else (
						Free BoneIndexMap
						BoneIndexMap = unsupplied
					)
				)
				
				--create fake bones
				if MaxBoneIndex > BoneNodes.Count then (
					if HaveBoneIndexMap then (
						GIMS.Core.SystemMgr.AddResult #Error (
							GIMS.Core.ValueOps.FormatText \
								v1:"Model with skeleton \"" \
								v2:TheSkeleton.DiskPath \
								v3:TheSkeleton.ObjName \
								v4:"\" hasn't got enough bones to properly create skinned meshes, despite the fact you've supplied FULL skeleton file \"" \
								v5:TheSkeleton_FULL.ObjName \
								v6:"\".\nFake bones will be created. Probably, supplied FULL skeleton doesn't match this model." \
						)
					)
					local	BonesParent = BoneNodes[1],
							BonesParentTM = BonesParent.Transform
					for i = MaxBoneIndex to 1 by -1 where No BoneNodes[i] do (
						local	tBone = (EGIMS_V_Model_Bone Name:("Fake Bone " + ((i as Integer) as String)) Parent:BonesParent Transform:BonesParentTM)
						tBone.WireColor = Yellow
						tBone.ShowLinks = true
						tBone.ShowLinksOnly = true
						BoneNodes[i] = tBone
					)
				)
					
				/*TODO remove, debug*
				if HaveBoneIndexMap then (
					Format "BoneIndexMap of %\n" (if HaveTheSkeleton then TheSkeleton.ObjName else TheSkeleton_FULL.ObjName)
					Format "\tSize %\n" BoneIndexMap.Count
					Format "\tFirst undefined at %\n" (FindItem BoneIndexMap undefined)
					with printallelements true (Format "\tData %\n" (BoneIndexMap as String))
				)
				/*TODO remove, debug END*/
				
				--create meshes
				for LODGrpID = 1 to LODGroups.Count do (
					for tMesh in LODGroups[LODGrpID] do (
						local	TempMesh = false
						try (
							TempMesh = (tMesh.Create BoneNodes MMtl BoneIndexMap)
						) catch (
							local	CET = (GetCurrentException())
							try (GIMS.Core.SystemMgr.AddResult #Warning ("Skipped a CodeWalker LOD mesh: " + CET)) catch ()
							TempMesh = false
						)
						if TempMesh != false then (
							try (
							for Geom in tMesh.Geometries do (
								local	Mtl = MMtl[Geom.ShaderIndex]
								if (IsKindOf Mtl EGIMS_V_material) then (
									local	GeometryFlags = Mtl.GeometryFlags
									for FlagID in Geom.Flags do
										GeometryFlags[FlagID] = true
								)
							)
							TempMesh.Material = MMtl
							try (showTextureMap MMtl true) catch ()
							AddModifier TempMesh (EGIMS_V_ModelMesh Type:LODGrpID Mask:tMesh.Mask FixUVs:false FixVCs:false FixNRMs:false SaveOp:false)
							try (SetUserProp TempMesh "GIMS_XMLLOD" LODGrpID) catch ()
							if tMesh.IsPhysics then (
								SetUserProp TempMesh "GIMS_XMLPart" "physics"
								SetUserProp TempMesh "GIMS_PhysIndex" tMesh.PhysIndex
							)
							if LODGrpID > 1 then
								hide TempMesh
							try (
								Select TempMesh
								MAX Modify Mode
								modPanel.setCurrentObject TempMesh.baseObject
							) catch ()
							) catch (
								local	CET = (GetCurrentException())
								try (GIMS.Core.SystemMgr.AddResult #Warning ("CodeWalker mesh was created but a modifier/material step failed: " + CET)) catch ()
							)
						)
					)
				)
				Free BoneIndexMap
				OK
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#Mtls, #MMtlCount), #(Mtls, MMtl.Count)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		)
	)
	struct /*#PC*PATH	GIMS.CurrentGame.Core.TypeLibrary.grcCWXML*/ strCWXML (
		GIMSObjectLink = "GIMS.CurrentGame.Core.TypeLibrary.grcCWXML",
		fn IsXMLFile FilePath = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if not (DoesFileExist FilePath) then
					return false
				local	F = (OpenFile FilePath Mode:"rt")
				if No F then
					return false
				local	Line = ""
				while
					(not (eof F)) and
					(Line.Count == 0)
				do
					Line = (TrimLeft (ReadLine F))
				Close F
				if Line.Count == 0 then
					false
				else (
					local	FirstChar = Line[1]
					(FirstChar == "<") or (FirstChar == "?")
				)
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn LoadDocument FilePath = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	XMLDoc = (DotNetObject "System.Xml.XmlDocument")
				GIMS.SetLifetimeController XMLDoc #MXS
				XMLDoc.Load FilePath
				XMLDoc
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#FilePath), #(FilePath)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn GetAttr Node AttrName DefaultVal:"" = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if
					Have Node and
					Have Node.Attributes
				then (
					local	Attr = (Node.Attributes.GetNamedItem AttrName)
					if Have Attr then
						Attr.Value
					else
						DefaultVal
				) else
					DefaultVal
			/*<ERRHANDLER>*/) catch DefaultVal/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn GetAttrFloat Node AttrName DefaultVal:0.0 = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	Raw = (GetAttr Node AttrName DefaultVal:undefined)
				if Have Raw then
					(GIMS.Core.ValueOps.TypeCast Raw Float)
				else
					DefaultVal
			/*<ERRHANDLER>*/) catch DefaultVal/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn GetAttrInt Node AttrName DefaultVal:0 = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	Raw = (GetAttr Node AttrName DefaultVal:undefined)
				if Have Raw then
					(GIMS.Core.ValueOps.TypeCast Raw Integer)
				else
					DefaultVal
			/*<ERRHANDLER>*/) catch DefaultVal/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn GetChild Node TagName = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if Have Node then
					(Node.SelectSingleNode TagName)
				else
					undefined
			/*<ERRHANDLER>*/) catch undefined/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn GetChildText Node TagName DefaultVal:"" = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	Child = (GetChild Node TagName)
				if
					Have Child and
					Have Child.InnerText
				then
					(TrimLeft (TrimRight Child.InnerText))
				else
					DefaultVal
			/*<ERRHANDLER>*/) catch DefaultVal/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn GetVec3 Node TagName DefaultVal:[0, 0, 0] = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	Fallback = (
							if Supplied DefaultVal then
								DefaultVal
							else
								[0, 0, 0]
						),
						Child = (GetChild Node TagName)
				if Have Child then
					[(GetAttrFloat Child "x" DefaultVal:Fallback.x), (GetAttrFloat Child "y" DefaultVal:Fallback.y), (GetAttrFloat Child "z" DefaultVal:Fallback.z)]
				else
					Fallback
			/*<ERRHANDLER>*/) catch (
				if Supplied DefaultVal then
					DefaultVal
				else
					[0, 0, 0]
			)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn GetQuat Node TagName DefaultVal:(Quat 0 0 0 1) = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	Child = (GetChild Node TagName)
				if Have Child then
					(Quat (GetAttrFloat Child "x") (GetAttrFloat Child "y") (GetAttrFloat Child "z") (GetAttrFloat Child "w" DefaultVal:1.0))
				else
					DefaultVal
			/*<ERRHANDLER>*/) catch DefaultVal/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn MapBoneFlag FlagName = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	Key = (ToUpper (SubstituteString FlagName "_" ""))
				case Key of (
					"ROTX": #ROT_X
					"ROTY": #ROT_Y
					"ROTZ": #ROT_Z
					"TRANSX": #TRANS_X
					"TRANSY": #TRANS_Y
					"TRANSZ": #TRANS_Z
					"SCALEX": #SCALE_X
					"SCALEY": #SCALE_Y
					"SCALEZ": #SCALE_Z
					"LIMITROTATION": #LIMIT_ROTATION
					"LIMITTRANSLATION": #LIMIT_TRANSLATION
					"LIMITSCALE": #LIMIT_SCALE
					default: (
						if (MatchPattern Key Pattern:"UNK*") then
							undefined
						else
							(GIMS.Core.ValueOps.TypeCast FlagName name)
					)
				)
			/*<ERRHANDLER>*/) catch undefined/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn ApplyBoneFlags FlagsBitArray KnownFlags FlagText ObjName = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if
					Have FlagText and
					FlagText.Count != 0
				then (
					local	CleanText = (SubstituteString FlagText "," " "),
							FlagNames = (FilterString CleanText " \t")
					for FlagName in FlagNames where FlagName.Count != 0 do (
						local	FlagMapped = (MapBoneFlag FlagName)
						if Have FlagMapped then (
							local	FlagID = (FindItem KnownFlags FlagMapped)
							if FlagID != 0 then
								FlagsBitArray[FlagID] = true
							else (
								GIMS.Core.SystemMgr.AddResult #Warning  (
									GIMS.Core.ValueOps.FormatText \
										v1:"Unknown bone flag \"" \
										v2:FlagName \
										v3:"\" in object \"" \
										v4:ObjName \
										v5:"\" skipped."
								)
							)
						)
					)
				)
				true
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn GetDrawableNode Root = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if No Root then
					undefined
				else (
					local	RootName = (ToUpper Root.Name)
					case RootName of (
						"DRAWABLE":
							Root
						"FRAGMENT": (
							local	DrawableNode = (GetChild Root "Drawable")
							if No DrawableNode then
								(Root.SelectSingleNode ".//Drawable")
							else
								DrawableNode
						)
						"DRAWABLEDICTIONARY":
							(GetChild Root "Item")
						default:
							(
								local	DrawableNode = (Root.SelectSingleNode ".//Drawable")
								if No DrawableNode then
									Root
								else
									DrawableNode
							)
					)
				)
			/*<ERRHANDLER>*/) catch undefined/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn SplitTokens Txt = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if
					Have Txt and
					Txt.Count != 0
				then
					(FilterString Txt " \t\r\n")
				else
					#()
			/*<ERRHANDLER>*/) catch #()/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn CleanResourceName Name = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if
					No Name or
					Name.Count == 0
				then
					""
				else (
					local	UpperName = (ToUpper Name)
					if
						(MatchPattern UpperName Pattern:"*.YDR") or
						(MatchPattern UpperName Pattern:"*.YFT") or
						(MatchPattern UpperName Pattern:"*.YDD") or
						(MatchPattern UpperName Pattern:"*.YBN") or
						(MatchPattern UpperName Pattern:"*.YBD") or
						(MatchPattern UpperName Pattern:"*.YMAP") or
						(MatchPattern UpperName Pattern:"*.YTYP") or
						(MatchPattern UpperName Pattern:"*.YCD") or
						(MatchPattern UpperName Pattern:"*.YNV")
					then
						(GetFileNameFile Name)
					else
						Name
				)
			/*<ERRHANDLER>*/) catch Name/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn GetFileKindFromName FilePath = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	Name = (ToUpper (FileNameFromPath FilePath))
				if (MatchPattern Name Pattern:"*.YDD.XML") then
					#DrawableDictionary
				else if (MatchPattern Name Pattern:"*.YBN.XML") then
					#Bound
				else if (MatchPattern Name Pattern:"*.YBD.XML") then
					#BoundDictionary
				else if (MatchPattern Name Pattern:"*.YMAP.XML") then
					#MapData
				else if (MatchPattern Name Pattern:"*.YTYP.XML") then
					#MapTypes
				else if (MatchPattern Name Pattern:"*.YCD.XML") then
					#ClipDictionary
				else if (MatchPattern Name Pattern:"*.YNV.XML") then
					#NavMesh
				else if (MatchPattern Name Pattern:"*.YFT.XML") then
					#Fragment
				else if (MatchPattern Name Pattern:"*.YDR.XML") then
					#Drawable
				else
					#Unknown
			/*<ERRHANDLER>*/) catch #Unknown/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn GetFileKindFromRoot Root = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if No Root then
					#Unknown
				else (
					local	RootName = (ToUpper Root.Name)
					case RootName of (
						"DRAWABLE":
							#Drawable
						"FRAGMENT":
							#Fragment
						"DRAWABLEDICTIONARY":
							#DrawableDictionary
						"BOUNDSFILE":
							#Bound
						"BOUNDS":
							#Bound
						"BOUNDDICTIONARY":
							#BoundDictionary
						"BOUNDSDICTIONARY":
							#BoundDictionary
						"CMAPDATA":
							#MapData
						"CMAPTYPES":
							#MapTypes
						"CLIPDICTIONARY":
							#ClipDictionary
						"NAVMESH":
							#NavMesh
						"CNAVMESH":
							#NavMesh
						default:
							#Unknown
					)
				)
			/*<ERRHANDLER>*/) catch #Unknown/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn GetFileKind FilePath = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	Kind = (GetFileKindFromName FilePath)
				if Kind != #Unknown then
					Kind
				else if not (IsXMLFile FilePath) then
					#Unknown
				else (
					local	XMLDoc = undefined
					try (XMLDoc = (LoadDocument FilePath)) catch (XMLDoc = undefined)
					if No XMLDoc then
						#Unknown
					else
						(GetFileKindFromRoot XMLDoc.DocumentElement)
				)
			/*<ERRHANDLER>*/) catch #Unknown/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn GetKindLabel Kind = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				case Kind of (
					#Drawable:
						"Drawable XML: "
					#Fragment:
						"Fragment XML: "
					#DrawableDictionary:
						"Drawable dictionary XML: "
					#Bound:
						"Collision XML: "
					#BoundDictionary:
						"Collision dictionary XML: "
					#MapData:
						"Map XML: "
					#MapTypes:
						"Archetype XML: "
					#ClipDictionary:
						"Clip dictionary XML: "
					#NavMesh:
						"Navmesh XML: "
					default:
						"CodeWalker XML: "
				)
			/*<ERRHANDLER>*/) catch "CodeWalker XML: "/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn KindNeedsTextures Kind = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				(Kind == #Drawable) or (Kind == #Fragment) or (Kind == #DrawableDictionary) or (Kind == #Unknown)
			/*<ERRHANDLER>*/) catch true/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn GetKindExtension Kind = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				case Kind of (
					#Drawable:
						".ydr.xml"
					#Fragment:
						".yft.xml"
					#DrawableDictionary:
						".ydd.xml"
					#Bound:
						".ybn.xml"
					#BoundDictionary:
						".ybd.xml"
					#MapData:
						".ymap.xml"
					#MapTypes:
						".ytyp.xml"
					#ClipDictionary:
						".ycd.xml"
					default:
						".xml"
				)
			/*<ERRHANDLER>*/) catch ".xml"/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn IsXMLExport Extension SourceFormat:unsupplied = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if
					Supplied SourceFormat and
					SourceFormat == #XML
				then
					true
				else if Have Extension then
					(MatchPattern (ToUpper Extension) Pattern:"*XML")
				else
					false
			/*<ERRHANDLER>*/) catch false/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn TagSceneNode Node SourceFormat Extension Kind:unsupplied SourceXML:unsupplied SourceXMLOrig:unsupplied TexFolder:unsupplied = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if Have Node then (
					SetUserProp Node "GIMS_ExportFormat" (
						if SourceFormat == #XML then
							"xml"
						else
							"openFormats"
					)
					if Have Extension then
						SetUserProp Node "GIMS_ExportExtension" (Extension as String)
					if Supplied Kind then
						SetUserProp Node "GIMS_XMLKind" (Kind as String)
					if
						Supplied SourceXML and
						Have SourceXML
					then
						SetUserProp Node "GIMS_SourceXML" (SourceXML as String)
					if
						Supplied SourceXMLOrig and
						Have SourceXMLOrig
					then
						SetUserProp Node "GIMS_SourceXMLOrig" (SourceXMLOrig as String)
					if
						Supplied TexFolder and
						Have TexFolder
					then (
						local	TexDir = TexFolder
						if (IsKindOf TexDir Array) then (
							if TexDir.Count != 0 then
								TexDir = TexDir[1]
							else
								TexDir = ""
						)
						if
							Have TexDir and
							((TexDir as String).Count != 0)
						then
							SetUserProp Node "GIMS_TexFolder" (TexDir as String)
					)
				)
				OK
			/*<ERRHANDLER>*/) catch OK/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn ApplySceneNodeFormat Node Str = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if
					Have Node and
					Have Str
				then (
					local	Fmt = (GetUserProp Node "GIMS_ExportFormat")
					if (Fmt as String) == "xml" then (
						Str.SourceFormat = #XML
						local	Ext = (GetUserProp Node "GIMS_ExportExtension"),
								KindStr = (GetUserProp Node "GIMS_XMLKind")
						if Have Ext then
							Str.Extension = (Ext as String)
						if Have KindStr then (
							local	KindName = (KindStr as Name)
							try (Str.XMLKind = KindName) catch ()
							try (Str.Kind = KindName) catch ()
							if
								No Ext and
								Have KindName
							then
								Str.Extension = (GetKindExtension KindName)
						)
						local	SrcXML = (GetUserProp Node "GIMS_SourceXML"),
								SrcOrig = (GetUserProp Node "GIMS_SourceXMLOrig"),
								TexFolder = (GetUserProp Node "GIMS_TexFolder")
						if Have SrcXML then (
							local	SrcStr = (SrcXML as String)
							if SrcStr.Count != 0 then
								try (Str.SourceXMLPath = SrcStr) catch ()
						)
						if Have SrcOrig then (
							local	OrigStr = (SrcOrig as String)
							if OrigStr.Count != 0 then
								try (Str.SourceXMLOrigPath = OrigStr) catch ()
						)
						if Have TexFolder then (
							local	TexStr = (TexFolder as String)
							if TexStr.Count != 0 then
								try (Str.SourceTexPath = TexStr) catch ()
						)
					)
				)
				Str
			/*<ERRHANDLER>*/) catch Str/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn CacheSourceXML FilePath = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if
					No FilePath or
					not (DoesFileExist FilePath)
				then
					undefined
				else (
					local	CacheDir = ""
					try (CacheDir = (GIMS.CurrentGame.BasePath + "XMLSource\\")) catch (CacheDir = "")
					if CacheDir.Count == 0 then
						FilePath
					else (
						MakeDir CacheDir All:true
						local	FName = (FileNameFromPath FilePath),
								HashVal = 0,
								Dest
						for i = 1 to FilePath.Count do
							HashVal += ((Bit.CharAsInt FilePath[i]) * i)
						Dest = (CacheDir + (HashVal as String) + "_" + FName)
						if (DoesFileExist Dest) then
							try (DeleteFile Dest) catch ()
						try (CopyFile FilePath Dest) catch ()
						if (DoesFileExist Dest) then (
							try (CopyTextureSidecar FilePath Dest) catch ()
							Dest
						) else
							FilePath
					)
				)
			/*<ERRHANDLER>*/) catch FilePath/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn EnsureDirSlash Dir = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if No Dir then
					""
				else (
					local	S = (Dir as String)
					if S.Count == 0 then
						S
					else if S[S.Count] != "\\" then
						(S + "\\")
					else
						S
				)
			/*<ERRHANDLER>*/) catch ""/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn AssetShortName FilePath = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if No FilePath then
					""
				else (
					local	Name = (FileNameFromPath (FilePath as String)),
							Upper = (ToUpper Name)
					if (MatchPattern Upper Pattern:"*.XML") then
						Name = (GetFileNameFile Name)
					Upper = (ToUpper Name)
					if
						(MatchPattern Upper Pattern:"*.YDR") or
						(MatchPattern Upper Pattern:"*.YFT") or
						(MatchPattern Upper Pattern:"*.YDD") or
						(MatchPattern Upper Pattern:"*.YTD") or
						(MatchPattern Upper Pattern:"*.YBN") or
						(MatchPattern Upper Pattern:"*.YBD")
					then
						Name = (GetFileNameFile Name)
					Name
				)
			/*<ERRHANDLER>*/) catch ""/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn TextureFolderForXML FilePath = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				((EnsureDirSlash (GetFileNamePath FilePath)) + (AssetShortName FilePath) + "\\")
			/*<ERRHANDLER>*/) catch ""/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn CopyOneFile Src Dst = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if
					No Src or
					No Dst or
					not (DoesFileExist Src)
				then
					false
				else (
					MakeDir (GetFileNamePath Dst) All:true
					if (DoesFileExist Dst) then
						try (DeleteFile Dst) catch ()
					(CopyFile Src Dst)
				)
			/*<ERRHANDLER>*/) catch false/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn CopyDDSFiles SrcDir DstDir = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				SrcDir = (EnsureDirSlash SrcDir)
				DstDir = (EnsureDirSlash DstDir)
				if
					SrcDir.Count == 0 or
					DstDir.Count == 0 or
					not (DoesDirectoryExist SrcDir)
				then
					0
				else (
					MakeDir DstDir All:true
					local	Count = 0,
							Files = (GetFiles (SrcDir + "*.dds"))
					if Have Files then (
						for F in Files do (
							if (CopyOneFile F (DstDir + (FileNameFromPath F))) then
								Count += 1
						)
					)
					Count
				)
			/*<ERRHANDLER>*/) catch 0/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn CopyTextureSidecar SrcXML DstXML = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if
					No SrcXML or
					No DstXML
				then
					0
				else (
					local	SrcDir = (EnsureDirSlash (GetFileNamePath SrcXML)),
							DstFolder = (TextureFolderForXML DstXML),
							Copied = 0,
							SrcName = (AssetShortName SrcXML),
							DstName = (AssetShortName DstXML),
							SrcStem = (GetFileNameFile SrcXML),
							Candidates = #(
								(SrcDir + SrcName),
								(SrcDir + DstName),
								(SrcDir + SrcStem),
								SrcDir
							)
					for C in Candidates do
						Copied += (CopyDDSFiles C DstFolder)
					Copied
				)
			/*<ERRHANDLER>*/) catch 0/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn WriteU32 Stream Val = (
			local	V = (Val as Integer)
			WriteByte Stream (Bit.And V 255)
			WriteByte Stream (Bit.And (Bit.Shift V -8) 255)
			WriteByte Stream (Bit.And (Bit.Shift V -16) 255)
			WriteByte Stream (Bit.And (Bit.Shift V -24) 255)
			OK
		),
		fn WriteDummyDDS FilePath = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if No FilePath then
					false
				else (
					MakeDir (GetFileNamePath FilePath) All:true
					local	Stream = (FOpen FilePath "wb")
					if No Stream then
						false
					else (
						WriteByte Stream 68
						WriteByte Stream 68
						WriteByte Stream 83
						WriteByte Stream 32
						WriteU32 Stream 124
						WriteU32 Stream 528391
						WriteU32 Stream 4
						WriteU32 Stream 4
						WriteU32 Stream 8
						WriteU32 Stream 0
						WriteU32 Stream 1
						for i = 1 to 11 do
							WriteU32 Stream 0
						WriteU32 Stream 32
						WriteU32 Stream 4
						WriteU32 Stream 827611204
						WriteU32 Stream 0
						WriteU32 Stream 0
						WriteU32 Stream 0
						WriteU32 Stream 0
						WriteU32 Stream 0
						WriteU32 Stream 4096
						WriteU32 Stream 0
						WriteU32 Stream 0
						WriteU32 Stream 0
						WriteU32 Stream 0
						for i = 1 to 8 do
							WriteByte Stream 0
						FClose Stream
						true
					)
				)
			/*<ERRHANDLER>*/) catch false/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn FindDDSFile DDSName SearchDirs = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if
					No DDSName or
					DDSName.Count == 0
				then
					undefined
				else (
					local	Found = undefined
					if Have SearchDirs then (
						for Dir in SearchDirs while (No Found) do (
							local	Folder = (EnsureDirSlash Dir)
							if Folder.Count != 0 then (
								local	TryA = (Folder + DDSName)
								if (DoesFileExist TryA) then
									Found = TryA
								else (
									local	Subs = #()
									try (Subs = (GetDirectories (Folder + "*"))) catch ()
									if Have Subs then (
										for Sub in Subs while (No Found) do (
											local	TryB = ((EnsureDirSlash Sub) + DDSName)
											if (DoesFileExist TryB) then
												Found = TryB
										)
									)
								)
							)
						)
					)
					Found
				)
			/*<ERRHANDLER>*/) catch undefined/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn PrepareCodeWalkerTextures XMLPath SearchXMLs TexFolders:unsupplied = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if
					No XMLPath or
					not (DoesFileExist XMLPath)
				then
					false
				else (
					local	DstFolder = (TextureFolderForXML XMLPath),
							SearchDirs = #(DstFolder),
							Copied = 0,
							Missing = 0
					MakeDir DstFolder All:true
					if Have SearchXMLs then (
						for SrcXML in SearchXMLs where Have SrcXML do (
							local	SrcStr = (SrcXML as String)
							if SrcStr.Count != 0 then (
								Copied += (CopyTextureSidecar SrcStr XMLPath)
								Append SearchDirs (GetFileNamePath SrcStr)
								Append SearchDirs (TextureFolderForXML SrcStr)
								Append SearchDirs ((EnsureDirSlash (GetFileNamePath SrcStr)) + (GetFileNameFile SrcStr))
							)
						)
					)
					if
						Supplied TexFolders and
						Have TexFolders
					then (
						local	Folders = TexFolders
						if not (IsKindOf Folders Array) then
							Folders = #(Folders)
						for Folder in Folders where Have Folder do (
							local	DirStr = (Folder as String)
							if DirStr.Count != 0 then (
								Copied += (CopyDDSFiles DirStr DstFolder)
								Append SearchDirs DirStr
							)
						)
					)
					local	XMLDoc = undefined
					try (XMLDoc = (LoadDocument XMLPath)) catch ()
					if Have XMLDoc then (
						local	NameNodes = (XMLDoc.SelectNodes "//FileName")
						for i = 0 to (NameNodes.Count - 1) do (
							local	Node = (NameNodes.Item[i]),
									Raw = ""
							try (Raw = (Node.InnerText as String)) catch ()
							local	Upper = (ToUpper Raw)
							if
								Raw.Count != 0 and
								not (MatchPattern Upper Pattern:"*.SPS")
							then (
								local	Base = (GetFileNameFile Raw)
								if Base.Count == 0 then
									Base = (FileNameFromPath Raw)
								if Base.Count == 0 then
									Base = Raw
								local	DDSName = (Base + ".dds"),
										DestFile = (DstFolder + DDSName)
								try (Node.InnerText = DDSName) catch ()
								if not (DoesFileExist DestFile) then (
									local	Found = (FindDDSFile DDSName SearchDirs)
									if
										No Found and
										(DoesFileExist Raw)
									then
										Found = Raw
									if Have Found then
										CopyOneFile Found DestFile
								)
								if not (DoesFileExist DestFile) then (
									if (WriteDummyDDS DestFile) then
										Missing += 1
								)
							)
						)
						try (XMLDoc.Save XMLPath) catch ()
					)
					if Missing != 0 then
						try (GIMS.Core.SystemMgr.AddResult #Warning ("CodeWalker needs .dds files next to the XML in a folder named after the model. Wrote " + (Missing as String) + " placeholder texture(s) so import will not fail. Re-export from CodeWalker with textures, or copy the original .dds folder beside the XML.")) catch ()
					true
				)
			/*<ERRHANDLER>*/) catch false/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn IsSceneBone Obj = (
			try (
				if No Obj then
					false
				else (
					local	Cls = (ClassOf Obj)
					if
						(Cls == EGIMS_V_Model_Bone) or
						(Cls == EGIMS_V_Model_BoneMod) or
						(IsKindOf Obj EGIMS_V_Model_Bone) or
						(IsKindOf Obj EGIMS_V_Model_BoneMod)
					then
						true
					else (
						local	BoneMod = undefined
						try (BoneMod = Obj.Modifiers[#Bone]) catch ()
						if Have BoneMod then
							true
						else (
							try (
								for Mod in Obj.Modifiers do (
									local ModCls = (ClassOf Mod)
									if
										(ModCls == EGIMS_V_Model_Bone) or
										(ModCls == EGIMS_V_Model_BoneMod) or
										(IsKindOf Mod EGIMS_V_Model_Bone) or
										(IsKindOf Mod EGIMS_V_Model_BoneMod)
									then
										return true
								)
								false
							) catch false
						)
					)
				)
			) catch false
		),
		fn SceneBoneTag Obj = (
			/* A GIMS bone can store its GTA tag on the node or on its Bone modifier.
			   Prefer this immutable tag over the editable Max node name on XML export. */
			try (
				local	Tag = undefined
				try (Tag = Obj.ID) catch ()
				if not (IsKindOf Tag Integer) then
					try (Tag = Obj.Modifiers[#Bone].ID) catch ()
				if not (IsKindOf Tag Integer) then
					try (
						for Mod in Obj.Modifiers while not (IsKindOf Tag Integer) do
							try (Tag = Mod.ID) catch ()
					) catch ()
				if not (IsKindOf Tag Integer) then
					try (Tag = Obj.BaseObject.ID) catch ()
				Tag
			) catch undefined
		),
		fn BoneParentForExport Obj RootNode = (
			try (
				local	ParentObj = Obj.Parent
				while Have ParentObj do (
					if
						Have RootNode and
						ParentObj == RootNode
					then
						return ParentObj
					if (IsSceneBone ParentObj) then
						return ParentObj
					local	PCls = (ClassOf ParentObj)
					if
						(PCls == EGIMS_V_Model) or
						(PCls == EGIMS_V_Model_ModelMod)
					then
						return ParentObj
					ParentObj = ParentObj.Parent
				)
				RootNode
			) catch RootNode
		),
		fn BoneLocalXForm Obj RootNode = (
			/* IMPORTANT: on failure this must return `undefined`, never a fabricated
			   identity/zero transform - a silent identity fallback here looks exactly
			   like a successful patch to the caller (Patched still gets incremented
			   and the text gets written) while actually zeroing the bone out. Callers
			   must check for `undefined` and skip/report that bone instead of writing it. */
			try (
				local	ParentObj = (BoneParentForExport Obj RootNode),
						InvParentTM = (
							if Have ParentObj then
								(Inverse ParentObj.Transform)
							else
								(Matrix3 1)
						),
						Pos = (Obj.Pos * InvParentTM),
						Rot = ((Inverse (Obj.Rotation as Matrix3)) * InvParentTM).Rotation,
						ScaleVal = (
							if Have ParentObj then
								(Obj.Scale / ParentObj.Scale)
							else
								Obj.Scale
						)
				Rot = (Inverse Rot)
				#(Pos, Rot, ScaleVal)
			) catch undefined
		),
		fn ReplaceXMLSelfTag Block TagName Replacement = (
			try (
				local	Open = ("<" + TagName),
						A = (Block.IndexOf Open)
				if A < 0 then
					Block
				else (
					local	B = (Block.IndexOf ">" A)
					if B < 0 then
						Block
					else (
						local	SB = (DotNetObject "System.Text.StringBuilder")
						SB.Append (Block.Substring 0 A)
						SB.Append Replacement
						SB.Append (Block.Substring (B + 1))
						(SB.ToString())
					)
				)
			) catch Block
		),
		fn PatchXMLSkeletonFromScene FilePath RootName = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				global GIMS_CW_FALLBACK_SKIPPED
				GIMS_CW_FALLBACK_SKIPPED = 0
				if
					No FilePath or
					not (DoesFileExist FilePath)
				then
					false
				else (
					local	Root = undefined,
						SceneNodes = #(),
						Candidates = #()
					if Have RootName then
						try (Root = (GetNodeByName RootName)) catch ()
					if Have Root then (
						local	Kids = #(Root),
								Cursor = 1
						while Cursor <= Kids.Count do (
							local	Obj = Kids[Cursor]
							Cursor += 1
							Append SceneNodes Obj
							if (IsSceneBone Obj) then
								Append Candidates Obj
							try (
								for Child in Obj.Children do
									Append Kids Child
							) catch ()
						)
					)
					/* Some legacy GIMS bone helpers do not expose their modifier class
					   through MaxScript.  Retain the root's named nodes as a last-resort
					   map so their skeleton entries can still be located by name. */
					if Candidates.Count == 0 and SceneNodes.Count != 0 then (
						for Obj in SceneNodes where Obj != Root do
							Append Candidates Obj
					)
					if Candidates.Count == 0 then (
						for Obj in Objects where (IsSceneBone Obj) do
							Append Candidates Obj
					)
					/* Export names do not always match the model-root node name, and a
					   vehicle scene can contain bones outside that root (turrets, trailers,
					   attachments, etc). Only pull in EXTRA scene objects that are genuine
					   GIMS bones and are not already accounted for above - never blindly
					   dump every object in the scene, since an unrelated/duplicate-named
					   object (a leftover from a previous import, a backup copy, etc.) would
					   silently overwrite a correctly-synced bone with the wrong transform. */
					for Obj in Objects where (IsSceneBone Obj) do
						Append Candidates Obj
					/* Dedupe by node handle, keeping only the FIRST occurrence of each bone
					   (the one found via the proper hierarchy walk above, if any), so a
					   later stray/duplicate-named object can never overwrite a correctly
					   synced bone's transform. */
					local	BoneMap = #(),
							SeenHandles = #{},
							SeenTags = #{}
					for Obj in Candidates do (
						local	Handle = undefined,
								AlreadySeen = false
						try (Handle = (GetHandleByAnim Obj)) catch ()
						if Have Handle then (
							if SeenHandles[Handle] then
								AlreadySeen = true
							else
								SeenHandles[Handle] = true
						)
						if not AlreadySeen then (
							local	Tag = (SceneBoneTag Obj)
							if (IsKindOf Tag Integer) and Tag > 0 then (
								if SeenTags[Tag] then
									AlreadySeen = true
								else
									SeenTags[Tag] = true
							)
						)
						if not AlreadySeen then (
							local	XForm = (BoneLocalXForm Obj Root)
							/* A transform that failed to read must NOT be written as identity/zero -
							   that would silently corrupt this bone while the caller still sees
							   "success". Drop it from the map instead, and track it so the
							   skip is visible rather than invisible. */
							if Have XForm then
								Append BoneMap #(Obj.Name, XForm, (SceneBoneTag Obj))
							else
								GIMS_CW_FALLBACK_SKIPPED += 1
						)
					)
					if BoneMap.Count == 0 then
						false
					else (
						local	FileCls = (DotNetClass "System.IO.File"),
								Enc = (DotNetObject "System.Text.UTF8Encoding" false),
								Txt = (FileCls.ReadAllText FilePath),
								Patched = 0
						for Entry in BoneMap do (
							local	BoneName = (Entry[1] as String),
									XForm = Entry[2],
									BoneTag = Entry[3],
									NameTag = ("<Name>" + BoneName + "</Name>"),
									MatchTag = (
										if (IsKindOf BoneTag Integer) then
											("<Tag value=\"" + (BoneTag as String) + "\"")
										else
											NameTag
									),
									SearchAt = 0,
									NamePos = (Txt.IndexOf MatchTag SearchAt)
							if NamePos < 0 and not (IsKindOf BoneTag Integer) then (
								/* GIMS can expose turret_1base as turret_base in the scene.
								   Try the original XML naming form only after exact matching. */
								MatchTag = ("<Name>" + (SubstituteString BoneName "_" "_1") + "</Name>")
								NamePos = (Txt.IndexOf MatchTag SearchAt)
							)
							while NamePos >= 0 do (
								local	ItemStart = (Txt.LastIndexOf "<Item>" NamePos),
										ItemEnd = (Txt.IndexOf "</Item>" NamePos),
										SkelStart = (Txt.LastIndexOf "<Skeleton>" ItemStart),
										SkelEnd = (if SkelStart >= 0 then (Txt.IndexOf "</Skeleton>" SkelStart) else -1),
										NextSearchAt = (ItemEnd + 1)
								if
									ItemStart >= 0 and
									ItemEnd > ItemStart and
									SkelEnd > ItemEnd
								then (
									ItemEnd += 7
									local	Item = (Txt.Substring ItemStart (ItemEnd - ItemStart)),
											Pos = XForm[1],
											Rot = XForm[2],
											Scl = XForm[3],
											TransTag = ("<Translation " + (Vec3Attrs Pos) + " />"),
											RotTag = ("<Rotation " + (QuatAttrs Rot) + " />"),
											ScaleTag = ("<Scale " + (Vec3Attrs Scl) + " />")
									Item = (ReplaceXMLSelfTag Item "Translation" TransTag)
									Item = (ReplaceXMLSelfTag Item "Rotation" RotTag)
									Item = (ReplaceXMLSelfTag Item "Scale" ScaleTag)
									local	SB = (DotNetObject "System.Text.StringBuilder")
									SB.Append (Txt.Substring 0 ItemStart)
									SB.Append Item
									SB.Append (Txt.Substring ItemEnd)
									Txt = (SB.ToString())
									Patched += 1
									NextSearchAt = (ItemStart + Item.Count)
								)
								SearchAt = NextSearchAt
								NamePos = (Txt.IndexOf MatchTag SearchAt)
							)
						)
						if Patched != 0 then
							FileCls.WriteAllText FilePath Txt Enc
						(Patched != 0)
					)
				)
			/*<ERRHANDLER>*/) catch false/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn ParseXMLString Txt = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				undefined
			/*<ERRHANDLER>*/) catch undefined/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn ExtractTagBlock Txt TagName = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if No Txt then
					undefined
				else (
					local	OpenTag = ("<" + TagName + ">"),
							CloseTag = ("</" + TagName + ">"),
							A = (Txt.IndexOf OpenTag)
					if A < 0 then (
						OpenTag = ("<" + TagName + " ")
						A = (Txt.IndexOf OpenTag)
					)
					if A < 0 then
						undefined
					else (
						local	B = (Txt.IndexOf CloseTag A)
						if B < 0 then
							undefined
						else
							(Txt.Substring A ((B + CloseTag.Count) - A))
					)
				)
			/*<ERRHANDLER>*/) catch undefined/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn ReplaceFirstTag Original TagName NewBlock = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if
					No Original or
					No NewBlock or
					No TagName
				then
					Original
				else (
					local	OpenTag = ("<" + TagName + ">"),
							CloseTag = ("</" + TagName + ">"),
							A = (Original.IndexOf OpenTag)
					if A < 0 then (
						OpenTag = ("<" + TagName + " ")
						A = (Original.IndexOf OpenTag)
					)
					if A < 0 then
						Original
					else (
						local	B = (Original.IndexOf CloseTag A)
						if B < 0 then
							Original
						else (
							local	SB = (DotNetObject "System.Text.StringBuilder")
							SB.Append (Original.Substring 0 A)
							SB.Append NewBlock
							SB.Append (Original.Substring (B + CloseTag.Count))
							(SB.ToString())
						)
					)
				)
			/*<ERRHANDLER>*/) catch Original/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn MergeEditedXML SourcePath NewXML OutPath Kind PhysMeshes:unsupplied = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if
					No SourcePath or
					not (DoesFileExist SourcePath) or
					No NewXML
				then
					false
				else if
					Kind != #Fragment and
					Kind != #Drawable
				then
					false
				else (
					local	FileCls = (DotNetClass "System.IO.File"),
							Enc = (DotNetObject "System.Text.UTF8Encoding" false),
							TempNew = ((GetDir #temp) + "gims_cw_new.xml"),
							Original,
							NewNet,
							NewHigh
					FileCls.WriteAllText TempNew (NewXML as String) Enc
					Original = (FileCls.ReadAllText SourcePath)
					NewNet = (FileCls.ReadAllText TempNew)
					NewHigh = (ExtractTagBlock NewNet "DrawableModelsHigh")
					if Have NewHigh then
						Original = (ReplaceFirstTag Original "DrawableModelsHigh" NewHigh)
					MakeDir (GetFileNamePath OutPath) All:true
					FileCls.WriteAllText OutPath Original Enc
					true
				)
			/*<ERRHANDLER>*/) catch false/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn XMLEscape Txt = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if No Txt then
					""
				else (
					local	Result = (Txt as String)
					Result = (SubstituteString Result "&" "&amp;")
					Result = (SubstituteString Result "<" "&lt;")
					Result = (SubstituteString Result ">" "&gt;")
					Result = (SubstituteString Result "\"" "&quot;")
					Result
				)
			/*<ERRHANDLER>*/) catch ""/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn FormatFloat Val = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if No Val then
					"0"
				else
					(FormattedPrint (Val as Float) Format:"0.########")
			/*<ERRHANDLER>*/) catch "0"/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn SafeP4 Val = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if No Val then
					[0, 0, 0, 0]
				else
					(GIMS.Core.ValueOps.TypeCast Val #P4 ReportCastFail:false)
			/*<ERRHANDLER>*/) catch [0, 0, 0, 0]/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn ArrayTypeCount ParamType = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				case ParamType of (
					#svt_float4x2:
						2
					#svt_float2x3:
						3
					#svt_matrix3x4:
						4
					#svt_matrix44:
						4
					#svt_float4x4:
						4
					#svt_float4x5:
						5
					default:
						0
				)
			/*<ERRHANDLER>*/) catch 0/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn PadP4Array Arr Needed = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if No Arr then
					Arr = #()
				for i = 1 to Needed do (
					if
						i > Arr.Count or
						No Arr[i]
					then
						Arr[i] = [0, 0, 0, 0]
					else
						Arr[i] = (SafeP4 Arr[i])
				)
				Arr.Count = Needed
				Arr
			/*<ERRHANDLER>*/) catch #()/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn DefaultParamValue ParamType = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	Needed = (ArrayTypeCount ParamType)
				if Needed != 0 then
					(PadP4Array #() Needed)
				else (
					case ParamType of (
						#svt_sampler:
							undefined
						#svt_float:
							[0, 0, 0, 0]
						#svt_float2:
							[0, 0, 0, 0]
						#svt_float3:
							[0, 0, 0, 0]
						#svt_float4:
							[0, 0, 0, 0]
						default:
							[0, 0, 0, 0]
					)
				)
			/*<ERRHANDLER>*/) catch [0, 0, 0, 0]/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn WriteXMLFile FilePath Txt = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	Folder = (GetFileNamePath FilePath)
				if Have Folder then
					MakeDir Folder All:true
				local	FileCls = (DotNetClass "System.IO.File"),
						Enc = (DotNetObject "System.Text.UTF8Encoding" false)
				FileCls.WriteAllText FilePath (Txt as String) Enc
				true
			/*<ERRHANDLER>*/) catch false/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn XMLWrite Dest Txt = (
			try (
				if Txt == undefined then
					Format "%" "" To:Dest
				else
					Format "%" Txt To:Dest
			) catch ()
			true
		),
		fn CreateXMLWriter FilePath = (
			try (
				if (DoesFileExist FilePath) then
					try (DeleteFile FilePath) catch ()
				(CreateFile FilePath)
			) catch undefined
		),
		fn CloseXMLWriter Dest = (
			try (Flush Dest) catch ()
			try (Close Dest) catch ()
			OK
		),
		fn MergeHighFile SourcePath HighPath OutPath = (
			/*<PROFILERSTART>*//*LogProfiler #Start "CWXML.MergeHighFile"; local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if
					No SourcePath or
					not (DoesFileExist SourcePath)
				then
					false
				else if
					No HighPath or
					not (DoesFileExist HighPath)
				then
					false
				else (
					local	FileCls = (DotNetClass "System.IO.File"),
							Enc = (DotNetObject "System.Text.UTF8Encoding" false),
							Original = (FileCls.ReadAllText SourcePath Enc),
							NewHigh = (FileCls.ReadAllText HighPath Enc)
					if Have NewHigh then
						Original = (ReplaceFirstTag Original "DrawableModelsHigh" NewHigh)
					MakeDir (GetFileNamePath OutPath) All:true
					FileCls.WriteAllText OutPath Original Enc
					true
				)
			/*<ERRHANDLER>*/) catch false/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn FormatInt Val = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if No Val then
					"0"
				else
					((Val as Integer) as String)
			/*<ERRHANDLER>*/) catch "0"/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn ClampByte Val = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	N = 0
				if Have Val then
					N = ((Val as Float) + 0.5) as Integer
				if N < 0 then
					N = 0
				else if N > 255 then
					N = 255
				N
			/*<ERRHANDLER>*/) catch 0/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn ScaledByte Val = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	N = 0.0
				if Have Val then
					N = (Val as Float)
				if N <= 1.0001 then
					N *= 255.0
				(ClampByte N)
			/*<ERRHANDLER>*/) catch 0/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Vec3Attrs Val = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	P = Val
				if No P then
					P = [0, 0, 0]
				("x=\"" + (FormatFloat P.x) + "\" y=\"" + (FormatFloat P.y) + "\" z=\"" + (FormatFloat P.z) + "\"")
			/*<ERRHANDLER>*/) catch "x=\"0\" y=\"0\" z=\"0\""/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Vec4Attrs Val = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	P = (SafeP4 Val)
				("x=\"" + (FormatFloat P.x) + "\" y=\"" + (FormatFloat P.y) + "\" z=\"" + (FormatFloat P.z) + "\" w=\"" + (FormatFloat P.w) + "\"")
			/*<ERRHANDLER>*/) catch "x=\"0\" y=\"0\" z=\"0\" w=\"0\""/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn QuatAttrs Val = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	Q = Val
				if No Q then
					Q = (Quat 0 0 0 1)
				("x=\"" + (FormatFloat Q.x) + "\" y=\"" + (FormatFloat Q.y) + "\" z=\"" + (FormatFloat Q.z) + "\" w=\"" + (FormatFloat Q.w) + "\"")
			/*<ERRHANDLER>*/) catch "x=\"0\" y=\"0\" z=\"0\" w=\"1\""/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn ValueTag Tab TagName Val = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				(Tab + "<" + TagName + " value=\"" + (Val as String) + "\" />\n")
			/*<ERRHANDLER>*/) catch ""/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Vec3Tag Tab TagName Val = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				(Tab + "<" + TagName + " " + (Vec3Attrs Val) + " />\n")
			/*<ERRHANDLER>*/) catch ""/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Vec4Tag Tab TagName Val = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				(Tab + "<" + TagName + " " + (Vec4Attrs Val) + " />\n")
			/*<ERRHANDLER>*/) catch ""/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn BoundTypeXML Type = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if not (IsKindOf Type Name) then (
					local	BoundTypeMapped = (MapBoundType (Type as String))
					if Have BoundTypeMapped then
						Type = BoundTypeMapped
				)
				case Type of (
					#BoundBox:
						"Box"
					#BoundSphere:
						"Sphere"
					#BoundCapsule:
						"Capsule"
					#BoundCylinder:
						"Cylinder"
					#BoundDisc:
						"Disc"
					#BoundGeometry:
						"Geometry"
					#BoundBVH:
						"GeometryBVH"
					#BoundComposite:
						"Composite"
					#BoundPlane:
						"Plane"
					default:
						"Geometry"
				)
			/*<ERRHANDLER>*/) catch "Geometry"/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn BoneFlagXMLName Flag = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				case Flag of (
					#ROT_X:
						"RotX"
					#ROT_Y:
						"RotY"
					#ROT_Z:
						"RotZ"
					#TRANS_X:
						"TransX"
					#TRANS_Y:
						"TransY"
					#TRANS_Z:
						"TransZ"
					#SCALE_X:
						"ScaleX"
					#SCALE_Y:
						"ScaleY"
					#SCALE_Z:
						"ScaleZ"
					#LIMIT_ROTATION:
						"LimitRotation"
					#LIMIT_TRANSLATION:
						"LimitTranslation"
					#LIMIT_SCALE:
						"LimitScale"
					default:
						(Flag as String)
				)
			/*<ERRHANDLER>*/) catch ""/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn FormatBoneFlags Flags KnownFlags = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	Parts = #()
				if Have Flags then (
					for Flag in Flags do (
						local	FlagName = (BoneFlagXMLName KnownFlags[Flag])
						if
							Have FlagName and
							FlagName.Count != 0
						then
							Append Parts FlagName
					)
				)
				if Parts.Count == 0 then
					""
				else (
					local	Result = Parts[1]
					for i = 2 to Parts.Count do
						Result += (", " + Parts[i])
					Result
				)
			/*<ERRHANDLER>*/) catch ""/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn FormatFlagBitArray Flags KnownFlags = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	Parts = #(),
						BitGet = Bit.Get
				if Have Flags then (
					for i = 1 to KnownFlags.Count where (BitGet Flags i) do
						Append Parts (KnownFlags[i] as String)
				)
				if Parts.Count == 0 then
					""
				else (
					local	Result = Parts[1]
					for i = 2 to Parts.Count do
						Result += (", " + Parts[i])
					Result
				)
			/*<ERRHANDLER>*/) catch ""/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn FormatBoolFlags Flags KnownFlags = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	Parts = #()
				if Have Flags then (
					for i = 1 to KnownFlags.Count where Flags[i] == true do
						Append Parts (KnownFlags[i] as String)
				)
				if Parts.Count == 0 then
					""
				else (
					local	Result = Parts[1]
					for i = 2 to Parts.Count do
						Result += (", " + Parts[i])
					Result
				)
			/*<ERRHANDLER>*/) catch ""/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn FormatMatrix4 TM = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if No TM then
					TM = (Matrix3 1)
				local	R1 = TM.Row1,
						R2 = TM.Row2,
						R3 = TM.Row3,
						R4 = TM.Row4
				((FormatFloat R1.x) + " " + (FormatFloat R1.y) + " " + (FormatFloat R1.z) + " 0 " + (FormatFloat R2.x) + " " + (FormatFloat R2.y) + " " + (FormatFloat R2.z) + " 0 " + (FormatFloat R3.x) + " " + (FormatFloat R3.y) + " " + (FormatFloat R3.z) + " 0 " + (FormatFloat R4.x) + " " + (FormatFloat R4.y) + " " + (FormatFloat R4.z) + " 1")
			/*<ERRHANDLER>*/) catch "1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1"/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn GetComp4 Val DefaultVal:[0, 0, 0, 0] = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if No Val then
					DefaultVal
				else if (IsKindOf Val Point4) then
					Val
				else if (IsKindOf Val Point3) then
					[Val.x, Val.y, Val.z, DefaultVal.w]
				else if (IsKindOf Val Array) then (
					local	X = (if Val.Count > 0 then Val[1] else DefaultVal.x),
							Y = (if Val.Count > 1 then Val[2] else DefaultVal.y),
							Z = (if Val.Count > 2 then Val[3] else DefaultVal.z),
							W = (if Val.Count > 3 then Val[4] else DefaultVal.w)
					[X, Y, Z, W]
				) else
					(SafeP4 Val)
			/*<ERRHANDLER>*/) catch DefaultVal/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn XMLModelNames = (
			#("DrawableModelsHigh", "DrawableModelsMedium", "DrawableModelsLow", "DrawableModelsVeryLow")
		),
		fn GetChildFloat Node TagName DefaultVal:0.0 = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	Child = (GetChild Node TagName)
				if Have Child then
					(GetAttrFloat Child "value" DefaultVal:DefaultVal)
				else
					DefaultVal
			/*<ERRHANDLER>*/) catch DefaultVal/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn GetChildInt Node TagName DefaultVal:0 = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	Child = (GetChild Node TagName)
				if Have Child then
					(GetAttrInt Child "value" DefaultVal:DefaultVal)
				else
					DefaultVal
			/*<ERRHANDLER>*/) catch DefaultVal/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn ParseFloatList Txt = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if
					No Txt or
					Txt.Count == 0
				then
					#()
				else (
					local	Clean = (SubstituteString Txt "," " "),
							Tokens = (FilterString Clean " \t\r\n"),
							Result = #(),
							Count = 0
					Result.Count = Tokens.Count
					for Tok in Tokens where Tok.Count != 0 do (
						Count += 1
						Result[Count] = (GIMS.Core.ValueOps.TypeCast Tok Float)
					)
					Result.Count = Count
					Result
				)
			/*<ERRHANDLER>*/) catch #()/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn ParseVec3Array Txt = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	Floats = (ParseFloatList Txt),
						VertCount = (Floats.Count / 3),
						Result = #(),
						Src = 1
				Result.Count = VertCount
				for i = 1 to VertCount do (
					Result[i] = [Floats[Src], Floats[Src + 1], Floats[Src + 2]]
					Src += 3
				)
				Result
			/*<ERRHANDLER>*/) catch #()/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn ParseMatrix4 Txt = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	Floats = (ParseFloatList Txt)
				if Floats.Count < 16 then
					(Matrix3 1)
				else (
					local	Row1 = [Floats[1], Floats[2], Floats[3]],
							Row2 = [Floats[5], Floats[6], Floats[7]],
							Row3 = [Floats[9], Floats[10], Floats[11]],
							Row4 = [Floats[13], Floats[14], Floats[15]]
					(Matrix3 Row1 Row2 Row3 Row4)
				)
			/*<ERRHANDLER>*/) catch (Matrix3 1)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn MapBoundType TypeStr = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if No TypeStr then
					undefined
				else (
					case (ToUpper TypeStr) of (
						"BOX":
							#BoundBox
						"BOUNDBOX":
							#BoundBox
						"SPHERE":
							#BoundSphere
						"BOUNDSPHERE":
							#BoundSphere
						"CAPSULE":
							#BoundCapsule
						"BOUNDCAPSULE":
							#BoundCapsule
						"CYLINDER":
							#BoundCylinder
						"BOUNDCYLINDER":
							#BoundCylinder
						"DISC":
							#BoundDisc
						"BOUNDDISC":
							#BoundDisc
						"GEOMETRY":
							#BoundGeometry
						"BOUNDGEOMETRY":
							#BoundGeometry
						"GEOMETRYBVH":
							#BoundBVH
						"BOUNDBVH":
							#BoundBVH
						"COMPOSITE":
							#BoundComposite
						"BOUNDCOMPOSITE":
							#BoundComposite
						"PLANE":
							#BoundPlane
						"BOUNDPLANE":
							#BoundPlane
						default:
							undefined
					)
				)
			/*<ERRHANDLER>*/) catch undefined/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn MapChildFlagName FlagName = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	UpperName = (ToUpper FlagName)
				case UpperName of (
					"FOLIAGE":
						#Foliage
					"GLASS":
						#Glass
					"OBJECT":
						#object
					"RAGDOLL":
						#ragdoll
					"SMOKE":
						#Smoke
					"NONE":
						undefined
					default:
						(GIMS.Core.ValueOps.TypeCast FlagName name)
				)
			/*<ERRHANDLER>*/) catch undefined/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn ParseFlagNames FlagText = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if
					No FlagText or
					FlagText.Count == 0
				then
					#()
				else (
					local	CleanText = (SubstituteString FlagText "," " ")
					(FilterString CleanText " \t")
				)
			/*<ERRHANDLER>*/) catch #()/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn ParseChildFlagBools FlagText KnownFlags = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	Flags = #()
				for i = KnownFlags.Count to 1 by -1 do
					Flags[i] = false
				local	FlagNames = (ParseFlagNames FlagText)
				for FlagName in FlagNames where FlagName.Count != 0 do (
					local	FlagMapped = (MapChildFlagName FlagName)
					if Have FlagMapped then (
						local	FlagID = (FindItem KnownFlags FlagMapped)
						if FlagID != 0 then
							Flags[FlagID] = true
					)
				)
				Flags
			/*<ERRHANDLER>*/) catch #()/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn ParsePolyFlags FlagText KnownFlags = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	PolyFlags = 0,
						FlagNames = (ParseFlagNames FlagText),
						BitSet = Bit.Set
				for FlagName in FlagNames where FlagName.Count != 0 do (
					local	UpperName = (ToUpper FlagName)
					if UpperName != "NONE" then (
						local	FlagMapped = (GIMS.Core.ValueOps.TypeCast FlagName name),
								FlagID = (FindItem KnownFlags FlagMapped)
						if FlagID != 0 then
							PolyFlags = (BitSet PolyFlags FlagID true)
					)
				)
				PolyFlags
			/*<ERRHANDLER>*/) catch 0/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		)
	)
	struct /*#PC*PATH	GIMS.CurrentGame.Core.TypeLibrary.grcBone*/ strBone (
		GIMSObjectLink = "GIMS.CurrentGame.Core.TypeLibrary.grcBone",
		ObjName,
		ID = #NoBoneID,
		MirrorBoneID = #NoMirrorBoneID,
		Flags = #{},
		KnownFlags = #(
			#LIMIT_ROTATION,
			#ROT_X,
			#ROT_Y,
			#ROT_Z,
			#LIMIT_TRANSLATION,
			#TRANS_X,
			#TRANS_Y,
			#TRANS_Z,
			#LIMIT_SCALE,
			#SCALE_X,
			#SCALE_Y,
			#SCALE_Z
		),
		RotationQuaternion,
		LocalOffset,
		TheScale,
		Children = #(),
		
		Index = #NoBoneIndex,
		
		fn GetRAWData RAWData FloatFmtStr = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				Format "%%%%" \
					ID \
					(FormattedPrint RotationQuaternion Format:FloatFmtStr) \
					(FormattedPrint LocalOffset Format:FloatFmtStr) \
					(FormattedPrint TheScale Format:FloatFmtStr) \
					To:RAWData
				for Child in Children do
					Child.GetRAWData RAWData FloatFmtStr
				OK
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn GetBoneIDs BoneIDs = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				BoneIDs[Index] = ID
				for tBone in Children do
					tBone.GetBoneIDs BoneIDs
				OK
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Read ThisObj BufferID LastBoneIndex = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				LastBoneIndex += 1
				Index = LastBoneIndex
				local	tLine,
						BufferMgr = GIMS.Core.BufferMgr,
						ReadVal = BufferMgr.ReadVal,
						Skip = BufferMgr.Skip,
						oFTypeExec = GIMS.Core.StringOps.oFTypeExec,
						grcBone = GIMS.CurrentGame.Core.TypeLibrary.grcBone,
						TypeCast = GIMS.Core.ValueOps.TypeCast
				GIMS.Core.GUIMgr.UpdateProgress #None 0
				local	NotEOF = BufferMgr.NotEOF
				while (tLine = (ReadVal BufferID FilterStr:"\t "))[1] != "}" do ( /* skips end */
					local	Tag = (TypeCast tLine[1] name BufferID:BufferID)
					case Tag of (
						#Bone: (
							ObjName = (tLine[2] as String)
							ID = (TypeCast tLine[3] Integer BufferID:BufferID)
							Skip BufferID 1 /* skip start */
						)
						#Flags: (
							local	FlagText = ""
							for i = 2 to tLine.Count do (
								if FlagText.Count != 0 then
									Append FlagText " "
								Append FlagText (tLine[i] as String)
							)
							GIMS.CurrentGame.Core.TypeLibrary.CWXML.ApplyBoneFlags Flags KnownFlags FlagText ObjName
						)
						#MirrorBoneId:
							MirrorBoneID = (TypeCast tLine[2] Integer BufferID:BufferID)
						#Tag:
							ID = (TypeCast tLine[2] Integer BufferID:BufferID)
						#Index:
							Index = ((TypeCast tLine[2] Integer BufferID:BufferID) + 1)
						#RotationQuaternion:
							RotationQuaternion = (oFTypeExec tLine #Quat IDMask:#{2..5} BufferID:BufferID)
						#Rotation:
							RotationQuaternion = (oFTypeExec tLine #Quat IDMask:#{2..5} BufferID:BufferID)
						#LocalOffset:
							LocalOffset = (oFTypeExec tLine #P3 IDMask:#{2..4} BufferID:BufferID)
						#Translation:
							LocalOffset = (oFTypeExec tLine #P3 IDMask:#{2..4} BufferID:BufferID)
						#Scale:
							TheScale = (oFTypeExec tLine #P3 IDMask:#{2..4} BufferID:BufferID)
						#Children: (
							Skip BufferID 1 /* skip start */
							Children.Count = (TypeCast tLine[2] Integer BufferID:BufferID)
							for ChildID = 1 to Children.Count do (
								local	NewItem = grcBone()
								LastBoneIndex = (NewItem.Read NewItem BufferID LastBoneIndex)
								if LastBoneIndex == false then
									return false;
								Children[ChildID] = NewItem
							)
							Skip BufferID 1 /* skip end */
						)
						#ParentIndex: ()
						#SiblingIndex: ()
						#TransformUnk: ()
						#WorldOffset: ()
						#RotationOri: ()
						default: (
							GIMS.Core.SystemMgr.AddResult #Warning  (
								GIMS.Core.ValueOps.FormatText \
									v1:"Unknown bone tag \"" \
									v2:tLine[1] \
									v3:"\" in object \"" \
									v4:ObjName \
									v5:"\" skipped."
							)
							if
								(NotEOF BufferID) and
								(ReadVal BufferID FilterStr:"\t " NoSeek:true)[1] == "{"
							then (
								Skip BufferID 1
								local	Depth = 1
								while
									(Depth > 0) and
									(NotEOF BufferID)
								do (
									local	SkipLine = (ReadVal BufferID FilterStr:"\t ")
									if SkipLine[1] == "{" then
										Depth += 1
									else (
										if SkipLine[1] == "}" then
											Depth -= 1
									)
								)
							)
						)
					)
				)
				if No RotationQuaternion then
					RotationQuaternion = (Quat 0 0 0 1)
				if No LocalOffset then
					LocalOffset = [0, 0, 0]
				if No TheScale then
					TheScale = [1, 1, 1]
				if MirrorBoneID == #NoMirrorBoneID then
					MirrorBoneID = (
						if ID == #NoBoneID then
							0
						else
							ID
					)
				LastBoneIndex
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Write BufferID TabString = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	BufferMgr = GIMS.Core.BufferMgr,
						WriteVal = BufferMgr.WriteVal,
						ToHighReg = GIMS.Core.StringOps.ToHighReg,
						ValueOps = GIMS.Core.ValueOps,
						AsoFText = ValueOps.AsoFText,
						FormatText = ValueOps.FormatText
				GIMS.Core.GUIMgr.UpdateProgress #None 0
				WriteVal BufferID (
					FormatText \
						v1:TabString \
						v2:"Bone " \
						v3:ObjName \
						v4:" " \
						v5:ID
				)
				WriteVal BufferID (TabString + "{")
				local	SubTabString = (TabString + "\t")
				WriteVal BufferID (
					FormatText \
						v1:SubTabString \
						v2:"MirrorBoneId " \
						v3:MirrorBoneID
				)
				WriteVal BufferID (SubTabString + "Flags")
				for Flag in Flags do
					WriteVal BufferID (" " + (ToHighReg (KnownFlags[Flag] as String))) AppendLast:true
				WriteVal BufferID (AsoFText RotationQuaternion TabString:(SubTabString + "RotationQuaternion "))
				WriteVal BufferID (AsoFText LocalOffset TabString:(SubTabString + "LocalOffset "))
				WriteVal BufferID (AsoFText TheScale TabString:(SubTabString + "Scale "))
				local	ChildrenCount = Children.Count
				if ChildrenCount != 0 then (
					WriteVal BufferID (
						FormatText \
							v1:SubTabString \
							v2:"Children " \
							v3:ChildrenCount
					)
					WriteVal BufferID (SubTabString + "{")
					local	ChildTabString = (SubTabString + "\t")
					for TempBone in Children do
						TempBone.Write BufferID ChildTabString
					WriteVal BufferID (SubTabString + "}")
				)
				WriteVal BufferID (TabString + "}")
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Create ThisObj ParentNode AncestorBoneNodes LastBoneIndex = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	ParentTM = (
							if ParentNode == RootNode then
								(Matrix3 1)
							else
								ParentNode.Transform
						),
						InvParentTM = (Inverse ParentTM),
						Result = (GIMS.Core.ObjectMgr.CreateIfUnique ObjName ParentNode:ParentNode AllowSearch:false NodeType:EGIMS_V_Model_Bone)
				GIMS.Core.GUIMgr.UpdateProgress #None 0
				Result.WireColor = Yellow
				Result.ShowLinks = true
				Result.ShowLinksOnly = true
				Result.Scale = (TheScale * ParentNode.Scale)
				Result.Rotation = (InvParentTM * (RotationQuaternion as Matrix3)).Rotation
				Result.Pos = (LocalOffset * ParentTM)
				Result.InitialTM = (Result.Transform * InvParentTM)
				Result.IsInitialTMSet = true
				GIMS.Core.ValueOps.ConvertStruct Result undefined ParamSource:ThisObj DontCreate:true
				if
					Index == #NoBoneIndex or
					Index < 1
				then (
					LastBoneIndex += 1
					Index = LastBoneIndex
				) else (
					if Index > LastBoneIndex then
						LastBoneIndex = Index
				)
				AncestorBoneNodes[Index] = Result
				for Item in Children do
					LastBoneIndex = (Item.Create Item Result AncestorBoneNodes LastBoneIndex)
				LastBoneIndex
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		)
	)
	struct /*#PC*PATH	GIMS.CurrentGame.Core.TypeLibrary.grcSkeleton*/ strSkeleton (
		GIMSObjectLink = "GIMS.CurrentGame.Core.TypeLibrary.grcSkeleton",
		DiskPath,
		ObjName,
		Extension = ".skel",
		Version = [165, 30],
		DataCRC = -2,
		NumBones = 0,
		TheBones = #(),
		fn GetDataHash ValueOps:unsupplied = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	RAWData = (StringStream ""),
						FloatFmtStr = "0.6f"
				for tBone in TheBones do
					tBone.GetRAWData RAWData FloatFmtStr
				local	Hash
				
				/*STRING HASH*
				Hash = (RAWData as String)
				/**/
				
				/*JENKINS HASH*/
				if not Supplied ValueOps then
					Hash = (GIMS.Core.ValueOps.GetHash (RAWData as String))
				else
					Hash = (ValueOps.GetHash (RAWData as String))
				/**/
				
				Free RAWData
				Hash
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn CountBones tBone = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	Result = 1
				for Child in tBone.Children do
					Result += (CountBones Child)
				Result
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn BuildHierarchyFromFlat FlatBones ParentIndices = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	Roots = #(),
						BoneCount = FlatBones.Count
				for i = 1 to BoneCount do (
					local	tBone = FlatBones[i]
					if Have tBone then (
						tBone.Children = #()
						tBone.Index = i
					)
				)
				for i = 1 to BoneCount do (
					local	tBone = FlatBones[i]
					if Have tBone then (
						local	ParentIndex = ParentIndices[i]
						if
							No ParentIndex or
							ParentIndex < 0
						then
							Append Roots tBone
						else (
							local	ParentBone = FlatBones[ParentIndex + 1]
							if Have ParentBone then
								Append ParentBone.Children tBone
							else
								Append Roots tBone
						)
					)
				)
				TheBones = Roots
				if NumBones == 0 then
					NumBones = BoneCount
				true
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn CollectFlatBones = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	Bones = #(),
						Parents = #(),
						PendingBones = #(),
						PendingParents = #(),
						PendingCount = 0,
						Cursor = 1
				if Have TheBones then (
					for Root in TheBones do (
						PendingCount += 1
						PendingBones[PendingCount] = Root
						PendingParents[PendingCount] = -1
					)
				)
				while Cursor <= PendingCount do (
					local	tBone = PendingBones[Cursor],
							ParentIdx = PendingParents[Cursor]
					Cursor += 1
					if Have tBone then (
						local	Slot = tBone.Index
						if
							No Slot or
							Slot == #NoBoneIndex or
							(not (IsKindOf Slot Integer)) or
							Slot < 1
						then
							Slot = (Bones.Count + 1)
						Bones[Slot] = tBone
						Parents[Slot] = ParentIdx
						local	MyIdx = (Slot - 1)
						if Have tBone.Children then (
							for Child in tBone.Children do (
								PendingCount += 1
								PendingBones[PendingCount] = Child
								PendingParents[PendingCount] = MyIdx
							)
						)
					)
				)
				#(Bones, Parents)
			/*<ERRHANDLER>*/) catch #(#(), #())/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn SyncBoneSceneTransforms tBone BoneNodes ExportRoot XMLApi = (
			try (
				local SceneBone = undefined
				for Obj in BoneNodes while No SceneBone do (
					if (Obj.Name as String) == (tBone.ObjName as String) then
						SceneBone = Obj
				)
				if Have SceneBone then (
					local XForm = (XMLApi.BoneLocalXForm SceneBone ExportRoot)
					tBone.LocalOffset = XForm[1]
					tBone.RotationQuaternion = XForm[2]
					tBone.TheScale = XForm[3]
				)
				for Child in tBone.Children do
					SyncBoneSceneTransforms Child BoneNodes ExportRoot XMLApi
				true
			) catch false
		),
		fn SyncSceneTransforms RootNode = (
			/* Copy the current Max scene pose back to this data skeleton.  XML export
			   normally merges into the source YFT, so keeping this structure current
			   also makes direct skeleton writes and the merge path agree. */
			try (
				local	CWXML = GIMS.CurrentGame.Core.TypeLibrary.CWXML,
						SceneBones = #(),
						Kids = #(),
						Cursor = 1
				if Have RootNode then (
					Append Kids RootNode
					while Cursor <= Kids.Count do (
						local Obj = Kids[Cursor]
						Cursor += 1
						if (CWXML.IsSceneBone Obj) then
							Append SceneBones Obj
						try (for Child in Obj.Children do Append Kids Child) catch ()
					)
				)
				if SceneBones.Count == 0 then (
					for Obj in Objects where (CWXML.IsSceneBone Obj) do
						Append SceneBones Obj
				)
				for tBone in TheBones do
					SyncBoneSceneTransforms tBone SceneBones RootNode CWXML
				true
			) catch false
		),
		fn WriteCodeWalkerXML SS Tab = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	CWXML = GIMS.CurrentGame.Core.TypeLibrary.CWXML,
						Flat = (CollectFlatBones()),
						Bones = Flat[1],
						Parents = Flat[2],
						Inner = (Tab + " "),
						Inner2 = (Inner + " "),
						Inner3 = (Inner2 + " ")
				Format "%" (Tab + "<Skeleton>\n") To:SS
				Format "%" (CWXML.ValueTag Inner "Unknown58" DataCRC) To:SS
				Format "%" (Inner + "<Bones>\n") To:SS
				for i = 1 to Bones.Count do (
					local	tBone = Bones[i]
					if Have tBone then (
						local	ParentIdx = Parents[i],
								SiblingIdx = -1,
								BoneTag = tBone.ID,
								BoneRot = tBone.RotationQuaternion,
								BoneOffset = tBone.LocalOffset,
								BoneScale = tBone.TheScale
						if No ParentIdx then
							ParentIdx = -1
						if
							No BoneTag or
							BoneTag == #NoBoneID
						then
							BoneTag = 0
						if No BoneOffset then
							BoneOffset = [0, 0, 0]
						if No BoneScale then
							BoneScale = [1, 1, 1]
						for j = (i + 1) to Bones.Count while SiblingIdx == -1 do (
							if
								Have Bones[j] and
								Parents[j] == ParentIdx
							then
								SiblingIdx = (j - 1)
						)
						Format "%" (Inner2 + "<Item>\n") To:SS
						Format "%" (Inner3 + "<Name>" + (CWXML.XMLEscape tBone.ObjName) + "</Name>\n") To:SS
						Format "%" (CWXML.ValueTag Inner3 "Tag" BoneTag) To:SS
						Format "%" (CWXML.ValueTag Inner3 "Index" (i - 1)) To:SS
						Format "%" (CWXML.ValueTag Inner3 "ParentIndex" ParentIdx) To:SS
						Format "%" (CWXML.ValueTag Inner3 "SiblingIndex" SiblingIdx) To:SS
						Format "%" (Inner3 + "<Flags>" + (CWXML.FormatBoneFlags tBone.Flags tBone.KnownFlags) + "</Flags>\n") To:SS
						Format "%" (CWXML.Vec3Tag Inner3 "Translation" BoneOffset) To:SS
						Format "%" (Inner3 + "<Rotation " + (CWXML.QuatAttrs BoneRot) + " />\n") To:SS
						Format "%" (CWXML.Vec3Tag Inner3 "Scale" BoneScale) To:SS
						Format "%" (Inner3 + "<TransformUnk x=\"0\" y=\"4\" z=\"-3\" w=\"0\" />\n") To:SS
						Format "%" (Inner2 + "</Item>\n") To:SS
					)
				)
				Format "%" (Inner + "</Bones>\n") To:SS
				Format "%" (Tab + "</Skeleton>\n") To:SS
				OK
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn ReadCodeWalkerFromNode SkelNode = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if No SkelNode then
					return false
				local	CWXML = GIMS.CurrentGame.Core.TypeLibrary.CWXML,
						Unknown58 = (CWXML.GetChild SkelNode "Unknown58")
				if Have Unknown58 then
					DataCRC = (CWXML.GetAttrInt Unknown58 "value" DefaultVal:DataCRC)
				local	BoneNodes = (SkelNode.SelectNodes "Bones/Item"),
						BoneCount = BoneNodes.Count,
						grcBone = GIMS.CurrentGame.Core.TypeLibrary.grcBone,
						FlatBones = #(),
						ParentIndices = #()
				if BoneCount == 0 then
					return false
				FlatBones.Count = BoneCount
				ParentIndices.Count = BoneCount
				for i = 0 to (BoneCount - 1) do (
					local	BoneNode = (BoneNodes.Item[i]),
							NewBone = (grcBone()),
							BoneName = (CWXML.GetChildText BoneNode "Name" DefaultVal:("Bone_" + ((i + 1) as String))),
							TagValue = 0,
							IndexValue = (i + 1),
							ParentIndex = -1,
							TagNode = (CWXML.GetChild BoneNode "Tag"),
							IndexNode = (CWXML.GetChild BoneNode "Index"),
							ParentXML = (CWXML.GetChild BoneNode "ParentIndex")
					if Have TagNode then
						TagValue = (CWXML.GetAttrInt TagNode "value")
					if Have IndexNode then
						IndexValue = ((CWXML.GetAttrInt IndexNode "value") + 1)
					if Have ParentXML then
						ParentIndex = (CWXML.GetAttrInt ParentXML "value" DefaultVal:-1)
					NewBone.ObjName = BoneName
					NewBone.ID = TagValue
					NewBone.MirrorBoneID = TagValue
					NewBone.Index = IndexValue
					NewBone.RotationQuaternion = (CWXML.GetQuat BoneNode "Rotation")
					NewBone.LocalOffset = (CWXML.GetVec3 BoneNode "Translation")
					NewBone.TheScale = (CWXML.GetVec3 BoneNode "Scale" DefaultVal:[1, 1, 1])
					CWXML.ApplyBoneFlags NewBone.Flags NewBone.KnownFlags (CWXML.GetChildText BoneNode "Flags") BoneName
					local	Slot = IndexValue
					if
						Slot < 1 or
						Slot > BoneCount
					then
						Slot = (i + 1)
					FlatBones[Slot] = NewBone
					ParentIndices[Slot] = ParentIndex
				)
				BuildHierarchyFromFlat FlatBones ParentIndices
				if NumBones == 0 then (
					NumBones = 0
					for tBone in TheBones do
						NumBones += (CountBones tBone)
				)
				true
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn ReadCodeWalkerXML FilePath = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	CWXML = GIMS.CurrentGame.Core.TypeLibrary.CWXML,
						XMLDoc = (CWXML.LoadDocument FilePath)
				if No XMLDoc then
					return false
				local	Root = XMLDoc.DocumentElement,
						DrawableNode = (CWXML.GetDrawableNode Root),
						SkelNode = undefined
				if Have DrawableNode then
					SkelNode = (CWXML.GetChild DrawableNode "Skeleton")
				if No SkelNode then
					SkelNode = (Root.SelectSingleNode ".//Skeleton")
				(ReadCodeWalkerFromNode SkelNode)
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#FilePath), #(FilePath)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn FindAndReadExternal DiskPath ObjName ExcludeObjName:unsupplied = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	FormatText = GIMS.Core.ValueOps.FormatText,
						grcSkeleton = GIMS.CurrentGame.Core.TypeLibrary.grcSkeleton,
						Candidates = #(),
						Tried = #()
				Append Candidates (FormatText v1:DiskPath v2:ObjName v3:" FULL.skel")
				Append Candidates (FormatText v1:DiskPath v2:ObjName v3:".yft.xml")
				Append Candidates (FormatText v1:DiskPath v2:ObjName v3:".ydr.xml")
				local	YftFiles = (GetFiles (DiskPath + "*.yft.xml")),
						SkelFiles = (GetFiles (DiskPath + "*.skel"))
				if Have YftFiles then (
					for F in YftFiles do
						Append Candidates F
				)
				if Have SkelFiles then (
					for F in SkelFiles do (
						local	FName = (GetFileNameFile F),
								SkipIt = (FName == ObjName)
						if
							not SkipIt and
							Supplied ExcludeObjName and
							(FName == ExcludeObjName)
						then
							SkipIt = true
						if
							not SkipIt and
							(MatchPattern FName Pattern:"* FULL")
						then
							InsertItem F Candidates 1
						else (
							if not SkipIt then
								Append Candidates F
						)
					)
				)
				for F in Candidates where
					(DoesFileExist F) and
					(FindItem Tried F) == 0
				do (
					Append Tried F
					local	Skel = (
								grcSkeleton \
									DiskPath:(GetFileNamePath F) \
									ObjName:(GetFileNameFile F) \
									Extension:(GetFileNameType F)
							)
					if (Skel.Read()) then (
						if
							Skel.NumBones > 0 or
							Skel.TheBones.Count > 0
						then
							return Skel
					)
				)
				unsupplied
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#DiskPath, #ObjName), #(DiskPath, ObjName)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Read = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	ValueOps = GIMS.Core.ValueOps,
						FilePath = (
							ValueOps.FormatText \
								v1:DiskPath \
								v2:ObjName \
								v3:Extension
						)
				if not (DoesFileExist FilePath) then
					return false
				if (GIMS.CurrentGame.Core.TypeLibrary.CWXML.IsXMLFile FilePath) then
					return (ReadCodeWalkerXML FilePath)
				local	tLine,
						BufferMgr = GIMS.Core.BufferMgr,
						ReadVal = BufferMgr.ReadVal,
						Skip = BufferMgr.Skip,
						oFTypeExec = GIMS.Core.StringOps.oFTypeExec,
						TypeCast = ValueOps.TypeCast,
						\
						grcBone = GIMS.CurrentGame.Core.TypeLibrary.grcBone,
						BufferID = (BufferMgr.ReadFile FilePath Mode:#TxtLines),
						NotEOF = BufferMgr.NotEOF,
						LastBoneIndex = 0
				if BufferID == false then
					return false;
				while
					(NotEOF BufferID) and
					(tLine = (ReadVal BufferID FilterStr:"\t "))[1] != "}"
				do ( /* skips end */
					local	Tag = (TypeCast tLine[1] name BufferID:BufferID)
					case Tag of (
						#Version: (
							if (oFTypeExec tLine #P2 IDMask:#{2, 3} BufferID:BufferID) != Version then (
								GIMS.Core.SystemMgr.AddResult #Warning  (
									ValueOps.FormatText \
										v1:"Skeleton \"" \
										v2:DiskPath \
										v3:ObjName \
										v4:Extension \
										v5:"\" uses version " \
										v6:tLine[2] \
										v7:" " \
										v8:tLine[3] \
										v9:", expected " \
										v10:(Version as String) \
										v11:". Importing anyway."
								)
							)
							if
								(NotEOF BufferID) and
								(ReadVal BufferID FilterStr:"\t " NoSeek:true)[1] == "{"
							then
								Skip BufferID 1 /* skip start */
						)
						#DataCRC:
							DataCRC = (TypeCast (tLine[2] + "L") Integer64 BufferID:BufferID)
						#Unknown58:
							DataCRC = (TypeCast (tLine[2] + "L") Integer64 BufferID:BufferID)
						#NumBones:
							NumBones = (TypeCast tLine[2] Integer BufferID:BufferID)
						#Unknown1C: ()
						#Unknown50: ()
						#Unknown54: ()
						#Bone: (
							Skip BufferID -1 /* return to start */
							local	NewItem = (grcBone())
							LastBoneIndex = (NewItem.Read NewItem BufferID LastBoneIndex)
							if LastBoneIndex == false then
								return false;
							Append TheBones NewItem
						)
						default: (
							GIMS.Core.SystemMgr.AddResult #Warning  (
								ValueOps.FormatText \
									v1:"Unknown skeleton tag \"" \
									v2:tLine[1] \
									v3:"\" in \"" \
									v4:ObjName \
									v5:Extension \
									v6:"\" skipped."
							)
							if
								(NotEOF BufferID) and
								(ReadVal BufferID FilterStr:"\t " NoSeek:true)[1] == "{"
							then (
								Skip BufferID 1
								local	Depth = 1
								while
									(Depth > 0) and
									(NotEOF BufferID)
								do (
									local	SkipLine = (ReadVal BufferID FilterStr:"\t ")
									if SkipLine[1] == "{" then
										Depth += 1
									else (
										if SkipLine[1] == "}" then
											Depth -= 1
									)
								)
							)
						)
					)
				)
				BufferMgr.ClearBuffer BufferID
				if
					NumBones == 0 and
					TheBones.Count != 0
				then (
					for tBone in TheBones do
						NumBones += (CountBones tBone)
				)
				true
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Write = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	BufferMgr = GIMS.Core.BufferMgr,
						WriteVal = BufferMgr.WriteVal,
						ValueOps = GIMS.Core.ValueOps,
						FormatText = ValueOps.FormatText,
						AsoFText = ValueOps.AsoFText,
						FilePath = (
							FormatText \
								v1:DiskPath \
								v2:ObjName \
								v3:Extension
						),
						BufferID = (BufferMgr.Create Mode:#TxtLines FilePath:FilePath),
						TabString = "\t"
				if BufferID != false then (
					WriteVal BufferID (AsoFText Version TypeHook:Integer TabString:"Version ")
					WriteVal BufferID "{"
					if DataCRC == -1 then
						WriteVal BufferID (TabString + "DataCRC -1")
					else (
						if DataCRC == -2 then
							DataCRC = (GetDataHash ValueOps:ValueOps)
						WriteVal BufferID (FormatText v1:TabString v2:"DataCRC " v3:(FormattedPrint DataCRC Format:"u"))
					)
					WriteVal BufferID (
						FormatText \
							v1:TabString \
							v2:"NumBones " \
							v3:NumBones \
					)
					for TheBone in TheBones do
						TheBone.Write BufferID TabString
					WriteVal BufferID "}"
					BufferMgr.WriteFile BufferID FilePath:FilePath
					BufferMgr.ClearBuffer BufferID
				) else
					EGIMS_EHAbort ("Can't write file " + (TempFilePath as String))
				OK
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn GetBoneIDs = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	BoneIDs = #()
				BoneIDs.Count = NumBones
				for tBone in TheBones do
					tBone.GetBoneIDs BoneIDs
				BoneIDs
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn BuildBoneIndexMap BoneIndexMap TheSkeleton_FULL = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	Result = true,
						BoneIDs = (GetBoneIDs())
						FULLBoneIDs = (TheSkeleton_FULL.GetBoneIDs())
				for Index = 1 to NumBones while Result do (
					local	BoneID = BoneIDs[Index],
							FULLBoneIndex = (FindItem FULLBoneIDs BoneID)
					if FULLBoneIndex == 0 then (
						GIMS.Core.SystemMgr.AddResult #Error  (
							GIMS.Core.ValueOps.FormatText \
								v1:"Can't find a bone with ID " \
								v2:BoneID \
								v3:" in file \"" \
								v4:TheSkeleton_FULL.ObjName \
								v5:"\".\nMay be, you've supplied wrong skeleton file."
						)
						Result = false
					) else
						BoneIndexMap[Index] = FULLBoneIndex
				)
				Result
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Create ParentNode AncestorBoneNodes = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local 	LastBoneIndex = 0
				for tBone in TheBones do
					LastBoneIndex = (tBone.Create tBone ParentNode AncestorBoneNodes LastBoneIndex)
				OK
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		)
	)
	struct /*#PC*PATH	GIMS.CurrentGame.Core.TypeLibrary.grcLight*/ strLight (
		GIMSObjectLink = "GIMS.CurrentGame.Core.TypeLibrary.grcLight",
		Position = [0, 0, 0],
		TheColor = White,
		Flashiness = 0,
		Intensity = 1,
		Flags = #{},
		BoneTag = 0,
		GroupId = 0,
		LightType = 1,
		TimeFlags = #{},
		Falloff = 3.5,
		FalloffExponent = 32,
		CullingPlane = #(0, 0, 1, 10),
		ShadowBlur = 0,
		VolumeIntensity = 1,
		VolumeSizeScale = 1,
		VolumeOuterColor = White,
		LightHash = 0,	--0..255
		VolumeOuterIntensity = 1,
		CoronaSize = 1,
		VolumeOuterExponent = 1,
		LightFadeDistance = 0,
		ShadowFadeDistance = 0,
		SpecularFadeDistance = 0,
		VolumetricFadeDistance = 0,
		ShadowNearClip = 0.01,
		CoronaIntensity = 1,
		CoronaZBias = 0.1,
		Direction = [0, 0, -1],
		Tangent = [-1, 0, 0],
		ConeInnerAngle = 0,
		ConeOuterAngle = 0,
		Extents = [1, 1, 1],
		ProjectedTextureHash = 0L,
		fn Read BufferID = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	tLine,
						BufferMgr = GIMS.Core.BufferMgr,
						ReadVal = BufferMgr.ReadVal,
						oFTypeExec = GIMS.Core.StringOps.oFTypeExec,
						ValueOps = GIMS.Core.ValueOps,
						TypeCast = ValueOps.TypeCast,
						AsBitArray = ValueOps.AsBitArray
				while (tLine = (ReadVal BufferID FilterStr:"\t "))[1] != "}" do ( /* skips end */
					local	Tag = (TypeCast tLine[1] name BufferID:BufferID)
					case Tag of (
						#Position:
							Position = (oFTypeExec tLine #P3 IDMask:#{2..4} BufferID:BufferID)
						#Color:
							TheColor = (oFTypeExec tLine #Color IDMask:#{2..4} BufferID:BufferID)
						#Flashiness:		--0,
							Flashiness = (TypeCast tLine[2] Integer BufferID:BufferID)
						#Intensity:		--1,
							Intensity = (TypeCast tLine[2] Float BufferID:BufferID)
						#Flags:		--0L,
							Flags = (AsBitArray (TypeCast (Append tLine[2] "L") Integer BufferID:BufferID))
						#BoneTag:		--0,
							BoneTag = (TypeCast tLine[2] Integer BufferID:BufferID)
						#LightType: (		--1,
							LightType = (TypeCast tLine[2] Integer BufferID:BufferID)
							if (
								LightType != 1 and
								LightType != 2 and
								LightType != 4
							) then
								throw "Unknown light type: " LightType
						)
						#GroupId:		--0,
							GroupId = (TypeCast tLine[2] Integer BufferID:BufferID)
						#TimeFlags:		--0L,
							TimeFlags = (AsBitArray (TypeCast (Append tLine[2] "L") Integer BufferID:BufferID))
						#Falloff:		--3.5,
							Falloff = (TypeCast tLine[2] Float BufferID:BufferID)
						#FalloffExponent:		--32,
							FalloffExponent = (TypeCast tLine[2] Float BufferID:BufferID)
						#CullingPlane:		--[0, 0, 1, 3.5],
							CullingPlane = (oFTypeExec tLine #FloatArray IDMask:#{2..5} BufferID:BufferID)
						#ShadowBlur:		--0,
							ShadowBlur = (TypeCast tLine[2] Integer BufferID:BufferID)
						#VolumeIntensity:		--1,
							VolumeIntensity = (TypeCast tLine[2] Float BufferID:BufferID)
						#VolumeSizeScale:		--1,
							VolumeSizeScale = (TypeCast tLine[2] Float BufferID:BufferID)
						#VolumeOuterColor:		--White,
							VolumeOuterColor = (oFTypeExec tLine #Color IDMask:#{2..4} BufferID:BufferID)
						#LightHash:		--0,
							LightHash = (TypeCast tLine[2] Integer BufferID:BufferID)
						#VolumeOuterIntensity:		--1,
							VolumeOuterIntensity = (TypeCast tLine[2] Float BufferID:BufferID)
						#CoronaSize:		--1,
							CoronaSize = (TypeCast tLine[2] Float BufferID:BufferID)
						#VolumeOuterExponent:		--1,
							VolumeOuterExponent = (TypeCast tLine[2] Float BufferID:BufferID)
						#LightFadeDistance:		--0,
							LightFadeDistance = (TypeCast tLine[2] Integer BufferID:BufferID)
						#ShadowFadeDistance:		--0,
							ShadowFadeDistance = (TypeCast tLine[2] Integer BufferID:BufferID)
						#SpecularFadeDistance:		--0,
							SpecularFadeDistance = (TypeCast tLine[2] Integer BufferID:BufferID)
						#VolumetricFadeDistance:		--0,
							VolumetricFadeDistance = (TypeCast tLine[2] Integer BufferID:BufferID)
						#ShadowNearClip:		--0.01,
							ShadowNearClip = (TypeCast tLine[2] Float BufferID:BufferID)
						#CoronaIntensity:		--1,
							CoronaIntensity = (TypeCast tLine[2] Float BufferID:BufferID)
						#CoronaZBias:		--0.1,
							CoronaZBias = (TypeCast tLine[2] Float BufferID:BufferID)
						#Direction:		--[0, 0, -1],
							Direction = (oFTypeExec tLine #P3 IDMask:#{2..4} BufferID:BufferID)
						#Tangent:		--[-1, 0, 0],
							Tangent = (oFTypeExec tLine #P3 IDMask:#{2..4} BufferID:BufferID)
						#ConeInnerAngle:		--0,
							ConeInnerAngle = (TypeCast tLine[2] Float BufferID:BufferID)
						#ConeOuterAngle:		--0,
							ConeOuterAngle = (TypeCast tLine[2] Float BufferID:BufferID)
						#Extents:		--[1, 1, 1],
							Extents = (oFTypeExec tLine #P3 IDMask:#{2..4} BufferID:BufferID)
						#ProjectedTextureHash:
							ProjectedTextureHash = (TypeCast (Append tLine[2] "L") Integer BufferID:BufferID)
						default:
							EGIMS_EHAbort "Unknown strLight tag: " Param1:tLine[1] BufferID:BufferID
					)
				)
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Write BufferID TabString = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	BufferMgr = GIMS.Core.BufferMgr,
						WriteVal = BufferMgr.WriteVal,
						ValueOps = GIMS.Core.ValueOps,
						CopyBits = ValueOps.CopyBits,
						AsoFText = ValueOps.AsoFText,
						FormatText = ValueOps.FormatText,
						BitArrayAsValue = GIMS.Core.ArrayOps.BitArrayAsValue,
						SubTabString = (TabString + "\t"),
						dwFmt = "u"
				GIMS.Core.GUIMgr.UpdateProgress #None 0
				WriteVal BufferID (TabString + "Attribute")
				WriteVal BufferID (TabString + "{")
				WriteVal BufferID (AsoFText Position TabString:(SubTabString + "Position "))
				WriteVal BufferID (AsoFText TheColor TabString:(SubTabString + "Color ") WithAlpha:false)
				WriteVal BufferID (FormatText v1:SubTabString v2:"Flashiness " v3:Flashiness)
				WriteVal BufferID (FormatText v1:SubTabString v2:"Intensity " v3:Intensity)
				WriteVal BufferID (FormatText v1:SubTabString v2:"Flags " v3:(FormattedPrint (BitArrayAsValue Flags Range:#{1..32}) Format:dwFmt))
				WriteVal BufferID (FormatText v1:SubTabString v2:"BoneTag " v3:BoneTag)
				WriteVal BufferID (FormatText v1:SubTabString v2:"LightType " v3:LightType)
				WriteVal BufferID (FormatText v1:SubTabString v2:"GroupId " v3:GroupId)
				WriteVal BufferID (FormatText v1:SubTabString v2:"TimeFlags " v3:(FormattedPrint (BitArrayAsValue TimeFlags Range:#{1..32}) Format:dwFmt))
				WriteVal BufferID (FormatText v1:SubTabString v2:"Falloff " v3:Falloff)
				WriteVal BufferID (FormatText v1:SubTabString v2:"FalloffExponent " v3:FalloffExponent)
				WriteVal BufferID (AsoFText CullingPlane TabString:(SubTabString + "CullingPlane "))
				WriteVal BufferID (FormatText v1:SubTabString v2:"ShadowBlur " v3:ShadowBlur)
				WriteVal BufferID (FormatText v1:SubTabString v2:"VolumeIntensity " v3:VolumeIntensity)
				WriteVal BufferID (FormatText v1:SubTabString v2:"VolumeSizeScale " v3:VolumeSizeScale)
				WriteVal BufferID (AsoFText VolumeOuterColor TabString:(SubTabString + "VolumeOuterColor ") WithAlpha:false)
				WriteVal BufferID (FormatText v1:SubTabString v2:"LightHash " v3:LightHash)
				WriteVal BufferID (FormatText v1:SubTabString v2:"VolumeOuterIntensity " v3:VolumeOuterIntensity)
				WriteVal BufferID (FormatText v1:SubTabString v2:"CoronaSize " v3:CoronaSize)
				WriteVal BufferID (FormatText v1:SubTabString v2:"VolumeOuterExponent " v3:VolumeOuterExponent)
				WriteVal BufferID (FormatText v1:SubTabString v2:"LightFadeDistance " v3:LightFadeDistance)
				WriteVal BufferID (FormatText v1:SubTabString v2:"ShadowFadeDistance " v3:ShadowFadeDistance)
				WriteVal BufferID (FormatText v1:SubTabString v2:"SpecularFadeDistance " v3:SpecularFadeDistance)
				WriteVal BufferID (FormatText v1:SubTabString v2:"VolumetricFadeDistance " v3:VolumetricFadeDistance)
				WriteVal BufferID (FormatText v1:SubTabString v2:"ShadowNearClip " v3:ShadowNearClip)
				WriteVal BufferID (FormatText v1:SubTabString v2:"CoronaIntensity " v3:CoronaIntensity)
				WriteVal BufferID (FormatText v1:SubTabString v2:"CoronaZBias " v3:CoronaZBias)
				WriteVal BufferID (AsoFText Direction TabString:(SubTabString + "Direction "))
				WriteVal BufferID (AsoFText Tangent TabString:(SubTabString + "Tangent "))
				WriteVal BufferID (FormatText v1:SubTabString v2:"ConeInnerAngle " v3:ConeInnerAngle)
				WriteVal BufferID (FormatText v1:SubTabString v2:"ConeOuterAngle " v3:ConeOuterAngle)
				WriteVal BufferID (AsoFText Extents TabString:(SubTabString + "Extents "))
				WriteVal BufferID (FormatText v1:SubTabString v2:"ProjectedTextureHash " v3:ProjectedTextureHash)
				WriteVal BufferID (TabString + "}")
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Create ThisObj BoneNodes = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	ParentNode = undefined
				GIMS.Core.GUIMgr.UpdateProgress #None 0
				for tBone in BoneNodes while No ParentNode where
					not (IsKindOf tBone EGIMS_V_Model) and
					not (IsKindOf tBone.Modifiers[#Model] EGIMS_V_Model_ModelMod) and
					tBone.ID == BoneTag
				do
					ParentNode = tBone
				if No ParentNode then (
					/*if BoneTag != 0 then (
						GIMS.Core.SystemMgr.AddResult #Error  (
							ValueOps.FormatText \
								v1:"Light link error in object \"" \
								v2:ObjName \
								v3:"\" - no bone with tag " \
								v4:BoneTag
						)
					) else*/
						ParentNode = BoneNodes[1]
				)
				local	ParentTM = (
							if ParentNode == RootNode then
								(Matrix3 1)
							else
								ParentNode.Transform
						),
						ParentRotation = ParentTM.Rotation,
						Result = (GIMS.Core.ObjectMgr.CreateIfUnique (LightHash as String) ParentNode:ParentNode AllowSearch:false NodeType:EGIMS_V_Model_Light),
						ValueOps = GIMS.Core.ValueOps,
						TypeCast = ValueOps.TypeCast,
						Pos = (Position * ParentTM),
						Dir = ((Normalize (-Direction)) * ParentRotation),
						DirMtx = (MatrixFromNormal Dir),
						CPVec = ((Normalize [CullingPlane[1], CullingPlane[2], CullingPlane[3]]) * ParentRotation),
						--CPMtx = ((MatrixFromNormal CPVec) * (Inverse DirMtx)),
						CPMtx = (MatrixFromNormal CPVec),
						CPAngles = (TypeCast (CPMtx.Rotation as EulerAngles) #Array),
						
						TngVec = ((Normalize (Tangent)) * ParentRotation),
						TngMtx = (MatrixFromNormal TngVec),
						TngAngles = (TypeCast (TngMtx.Rotation as EulerAngles) #Array)
						
				ValueOps.ConvertStruct Result undefined ParamSource:ThisObj DontCreate:true
				/*Result.Pos = Pos
				Result.Dir = Dir*/
				Result.Transform = (matrix3 DirMtx[1] DirMtx[2] DirMtx[3] Pos)
				Result.TheExtents = Extents[1]
				Result.TheDistance = LightFadeDistance
				Result.GenerateName = false
				Result.ProjectedTextureName = (GIMS.Core.ArrayOps.FetchMHL GIMS.CurrentGame.Core.DB.TextureNames ProjectedTextureHash)
				Result.ProjTexHash = (formattedPrint ProjectedTextureHash format:"u")		
				Result.Type = (
					case LightType of (
						1:
							1
						2:
							2
						4:
							3
						default:
							throw "Unknown light type: " LightType
					)
				)
				Result.CustomCullingPlane = true
				Result.CPDistance = CullingPlane[4]
				Result.CPAngles = CPAngles

				Result.CustomTng = true
				Result.TngAngles = TngAngles
				/*
				local	ResultCPAngles = Result.CPAngles
				for i = 1 to ResultCPAngles.Count do
					ResultCPAngles[i] = (CPAngles[i] + 180)
				*/
				OK
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		)
	)
	struct /*#PC*PATH	GIMS.CurrentGame.Core.TypeLibrary.grcLightAttributes*/ strLightAttributes (
		GIMSObjectLink = "GIMS.CurrentGame.Core.TypeLibrary.grcLightAttributes",
		DiskPath,
		ObjName,
		Extension = ".light",
		Version = [165, 30],
		Items = #(),
		fn Read = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	tLine,
						BufferMgr = GIMS.Core.BufferMgr,
						ReadVal = BufferMgr.ReadVal,
						Skip = BufferMgr.Skip,
						oFTypeExec = GIMS.Core.StringOps.oFTypeExec,
						ValueOps = GIMS.Core.ValueOps,
						TypeCast = ValueOps.TypeCast,
						grcLight = GIMS.CurrentGame.Core.TypeLibrary.grcLight,
						BufferID = (
							BufferMgr.ReadFile (
								ValueOps.FormatText \
									v1:DiskPath \
									v2:ObjName \
									v3:Extension
							) Mode:#TxtLines
						),
						NotEOF = BufferMgr.NotEOF,
						ItemCount = 0
				Items.Count = 10
				if BufferID == false then
					return false;
				while
					(NotEOF BufferID) and
					(tLine = (ReadVal BufferID FilterStr:"\t "))[1] != "}"
				do ( /* skips end */
					local	Tag = (TypeCast tLine[1] name BufferID:BufferID)
					case Tag of (
						#Version: (
							if (oFTypeExec tLine #P2 IDMask:#{2, 3} BufferID:BufferID) != Version then (
								GIMS.Core.SystemMgr.AddResult #Error  (
									FormatText \
										v1:"Wrong version resource \"" \
										v2:DiskPath \
										v3:ObjName \
										v4:Extension \
										v5:"\""
								)
								return false;
							)
							Skip BufferID 1 /* skip start */
						)
						#Attribute: (
							Skip BufferID 1 /* skip start */
							local	NewItem = (grcLight())
							NewItem.Read BufferID /* skips end */
							ItemCount += 1
							Items[ItemCount] = NewItem
						)
						default:
							EGIMS_EHAbort "Unknown strLightAttributes tag: " Param1:tLine[1] BufferID:BufferID
					)
				)
				Items.Count = ItemCount
				BufferMgr.ClearBuffer BufferID
				true
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Write = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	BufferMgr = GIMS.Core.BufferMgr,
						WriteVal = BufferMgr.WriteVal,
						ValueOps = GIMS.Core.ValueOps,
						AsoFText = ValueOps.AsoFText,
						FilePath = (
							ValueOps.FormatText \
								v1:DiskPath \
								v2:ObjName \
								v3:Extension
						),
						BufferID = (BufferMgr.Create Mode:#TxtLines FilePath:FilePath),
						TabString = "\t"
				if BufferID != false then (
					WriteVal BufferID (AsoFText Version TypeHook:Integer TabString:"Version ")
					WriteVal BufferID "{"
					for Item in Items do
						Item.Write BufferID TabString
					WriteVal BufferID "}"
					BufferMgr.WriteFile BufferID FilePath:FilePath
					BufferMgr.ClearBuffer BufferID
				) else
					EGIMS_EHAbort ("Can't write file " + (TempFilePath as String))
				OK
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Create BoneNodes = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				for Item in Items do
					Item.Create Item BoneNodes
				OK
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		)
	)
	struct /*#PC*PATH	GIMS.CurrentGame.Core.TypeLibrary.grcTexture*/ strTexture (
		GIMSObjectLink = "GIMS.CurrentGame.Core.TypeLibrary.grcTexture",
		DiskPath,
		ObjName,
		Extension = ".otx",
		Version = [13, 30],
		TexturePath = "",
		TypeID = 1,
		PixelFormatID = 1,
		UsageID = 1,
		UsageFlags = #{},
		ExtraFlags = 0,
		
		TypeStrings = #(
			"Regular",
			"Cube",
			"Volume"
		),
		TypeNames = #(
			#Regular,
			#Cube,
			#Volume
		),
		PixelFormatStrings = #(
			"DXT5",
			"DXT3",
			"DXT1",
			"A8R8G8B8",
			"ATI2",
			"ATI1"
		),
		PixelFormatNames = #(
			#DXT5,
			#DXT3,
			#DXT1,
			#A8R8G8B8,
			#ATI2,
			#ATI1
		),
		KnownUsages = #(
			#UNKNOWN,
			#DEFAULT,
			#TERRAIN,
			#CLOUDDENSITY,
			#CLOUDNORMAL,
			#CABLE,
			#FENCE,
			#ENVEFF,
			#SCRIPT,
			#WATERFLOW,
			#WATERFOAM,
			#WATERFOG,
			#WATEROCEAN,
			#WATER,
			#FOAMOPACITY,
			#FOAM,
			#DIFFUSEMIPSHARPEN,
			#DIFFUSEDETAIL,
			#DIFFUSEDARK,
			#DIFFUSEALPHAOPAQUE,
			#DIFFUSE,
			#DETAIL,
			#NORMAL,
			#SPECULAR,
			#EMISSIVE,
			#TINTPALETTE,
			#SKIPPROCESSING,
			#DONOTOPTIMIZE,
			#TEST,
			#COUNT
		),
		KnownUsageFlags = #(
			#NOT_HALF,
			#HD_SPLIT,
			#FLAG_FULL,
			#MAPS_HALF
		),
		fn Read = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	tLine,
						BufferMgr = GIMS.Core.BufferMgr,
						ReadVal = BufferMgr.ReadVal,
						Skip = BufferMgr.Skip,
						oFTypeExec = GIMS.Core.StringOps.oFTypeExec,
						ValueOps = GIMS.Core.ValueOps,
						TypeCast = ValueOps.TypeCast,
						GetProgress = BufferMgr.GetProgress,
						FormatText = ValueOps.FormatText,
						BufferID = (
							BufferMgr.ReadFile (
								FormatText \
									v1:DiskPath \
									v2:ObjName \
									v3:Extension
							) Mode:#TxtLines
						),
						NotEOF = BufferMgr.NotEOF
				if BufferID == false then
					return false;
				while
					(NotEOF BufferID) and
					(tLine = (ReadVal BufferID FilterStr:"\t "))[1] != "}"
				do ( /* skips end */
					local	Tag = (TypeCast tLine[1] name BufferID:BufferID)
					case Tag of (
						#Version: (
							if (oFTypeExec tLine #P2 IDMask:#{2, 3} BufferID:BufferID) != Version then (
								GIMS.Core.SystemMgr.AddResult #Error  (
									FormatText \
										v1:"Wrong version resource \"" \
										v2:DiskPath \
										v3:ObjName \
										v4:Extension \
										v5:"\""
								)
								return false;
							)
							Skip BufferID 1 /* skip start */
						)
						#Image:
							TexturePath = (DiskPath + (tLine[2] as String))
						#Type: (
							TypeID = (FindItem TypeNames (TypeCast tLine[2] name BufferID:BufferID))
							if TypeID == 0 then (
								GIMS.Core.SystemMgr.AddResult #Error  (
									FormatText \
										v1:"Unknown type \"" \
										v2:tLine[2] \
										v3:"\" in object \"" \
										v4:ObjName \
										v5:"\" found at " \
										v6:(BufferMgr.GetErrorInfo BufferID) \
								)
								return false;
							)
						)
						#PixelFormat: (
							PixelFormatID = (FindItem PixelFormatNames (TypeCast tLine[2] name BufferID:BufferID))
							if PixelFormatID == 0 then
								PixelFormatID = 6
								--EGIMS_EHAbort ("Unknown PixelFormat \"" + tLine[2] as String + "\" in object \"" + ObjName + "\" found!") BufferID:BufferID
						)
						#Usage: (
							UsageID = (FindItem KnownUsages (TypeCast tLine[2] name BufferID:BufferID))
							if UsageID == 0 then
								EGIMS_EHAbort ("Unknown Usage \"" + tLine[2] as String + "\" in object \"" + ObjName + "\" found!") BufferID:BufferID
						)
						#UsageFlags: (
							if tLine[2] != "-" then (
								for i = 2 to tLine.Count do (
									local	ID = (FindItem KnownUsageFlags (TypeCast tLine[i] name BufferID:BufferID))
									if ID == 0 then
										EGIMS_EHAbort ("Unknown UsageFlag \"" + tLine[i] as String + "\" in object \"" + ObjName + "\" found!") BufferID:BufferID
									UsageFlags[ID] = true
								)
							)
						)
						#ExtraFlags:
							ExtraFlags = (TypeCast tLine[2] Integer BufferID:BufferID)
						#Levels: (/*skip*/)
						Default:
							EGIMS_EHAbort "Unknown strTexture tag: " Param1:tLine[1] BufferID:BufferID
					)
				)
				BufferMgr.ClearBuffer BufferID
				true
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Write = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	BufferMgr = GIMS.Core.BufferMgr,
						ValueOps = GIMS.Core.ValueOps,
						FormatText = ValueOps.FormatText,
						WriteVal = BufferMgr.WriteVal,
						FilePath = (
							ValueOps.FormatText \
								v1:DiskPath \
								v2:ObjName \
								v3:Extension
						),
						BufferID = (BufferMgr.Create Mode:#TxtLines FilePath:FilePath),
						TexFileExt = (FileNameFromPath TexturePath),
						ToHighReg = GIMS.Core.StringOps.ToHighReg,
						TypeCast = ValueOps.TypeCast,
						MipLevelCount = 0
				if BufferID != false then (
					if (DoesFileExist TexturePath) then (
						local	TexBitMap = (try (OpenBitMap TexturePath) catch undefined)
						if Have TexBitMap then (
							local	Pixels,
									BitAnd = Bit.And,
									TW = TexBitMap.Width,
									TH = TexBitMap.Height
							Close TexBitMap
							if
								((BitAnd TW (TW - 1)) == 0) and
								((BitAnd TH (TH - 1)) == 0)
							then (
								if TW < TH then
									Pixels = TW
								else
									Pixels = TH
								while Pixels > 2 do (
									MipLevelCount += 1
									Pixels /= 2
								)
							)
						)
						GIMS.Core.SystemMgr.FileCopy TexturePath (DiskPath + TexFileExt)
					) else (
						GIMS.Core.SystemMgr.AddResult #Error  (
							FormatText \
								v1:"Can't find a texture file:\n\"" \
								v2:TexturePath \
								v3:"\"\nPlease copy it by yourself! Otherwise, the resource won't work."
						)
					)
					WriteVal BufferID (ValueOps.AsoFText Version TypeHook:Integer TabString:"Version ")
					WriteVal BufferID "{"
					WriteVal BufferID ("\tImage " + TexFileExt)
					WriteVal BufferID ("\tType " + TypeStrings[TypeID])
					WriteVal BufferID ("\tPixelFormat " + PixelFormatStrings[PixelFormatID])
					WriteVal BufferID ("\tLevels " + ((TypeCast MipLevelCount Integer BufferID:BufferID) as String))
					WriteVal BufferID ("\tUsage " + (ToHighReg (KnownUsages[UsageID] as String)))
					if UsageFlags.NumberSet == 0 then
						WriteVal BufferID "\tUsageFlags -"
					else (
						WriteVal BufferID "\tUsageFlags "
						for UsageFlag in UsageFlags do
							WriteVal BufferID (" " + (ToHighReg (KnownUsageFlags[UsageFlag] as String))) AppendLast:true
					)
					WriteVal BufferID ("\tExtraFlags " + ((TypeCast ExtraFlags Integer) as String))
					WriteVal BufferID "}"
					BufferMgr.WriteFile BufferID FilePath:FilePath
					BufferMgr.ClearBuffer BufferID
				) else
					EGIMS_EHAbort ("Can't write file " + (TempFilePath as String))
				OK
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(
			#(
				#TypeID,
				#PixelFormatID,
				#UsageID
			), #(
				TypeID,
				PixelFormatID,
				UsageID
			)
			))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		)
	)
	struct /*#PC*PATH	GIMS.CurrentGame.Core.TypeLibrary.grcTextureDictionary*/ strTextureDictionary (
		GIMSObjectLink = "GIMS.CurrentGame.Core.TypeLibrary.grcTextureDictionary",
		DiskPath,
		ObjName,
		Extension = ".otd",
		Version = [13, 30],
		Items = #(),
		fn Read ReportProgress:true = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	tLine,
						BufferMgr = GIMS.Core.BufferMgr,
						ReadVal = BufferMgr.ReadVal,
						Skip = BufferMgr.Skip,
						StringOps = GIMS.Core.StringOps,
						oFTypeExec = StringOps.oFTypeExec,
						ValueOps = GIMS.Core.ValueOps,
						TypeCast = ValueOps.TypeCast,
						FormatText = ValueOps.FormatText,
						\
						grcTexture = GIMS.CurrentGame.Core.TypeLibrary.grcTexture,
						GetProgress = BufferMgr.GetProgress,
						UpdateProgress = GIMS.Core.GUIMgr.UpdateProgress,
						BufferID = (
							BufferMgr.ReadFile (
								FormatText \
									v1:DiskPath \
									v2:ObjName \
									v3:Extension
							) Mode:#TxtLines
						),
						NewItem,
						NotEOF = BufferMgr.NotEOF,
						\
						TextureNames = GIMS.CurrentGame.Core.DB.TextureNames,
						AppendMHL = GIMS.Core.ArrayOps.AppendMHL,
						IsVersionValid = false
				AppendMHL GIMS.CurrentGame.Core.DB.ObjectNames ObjName
				if BufferID == false then
					return false;
				local	ItemCount = 0
				Items.Count = 20
				while
					(NotEOF BufferID) and
					(tLine = (ReadVal BufferID FilterStr:"\t "))[1] != "}"
				do ( /* skips end */
					if ReportProgress then
						UpdateProgress #Progress (GetProgress BufferID)
					else
						UpdateProgress #None 0
					local	Tag = (TypeCast tLine[1] name BufferID:BufferID)
					case Tag of (
						#Version: (
							if (oFTypeExec tLine #P2 IDMask:#{2, 3} BufferID:BufferID) != Version then (
								GIMS.Core.SystemMgr.AddResult #Error  (
									FormatText \
										v1:"Wrong version resource \"" \
										v2:DiskPath \
										v3:ObjName \
										v4:Extension \
										v5:"\""
								)
								return false;
							)
							Skip BufferID 1 /* skip dict start */
							IsVersionValid = true
						)
						Default: (
							if IsVersionValid then (
								local	SubPath = tLine[1],
										TexFileName = (GetFileNameFile SubPath)
								AppendMHL TextureNames TexFileName
								NewItem = (grcTexture DiskPath:(DiskPath + (GetFileNamePath SubPath)) ObjName:TexFileName)
								if not (NewItem.Read()) then
									return false;
								ItemCount += 1
								Items[ItemCount] = NewItem
							) else (
								GIMS.Core.SystemMgr.AddResult #Error  (
									FormatText \
										v1:"Syntax error in TextureDictionary resource \"" \
										v2:DiskPath \
										v3:ObjName \
										v4:Extension \
										v5:"\""
								)
								return false;
							)
						)
					)
				)
				Items.Count = ItemCount
				BufferMgr.ClearBuffer BufferID
				true
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#DiskPath, #ObjName, #Extension), #(DiskPath, ObjName, Extension)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Write = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	BufferMgr = GIMS.Core.BufferMgr,
						ValueOps = GIMS.Core.ValueOps,
						FormatText = ValueOps.FormatText,
						WriteVal = BufferMgr.WriteVal,
						ObjDir = (DiskPath + ObjName),
						FilePath = (ObjDir + Extension),
						BufferID = (BufferMgr.Create Mode:#TxtLines FilePath:FilePath),
						SubDir = (ObjName + "\\"),
						SubPath = (DiskPath + SubDir),
						ItemHeader = ("\t" + SubDir),
						UpdateProgress = GIMS.Core.GUIMgr.UpdateProgress,
						CurrentProgress = [0, 0, Items.Count],
						\
						TextureNames = GIMS.CurrentGame.Core.DB.TextureNames,
						AppendMHL = GIMS.Core.ArrayOps.AppendMHL
				if BufferID != false then (
					AppendMHL GIMS.CurrentGame.Core.DB.ObjectNames ObjName
					MakeDir ObjDir All:true
					WriteVal BufferID (ValueOps.AsoFText Version TypeHook:Integer TabString:"Version ")
					WriteVal BufferID "{"
					for Item in Items do (
						CurrentProgress.x += 1
						UpdateProgress #Progress CurrentProgress
						local	ItemObjName = Item.ObjName
						AppendMHL TextureNames ItemObjName
						WriteVal BufferID (
							FormatText \
								v1:ItemHeader \
								v2:ItemObjName \
								v3:Item.Extension
						)
						Item.DiskPath = SubPath
						Item.Write()
					)
					WriteVal BufferID "}"
					BufferMgr.WriteFile BufferID FilePath:FilePath
					BufferMgr.ClearBuffer BufferID
				) else
					EGIMS_EHAbort ("Can't write file " + (TempFilePath as String))
				OK
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#DiskPath, #ObjName, #Extension), #(DiskPath, ObjName, Extension)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		)
	)
	struct /*#PC*PATH	GIMS.CurrentGame.Core.TypeLibrary.grcShadingGroup*/ strShadingGroup (
		GIMSObjectLink = "GIMS.CurrentGame.Core.TypeLibrary.grcShadingGroup",
		DiskPath,
		ObjName,
		Mtls = #(),
		fn Read BufferID TexPaths = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	MtlCount = 0,
						\
						grcTexture = GIMS.CurrentGame.Core.TypeLibrary.grcTexture,
						ArrayOps = GIMS.Core.ArrayOps,
						AppendMHL = ArrayOps.AppendMHL,
						QuickSearch = ArrayOps.QuickSearch,
						oFTypeExec = GIMS.Core.StringOps.oFTypeExec,
						SPSToGIMSParamType = GIMS.CurrentGame.Core.MAXFactory.ObjectMgr.SPSToGIMSParamType,
						LoadBitmapFile = GIMS.Core.MaterialOps.LoadBitmapFile,
						GetShaderByName = GIMS.CurrentGame.Core.DB.GetShaderByName,
						TextureNames = GIMS.CurrentGame.Core.DB.TextureNames,
						BufferMgr = GIMS.Core.BufferMgr,
						ReadVal = BufferMgr.ReadVal,
						Skip = BufferMgr.Skip,
						TypeCast = GIMS.Core.ValueOps.TypeCast,
						BitArrayAsValue = ArrayOps.BitArrayAsValue,
						tLine,
						MtlBufferSize = 50
				Mtls.Count = MtlBufferSize
				while (tLine = (ReadVal BufferID FilterStr:"\t "))[1] != "}" do ( /* skips end */
					local	SPSName = (GetFileNameFile tLine[1]),
							SPS = (GetShaderByName SPSName),
							Mtl = (EGIMS_V_material SPSName:SPSName ShowInViewport:true),
							MtlName = SPSName,
							SPSShaderParameters = SPS.ShaderParameters,
							MtlSetParam = Mtl.SetParam
					if (ReadVal BufferID FilterStr:"\t " NoSeek:true)[1] == "{" then (
						Skip BufferID 1 /* skip shader start */
						while (tLine = (ReadVal BufferID FilterStr:"\t "))[1] != "}" do ( /* skips shader end */
							local	SPSParamDef = tLine,
									SPSParamName = SPSParamDef[1],
									SPSParamID = (QuickSearch SPSShaderParameters SPSParamName PropertyName:#aName)
							if SPSParamID == 0 then
								EGIMS_EHAbort ("Can't find a " + SPSName + " shader parameter: ") Param1:SPSParamName
							if (ReadVal BufferID FilterStr:"\t " NoSeek:true)[1] == "{" then (
								Skip BufferID 1 /* skip param start */
								while (tLine = (ReadVal BufferID FilterStr:"\t "))[1] != "}" do /* skips multiline param end */
									SPSParamDef += tLine
							)
							local	SPSParam = SPSShaderParameters[SPSParamID],
									SPSParamType = SPSParam.aType,
									TheTexParams = unsupplied
							if SPSParamType == #svt_sampler then (
								local	ParamValue = SPSParamDef[2]
								if ParamValue != "*NULL*" then (
									local	TexFilePath = (GetFileNamePath ParamValue),
											TexFileName = (GetFileNameFile ParamValue),
											TexFileType = (GetFileNameType ParamValue),
											IsIncluded = (
												(TexFileType.Count != 0) and
												(DoesFileExist (DiskPath + ParamValue))
											)
									if IsIncluded then (
										local	OTX = (
													grcTexture \
													DiskPath:(DiskPath + TexFilePath) \
													ObjName:TexFileName \
													Extension:TexFileType \
												)
										OTX.Read()
										local	OTXTexturePath = OTX.TexturePath
										TexFilePath = (GetFileNamePath OTXTexturePath)
										TexFileName = (GetFileNameFile OTXTexturePath)
										TheTexParams = (
											Matrix3 \
											[OTX.TypeID, OTX.PixelFormatID, OTX.UsageID] \
											[(BitArrayAsValue OTX.UsageFlags), OTX.ExtraFlags, -1] \
											[-1, -1, -1] \
											[-1, -1, -1] \
										)
									)
									AppendMHL TextureNames TexFileName
									local	DefaultTexColor,
											SPSParamNameAsName = (TypeCast SPSParamName Name BufferID:BufferID)
									if
										SPSParamNameAsName == #DiffuseSampler or
										SPSParamNameAsName == #TextureGrassSampler or
										SPSParamNameAsName == #texturesampler_layer0 or
										SPSParamNameAsName == #texturesampler
									then (
										MtlName = TexFileName
										DefaultTexColor = Red
									) else
										DefaultTexColor = White
									if IsIncluded then
										MtlSetParam SPSParamName SPSParamType (LoadBitmapFile TexFilePath TexFileName BackColor:DefaultTexColor) IsTexInternal:IsIncluded TheTexParams:TheTexParams
									else
										MtlSetParam SPSParamName SPSParamType (LoadBitmapFile (Ternary IsIncluded DiskPath TexPaths) (Append TexFilePath TexFileName) BackColor:DefaultTexColor) IsTexInternal:IsIncluded TheTexParams:TheTexParams
								)
							) else
								MtlSetParam SPSParamName SPSParamType (oFTypeExec SPSParamDef (SPSToGIMSParamType SPSParamType) IDMask:#{2..SPSParamDef.Count} BufferID:BufferID) TheTexParams:TheTexParams
						)
					)
					Mtl.Name = MtlName
					MtlCount += 1
					if MtlCount > MtlBufferSize then (
						MtlBufferSize += 50
						Mtls.Count = MtlBufferSize
					)
					Mtls[MtlCount] = Mtl
				)
				Mtls.Count = MtlCount
				OK
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn ReadCodeWalkerXML ShadersNode TexPaths = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if No ShadersNode then
					return false
				local	CWXML = GIMS.CurrentGame.Core.TypeLibrary.CWXML,
						ShaderItems = (ShadersNode.SelectNodes "Item"),
						GetShaderByName = GIMS.CurrentGame.Core.DB.GetShaderByName,
						LoadBitmapFile = GIMS.Core.MaterialOps.LoadBitmapFile,
						QuickSearch = GIMS.Core.ArrayOps.QuickSearch,
						MtlCount = ShaderItems.Count
				Mtls.Count = MtlCount
				for i = 0 to (MtlCount - 1) do (
					local	ShaderItem = (ShaderItems.Item[i]),
							FileName = (CWXML.GetChildText ShaderItem "FileName"),
							SPSName = (GetFileNameFile FileName)
					if SPSName.Count == 0 then
						SPSName = (CWXML.GetChildText ShaderItem "Name")
					if SPSName.Count == 0 then
						SPSName = "default"
					local	SPS = undefined,
							Mtl = (EGIMS_V_material SPSName:SPSName ShowInViewport:true)
					try (SPS = (GetShaderByName SPSName)) catch ()
					local	ParamsNode = (CWXML.GetChild ShaderItem "Parameters")
					if
						Have SPS and
						Have ParamsNode
					then (
						local	SPSShaderParameters = SPS.ShaderParameters,
								MtlSetParam = Mtl.SetParam,
								ParamItems = (ParamsNode.SelectNodes "Item")
						for p = 0 to (ParamItems.Count - 1) do (
							local	ParamItem = (ParamItems.Item[p]),
									SPSParamName = (CWXML.GetAttr ParamItem "name"),
									ParamTypeName = (CWXML.GetAttr ParamItem "type"),
									SPSParamID = (QuickSearch SPSShaderParameters SPSParamName PropertyName:#aName)
							if SPSParamID != 0 then (
								local	SPSParam = SPSShaderParameters[SPSParamID],
										SPSParamType = SPSParam.aType,
										Needed = (CWXML.ArrayTypeCount SPSParamType)
								if
									(ToUpper ParamTypeName) == "TEXTURE" or
									SPSParamType == #svt_sampler
								then (
									local	TexName = (CWXML.GetChildText ParamItem "Name")
									if
										Have TexName and
										TexName.Count != 0 and
										TexName != "*NULL*"
									then (
										local	TexBase = (GetFileNameFile TexName),
												TexDirs = TexPaths
										if TexBase.Count == 0 then
											TexBase = TexName
										if No TexDirs then
											TexDirs = DiskPath
										if not (IsKindOf TexDirs Array) then
											TexDirs = #(TexDirs)
										if
											Have DiskPath and
											((FindItem TexDirs DiskPath) == 0)
										then
											Append TexDirs DiskPath
										for d = 1 to TexDirs.Count do (
											local	DirStr = (TexDirs[d] as String)
											if
												DirStr.Count != 0 and
												DirStr[DirStr.Count] != "\\"
											then
												TexDirs[d] = (DirStr + "\\")
										)
										MtlSetParam SPSParamName SPSParamType (LoadBitmapFile TexDirs TexBase BackColor:White) IsTexInternal:false
									)
								) else (
									if
										(ToUpper ParamTypeName) == "ARRAY" or
										Needed != 0
									then (
										local	ValueNodes = (ParamItem.SelectNodes "Value"),
												Arr = #()
										if ValueNodes.Count != 0 then (
											Arr.Count = ValueNodes.Count
											for v = 0 to (ValueNodes.Count - 1) do (
												local	ValueNode = (ValueNodes.Item[v])
												Arr[v + 1] = [(CWXML.GetAttrFloat ValueNode "x"), (CWXML.GetAttrFloat ValueNode "y"), (CWXML.GetAttrFloat ValueNode "z"), (CWXML.GetAttrFloat ValueNode "w")]
											)
										) else
											Arr[1] = [(CWXML.GetAttrFloat ParamItem "x"), (CWXML.GetAttrFloat ParamItem "y"), (CWXML.GetAttrFloat ParamItem "z"), (CWXML.GetAttrFloat ParamItem "w")]
										if Needed == 0 then
											Needed = Arr.Count
										if Needed < 1 then
											Needed = 1
										MtlSetParam SPSParamName SPSParamType (CWXML.PadP4Array Arr Needed)
									) else (
										local	Vec = [(CWXML.GetAttrFloat ParamItem "x"), (CWXML.GetAttrFloat ParamItem "y"), (CWXML.GetAttrFloat ParamItem "z"), (CWXML.GetAttrFloat ParamItem "w" DefaultVal:0.0)]
										MtlSetParam SPSParamName SPSParamType Vec
									)
								)
							)
						)
						try (Mtl.EnsureHaveParams SPSName GIMS.CurrentGame.Core.DB QuickSearch GIMS.Core.ValueOps.TypeCast) catch ()
					)
					Mtl.Name = SPSName
					Mtls[i + 1] = Mtl
				)
				true
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn WriteCodeWalkerXML SS Tab = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	CWXML = GIMS.CurrentGame.Core.TypeLibrary.CWXML,
						GetShaderByName = GIMS.CurrentGame.Core.DB.GetShaderByName,
						Inner = (Tab + " "),
						Inner2 = (Inner + " "),
						Inner3 = (Inner2 + " "),
						Inner4 = (Inner3 + " ")
				Format "%" (Tab + "<ShaderGroup>\n") To:SS
				Format "%" (Inner + "<Shaders>\n") To:SS
				for Mtl in Mtls do (
					local	SPSName = "default",
							GetParam,
							SPS
					if Have Mtl then (
						try (SPSName = Mtl.SPSName) catch ()
						try (GetParam = Mtl.GetParam) catch ()
					)
					try (SPS = (GetShaderByName SPSName)) catch ()
					Format "%" (Inner2 + "<Item>\n") To:SS
					Format "%" (Inner3 + "<Name>" + (CWXML.XMLEscape SPSName) + "</Name>\n") To:SS
					Format "%" (Inner3 + "<FileName>" + (CWXML.XMLEscape (SPSName + ".sps")) + "</FileName>\n") To:SS
					Format "%" (CWXML.ValueTag Inner3 "RenderBucket" 0) To:SS
					Format "%" (Inner3 + "<Parameters>\n") To:SS
					if Have SPS then (
						for SPSParam in SPS.ShaderParameters do (
							local	ParamName = SPSParam.aName,
									ParamType = SPSParam.aType,
									Needed = (CWXML.ArrayTypeCount ParamType)
							if
								ParamType == #svt_sampler
							then (
								local	Tex = undefined
								if Have GetParam then
									try (Tex = (GetParam ParamName ParamType)) catch ()
								if
									Have Tex and
									Have Tex.FileName
								then (
									local	TexName = (GetFileNameFile Tex.FileName)
									Format "%" (Inner4 + "<Item name=\"" + (CWXML.XMLEscape ParamName) + "\" type=\"Texture\">\n") To:SS
									Format "%" (Inner4 + " <Name>" + (CWXML.XMLEscape TexName) + "</Name>\n") To:SS
									Format "%" (Inner4 + "</Item>\n") To:SS
								) else
									Format "%" (Inner4 + "<Item name=\"" + (CWXML.XMLEscape ParamName) + "\" type=\"Texture\" />\n") To:SS
							) else (
								local	ParamValue = undefined
								if Have GetParam then
									try (ParamValue = (GetParam ParamName ParamType)) catch ()
								if Needed != 0 then (
									if No ParamValue then
										ParamValue = (CWXML.DefaultParamValue ParamType)
									if not (IsKindOf ParamValue Array) then
										ParamValue = #(ParamValue)
									ParamValue = (CWXML.PadP4Array ParamValue Needed)
									Format "%" (Inner4 + "<Item name=\"" + (CWXML.XMLEscape ParamName) + "\" type=\"Array\">\n") To:SS
									for Val in ParamValue do
										Format "%" (Inner4 + " <Value " + (CWXML.Vec4Attrs Val) + " />\n") To:SS
									Format "%" (Inner4 + "</Item>\n") To:SS
								) else (
									if No ParamValue then
										ParamValue = [0, 0, 0, 0]
									Format "%" (Inner4 + "<Item name=\"" + (CWXML.XMLEscape ParamName) + "\" type=\"Vector\" " + (CWXML.Vec4Attrs ParamValue) + " />\n") To:SS
								)
							)
						)
					)
					Format "%" (Inner3 + "</Parameters>\n") To:SS
					Format "%" (Inner2 + "</Item>\n") To:SS
				)
				Format "%" (Inner + "</Shaders>\n") To:SS
				Format "%" (Tab + "</ShaderGroup>\n") To:SS
				OK
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Write BufferID SubDir TexPath = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	ValueOps = GIMS.Core.ValueOps,
						AsoFText = ValueOps.AsoFText,
						TypeCast = ValueOps.TypeCast,
						FormatText = ValueOps.FormatText,
						AddResult = GIMS.Core.SystemMgr.AddResult,
						AsBitArray = ValueOps.AsBitArray,
						\
						GetShaderByName = GIMS.CurrentGame.Core.DB.GetShaderByName,
						grcTexture = GIMS.CurrentGame.Core.TypeLibrary.grcTexture,
						SPSToGIMSParamType = GIMS.CurrentGame.Core.MAXFactory.ObjectMgr.SPSToGIMSParamType,
						QuickSearch = GIMS.Core.ArrayOps.QuickSearch,
						TabString = "\t\t",
						SubTabString = (TabString + "\t"),
						DoubleSubTabString = (SubTabString + "\t"),
						BufferMgr = GIMS.Core.BufferMgr,
						WriteVal = BufferMgr.WriteVal
				for MtlID = 1 to Mtls.Count do (
					local	Mtl = Mtls[MtlID],
							GetParam = Mtl.GetParam,
							SPSName = Mtl.SPSName,
							SPS = (GetShaderByName SPSName)
					WriteVal BufferID (
						FormatText \
							v1:TabString \
							v2:SPSName \
							v3:".sps" \
					)
					local	ParamNameGroups = #(
								Mtl.TexValueNames,
								Mtl.FloatValueNames,
								Mtl.Matrix3x4ParamNames,
								Mtl.Matrix44ParamNames,
								Mtl.Float2x3ParamNames,
								Mtl.Float4x2ParamNames,
								Mtl.Float4x4ParamNames,
								Mtl.Float4x5ParamNames
							),
							ParamTypeGroups = #(
								#svt_sampler,
								#svt_float,
								#svt_matrix3x4,
								#svt_matrix44,
								#svt_float2x3,
								#svt_float4x2,
								#svt_float4x4,
								#svt_float4x5
							),
							TexInternalFlags = Mtl.TexInternalFlags,
							ShaderParameters = SPS.ShaderParameters,
							HaveParams = false
					for Grp in ParamNameGroups where Grp.Count != 0 while not HaveParams do
						HaveParams = true
					if HaveParams then
						WriteVal BufferID (TabString + "{")
					for GID = 1 to ParamNameGroups.Count do (
						local	ParamNames = ParamNameGroups[GID],
								ParamType = ParamTypeGroups[GID]
						for PID = 1 to ParamNames.Count do (
							local	ParamName = ParamNames[PID],
									SPSParamID = (QuickSearch ShaderParameters ParamName PropertyName:#aName)
							if SPSParamID != 0 then (
								local	SPSParam = ShaderParameters[SPSParamID]
								local	ParamValueData = (GetParam ParamName ParamType GetParamIDToo:true),
										ParamValue = ParamValueData[1],
										ParamID = ParamValueData[2],
										GIMSParamType = (SPSToGIMSParamType SPSParam.aType),
										CWXML = GIMS.CurrentGame.Core.TypeLibrary.CWXML,
										ValueToWrite = (
											if GID == 1 then (
												if Have ParamValue then (
													local	FilePath = ParamValue.FileName,
															FileName = (GetFileNameFile FilePath),
															IncAndParams = (GetParam ParamName ParamType GetIsTexInternal:true ParamID:ParamID GetTexParams:true)
													if IncAndParams[1] then (
														if (DoesFileExist FilePath) then (
															local	FileNameExt = (FileNameFromPath FilePath),
																	NewPath = (TexPath + FileNameExt),
																	TexParams = IncAndParams[2],
																	OTX = (
																		grcTexture \
																			DiskPath:TexPath \
																			ObjName:FileName \
																			TexturePath:FilePath \
																			TypeID:TexParams[1][1] \
																			PixelFormatID:TexParams[1][2] \
																			UsageID:TexParams[1][3] \
																			UsageFlags:(AsBitArray TexParams[2][1]) \
																			ExtraFlags:TexParams[2][2] \
																	)
															OTX.Write()
															(
																FormatText \
																	v1:SubDir \
																	v2:FileName \
																	v3:OTX.Extension
															)
														) else (
															AddResult #Warning  (
																FormatText \
																	v1:"Can't find an embedded texture file:\n\"" \
																	v2:FilePath \
																	v3:"\"\nIt will be stored as external."
															)
															FileName
														)
													) else
														FileName
												) else 
													"*NULL*"
											) else (
												if No ParamValue then
													ParamValue = (CWXML.DefaultParamValue SPSParam.aType)
												if
													GIMSParamType == #P4Array or
													GIMSParamType == #P3Array or
													GIMSParamType == #P2Array
												then (
													local	Needed = (CWXML.ArrayTypeCount SPSParam.aType)
													if Needed == 0 then
														Needed = (CWXML.ArrayTypeCount ParamType)
													if Needed == 0 then (
														try (Needed = ParamValue.Count) catch (
															Needed = 1
														)
													)
													if not (IsKindOf ParamValue Array) then
														ParamValue = #(ParamValue)
													ParamValue = (CWXML.PadP4Array ParamValue Needed)
													ParamValue
												) else
													(TypeCast ParamValue GIMSParamType ReportCastFail:false BufferID:BufferID)
											)
										)
								WriteVal BufferID (AsoFText ParamName TabString:SubTabString)
								if
									ParamType == #svt_matrix3x4 or
									ParamType == #svt_float4x2 or
									ParamType == #svt_float4x4 or
									ParamType == #svt_matrix44 or
									ParamType == #svt_float2x3 or
									ParamType == #svt_float4x5
								then (
									WriteVal BufferID (SubTabString + "{")
									for Val in ValueToWrite do
										WriteVal BufferID (AsoFText Val TabString:DoubleSubTabString)
									WriteVal BufferID (SubTabString + "}")
								) else
									WriteVal BufferID (AsoFText ValueToWrite TabString:" ") AppendLast:true
							)
						)
					)
					if HaveParams then
						WriteVal BufferID (TabString + "}")
				)
				OK
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#DiskPath, #ObjName, #SubDir, #TexPath), #(DiskPath, ObjName, SubDir, TexPath)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		)
	)
	struct /*#PC*PATH	GIMS.CurrentGame.Core.TypeLibrary.grcJointLimit*/ strJointLimit (
		GIMSObjectLink = "GIMS.CurrentGame.Core.TypeLibrary.grcJointLimit",
		BoneID,
		LimitMin,
		LimitMax,
		fn Read BufferID LineItems Header = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	BufferMgr = GIMS.Core.BufferMgr,
						Skip = BufferMgr.Skip,
						ReadVal = BufferMgr.ReadVal,
						oFTypeExec = GIMS.Core.StringOps.oFTypeExec,
						TypeCast = GIMS.Core.ValueOps.TypeCast
				GIMS.Core.GUIMgr.UpdateProgress #None 0
				local	Tag = (TypeCast LineItems[1] Name BufferID:BufferID)
				if Tag == Header then (
					BoneID = (TypeCast LineItems[2] Integer BufferID:BufferID)
					Skip BufferID 1	--skip start
					while (LineItems = (ReadVal BufferID FilterStr:"\t "))[1] != "}" do (	--skips end
						local	Subtag = (TypeCast LineItems[1] Name BufferID:BufferID)
						case Subtag of (
							#LimitMin:
								LimitMin = (oFTypeExec LineItems #P3 IDMask:#{2..4} BufferID:BufferID)
							#LimitMax:
								LimitMax = (oFTypeExec LineItems #P3 IDMask:#{2..4} BufferID:BufferID)
							default:
								EGIMS_EHAbort "Unknown strJointLimit subtag " Param1:LineItems[1] BufferID:BufferID
						)
					)
				) else
					EGIMS_EHAbort "Unknown strJointLimit tag " Param1:LineItems[1] BufferID:BufferID
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Write BufferID TabString Header = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	BufferMgr = GIMS.Core.BufferMgr,
						WriteVal = BufferMgr.WriteVal,
						AsoFText = GIMS.Core.ValueOps.AsoFText,
						SubTabString = (TabString + "\t")
				WriteVal BufferID (Header + (BoneID as String))
				WriteVal BufferID (TabString + "{")
				WriteVal BufferID (AsoFText LimitMin TabString:(SubTabString + "LimitMin "))
				WriteVal BufferID (AsoFText LimitMax TabString:(SubTabString + "LimitMax "))
				WriteVal BufferID (TabString + "}")
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn CopyP3ToAP P3 Arr = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				for i = 1 to 3 do
					Arr[i] = P3[i]
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Create BoneNodes Type = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				case Type of (
					1: (
						for tBone in BoneNodes where tBone.ID == BoneID do (
							CopyP3ToAP LimitMin tBone.RotMin
							CopyP3ToAP LimitMax tBone.RotMax
							--tBone.UseJoints = true
						)
					)
					2: (
						for tBone in BoneNodes where tBone.ID == BoneID do (
							CopyP3ToAP LimitMin tBone.TransMin
							CopyP3ToAP LimitMax tBone.TransMax
							--tBone.UseJoints = true
						)
					)
					3: (
						for tBone in BoneNodes where tBone.ID == BoneID do (
							CopyP3ToAP LimitMin tBone.ScaleMin
							CopyP3ToAP LimitMax tBone.ScaleMax
							--tBone.UseJoints = true
						)
					)
				)
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		)
	)
	struct /*#PC*PATH	GIMS.CurrentGame.Core.TypeLibrary.grcJoints*/ strJoints (
		GIMSObjectLink = "GIMS.CurrentGame.Core.TypeLibrary.grcJoints",
		DiskPath,
		ObjName,
		Extension = ".joints",
		Version = [165, 30],
		RotationLimits = #(),
		TranslationLimits = #(),
		ScaleLimits = #(),
		fn Read = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	tLine,
						BufferMgr = GIMS.Core.BufferMgr,
						ReadVal = BufferMgr.ReadVal,
						Skip = BufferMgr.Skip,
						oFTypeExec = GIMS.Core.StringOps.oFTypeExec,
						ValueOps = GIMS.Core.ValueOps,
						TypeCast = ValueOps.TypeCast,
						grcJointLimit = GIMS.CurrentGame.Core.TypeLibrary.grcJointLimit,
						BufferID = (
							BufferMgr.ReadFile (
								ValueOps.FormatText \
									v1:DiskPath \
									v2:ObjName \
									v3:Extension
							) Mode:#TxtLines
						),
						NotEOF = BufferMgr.NotEOF
				if BufferID == false then
					return false;
				while
					(NotEOF BufferID) and
					(tLine = (ReadVal BufferID FilterStr:"\t "))[1] != "}"
				do ( /* skips end */
					local	Tag = (TypeCast tLine[1] name BufferID:BufferID)
					case Tag of (
						#Version: (
							if (oFTypeExec tLine #P2 IDMask:#{2, 3} BufferID:BufferID) != Version then (
								GIMS.Core.SystemMgr.AddResult #Error  (
									FormatText \
										v1:"Wrong version resource \"" \
										v2:DiskPath \
										v3:ObjName \
										v4:Extension \
										v5:"\""
								)
								return false;
							)
							Skip BufferID 1 /* skip start */
						)
						#RotationLimits: (
							local	Param2 = tLine[2]
							if (TypeCast Param2 Name BufferID:BufferID) != #NULL then (
								RotationLimits.Count = (TypeCast Param2 Integer BufferID:BufferID)
								local	LimitCount = 0,
										LineItems
								Skip BufferID 1	/* skip start */
								while (LineItems = (ReadVal BufferID FilterStr:"\t "))[1] != "}" do (	--skips end
									local	NewItem = (grcJointLimit())
									NewItem.Read BufferID LineItems #RotationLimit	/* skips end */
									LimitCount += 1
									RotationLimits[LimitCount] = NewItem
								)
								RotationLimits.Count = LimitCount
							)
						)
						#TranslationLimits: (
							local	Param2 = tLine[2]
							if (TypeCast Param2 Name BufferID:BufferID) != #NULL then (
								TranslationLimits.Count = (TypeCast Param2 Integer BufferID:BufferID)
								local	LimitCount = 0,
										LineItems
								Skip BufferID 1	/* skip start */
								while (LineItems = (ReadVal BufferID FilterStr:"\t "))[1] != "}" do (	--skips end
									local	NewItem = (grcJointLimit())
									NewItem.Read BufferID LineItems #TranslationLimit	/* skips end */
									LimitCount += 1
									TranslationLimits[LimitCount] = NewItem
								)
								TranslationLimits.Count = LimitCount
							)
						)
						#ScaleLimits: (
							local	Param2 = tLine[2]
							if (TypeCast Param2 Name BufferID:BufferID) != #NULL then (
								ScaleLimits.Count = (TypeCast Param2 Integer BufferID:BufferID)
								local	LimitCount = 0,
										LineItems
								Skip BufferID 1	/* skip start */
								while (LineItems = (ReadVal BufferID FilterStr:"\t "))[1] != "}" do (	--skips end
									local	NewItem = (grcJointLimit())
									NewItem.Read BufferID LineItems #ScaleLimit	/* skips end */
									LimitCount += 1
									ScaleLimits[LimitCount] = NewItem
								)
								ScaleLimits.Count = LimitCount
							)
						)
						default:
							EGIMS_EHAbort "Unknown strJoints tag " Param1:tLine[1] BufferID:BufferID
					)
				)
				BufferMgr.ClearBuffer BufferID
				true
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn ReadCodeWalkerLimits LimitNodes AsDegrees:false = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	CWXML = GIMS.CurrentGame.Core.TypeLibrary.CWXML,
						grcJointLimit = GIMS.CurrentGame.Core.TypeLibrary.grcJointLimit,
						Result = #(),
						LimitCount = LimitNodes.Count
				Result.Count = LimitCount
				for i = 0 to (LimitCount - 1) do (
					local	Item = (LimitNodes.Item[i]),
							BoneNode = (CWXML.GetChild Item "BoneId"),
							NewItem = (grcJointLimit()),
							MinVal = (CWXML.GetVec3 Item "Min"),
							MaxVal = (CWXML.GetVec3 Item "Max")
					NewItem.BoneID = (
						if Have BoneNode then
							(CWXML.GetAttrInt BoneNode "value")
						else
							0
					)
					if AsDegrees then (
						MinVal = [RadToDeg MinVal.x, RadToDeg MinVal.y, RadToDeg MinVal.z]
						MaxVal = [RadToDeg MaxVal.x, RadToDeg MaxVal.y, RadToDeg MaxVal.z]
					)
					NewItem.LimitMin = MinVal
					NewItem.LimitMax = MaxVal
					Result[i + 1] = NewItem
				)
				Result
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn ReadCodeWalkerXML JointsNode = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if No JointsNode then
					return false
				local	RotNode = (JointsNode.SelectSingleNode "RotationLimits"),
						TransNode = (JointsNode.SelectSingleNode "TranslationLimits")
				if Have RotNode then
					RotationLimits = (ReadCodeWalkerLimits (RotNode.SelectNodes "Item") AsDegrees:true)
				if Have TransNode then
					TranslationLimits = (ReadCodeWalkerLimits (TransNode.SelectNodes "Item") AsDegrees:false)
				true
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn WriteCodeWalkerXML SS Tab = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	CWXML = GIMS.CurrentGame.Core.TypeLibrary.CWXML,
						Inner = (Tab + " "),
						Inner2 = (Inner + " "),
						Inner3 = (Inner2 + " ")
				Format "%" (Tab + "<Joints>\n") To:SS
				if RotationLimits.Count != 0 then (
					Format "%" (Inner + "<RotationLimits>\n") To:SS
					for Limit in RotationLimits do (
						local	MinVal = Limit.LimitMin,
								MaxVal = Limit.LimitMax
						if No MinVal then
							MinVal = [0, 0, 0]
						if No MaxVal then
							MaxVal = [0, 0, 0]
						MinVal = [DegToRad MinVal.x, DegToRad MinVal.y, DegToRad MinVal.z]
						MaxVal = [DegToRad MaxVal.x, DegToRad MaxVal.y, DegToRad MaxVal.z]
						Format "%" (Inner2 + "<Item>\n") To:SS
						Format "%" (CWXML.ValueTag Inner3 "BoneId" Limit.BoneID) To:SS
						Format "%" (CWXML.ValueTag Inner3 "UnknownA" 0) To:SS
						Format "%" (CWXML.Vec3Tag Inner3 "Min" MinVal) To:SS
						Format "%" (CWXML.Vec3Tag Inner3 "Max" MaxVal) To:SS
						Format "%" (Inner2 + "</Item>\n") To:SS
					)
					Format "%" (Inner + "</RotationLimits>\n") To:SS
				)
				if TranslationLimits.Count != 0 then (
					Format "%" (Inner + "<TranslationLimits>\n") To:SS
					for Limit in TranslationLimits do (
						Format "%" (Inner2 + "<Item>\n") To:SS
						Format "%" (CWXML.ValueTag Inner3 "BoneId" Limit.BoneID) To:SS
						Format "%" (CWXML.Vec3Tag Inner3 "Min" Limit.LimitMin) To:SS
						Format "%" (CWXML.Vec3Tag Inner3 "Max" Limit.LimitMax) To:SS
						Format "%" (Inner2 + "</Item>\n") To:SS
					)
					Format "%" (Inner + "</TranslationLimits>\n") To:SS
				)
				Format "%" (Tab + "</Joints>\n") To:SS
				OK
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Write = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	BufferMgr = GIMS.Core.BufferMgr,
						WriteVal = BufferMgr.WriteVal,
						ValueOps = GIMS.Core.ValueOps,
						AsoFText = ValueOps.AsoFText,
						FormatText = ValueOps.FormatText,
						FilePath = (
							FormatText \
								v1:DiskPath \
								v2:ObjName \
								v3:Extension
						),
						BufferID = (BufferMgr.Create Mode:#TxtLines FilePath:FilePath),
						TabString = "\t",
						TabOpenString = "\t{",
						TabCloseString = "\t}",
						DoubleTabString = (TabString + TabString),
						RotationLimitsHeader = (DoubleTabString + "RotationLimit "),
						TranslationLimitsHeader = (DoubleTabString + "TranslationLimit "),
						ScaleLimitsHeader = (DoubleTabString + "ScaleLimit ")
				if BufferID != false then (
					WriteVal BufferID (AsoFText Version TypeHook:Integer TabString:"Version ")
					WriteVal BufferID "{"
					local	RotationLimitsCount = RotationLimits.Count,
							TranslationLimitsCount = TranslationLimits.Count,
							ScaleLimitsCount = ScaleLimits.Count
					if RotationLimitsCount != 0 then (
						WriteVal BufferID (FormatText v1:TabString v2:"RotationLimits " v3:RotationLimitsCount)
						WriteVal BufferID TabOpenString
						for Limit in RotationLimits do
							Limit.Write BufferID DoubleTabString RotationLimitsHeader
						WriteVal BufferID TabCloseString
					) else
						WriteVal BufferID (TabString + "RotationLimits null")
					if TranslationLimitsCount != 0 then (
						WriteVal BufferID (FormatText v1:TabString v2:"TranslationLimits " v3:TranslationLimitsCount)
						WriteVal BufferID TabOpenString
						for Limit in TranslationLimits do
							Limit.Write BufferID DoubleTabString TranslationLimitsHeader
						WriteVal BufferID TabCloseString
					) else
						WriteVal BufferID (TabString + "TranslationLimits null")
					if ScaleLimitsCount != 0 then (
						WriteVal BufferID (FormatText v1:TabString v2:"ScaleLimits " v3:ScaleLimitsCount)
						WriteVal BufferID TabOpenString
						for Limit in ScaleLimits do
							Limit.Write BufferID DoubleTabString ScaleLimitsHeader
						WriteVal BufferID TabCloseString
					) else
						WriteVal BufferID (TabString + "ScaleLimits null")
					WriteVal BufferID "}"
					BufferMgr.WriteFile BufferID FilePath:FilePath
					BufferMgr.ClearBuffer BufferID
				) else
					EGIMS_EHAbort ("Can't write file " + (TempFilePath as String))
				OK
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Create BoneNodes = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				for Limit in RotationLimits do
					Limit.Create BoneNodes 1
				for Limit in TranslationLimits do
					Limit.Create BoneNodes 2
				for Limit in ScaleLimits do
					Limit.Create BoneNodes 3
				OK
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		)
	)
	struct /*#PC*PATH	GIMS.CurrentGame.Core.TypeLibrary.grcDrawable*/ strDrawable (
		GIMSObjectLink = "GIMS.CurrentGame.Core.TypeLibrary.grcDrawable",
		DiskPath,
		ObjName,
		Extension = ".odr",
		Version = [165, 32],
		SourceFormat = #OpenFormats,
		XMLKind = #Drawable,
		XMLName = unsupplied,
		SourceXMLPath = unsupplied,
		SourceXMLOrigPath = unsupplied,
		SourceTexPath = unsupplied,
		PhysExport = #(),
		ShadingGroup,
		TheSkeleton,
		TheSkeleton_FULL = unsupplied,
		LODGroup,
		LightAttributes,
		Bound,
		Joints,
		fn CheckLocked = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	Locked = false
				if Have LODGroup then (
					for LODGroup in LODGroup.LODGroups while not Locked where LODGroup.Count != 0 do (
						for LODMesh in LODGroup while not Locked where LODMesh.Locked do
							Locked = true
					)
				)
				Locked
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn PostCacheLoad CachePath = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				/*
				LightAttributes
				TheSkeleton
				if Have LODGroup then
					LODGroup.LODGroups[0].LODMesh
				*/
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#CachePath), #(CachePath)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn CollectCodeWalkerModels ModelsNode LODMeshes Suffix:"" = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if Have ModelsNode then (
					local	Items = (ModelsNode.SelectNodes "Item"),
							grcLODMesh = GIMS.CurrentGame.Core.TypeLibrary.grcLODMesh
					for i = 0 to (Items.Count - 1) do (
						local	MeshName = (ObjName + Suffix + "_" + ((i + 1) as String)),
								LODMesh = (grcLODMesh DiskPath:DiskPath ObjName:MeshName Extension:".mesh")
						if (LODMesh.ReadCodeWalkerModel (Items.Item[i])) then
							Append LODMeshes LODMesh
					)
				)
				OK
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn ReadCodeWalkerFromNode DrawableNode RootNode FilePath TexPaths = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if No DrawableNode then
					return false
				local	CWXML = GIMS.CurrentGame.Core.TypeLibrary.CWXML
				SourceFormat = #XML
				SourceXMLOrigPath = FilePath
				if Have TexPaths then
					SourceTexPath = TexPaths
				SourceXMLPath = (CWXML.CacheSourceXML FilePath)
				XMLKind = #Drawable
				if Have RootNode then (
					local	RootKind = (CWXML.GetFileKindFromRoot RootNode)
					if RootKind == #Fragment then
						XMLKind = #Fragment
				)
				Extension = (CWXML.GetKindExtension XMLKind)
				if No TexPaths then
					TexPaths = DiskPath
				ObjName = (CWXML.CleanResourceName ObjName)
				local	DrawableName = (CWXML.GetChildText DrawableNode "Name")
				if
					Have DrawableName and
					DrawableName.Count != 0
				then
					XMLName = DrawableName
				local	grcSkeleton = GIMS.CurrentGame.Core.TypeLibrary.grcSkeleton,
						grcJoints = GIMS.CurrentGame.Core.TypeLibrary.grcJoints,
						grcShadingGroup = GIMS.CurrentGame.Core.TypeLibrary.grcShadingGroup,
						grcLODGroup = GIMS.CurrentGame.Core.TypeLibrary.grcLODGroup,
						ShaderGroupNode = (CWXML.GetChild DrawableNode "ShaderGroup"),
						JointsNode = (CWXML.GetChild DrawableNode "Joints"),
						SkelNode = (CWXML.GetChild DrawableNode "Skeleton")
				if
					No SkelNode and
					Have RootNode
				then
					SkelNode = (RootNode.SelectSingleNode ".//Skeleton")
				TheSkeleton = (grcSkeleton DiskPath:DiskPath ObjName:ObjName Extension:Extension)
				if not (TheSkeleton.ReadCodeWalkerFromNode SkelNode) then
					TheSkeleton = undefined
				if Have JointsNode then (
					Joints = (grcJoints DiskPath:DiskPath ObjName:ObjName Extension:".joints")
					Joints.ReadCodeWalkerXML JointsNode
				)
				if Have ShaderGroupNode then (
					local	ShadersNode = (CWXML.GetChild ShaderGroupNode "Shaders")
					ShadingGroup = (grcShadingGroup DiskPath:DiskPath ObjName:ObjName)
					ShadingGroup.ReadCodeWalkerXML ShadersNode TexPaths
				)
				LODGroup = (grcLODGroup DiskPath:DiskPath)
				local	HighDist = (CWXML.GetChild DrawableNode "LodDistHigh"),
						MedDist = (CWXML.GetChild DrawableNode "LodDistMed"),
						LowDist = (CWXML.GetChild DrawableNode "LodDistLow"),
						VlowDist = (CWXML.GetChild DrawableNode "LodDistVlow")
				if Have HighDist then
					LODGroup.LODGroupValues[1] = (CWXML.GetAttrFloat HighDist "value" DefaultVal:9998.0)
				if Have MedDist then
					LODGroup.LODGroupValues[2] = (CWXML.GetAttrFloat MedDist "value" DefaultVal:9998.0)
				if Have LowDist then
					LODGroup.LODGroupValues[3] = (CWXML.GetAttrFloat LowDist "value" DefaultVal:9998.0)
				if Have VlowDist then
					LODGroup.LODGroupValues[4] = (CWXML.GetAttrFloat VlowDist "value" DefaultVal:9998.0)
				CollectCodeWalkerModels (CWXML.GetChild DrawableNode "DrawableModelsHigh") LODGroup.LODGroups[1] Suffix:"_H"
				CollectCodeWalkerModels (CWXML.GetChild DrawableNode "DrawableModelsMedium") LODGroup.LODGroups[2] Suffix:"_M"
				CollectCodeWalkerModels (CWXML.GetChild DrawableNode "DrawableModelsLow") LODGroup.LODGroups[3] Suffix:"_L"
				CollectCodeWalkerModels (CWXML.GetChild DrawableNode "DrawableModelsVeryLow") LODGroup.LODGroups[4] Suffix:"_VL"
				if Have RootNode then (
					local	PhysicsNode = (CWXML.GetChild RootNode "Physics")
					if Have PhysicsNode then (
						local	LOD1 = (CWXML.GetChild PhysicsNode "LOD1")
						if Have LOD1 then (
							local	ChildrenNode = (CWXML.GetChild LOD1 "Children")
							if Have ChildrenNode then (
								local	ChildItems = (ChildrenNode.SelectNodes "Item")
								for i = 0 to (ChildItems.Count - 1) do (
									local	ChildItem = (ChildItems.Item[i]),
											ChildDrawable = (CWXML.GetChild ChildItem "Drawable"),
											BoneTagNode = (CWXML.GetChild ChildItem "BoneTag")
									if Have ChildDrawable then (
										local	ChildHigh = (CWXML.GetChild ChildDrawable "DrawableModelsHigh")
										if Have ChildHigh then (
											local	BoneIndex = 1
											if Have BoneTagNode then (
												local	BoneTag = (CWXML.GetAttrInt BoneTagNode "value")
												if Have TheSkeleton then (
													local	BoneIDs = (TheSkeleton.GetBoneIDs()),
															FoundID = (FindItem BoneIDs BoneTag)
													if FoundID != 0 then
														BoneIndex = FoundID
												)
											)
											local	SkipPhys = (
												BoneIndex == 1 and
												LODGroup.LODGroups[1].Count != 0
											)
											if not SkipPhys then (
												local	BeforeCount = LODGroup.LODGroups[1].Count
												CollectCodeWalkerModels ChildHigh LODGroup.LODGroups[1] Suffix:("_P" + ((i + 1) as String))
												for m = (BeforeCount + 1) to LODGroup.LODGroups[1].Count do (
													LODGroup.LODGroups[1][m].BoneID = BoneIndex
													LODGroup.LODGroups[1][m].IsPhysics = true
													LODGroup.LODGroups[1][m].PhysIndex = (i + 1)
												)
											)
										)
									)
								)
							)
						)
					)
				)
				if not Supplied TheSkeleton_FULL then (
					local	FoundSkel = ((grcSkeleton()).FindAndReadExternal DiskPath ObjName ExcludeObjName:ObjName)
					if Supplied FoundSkel then
						TheSkeleton_FULL = FoundSkel
				)
				true
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#DiskPath, #ObjName, #Extension, #TexPaths), #(DiskPath, ObjName, Extension, TexPaths)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn ReadCodeWalkerXML TexPaths = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	CWXML = GIMS.CurrentGame.Core.TypeLibrary.CWXML,
						FormatText = GIMS.Core.ValueOps.FormatText,
						FilePath = (FormatText v1:DiskPath v2:ObjName v3:Extension),
						XMLDoc = (CWXML.LoadDocument FilePath)
				if No XMLDoc then
					return false
				local	Root = XMLDoc.DocumentElement,
						DrawableNode = (CWXML.GetDrawableNode Root)
				(ReadCodeWalkerFromNode DrawableNode Root FilePath TexPaths)
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#DiskPath, #ObjName, #Extension, #TexPaths), #(DiskPath, ObjName, Extension, TexPaths)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Read TexPaths ReportProgress:true CachePath:undefined = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	ValueOps = GIMS.Core.ValueOps,
						FormatText = ValueOps.FormatText,
						FilePath = (
							FormatText \
								v1:DiskPath \
								v2:ObjName \
								v3:Extension
						),
						ExtName = (ToUpper (SubstituteString Extension "." ""))
				if No TexPaths then
					TexPaths = DiskPath
				if
					(MatchPattern ExtName Pattern:"XML") or
					(GIMS.CurrentGame.Core.TypeLibrary.CWXML.IsXMLFile FilePath)
				then
					return (ReadCodeWalkerXML TexPaths)
				if MatchPattern ExtName Pattern:"SKEL" then (
					local	grcSkeleton = GIMS.CurrentGame.Core.TypeLibrary.grcSkeleton
					TheSkeleton = (grcSkeleton DiskPath:DiskPath ObjName:ObjName Extension:Extension)
					if not (TheSkeleton.Read()) then
						return false
					LODGroup = (GIMS.CurrentGame.Core.TypeLibrary.grcLODGroup DiskPath:DiskPath)
					return true
				)
				local	TypeCast = ValueOps.TypeCast,
						BufferMgr = GIMS.Core.BufferMgr,
						ReadVal = BufferMgr.ReadVal,
						GetProgress = BufferMgr.GetProgress,
						UpdateProgress = GIMS.Core.GUIMgr.UpdateProgress,
						Skip = BufferMgr.Skip,
						StringOps = GIMS.Core.StringOps,
						oFTypeExec = StringOps.oFTypeExec,
						NoCaseOrderComparator = StringOps.NoCaseOrderComparator,
						\
						grcShadingGroup = GIMS.CurrentGame.Core.TypeLibrary.grcShadingGroup,
						grcSkeleton = GIMS.CurrentGame.Core.TypeLibrary.grcSkeleton,
						grcJoints = GIMS.CurrentGame.Core.TypeLibrary.grcJoints,
						grcLODGroup = GIMS.CurrentGame.Core.TypeLibrary.grcLODGroup,
						grcLightAttributes = GIMS.CurrentGame.Core.TypeLibrary.grcLightAttributes,
						grcPhBound = GIMS.CurrentGame.Core.TypeLibrary.grcPhBound,
						FormatText = ValueOps.FormatText,
						ArrayOps = GIMS.Core.ArrayOps,
						ObjectNames = GIMS.CurrentGame.Core.DB.ObjectNames,
						NotEOF = BufferMgr.NotEOF,
						BufferID = (
							BufferMgr.ReadFile (
								FormatText \
									v1:DiskPath \
									v2:ObjName \
									v3:Extension
							) Mode:#TxtLines
						),
						tLine,
						IsVersionValid = false
				ArrayOps.AppendMHL ObjectNames ObjName
				if BufferID == false then
					return false;
				if No TexPaths then
					TexPaths = DiskPath
				while
					(NotEOF BufferID) and
					(tLine = (ReadVal BufferID FilterStr:"\t "))[1] != "}"
				do ( /* skips end */
					local	Tag = (TypeCast tLine[1] name BufferID:BufferID)
					if ReportProgress then
						UpdateProgress #Progress (GetProgress BufferID)
					else
						UpdateProgress #None 0
					case Tag of (
						#Version: (
							if (oFTypeExec tLine #P2 IDMask:#{2, 3} BufferID:BufferID) != Version then (
								GIMS.Core.SystemMgr.AddResult #Error  (
									FormatText \
										v1:"Wrong version resource \"" \
										v2:DiskPath \
										v3:ObjName \
										v4:Extension \
										v5:"\""
								)
								return false;
							)
							Skip BufferID 1 /* skip start */
							IsVersionValid = true
						)
						#Shaders: (
							Skip BufferID 1 /* skip start */
							if
								tLine.Count == 1 or
								(TypeCast tLine[2] name BufferID:BufferID) != #NULL
							then (
								ShadingGroup = (grcShadingGroup DiskPath:DiskPath ObjName:ObjName)
								ShadingGroup.Read BufferID TexPaths
							)
						)
						#Skeleton: (
							local	PathParam = tLine[2]
							for i = 3 to tLine.Count do (
								Append PathParam " "
								Append PathParam tLine[i]
							)
							if (TypeCast PathParam name BufferID:BufferID) != #NULL then (
								local	SkelDiskPath = (DiskPath + (GetFileNamePath PathParam)),
										SkelObjName = (GetFileNameFile PathParam)
								TheSkeleton = (grcSkeleton DiskPath:SkelDiskPath ObjName:SkelObjName Extension:(GetFileNameType PathParam))
								if not (TheSkeleton.Read()) then
									return false;
							)
						)
						#LODGroup: (
							Skip BufferID 1 /* skip start */
							LODGroup = (grcLODGroup DiskPath:DiskPath)
							if not (LODGroup.Read BufferID ShadingGroup) then
								return false;
						)
						#Light: (
							local	PathParam = tLine[2]
							for i = 3 to tLine.Count do (
								Append PathParam " "
								Append PathParam tLine[i]
							)
							if (TypeCast PathParam name BufferID:BufferID) != #NULL then (
								LightAttributes = (grcLightAttributes DiskPath:(DiskPath + (GetFileNamePath PathParam)) ObjName:(GetFileNameFile PathParam) Extension:(GetFileNameType PathParam))
								if not (LightAttributes.Read()) then
									return false;
							)
						)
						#Bound: (
							local	PathParam = tLine[2]
							for i = 3 to tLine.Count do (
								Append PathParam " "
								Append PathParam tLine[i]
							)
							if (TypeCast PathParam name BufferID:BufferID) != #NULL then (
								Bound = (grcPhBound DiskPath:(DiskPath + (GetFileNamePath PathParam)) ObjName:(GetFileNameFile PathParam) Extension:(GetFileNameType PathParam))
								if not (
									Bound.Read \
										ReportProgress:false \
										BufferMgr:BufferMgr \
										Skip:Skip \
										ReadVal:ReadVal \
										TypeCast:TypeCast \
										oFTypeExec:oFTypeExec \
										GetProgress:GetProgress \
										UpdateProgress:UpdateProgress \
										FormatText:FormatText \
										NotEOF:NotEOF \
										grcPhBound:grcPhBound \
										ValueOps:ValueOps \
										AppendMHL:ArrayOps.AppendMHL \
										FetchMHL:ArrayOps.FetchMHL \
										QuickSearch:ArrayOps.QuickSearch \
										ObjectNames:ObjectNames \
										NoCaseOrderComparator:NoCaseOrderComparator \
										UpdateMatrix:ValueOps.UpdateMatrix
								) then
									return false;
							)
						)
						#Joints: (
							local	PathParam = tLine[2]
							for i = 3 to tLine.Count do (
								Append PathParam " "
								Append PathParam tLine[i]
							)
							if (TypeCast PathParam name BufferID:BufferID) != #NULL then (
								Joints = (grcJoints DiskPath:(DiskPath + (GetFileNamePath PathParam)) ObjName:(GetFileNameFile PathParam) Extension:(GetFileNameType PathParam))
								if not (Joints.Read()) then
									return false;
							)
						)
						Default: (
							if IsVersionValid then
								EGIMS_EHAbort "Unknown strDrawable tag: " Param1:tLine[1] BufferID:BufferID
							else (
								GIMS.Core.SystemMgr.AddResult #Error  (
									FormatText \
										v1:"Syntax error in Drawable resource \"" \
										v2:DiskPath \
										v3:ObjName \
										v4:Extension \
										v5:"\""
								)
								return false;
							)
						)
					)
				)
				BufferMgr.ClearBuffer BufferID
				local	Result = true
				if not Supplied TheSkeleton_FULL then (
					local	ExcludeName = undefined
					if Have TheSkeleton then
						ExcludeName = TheSkeleton.ObjName
					local	FoundSkel = ((grcSkeleton()).FindAndReadExternal DiskPath ObjName ExcludeObjName:ExcludeName)
					if Supplied FoundSkel then
						TheSkeleton_FULL = FoundSkel
				)
				Result
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#DiskPath, #ObjName, #Extension, #TexPaths), #(DiskPath, ObjName, Extension, TexPaths)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn WriteCodeWalkerInner SS Tab = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	CWXML = GIMS.CurrentGame.Core.TypeLibrary.CWXML,
						Inner = (Tab + " "),
						DName = ObjName,
						LodDists = #(9998.0, 9998.0, 9998.0, 9998.0),
						ModelNames = (CWXML.XMLModelNames()),
						BMin = [0, 0, 0],
						BMax = [0, 0, 0],
						Center = [0, 0, 0],
						Radius = 0.0,
						HaveBounds = false
				if
					Supplied XMLName and
					Have XMLName and
					XMLName.Count != 0
				then
					DName = XMLName
				if
					Have LODGroup and
					Have LODGroup.LODGroupValues
				then (
					for i = 1 to 4 do (
						if Have LODGroup.LODGroupValues[i] then
							LodDists[i] = LODGroup.LODGroupValues[i]
					)
				)
				if Have LODGroup then (
					for i = 1 to 4 do (
						local	LODMeshes = LODGroup.LODGroups[i]
						if Have LODMeshes then (
							for LODMesh in LODMeshes where not LODMesh.IsPhysics do (
								for Geom in LODMesh.Geometries do (
									if
										Have Geom and
										Have Geom.Positions
									then (
										for Pos in Geom.Positions do (
											if Have Pos then (
												if not HaveBounds then (
													BMin = Pos
													BMax = Pos
													HaveBounds = true
												) else (
													BMin = [(aMin BMin.x Pos.x), (aMin BMin.y Pos.y), (aMin BMin.z Pos.z)]
													BMax = [(aMax BMax.x Pos.x), (aMax BMax.y Pos.y), (aMax BMax.z Pos.z)]
												)
											)
										)
									)
								)
							)
						)
					)
				)
				if HaveBounds then (
					Center = ((BMin + BMax) / 2)
					Radius = ((Length (BMax - BMin)) / 2)
				)
				Format "%" (Tab + "<Drawable>\n") To:SS
				Format "%" (Inner + "<Name>" + (CWXML.XMLEscape DName) + "</Name>\n") To:SS
				Format "%" (Inner + "<Matrix>\n" + Inner + " 1 0 0\n" + Inner + " 0 1 0\n" + Inner + " 0 0 1\n" + Inner + " 0 0 0\n" + Inner + "</Matrix>\n") To:SS
				Format "%" (CWXML.Vec3Tag Inner "BoundingSphereCenter" Center) To:SS
				Format "%" (CWXML.ValueTag Inner "BoundingSphereRadius" Radius) To:SS
				Format "%" (CWXML.Vec3Tag Inner "BoundingBoxMin" BMin) To:SS
				Format "%" (CWXML.Vec3Tag Inner "BoundingBoxMax" BMax) To:SS
				Format "%" (CWXML.ValueTag Inner "LodDistHigh" LodDists[1]) To:SS
				Format "%" (CWXML.ValueTag Inner "LodDistMed" LodDists[2]) To:SS
				Format "%" (CWXML.ValueTag Inner "LodDistLow" LodDists[3]) To:SS
				Format "%" (CWXML.ValueTag Inner "LodDistVlow" LodDists[4]) To:SS
				Format "%" (CWXML.ValueTag Inner "FlagsHigh" 1) To:SS
				Format "%" (CWXML.ValueTag Inner "FlagsMed" 1) To:SS
				Format "%" (CWXML.ValueTag Inner "FlagsLow" 1) To:SS
				Format "%" (CWXML.ValueTag Inner "FlagsVlow" 1) To:SS
				if Have ShadingGroup then
					ShadingGroup.WriteCodeWalkerXML SS Inner
				if Have TheSkeleton then
					TheSkeleton.WriteCodeWalkerXML SS Inner
				if Have Joints then
					Joints.WriteCodeWalkerXML SS Inner
				if Have LODGroup then (
					for i = 1 to 4 do (
						local	LODMeshes = LODGroup.LODGroups[i],
								WroteHeader = false
						if Have LODMeshes then (
							for LODMesh in LODMeshes where not LODMesh.IsPhysics do (
								if not WroteHeader then (
									Format "%" (Inner + "<" + ModelNames[i] + ">\n") To:SS
									WroteHeader = true
								)
								LODMesh.WriteCodeWalkerXML SS (Inner + " ")
							)
							if WroteHeader then
								Format "%" (Inner + "</" + ModelNames[i] + ">\n") To:SS
						)
					)
				)
				Format "%" (Tab + "</Drawable>\n") To:SS
				OK
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn WriteCodeWalkerXML = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				global GIMS_CW_SRC
				global GIMS_CW_DST
				global GIMS_CW_NODE
				global GIMS_CW_STATUS
				global GIMS_CW_BONE_STATUS
				global GIMS_CW_BONE_INFO
				local	AddResult = GIMS.Core.SystemMgr.AddResult,
						FilePath = (DiskPath + ObjName + Extension),
						SrcPath = SourceXMLPath,
						HaveSrc = false,
						BonePatchOK = false
				/* Persist the edited pose in the data model before either writer runs.
				   The merge patch below remains as a second safeguard for source XML. */
				if Have TheSkeleton then
					try (TheSkeleton.SyncSceneTransforms (GetNodeByName ObjName)) catch ()
				GIMS_CW_STATUS = "none"
				try (
					if
						Supplied SrcPath and
						Have SrcPath
					then
						HaveSrc = (DoesFileExist SrcPath)
				) catch ()
				if not HaveSrc then (
					local	TryA = (DiskPath + ObjName + ".yft.xml"),
							TryB = (DiskPath + ObjName + ".ydr.xml"),
							TryC = (DiskPath + ObjName + Extension)
					if (DoesFileExist TryA) then (
						SrcPath = TryA
						HaveSrc = true
					) else if (DoesFileExist TryB) then (
						SrcPath = TryB
						HaveSrc = true
					) else if (DoesFileExist TryC) then (
						SrcPath = TryC
						HaveSrc = true
					)
				)
				MakeDir (GetFileNamePath FilePath) All:true
				if not HaveSrc then
					AddResult #Error "Can't export XML: original CodeWalker file was not found. Re-import the .yft.xml / .ydr.xml and export again."
				else (
					if (DoesFileExist FilePath) then
						try (DeleteFile FilePath) catch ()
					CopyFile SrcPath FilePath
					local	YtdSrc = (SubstituteString (SrcPath as String) ".yft.xml" ".ytd.xml"),
							YtdDst,
							PyFile = "",
							PyRan = false,
							PyCmd = ""
					try (PyFile = (GIMS.CurrentGame.FilesPath + "cw_xml_export.py")) catch ()
					GIMS_CW_SRC = (SrcPath as String)
					GIMS_CW_DST = (FilePath as String)
					GIMS_CW_NODE = (ObjName as String)
					GIMS_CW_STATUS = "none"
					GIMS_CW_BONE_STATUS = "unknown"
					GIMS_CW_BONE_INFO = ""
					if
						Have PyFile and
						(DoesFileExist PyFile)
					then (
						PyCmd = ("exec(open('" + (SubstituteString PyFile "\\" "/") + "', encoding='utf-8').read())")
						try (python.Init()) catch ()
						try (
							python.ExecuteFile PyFile
							PyRan = true
						) catch ()
						if not PyRan then (
							try (
								python.execute PyCmd
								PyRan = true
							) catch ()
						)
						if not PyRan then (
							try (
								python.Execute PyCmd
								PyRan = true
							) catch ()
						)
					) else
						AddResult #Error ("Missing bake script: " + (PyFile as String))
					if (GIMS_CW_STATUS as String) == "ok" then
						AddResult #Warning ("SUCCESS: Exported mesh and bones to:\n" + FilePath)
					else if not PyRan then
						AddResult #Error "Max Python did not run, so mesh edits were not baked. Enable Python in 3ds Max (Customize > Preferences > Python) and restart Max."
					else
						AddResult #Error ("Mesh bake did not finish: " + (GIMS_CW_STATUS as String) + "\nCopied original XML to:\n" + FilePath)
					local	BoneStatus = ((GIMS_CW_BONE_STATUS as String) as Name),
							BoneInfo = (GIMS_CW_BONE_INFO as String)
					case BoneStatus of (
						#missing_hierarchy_root:
							AddResult #Warning ("Skeleton sync fallback used because model root \"" + ObjName + "\" was not found in the scene hierarchy. " + BoneInfo)
						#scene_bones_missing:
							AddResult #Warning ("Skeleton sync found no scene bones. Ensure the export includes the model root and bone hierarchy, or keep meshes skinned to the correct bones. " + BoneInfo)
						#scene_bone_transforms_missing:
							AddResult #Warning ("Scene bones matched by name, but their transforms could not be read (locked/odd bone controllers?). Falling back to local patch. " + BoneInfo)
						#skeleton_missing:
							AddResult #Error ("Source XML has no <Skeleton> block to patch. Re-import from a valid CodeWalker YFT/YDR containing a skeleton. " + BoneInfo)
						#skeleton_created:
							AddResult #Warning ("Source XML had no <Skeleton> block, so one was built from scene bones instead of patched. " + BoneInfo)
						#no_matching_scene_bones:
							AddResult #Warning ("Scene bones were found, but none matched skeleton entries in XML. Check renamed/detached bones and skin references. " + BoneInfo)
						#ok:
							AddResult #Warning ("Bone sync OK: " + BoneInfo)
						default:
							AddResult #Warning ("Bone sync returned a status this script version doesn't recognize: \"" + (BoneStatus as String) + "\". " + BoneInfo)
					)
					global GIMS_CW_FALLBACK_SKIPPED
					GIMS_CW_FALLBACK_SKIPPED = 0
					if BoneStatus == #ok or BoneStatus == #skeleton_created then
						BonePatchOK = true
					else
						try (BonePatchOK = (CWXML.PatchXMLSkeletonFromScene FilePath ObjName)) catch ()
					/* This used to only fire when BoneStatus == #unknown, so any of the
					   OTHER failure statuses (scene_bone_transforms_missing, scene_bones_missing,
					   no_matching_scene_bones, missing_hierarchy_root, skeleton_missing) that
					   still ended up with BonePatchOK == false went completely unreported here -
					   the case statement above is now exhaustive so those already print their
					   own line, but this still needs to run for all of them, not just #unknown. */
					if
						not BonePatchOK and
						BoneStatus != #ok and
						BoneStatus != #skeleton_created
					then
						AddResult #Warning "No scene bone transforms matched the XML skeleton; the exported file kept its original bone positions."
					if GIMS_CW_FALLBACK_SKIPPED > 0 then
						AddResult #Warning (
							"Local bone-patch fallback skipped " + (GIMS_CW_FALLBACK_SKIPPED as String) +
							" bone(s) whose local transform couldn't be computed (odd parenting/controller?) " +
							"rather than writing a zeroed-out value for them - check those bones manually."
						)
					if YtdSrc == (SrcPath as String) then
						YtdSrc = (SubstituteString (SrcPath as String) ".ydr.xml" ".ytd.xml")
					if
						(YtdSrc != (SrcPath as String)) and
						(DoesFileExist YtdSrc)
					then (
						YtdDst = (SubstituteString (FilePath as String) ".yft.xml" ".ytd.xml")
						if YtdDst == (FilePath as String) then
							YtdDst = (SubstituteString (FilePath as String) ".ydr.xml" ".ytd.xml")
						if YtdDst != (FilePath as String) then (
							if (DoesFileExist YtdDst) then
								try (DeleteFile YtdDst) catch ()
							try (CopyFile YtdSrc YtdDst) catch ()
						)
					)
				)
				local	TexSearchXMLs = #(SrcPath)
				if
					Supplied SourceXMLOrigPath and
					Have SourceXMLOrigPath and
					((SourceXMLOrigPath as String) != (SrcPath as String))
				then
					Append TexSearchXMLs SourceXMLOrigPath
				try (
					PrepareCodeWalkerTextures FilePath TexSearchXMLs TexFolders:SourceTexPath
				) catch ()
				OK
			/*<ERRHANDLER>*/) catch (
				try (GIMS.Core.SystemMgr.AddResult #Error ("XML export failed: " + (GetCurrentException()))) catch ()
				OK
			)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Write Progress:unsupplied = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	UseXML = (GIMS.CurrentGame.Core.TypeLibrary.CWXML.IsXMLExport Extension SourceFormat:SourceFormat)
				if not UseXML then (
					if SourceFormat == #XML then
						UseXML = true
					else if
						Supplied SourceXMLPath and
						Have SourceXMLPath
					then
						UseXML = true
				)
				if UseXML then
					WriteCodeWalkerXML()
				else (
				if No LODGroup then
					throw "No LODGroup"
				if not Supplied Progress then
					Progress = [0, 0, 4]
				local	UpdateProgress = GIMS.Core.GUIMgr.UpdateProgress,
						BufferMgr = GIMS.Core.BufferMgr,
						ValueOps = GIMS.Core.ValueOps,
						StringOps = GIMS.Core.StringOps,
						NoCaseOrderComparator = StringOps.NoCaseOrderComparator,
						ToHighReg = StringOps.ToHighReg,
						ArrayOps = GIMS.Core.ArrayOps,
						FormatText = ValueOps.FormatText,
						WriteVal = BufferMgr.WriteVal,
						AsoFText = ValueOps.AsoFText,
						TypeCast = ValueOps.TypeCast,
						ObjDir = (DiskPath + ObjName),
						FilePath = (ObjDir + Extension),
						BufferID = (BufferMgr.Create Mode:#TxtLines FilePath:FilePath),
						SubDir = (ObjName + "\\"),
						SubPath = (DiskPath + SubDir),
						HaveMeshes = false,
						LODGroups = LODGroup.LODGroups,
						HaveShadingGroup = (Have ShadingGroup),
						HaveTheSkeleton = (Have TheSkeleton),
						HaveJoints = (Have Joints),
						HaveBound = (Have Bound),
						HaveLightAttributes = (Have LightAttributes),
						TabString = "\t",
						BraceOpen = "{",
						BraceClose = "}",
						TabBraceOpen = (TabString + BraceOpen),
						TabBraceClose = (TabString + BraceClose)
				if BufferID != false then (
					ArrayOps.AppendMHL GIMS.CurrentGame.Core.DB.ObjectNames ObjName
					for LODGroup in LODGroups while not HaveMeshes where LODGroup.Count != 0 do
						HaveMeshes = true
					if
						HaveTheSkeleton or
						HaveJoints or
						HaveBound or
						HaveLightAttributes or
						HaveShadingGroup or
						HaveMeshes
					then
						MakeDir SubPath All:true
					WriteVal BufferID (AsoFText Version TypeHook:Integer TabString:"Version ")
					WriteVal BufferID BraceOpen
					if HaveShadingGroup then (
						WriteVal BufferID "\tShaders"
						WriteVal BufferID TabBraceOpen
						ShadingGroup.Write BufferID SubDir SubPath
						WriteVal BufferID TabBraceClose
					) else
						WriteVal BufferID "\tShaders null"
					Progress.x += 1
					UpdateProgress #Progress Progress
					if HaveTheSkeleton then (
						TheSkeleton.ObjName = ObjName
						TheSkeleton.DiskPath = SubPath
						WriteVal BufferID (
							FormatText \
							v1:"\tSkeleton " \
							v2:SubDir \
							v3:ObjName \
							v4:TheSkeleton.Extension
						)
						TheSkeleton.Write()
					) else
						WriteVal BufferID "\tSkeleton null"
					Progress.x += 1
					UpdateProgress #Progress Progress
					WriteVal BufferID "\tLodGroup"
					WriteVal BufferID TabBraceOpen
					LODGroup.DiskPath = SubPath
					LODGroup.Write BufferID SubDir ShadingGroup
					Progress.x += 1
					UpdateProgress #Progress Progress
					WriteVal BufferID TabBraceClose
					if HaveLightAttributes then (
						LightAttributes.ObjName = ObjName
						LightAttributes.DiskPath = SubPath
						WriteVal BufferID (
							FormatText \
							v1:"\tLight " \
							v2:SubDir \
							v3:ObjName \
							v4:LightAttributes.Extension
						)
						LightAttributes.Write()
					) else
						WriteVal BufferID "\tLight null"
					if HaveBound then (
						local	BoundExtension = ".bound"
						Bound.ObjName = ObjName
						Bound.Extension = BoundExtension
						Bound.DiskPath = SubPath
						WriteVal BufferID (
							FormatText \
							v1:"\tBound " \
							v2:SubDir \
							v3:ObjName \
							v4:BoundExtension
						)
						Bound.Write \
							NoCaseOrderComparator:NoCaseOrderComparator \
							ToHighReg:ToHighReg \
							BufferMgr:BufferMgr \
							WriteVal:WriteVal \
							ValueOps:ValueOps \
							FormatText:FormatText \
							AsoFText:AsoFText \
							TypeCast:TypeCast \
							UpdateProgress:UpdateProgress \
							ArrayOps:ArrayOps \
							Modify:ArrayOps.Modify \
							ReportProgress:false
					) else
						WriteVal BufferID "\tBound null"
					if HaveJoints then (
						Joints.ObjName = ObjName
						Joints.DiskPath = SubPath
						WriteVal BufferID (
							FormatText \
							v1:"\tJoints " \
							v2:SubDir \
							v3:ObjName \
							v4:Joints.Extension
						)
						Joints.Write()
					) else
						WriteVal BufferID "\tJoints null"
					WriteVal BufferID BraceClose
					BufferMgr.WriteFile BufferID FilePath:FilePath
					BufferMgr.ClearBuffer BufferID
					Progress.x += 1
					UpdateProgress #Progress Progress
				) else
					EGIMS_EHAbort ("Can't write file " + (TempFilePath as String))
				)
				OK
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#DiskPath, #ObjName, #Extension), #(DiskPath, ObjName, Extension)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Create ParentNode ReportProgress:true Progress:unsupplied IsSeparate:true = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if
					ReportProgress and
					not Supplied Progress
				then
					Progress = [0, 0, 4]
				local	UpdateProgress = GIMS.Core.GUIMgr.UpdateProgress,
						Result = (GIMS.Core.ObjectMgr.CreateIfUnique ObjName ParentNode:ParentNode AllowSearch:false NodeType:EGIMS_V_Model),
						ParentTM = (
							if IsSeparate then (
								if ParentNode == RootNode then
									(Matrix3 1)
								else
									ParentNode.Transform
							)
						),
						BoneNodes = #(Result)
				if Have LODGroup then
					Result.LODGroupValues = LODGroup.LODGroupValues
				if ReportProgress then (
					Progress.x += 1
					UpdateProgress #Progress Progress
				) else
						UpdateProgress #None 0
				local	HaveTheSkeleton = (Have TheSkeleton),
						HaveTheSkeleton_FULL = (Supplied TheSkeleton_FULL),
						ActiveSkeleton = (
							if HaveTheSkeleton_FULL then
								TheSkeleton_FULL
							else
								TheSkeleton
						),
						HaveActiveSkeleton = (Have ActiveSkeleton)
				if HaveTheSkeleton then
					Result.DataCRC = TheSkeleton.DataCRC
				else
					Result.UseBones = false
				if HaveActiveSkeleton then (
					BoneNodes.Count = ActiveSkeleton.NumBones
					ActiveSkeleton.Create Result BoneNodes
					if Have Joints then
						Joints.Create BoneNodes
				)
				if ReportProgress then (
					Progress.x += 1
					UpdateProgress #Progress Progress
				) else
						UpdateProgress #None 0
				if Have LODGroup then
					LODGroup.Create BoneNodes ShadingGroup TheSkeleton HaveTheSkeleton TheSkeleton_FULL HaveTheSkeleton_FULL HaveActiveSkeleton
				if ReportProgress then (
					Progress.x += 1
					UpdateProgress #Progress Progress
				) else
						UpdateProgress #None 0
				if Have LightAttributes then
					LightAttributes.Create BoneNodes
				if ReportProgress then (
					Progress.x += 1
					UpdateProgress #Progress Progress
				) else
					UpdateProgress #None 0
				if Have Bound then
					Bound.Create BoneNodes[1]
				if
					IsSeparate and
					Have Result
				then
					Result.Transform = ParentTM
				GIMS.CurrentGame.Core.TypeLibrary.CWXML.TagSceneNode Result SourceFormat Extension Kind:XMLKind SourceXML:SourceXMLPath SourceXMLOrig:SourceXMLOrigPath TexFolder:SourceTexPath
				Result
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#DiskPath, #ObjName, #Extension), #(DiskPath, ObjName, Extension)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		)
	)
	struct /*#PC*PATH	GIMS.CurrentGame.Core.TypeLibrary.grcDrawableDictionary*/ strDrawableDictionary (
		GIMSObjectLink = "GIMS.CurrentGame.Core.TypeLibrary.grcDrawableDictionary",
		DiskPath,
		ObjName,
		Extension = ".odd",
		Version = [165, 32],
		SourceFormat = #OpenFormats,
		SourceXMLPath = unsupplied,
		Items = #(),

		fn CheckLocked = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	Locked = false
				for Item in Items while not Locked do
					Locked = (Item.CheckLocked())
				Locked
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn PostCacheLoad CachePath = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				/*
				Items[0]
					LightAttributes
					TheSkeleton
					LODGroup.LODGroups[0].LODMesh
				*/
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#CachePath), #(CachePath)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn ReadCodeWalkerXML TexPaths = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	CWXML = GIMS.CurrentGame.Core.TypeLibrary.CWXML,
						FormatText = GIMS.Core.ValueOps.FormatText,
						FilePath = (FormatText v1:DiskPath v2:ObjName v3:Extension),
						XMLDoc = (CWXML.LoadDocument FilePath)
				if No XMLDoc then
					return false
				if No TexPaths then
					TexPaths = DiskPath
				SourceFormat = #XML
				SourceXMLOrigPath = FilePath
				SourceTexPath = TexPaths
				SourceXMLPath = (CWXML.CacheSourceXML FilePath)
				ObjName = (CWXML.CleanResourceName ObjName)
				Extension = (CWXML.GetKindExtension #DrawableDictionary)
				local	Root = XMLDoc.DocumentElement,
						ItemNodes = (Root.SelectNodes "Item"),
						grcDrawable = GIMS.CurrentGame.Core.TypeLibrary.grcDrawable,
						grcSkeleton = GIMS.CurrentGame.Core.TypeLibrary.grcSkeleton
				if ItemNodes.Count == 0 then
					ItemNodes = (Root.SelectNodes "Drawables/Item")
				if ItemNodes.Count == 0 then
					ItemNodes = (Root.SelectNodes "Drawable")
				local	ItemCount = ItemNodes.Count,
						TheSkeleton_FULL = ((grcSkeleton()).FindAndReadExternal DiskPath ObjName)
				Items.Count = ItemCount
				for i = 0 to (ItemCount - 1) do (
					local	ItemNode = (ItemNodes.Item[i]),
							ItemName = (CWXML.GetChildText ItemNode "Name" DefaultVal:(ObjName + "_" + ((i + 1) as String))),
							NewItem = (grcDrawable DiskPath:DiskPath ObjName:ItemName Extension:Extension TheSkeleton_FULL:TheSkeleton_FULL)
					if not (NewItem.ReadCodeWalkerFromNode ItemNode Root FilePath TexPaths) then
						return false
					Items[i + 1] = NewItem
				)
				true
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#DiskPath, #ObjName, #Extension, #TexPaths), #(DiskPath, ObjName, Extension, TexPaths)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Read TexPaths ReportProgress:true CachePath:undefined = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	ValueOps = GIMS.Core.ValueOps,
						FormatText = ValueOps.FormatText,
						FilePath = (
							FormatText \
								v1:DiskPath \
								v2:ObjName \
								v3:Extension
						),
						ExtName = (ToUpper (SubstituteString Extension "." ""))
				if
					(MatchPattern ExtName Pattern:"XML") or
					(GIMS.CurrentGame.Core.TypeLibrary.CWXML.IsXMLFile FilePath)
				then
					return (ReadCodeWalkerXML TexPaths)
				local	tLine,
						BufferMgr = GIMS.Core.BufferMgr,
						ReadVal = BufferMgr.ReadVal,
						Skip = BufferMgr.Skip,
						StringOps = GIMS.Core.StringOps,
						oFTypeExec = StringOps.oFTypeExec,
						TypeCast = ValueOps.TypeCast,
						\
						grcDrawable = GIMS.CurrentGame.Core.TypeLibrary.grcDrawable,
						grcSkeleton = GIMS.CurrentGame.Core.TypeLibrary.grcSkeleton,
						GetProgress = BufferMgr.GetProgress,
						UpdateProgress = GIMS.Core.GUIMgr.UpdateProgress,
						BufferID = (BufferMgr.ReadFile FilePath Mode:#TxtLines),
						NewItem,
						NotEOF = BufferMgr.NotEOF
				GIMS.Core.ArrayOps.AppendMHL GIMS.CurrentGame.Core.DB.ObjectNames ObjName
				if BufferID == false then
					return false;
				if No TexPaths then
					TexPaths = DiskPath
				local	IsVersionValid = false,
						TheSkeleton_FULL = ((grcSkeleton()).FindAndReadExternal DiskPath ObjName)
				local	tRAWLine,
						ItemCount = 0
				Items.Count = 20
				while
					(NotEOF BufferID) and
					(TrimLeft (tRAWLine = (ReadVal BufferID)))[1] != "}"
				do (	--skips end
					local	tLine = (FilterString tRAWLine "\t ")
					if tLine.Count > 0 then (
						local	Tag = (TypeCast tLine[1] name BufferID:BufferID)
						case Tag of (
							#Version: (
								if (oFTypeExec tLine #P2 IDMask:#{2, 3} BufferID:BufferID) != Version then (
									GIMS.Core.SystemMgr.AddResult #Error  (
										FormatText \
											v1:"Wrong version resource \"" \
											v2:DiskPath \
											v3:ObjName \
											v4:Extension \
											v5:"\""
									)
									return false;
								)
								Skip BufferID 1 /* skip dict start */
								IsVersionValid = true
							)
							Default: (
								if IsVersionValid then (
									local	SubPath = (FilterString tRAWLine "\t")[1]
									NewItem = (grcDrawable DiskPath:(DiskPath + (GetFileNamePath SubPath)) ObjName:(GetFileNameFile SubPath) TheSkeleton_FULL:TheSkeleton_FULL)
									if not (NewItem.Read TexPaths ReportProgress:false) then
										return false;
									ItemCount += 1
									Items[ItemCount] = NewItem
								) else (
									GIMS.Core.SystemMgr.AddResult #Error  (
										FormatText \
											v1:"Syntax error in Drawable resource \"" \
											v2:DiskPath \
											v3:ObjName \
											v4:Extension \
											v5:"\""
									)
									return false;
								)
							)
						)
						if ReportProgress then
							UpdateProgress #Progress (GetProgress BufferID)
						else
							UpdateProgress #None 0
					)
				)
				Items.Count = ItemCount
				BufferMgr.ClearBuffer BufferID
				true
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#DiskPath, #ObjName, #Extension, #TexPaths), #(DiskPath, ObjName, Extension, TexPaths)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn WriteCodeWalkerXML = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	CWXML = GIMS.CurrentGame.Core.TypeLibrary.CWXML,
						FilePath = (DiskPath + ObjName + Extension),
						SS = (StringStream "")
				Format "%" "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" To:SS
				Format "%" "<DrawableDictionary>\n" To:SS
				for Item in Items do (
					if Have Item then
						Item.WriteCodeWalkerInner SS " "
				)
				Format "%" "</DrawableDictionary>\n" To:SS
				local	Merged = false
				if
					Supplied SourceXMLPath and
					Have SourceXMLPath and
					(DoesFileExist SourceXMLPath)
				then
					Merged = (CWXML.MergeEditedXML SourceXMLPath (SS as String) FilePath #DrawableDictionary)
				if not Merged then
					CWXML.WriteXMLFile FilePath (SS as String)
				Free SS
				OK
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#DiskPath, #ObjName, #Extension), #(DiskPath, ObjName, Extension)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Write = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if (GIMS.CurrentGame.Core.TypeLibrary.CWXML.IsXMLExport Extension SourceFormat:SourceFormat) then
					return (WriteCodeWalkerXML())
				local	BufferMgr = GIMS.Core.BufferMgr,
						ValueOps = GIMS.Core.ValueOps,
						FormatText = GIMS.Core.ValueOps.FormatText,
						WriteVal = BufferMgr.WriteVal,
						ObjDir = (DiskPath + ObjName),
						FilePath = (ObjDir + Extension),
						BufferID = (BufferMgr.Create Mode:#TxtLines FilePath:FilePath),
						SubDir = (ObjName + "\\"),
						SubPath = (DiskPath + SubDir),
						UpdateProgress = GIMS.Core.GUIMgr.UpdateProgress,
						ItemHeader = ("\t" + SubDir),
						Progress = [0, 0, Items.Count * 4]
				GIMS.Core.ArrayOps.AppendMHL GIMS.CurrentGame.Core.DB.ObjectNames ObjName
				MakeDir ObjDir All:true
				WriteVal BufferID (ValueOps.AsoFText Version TypeHook:Integer TabString:"Version ")
				WriteVal BufferID "{"
				for Item in Items do (
					WriteVal BufferID (
						FormatText \
							v1:ItemHeader \
							v2:Item.ObjName \
							v3:Item.Extension
					)
					Item.DiskPath = SubPath
					Item.Write Progress:Progress
				)
				WriteVal BufferID "}"
				BufferMgr.WriteFile BufferID FilePath:FilePath
				BufferMgr.ClearBuffer BufferID
				OK
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#DiskPath, #ObjName, #Extension), #(DiskPath, ObjName, Extension)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Create ParentNode ReportProgress:true = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	Result = (GIMS.Core.ObjectMgr.CreateIfUnique ObjName ParentNode:ParentNode AllowSearch:false NodeType:EGIMS_V_ModelDict),
						ItemCount = Items.Count,
						Progress = [0, 0, ItemCount * 4]
				for i = 1 to ItemCount do
					Items[i].Create Result ReportProgress:ReportProgress Progress:Progress IsSeparate:false
				if
					Have Result and
					ParentNode != RootNode
				then
					Result.Transform = ParentNode.Transform
				GIMS.CurrentGame.Core.TypeLibrary.CWXML.TagSceneNode Result SourceFormat Extension Kind:#DrawableDictionary SourceXML:SourceXMLPath
				Result
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#DiskPath, #ObjName, #Extension), #(DiskPath, ObjName, Extension)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		)
	)
	
/*paths*/

	struct /*#PC*PATH	GIMS.CurrentGame.Core.TypeLibrary.grcDistantLightGroup*/ strDistantLightGroup (	--TODO remove debug blocks; create
		GIMSObjectLink = "GIMS.CurrentGame.Core.TypeLibrary.grcDistantLightGroup",
		Centroid,
		Radius,
		PointOffset,
		PointCount,
		Flags,
		DisplayProperties,
		DistanceOffset,
		RandomSeed,
		
		/*TODO remove, debug*/
		CollectionIndex,
		/**/
					
		fn Read BufferID ReadVal = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				Centroid = (ReadVal BufferID MAXType:#P3 BinType:#Short)
				Radius = (ReadVal BufferID BinType:#Short)
				PointOffset = (ReadVal BufferID BinType:#Short)
				PointCount = (ReadVal BufferID BinType:#Short)
				Flags = (ReadVal BufferID BinType:#UShort)
				DisplayProperties = (ReadVal BufferID BinType:#UShort)
				DistanceOffset = (ReadVal BufferID BinType:#Float)
				RandomSeed = (ReadVal BufferID BinType:#Int)
				OK
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Write BufferID WriteVal = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				WriteVal BufferID Centroid BinType:#Short
				WriteVal BufferID Radius BinType:#Short
				WriteVal BufferID PointOffset BinType:#Short
				WriteVal BufferID PointCount BinType:#Short
				WriteVal BufferID Flags BinType:#UShort
				WriteVal BufferID DisplayProperties BinType:#UShort
				WriteVal BufferID DistanceOffset BinType:#Float
				WriteVal BufferID RandomSeed BinType:#Int
				OK
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Create ParentNode Points/*TODO remove, debug*/ UsedPoints/**/ = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (				
				local	spath = (SplineShape Parent:ParentNode WireColor:Blue Name:(CollectionIndex as String)/*TODO remove, debug*/ VertexTicks:true/**/)	--TODO remake to some other object name
				AddNewSpline spath
				for i = 1 to PointCount do (
					AddKnot spath 1 #Corner #Line Points[PointOffset + i]
					/*TODO remove, debug*/
					if UsedPoints[PointOffset + i] then
						Format "Point % reused" (PointOffset + i)
					else
						UsedPoints[PointOffset + i] = true
					/**/
				)
				UpdateShape spath
				spath.Pivot = Centroid
				spath
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		)
	)
	struct /*#PC*PATH	GIMS.CurrentGame.Core.TypeLibrary.grcDistantLights*/ strDistantLights (	--TODO remove debug blocks; create
		GIMSObjectLink = "GIMS.CurrentGame.Core.TypeLibrary.grcDistantLights",
		DiskPath,
		ObjName,
		Extension = ".dat",
		Points,
		Groups,
		FirstGroups,
		CoastalGroupNums,
		InlandGroupNums,

		fn Read ReportProgress:true CachePath:undefined = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	tLine,
						BufferMgr = GIMS.Core.BufferMgr,
						ReadVal = BufferMgr.ReadVal,
						grcDistantLightGroup = GIMS.CurrentGame.Core.TypeLibrary.grcDistantLightGroup,
						BufferID = (
							BufferMgr.ReadFile (
								GIMS.Core.ValueOps.FormatText \
									v1:DiskPath \
									v2:ObjName \
									v3:Extension
							) Mode:#NETBinStream BigEndian:true
						),
						SectorCount = 1024
				if BufferID == false then
					return false;
				local	m_numPoints = (ReadVal BufferID BinType:#Int),
						m_numGroups = (ReadVal BufferID BinType:#Int)
				FirstGroups = (ReadVal BufferID MAXType:#Array Size:SectorCount BinType:#Int)
				CoastalGroupNums = (ReadVal BufferID MAXType:#Array Size:SectorCount BinType:#Int)
				InlandGroupNums = (ReadVal BufferID MAXType:#Array Size:SectorCount BinType:#Int)
				Points = (ReadVal BufferID MAXType:#Array Size:m_numPoints ArrayItemMAXType:#P3 BinType:#Short)
				Groups = #()
				Groups.Count = m_numGroups
				for i = 1 to m_numGroups do (
					--TODO uncomment, working code	local	grp = (grcDistantLightGroup())
					/*TODO remove, debug*/
					local	grp = (grcDistantLightGroup CollectionIndex:i)
					/**/
					grp.Read BufferID ReadVal
					Groups[i] = grp
				)
				BufferMgr.ClearBuffer BufferID
				true
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Write = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	BufferMgr = GIMS.Core.BufferMgr,
						WriteVal = BufferMgr.WriteVal,
						FilePath = (
							GIMS.Core.ValueOps.FormatText \
								v1:DiskPath \
								v2:ObjName \
								v3:Extension
						),
						BufferID = (BufferMgr.Create FilePath:FilePath Mode:#NETBinStream BigEndian:true)
				if BufferID != false then (
					WriteVal BufferID Points.Count BinType:#Int
					WriteVal BufferID Groups.Count BinType:#Int
					WriteVal BufferID FirstGroups BinType:#Int
					WriteVal BufferID CoastalGroupNums BinType:#Int
					WriteVal BufferID InlandGroupNums BinType:#Int
					WriteVal BufferID Points BinType:#Short
					for grp in Groups do
						grp.Write BufferID WriteVal
					BufferMgr.WriteFile BufferID FilePath:FilePath
					BufferMgr.ClearBuffer BufferID
				) else
					EGIMS_EHAbort ("Can't write file " + (TempFilePath as String))
				OK
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Create ParentNode ReportProgress:true = (	--TODO test and make properly
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
			
				/*TODO remove, debug*/
				local	UsedPoints = #{}
				UsedPoints.Count = Points.Count
				/**/
				
				local	UpdateProgress,
						ProgressData,
						Result = (Dummy Name:"DistantLights")	--TODO create GIMS object
				if ReportProgress then (
					UpdateProgress = GIMS.Core.GUIMgr.UpdateProgress
					ProgressData = [0, 0, Groups.Count]
				)
				for grp in Groups do (
					if ReportProgress then (
						ProgressData.x += 1
						UpdateProgress #Progress ProgressData
					)
					grp.Create Result Points/*TODO remove, debug*/ UsedPoints/**/
				)
			
				/*TODO remove, debug*/
				local	d = (Dummy Name:"DEBUG" Parent:Result),
						SS = (StringStream ""),
						sid = 1
				for sy = 0 to 31 do (
					local	blockY = (((sy + 0.5) * 512.0) - 8192.0)
					for sx = 0 to 31 do (
						local	blockX = (((sx + 0.5) * 512.0) - 8192.0)
						Format "F %\r\nC %\r\nI %" FirstGroups[sid] CoastalGroupNums[sid] InlandGroupNums[sid] To:SS
						(Text Pos:[blockX, blockY + 110, 1000] Text:(SS as String) Size:150 WireColor:Black ShowFrozenInGray:false Parent:d).IsFrozen = true
						Free SS
						sid += 1
					)
				)
				(Plane Pos:[0, 0, -1000] length:16384 width:16384 lengthsegs:32 widthsegs:32 WireColor:Black ShowFrozenInGray:false Parent:d).IsFrozen = true
				/**/
				
				Result
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		)
	)
	
	struct /*#PC*PATH	GIMS.CurrentGame.Core.TypeLibrary.grcVehicleRecordingItem*/ strVehicleRecordingItem (	--TODO	test-read	test-create	test-write
		GIMSObjectLink = "GIMS.CurrentGame.Core.TypeLibrary.grcVehicleRecordingItem",
		KeyTime = 0,
		Position = [0, 0, 0],
		Right = [1, 0, 0],
		Top = [0, 1, 0],
		Velocity = #(0, 0, 0),
		SteeringAngle = 0,
		GasPedalPower = 0,
		BreakPedalPower = 0,
		UseHandBrake = false,
		
		fn Read BufferID = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	tLine,
						BufferMgr = GIMS.Core.BufferMgr,
						ReadVal = BufferMgr.ReadVal,
						oFTypeExec = GIMS.Core.StringOps.oFTypeExec,
						TypeCast = GIMS.Core.ValueOps.TypeCast
				while (tLine = (ReadVal BufferID FilterStr:"\t "))[1] != "}" do ( /* skips end */
					local	Tag = (TypeCast tLine[1] name BufferID:BufferID)
					case Tag of (
						#Time:	--46692
							KeyTime = ((TypeCast tLine[2] Float BufferID:BufferID) / frameRate)
						#Position:	--724.52000000 -4341.40100000 385.90720000
							Position = (oFTypeExec tLine #P3 IDMask:#{2..4} BufferID:BufferID)
						#Velocity:	--56.59231000 -32.89773000 9.45585600
							Velocity = (oFTypeExec tLine #FloatArray IDMask:#{2..4} BufferID:BufferID)
						#Right:	---0.49606300 -0.85826770 0.00000000
							Right = (oFTypeExec tLine #P3 IDMask:#{2..4} BufferID:BufferID)
						#Top:	--0.85039370 -0.48818900 0.17322830
							Top = (oFTypeExec tLine #P3 IDMask:#{2..4} BufferID:BufferID)
						#SteeringAngle:	--0.00000000
							SteeringAngle = (-(RadToDeg (TypeCast tLine[2] Float BufferID:BufferID)))
						#GasPedalPower:	--1.00000000
							GasPedalPower = (TypeCast tLine[2] Float BufferID:BufferID)
						#BreakPedalPower:	--0.00000000
							BreakPedalPower = (TypeCast tLine[2] Float BufferID:BufferID)
						#UseHandBrake:	--false
							UseHandBrake = (TypeCast tLine[2] BooleanClass BufferID:BufferID)
						default:
							EGIMS_EHAbort "Unknown strVehicleRecordingItem tag: " Param1:tLine[1] BufferID:BufferID
					)
				)
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Write BufferID TabString = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	BufferMgr = GIMS.Core.BufferMgr,
						WriteVal = BufferMgr.WriteVal,
						ValueOps = GIMS.Core.ValueOps,
						CopyBits = ValueOps.CopyBits,
						AsoFText = ValueOps.AsoFText,
						FormatText = ValueOps.FormatText,
						SubTabString = (TabString + "\t"),
						FloatFmtStr = "0.6f"
				GIMS.Core.GUIMgr.UpdateProgress #None 0
				WriteVal BufferID (TabString + "Item")
				WriteVal BufferID (TabString + "{")
				WriteVal BufferID (FormatText v1:SubTabString v2:"Time " v3:((KeyTime * frameRate) as Integer))
				WriteVal BufferID (AsoFText Position 	TabString:(SubTabString + "Position "))	
				WriteVal BufferID (AsoFText Velocity 	TabString:(SubTabString + "Velocity "))	
				WriteVal BufferID (AsoFText Right 		TabString:(SubTabString + "Right "))	
				WriteVal BufferID (AsoFText Top 		TabString:(SubTabString + "Top "))	
				WriteVal BufferID (FormatText v1:SubTabString v2:"SteeringAngle " 	v3:(FormattedPrint (DegToRad (-SteeringAngle)) Format:FloatFmtStr))	
				WriteVal BufferID (FormatText v1:SubTabString v2:"GasPedalPower " 	v3:(FormattedPrint GasPedalPower Format:FloatFmtStr))	
				WriteVal BufferID (FormatText v1:SubTabString v2:"BreakPedalPower "	v3:(FormattedPrint BreakPedalPower Format:FloatFmtStr))	
				WriteVal BufferID (FormatText v1:SubTabString v2:"UseHandBrake "	v3:(FormattedPrint UseHandBrake Format:FloatFmtStr))	
				WriteVal BufferID (TabString + "}")
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Create ThisObj AnimNode /*TODO remove, debug*mtxMode/**/ = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	vR = (Normalize Right),
						vT = (Normalize Top),
						vF = (Normalize (Cross vR vT)),
						rotMtx = (Matrix3 vR vT vF [0,0,0]),
						rot = (rotMtx.Rotation as EulerAngles)
				
				/*TODO remove, debug*
				case mtxMode of (
					1:	rotMtx = (Matrix3 vR vF vT [0,0,0])
					2:	rotMtx = (Matrix3 vR vT vF [0,0,0])
					3:	rotMtx = (Matrix3 vF vR vT [0,0,0])
					4:	rotMtx = (Matrix3 vF vT vR [0,0,0])
					5:	rotMtx = (Matrix3 vT vF vR [0,0,0])
					6:	rotMtx = (Matrix3 vT vR vF [0,0,0])
						
					7:	rotMtx = (Matrix3 -vR vF vT [0,0,0])
					8:	rotMtx = (Matrix3 -vR vT vF [0,0,0])
					9:	rotMtx = (Matrix3 -vF vR vT [0,0,0])
					10:	rotMtx = (Matrix3 -vF vT vR [0,0,0])
					11:	rotMtx = (Matrix3 -vT vF vR [0,0,0])
					12:	rotMtx = (Matrix3 -vT vR vF [0,0,0])

					13:	rotMtx = (Matrix3 vR -vF vT [0,0,0])
					14:	rotMtx = (Matrix3 vR -vT vF [0,0,0])
					15:	rotMtx = (Matrix3 vF -vR vT [0,0,0])
					16:	rotMtx = (Matrix3 vF -vT vR [0,0,0])
					17:	rotMtx = (Matrix3 vT -vF vR [0,0,0])
					18:	rotMtx = (Matrix3 vT -vR vF [0,0,0])

					19:	rotMtx = (Matrix3 vR vF -vT [0,0,0])
					20:	rotMtx = (Matrix3 vR vT -vF [0,0,0])
					21:	rotMtx = (Matrix3 vF vR -vT [0,0,0])
					22:	rotMtx = (Matrix3 vF vT -vR [0,0,0])
					23:	rotMtx = (Matrix3 vT vF -vR [0,0,0])
					24:	rotMtx = (Matrix3 vT vR -vF [0,0,0])
					
					default:
						throw "Unknown mtxMode"
				)
				/**/
						
				at Time KeyTime (
					GIMS.Core.ValueOps.ConvertStruct AnimNode undefined ParamSource:ThisObj DontCreate:true
					--AnimNode.Rotation = (Quat rotMtx.Rotation.x rotMtx.Rotation.y (-rotMtx.Rotation.z) rotMtx.Rotation.w)
					AnimNode.Rotation = (EulerAngles (rot.x) (rot.y) (-rot.z))
					AnimNode.Pos = Position
				)
				OK
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		)
	)
	struct /*#PC*PATH	GIMS.CurrentGame.Core.TypeLibrary.grcVehicleRecordings*/ strVehicleRecordings (	--TODO	test-read	test-create	test-write
		GIMSObjectLink = "GIMS.CurrentGame.Core.TypeLibrary.grcVehicleRecordings",
		DiskPath,
		ObjName,
		Extension = ".ovr",
		Version = [1, 30],
		Items = #(),
		fn Read = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	tLine,
						BufferMgr = GIMS.Core.BufferMgr,
						ReadVal = BufferMgr.ReadVal,
						Skip = BufferMgr.Skip,
						oFTypeExec = GIMS.Core.StringOps.oFTypeExec,
						ValueOps = GIMS.Core.ValueOps,
						TypeCast = ValueOps.TypeCast,
						grcVehicleRecordingItem = GIMS.CurrentGame.Core.TypeLibrary.grcVehicleRecordingItem,
						BufferID = (
							BufferMgr.ReadFile (
								ValueOps.FormatText \
									v1:DiskPath \
									v2:ObjName \
									v3:Extension
							) Mode:#TxtLines
						),
						NotEOF = BufferMgr.NotEOF,
						ItemCount = 0
				Items.Count = 1000
				if BufferID == false then
					return false;
				while
					(NotEOF BufferID) and
					(tLine = (ReadVal BufferID FilterStr:"\t "))[1] != "}"
				do ( /* skips end */
					local	Tag = (TypeCast tLine[1] name BufferID:BufferID)
					case Tag of (
						#Version: (
							if (oFTypeExec tLine #P2 IDMask:#{2, 3} BufferID:BufferID) != Version then (
								GIMS.Core.SystemMgr.AddResult #Error  (
									FormatText \
										v1:"Wrong version resource \"" \
										v2:DiskPath \
										v3:ObjName \
										v4:Extension \
										v5:"\""
								)
								return false;
							)
							Skip BufferID 1 /* skip start */
						)
						#Item: (
							Skip BufferID 1 /* skip start */
							local	NewItem = (grcVehicleRecordingItem())
							NewItem.Read BufferID /* skips end */
							ItemCount += 1
							Items[ItemCount] = NewItem
						)
						default:
							EGIMS_EHAbort "Unknown strVehicleRecordings tag: " Param1:tLine[1] BufferID:BufferID
					)
				)
				Items.Count = ItemCount
				BufferMgr.ClearBuffer BufferID
				true
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Write = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	BufferMgr = GIMS.Core.BufferMgr,
						WriteVal = BufferMgr.WriteVal,
						ValueOps = GIMS.Core.ValueOps,
						AsoFText = ValueOps.AsoFText,
						FilePath = (
							ValueOps.FormatText \
								v1:DiskPath \
								v2:ObjName \
								v3:Extension
						),
						BufferID = (BufferMgr.Create Mode:#TxtLines FilePath:FilePath),
						TabString = "\t"
				if BufferID != false then (
					WriteVal BufferID (AsoFText Version TypeHook:Integer TabString:"Version ")
					WriteVal BufferID "{"
					for Item in Items do
						Item.Write BufferID TabString
					WriteVal BufferID "}"
					BufferMgr.WriteFile BufferID FilePath:FilePath
					BufferMgr.ClearBuffer BufferID
				) else
					EGIMS_EHAbort ("Can't write file " + (TempFilePath as String))
				OK
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Create ParentNode ReportProgress:true = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (				
				local	ObjectMgr = GIMS.Core.ObjectMgr
				
				local	MaxTime = -999999999
				for Item in Items do (
					local	t = Item.KeyTime;
					if t > MaxTime then
						MaxTime = t;
				)
				if MaxTime > 0 then
					ObjectMgr.ExtendAnimationRange 0 MaxTime
					
				/*TODO remove, debug*
				local	mtxModeCount = 24,
						mtxLayerMargin = 10,
						mtxLayerStep = 5,
						mtxLayerCapacity = 8
				for mtxMode = 1 to mtxModeCount do (
				/**/
				
				local	Result = (ObjectMgr.CreateIfUnique ObjName ParentNode:ParentNode AllowSearch:false NodeType:EGIMS_V_VehicleRecording),
						UpdateProgress = GIMS.Core.GUIMgr.UpdateProgress
				Result.Pos.Controller = (Linear_Position())
				Result.Rotation.Controller = (Linear_Rotation())
				Result.SuspendMeshBuilding()
				with animate on (
					if ReportProgress then (
						local	Progress = [0, 0, Items.Count]
						for Item in Items do (
							Item.Create Item Result /*TODO remove, debug*mtxMode/**/
							Progress.x += 1
							UpdateProgress #Progress Progress
						)
					) else (
						for Item in Items do (
							UpdateProgress #None 0
							Item.Create Item Result /*TODO remove, debug*mtxMode/**/
						)
					)
				)
				Result.ResumeMeshBuilding()
				
				if
					Have Result and
					ParentNode != RootNode
				then
					Result.Transform = ParentNode.Transform
					
				/*TODO remove, debug*
					Result.Name += ("_mtx" + (mtxMode as String))
					local	layerSizeMult = (mtxMode / mtxLayerCapacity),
							layerOffset = (mtxLayerMargin + (mtxLayerStep * layerSizeMult)),
							layerAngleStep = (360.0 / (mtxLayerCapacity * (layerSizeMult + 1))),
							mtxAngle = (
								(
									EulerAngles \
										0 \
										0 \
										(layerAngleStep * (mtxMode - (mtxLayerCapacity * layerSizeMult)))
								) as Quat
							)
					Result.Pos += (layerOffset * ([0, 1, 0] * mtxAngle))
				)
				/**/
				
				Result
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#DiskPath, #ObjName, #Extension), #(DiskPath, ObjName, Extension)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		)
	)

/*shaders*/

	struct /*#PC*PATH	GIMS.CurrentGame.Core.TypeLibrary.SPSParamAnnotation*/ strSPSParamAnnotation (
		GIMSObjectLink = "GIMS.CurrentGame.Core.TypeLibrary.SPSParamAnnotation",
		aKey,
		aType,
		aValue,
		fn Read XMLNode = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if XMLNode.HasAttributes then (
					local	TypeCast = GIMS.Core.ValueOps.TypeCast
					if (TypeCast XMLNode.Name Name BufferID:BufferID) == #Annotation then (
						aKey = (TypeCast (XMLNode.GetAttribute "key") Name BufferID:BufferID)
						if No aKey then
							throw (Append "Can't find \"key\" parameter at " ([XMLNode.LineNumber, XMLNode.LinePosition] as String))
						aType = (TypeCast (XMLNode.GetAttribute "type") Name BufferID:BufferID)
						if No aType then
							throw (Append "Can't find \"type\" parameter at " ([XMLNode.LineNumber, XMLNode.LinePosition] as String))
						if not (XMLNode.Read()) then
							throw (Append "Can't read annotation value at " ([ShaderSubTree.LineNumber, ShaderSubTree.LinePosition] as String))
						aValue = (
							if XMLNode.HasValue then (
								case aType of (
									#string:
										XMLNode.Value
									#int:
										(TypeCast XMLNode.Value Integer BufferID:BufferID)
									#float:
										(TypeCast XMLNode.Value Float BufferID:BufferID)
									Default:
										throw ("Unknown shader parameter annotation type " + (aType as String) + " found at " + ([XMLNode.LineNumber, XMLNode.LinePosition] as String))
								)
							) else
								unsupplied
						)
						true
					) else
						false
				) else
					false
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		)
	)
	struct /*#PC*PATH	GIMS.CurrentGame.Core.TypeLibrary.SPSParam*/ strSPSParam (
		GIMSObjectLink = "GIMS.CurrentGame.Core.TypeLibrary.SPSParam",
		aName,
		Description,
		aType,
		isRequired,
		DefaultValue,
		Annotations = #(),
		fn Read XMLNode = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if XMLNode.HasAttributes then (
					local	TypeCast = GIMS.Core.ValueOps.TypeCast
					if (TypeCast XMLNode.Name Name BufferID:BufferID) == #Item then (
						aName = (XMLNode.GetAttribute "name")
						if No aName then
							throw (Append "Can't find \"name\" parameter at " ([XMLNode.LineNumber, XMLNode.LinePosition] as String))
						Description = (TypeCast (XMLNode.GetAttribute "description") Name BufferID:BufferID)
						if No Description then
							throw (Append "Can't find \"description\" parameter at " ([XMLNode.LineNumber, XMLNode.LinePosition] as String))
						aType = (TypeCast (XMLNode.GetAttribute "type") Name BufferID:BufferID)
						if No aType then
							throw (Append "Can't find \"type\" parameter at " ([XMLNode.LineNumber, XMLNode.LinePosition] as String))
						isRequired = (TypeCast (XMLNode.GetAttribute "isRequired") BooleanClass BufferID:BufferID)
						if No isRequired then
							throw (Append "Can't read \"isRequired\" parameter at " ([XMLNode.LineNumber, XMLNode.LinePosition] as String))
						local	ParamValue = (XMLNode.GetAttribute "value"),
								ParamType = (GIMS.CurrentGame.Core.MAXFactory.ObjectMgr.SPSToGIMSParamType aType),
								IsBaseParamType = (
									ParamType == #Float or
									ParamType == #P2 or
									ParamType == #P3
								)
						DefaultValue = (
							if Have ParamValue then (
								if IsBaseParamType then
									(TypeCast (GIMS.Core.StringOps.oFTypeExec ParamValue ParamType BufferID:BufferID) #P4 BufferID:BufferID)
								else
									(GIMS.Core.StringOps.oFTypeExec ParamValue ParamType BufferID:BufferID)
							) else
								unsupplied
						)
						local	AnnotationsSubTree = (XMLNode.ReadSubTree()),
								SPSParamAnnotation = GIMS.CurrentGame.Core.TypeLibrary.SPSParamAnnotation
						if Have AnnotationsSubTree then (
							local	AnnotationCount = 0
							Annotations.Count = 20
							while (AnnotationsSubTree.Read()) do (
								local	Annotation = (SPSParamAnnotation())
								if (Annotation.Read AnnotationsSubTree) then (
									AnnotationCount += 1
									Annotations[AnnotationCount] = Annotation
								)
							)
							Annotations.Count = AnnotationCount
							local	Modify = GIMS.Core.ArrayOps.Modify
							for Annotation in Annotations where
								Annotation.aKey == #UIMin and
								Supplied Annotation.aValue
							while not Supplied DefaultValue do (
								local	IsArray = true
								DefaultValue = (
									case aType of (
										#svt_float: (
											IsArray = false
											[1, 1, 1, 1]
										)
										#svt_float2: (
											IsArray = false
											[1, 1, 1, 1]
										)
										#svt_float3: (
											IsArray = false
											[1, 1, 1, 1]
										)
										#svt_float4: (
											IsArray = false
											[1, 1, 1, 1]
										)
										#svt_matrix3x4: (
											local	Res = #()
											for i = 4 to 1 by -1 do
												Res[i] = [1, 1, 1]
											Res
										)
										#svt_matrix44: (
											local	Res = #()
											for i = 4 to 1 by -1 do
												Res[i] = [1, 1, 1, 1]
											Res
										)
										#svt_float2x3: (
											local	Res = #()
											for i = 3 to 1 by -1 do
												Res[i] = [1, 1]
											Res
										)
										#svt_float4x2: (
											local	Res = #()
											for i = 2 to 1 by -1 do
												Res[i] = [1, 1, 1, 1]
											Res
										)
										#svt_float4x4: (
											local	Res = #()
											for i = 4 to 1 by -1 do
												Res[i] = [1, 1, 1, 1]
											Res
										)
										#svt_float4x5: (
											local	Res = #()
											for i = 5 to 1 by -1 do
												Res[i] = [1, 1, 1, 1]
											Res
										)
										#svt_sampler: (/*SKIP*/)
										Default:
											throw "Unknown SPS param type: " aType
									)
								)
								if IsArray then
									GIMS.Core.ArrayOps.Modify DefaultValue Annotation.aValue #Multiply
								else
									DefaultValue *= Annotation.aValue
							)
						)
						if not Supplied DefaultValue then (
							DefaultValue = (
								if
									IsBaseParamType or
									ParamType == #P4
								then
									[0, 0, 0, 0]
								else (
									case aType of (
										#svt_sampler:
											"*NULL*"
										#svt_matrix3x4: (
											local	Res = #()
											for i = 4 to 1 by -1 do
												Res[i] = [0, 0, 0]
											Res
										)
										#svt_matrix44: (
											local	Res = #()
											for i = 4 to 1 by -1 do
												Res[i] = [0, 0, 0, 0]
											Res
										)
										#svt_float2x3: (
											local	Res = #()
											for i = 3 to 1 by -1 do
												Res[i] = [0, 0, 0]
											Res
										)
										#svt_float4x2: (
											local	Res = #()
											for i = 2 to 1 by -1 do
												Res[i] = [0, 0, 0, 0]
											Res
										)
										#svt_float4x4: (
											local	Res = #()
											for i = 4 to 1 by -1 do
												Res[i] = [0, 0, 0, 0]
											Res
										)
										#svt_float4x5: (
											local	Res = #()
											for i = 5 to 1 by -1 do
												Res[i] = [0, 0, 0, 0]
											Res
										)
										default:
											throw "Unknown param type: " ParamType
									)
								)
							)
						)
						true
					) else
						false
				) else
					false
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		)
	)
	struct /*#PC*PATH	GIMS.CurrentGame.Core.TypeLibrary.SPSVertexDeclarationElement*/ strSPSVertexDeclarationElement (
		GIMSObjectLink = "GIMS.CurrentGame.Core.TypeLibrary.SPSVertexDeclarationElement",
		Usage,
		aType,
		fn Read XMLNode = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if XMLNode.HasAttributes then (
					local	TypeCast = GIMS.Core.ValueOps.TypeCast
					if (TypeCast XMLNode.Name Name BufferID:BufferID) == #Element then (
						Usage = (TypeCast (XMLNode.GetAttribute "usage") Name BufferID:BufferID)
						if No Usage then
							throw (Append "Can't find \"usage\" parameter at " ([XMLNode.LineNumber, XMLNode.LinePosition] as String))
						aType = (TypeCast (XMLNode.GetAttribute "type") Name BufferID:BufferID)
						if No aType then
							throw (Append "Can't find \"type\" parameter at " ([XMLNode.LineNumber, XMLNode.LinePosition] as String))
						true
					) else
						false
				) else
					false
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		)
	)
	struct /*#PC*PATH	GIMS.CurrentGame.Core.TypeLibrary.SPSVertexDeclaration*/ strSPSVertexDeclaration (
		GIMSObjectLink = "GIMS.CurrentGame.Core.TypeLibrary.SPSVertexDeclaration",
		aName,
		Skinned,
		Elements = #(),
		fn Read XMLNode = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if XMLNode.HasAttributes then (
					local	TypeCast = GIMS.Core.ValueOps.TypeCast
					if (TypeCast XMLNode.Name Name BufferID:BufferID) == #Declaration then (
					
						local	vdName = (XMLNode.GetAttribute "name")
						if No vdName then
							throw (Append "Can't find VD \"name\" parameter at " ([XMLNode.LineNumber, XMLNode.LinePosition] as String))
						aName = (TypeCast vdName Name BufferID:BufferID)
					
						Skinned = (TypeCast (XMLNode.GetAttribute "skinned") BooleanClass BufferID:BufferID)
						if No Skinned then
							throw (Append "Can't find VD \"skinned\" parameter at " ([XMLNode.LineNumber, XMLNode.LinePosition] as String))
						
						if not (XMLNode.ReadToFollowing "Count") then
							throw (Append "Can't find VD \"Count\" parameter at " ([XMLNode.LineNumber, XMLNode.LinePosition] as String))
						if not (XMLNode.Read()) then
							throw (Append "Can't read VD \"Count\" parameter at " ([XMLNode.LineNumber, XMLNode.LinePosition] as String))
						if not XMLNode.HasValue then
							throw (Append "Can't find VD \"Count\" parameter value at " ([XMLNode.LineNumber, XMLNode.LinePosition] as String))
						local	vdCount = XMLNode.Value
						if No vdCount then
							throw (Append "Wrong VD \"Count\" parameter value at " ([XMLNode.LineNumber, XMLNode.LinePosition] as String))
						vdCount = (TypeCast vdCount Integer BufferID:BufferID)
						
						if not (XMLNode.ReadToFollowing "D3D9VertexElements") then
							throw (Append "Can't find VD \"D3D9VertexElements\" parameter at " ([XMLNode.LineNumber, XMLNode.LinePosition] as String))
						local	ElementsSubTree = (XMLNode.ReadSubTree())
						if No ElementsSubTree then
							throw (Append "Can't find VD elements subtree at " ([XMLNode.LineNumber, XMLNode.LinePosition] as String))
						
						local	SPSVertexDeclarationElement = GIMS.CurrentGame.Core.TypeLibrary.SPSVertexDeclarationElement,
								ElementCount = 0
						Elements.Count = vdCount
						while (ElementsSubTree.Read()) do (
							/*TODO remove, debug*	LogProfiler #PlainInfo "\tElement @\t" AddParam:[ElementsSubTree.LineNumber, ElementsSubTree.LinePosition]	/**/
							local	Element = (SPSVertexDeclarationElement())
							if (Element.Read ElementsSubTree) then (
								ElementCount += 1
								Elements[ElementCount] = Element
							)
						)
						Elements.Count = ElementCount
						true
					) else
						false
				) else
					false
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		)
	)
	struct /*#PC*PATH	GIMS.CurrentGame.Core.TypeLibrary.SPS*/ strSPS (
		GIMSObjectLink = "GIMS.CurrentGame.Core.TypeLibrary.SPS",
		aName,
		aShader,
		SupportSkinning,
		ShaderParameters = #(),
		VertexDeclarations = #(),
		Bucket = 0,
		fn Read XMLNode = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				if XMLNode.HasAttributes then (
					local	TypeCast = GIMS.Core.ValueOps.TypeCast
					if (TypeCast XMLNode.Name Name BufferID:BufferID) == #ShaderPreSet then (
					
						aName = (XMLNode.GetAttribute "name")
						if No aName then
							throw (Append "Can't find \"name\" property at " ([XMLNode.LineNumber, XMLNode.LinePosition] as String))
						aName = (GetFileNameFile aName)
						
						aShader = (XMLNode.GetAttribute "shader")
						if No aShader then
							throw (Append "Can't find \"shader\" property at " ([XMLNode.LineNumber, XMLNode.LinePosition] as String))
						aShader = (TypeCast aShader Name BufferID:BufferID)
						
						local	ShaderSubTree = (XMLNode.ReadSubTree())
						if No ShaderSubTree then
							throw (Append "Can't read shader subtree at " ([XMLNode.LineNumber, XMLNode.LinePosition] as String))
							
						if not (ShaderSubTree.ReadToFollowing "Bucket") then
							throw (Append "Can't find \"Bucket\" parameter at " ([ShaderSubTree.LineNumber, ShaderSubTree.LinePosition] as String))
						if not (ShaderSubTree.Read()) then
							throw (Append "Can't read \"Bucket\" parameter at " ([ShaderSubTree.LineNumber, ShaderSubTree.LinePosition] as String))
						if not ShaderSubTree.HasValue then
							throw (Append "Can't find \"Bucket\" parameter value at " ([ShaderSubTree.LineNumber, ShaderSubTree.LinePosition] as String))
						Bucket = (TypeCast ShaderSubTree.Value Integer BufferID:BufferID)
						if No Bucket then
							throw (Append "Wrong \"Bucket\" parameter value at " ([ShaderSubTree.LineNumber, ShaderSubTree.LinePosition] as String))
							
						if not (ShaderSubTree.ReadToFollowing "SupportSkinning") then
							throw (Append "Can't find \"SupportSkinning\" parameter at " ([ShaderSubTree.LineNumber, ShaderSubTree.LinePosition] as String))
						if not (ShaderSubTree.Read()) then
							throw (Append "Can't read \"SupportSkinning\" parameter at " ([ShaderSubTree.LineNumber, ShaderSubTree.LinePosition] as String))
						if not ShaderSubTree.HasValue then
							throw (Append "Can't find \"SupportSkinning\" parameter value at " ([ShaderSubTree.LineNumber, ShaderSubTree.LinePosition] as String))
						SupportSkinning = (TypeCast ShaderSubTree.Value BooleanClass BufferID:BufferID)
						if No SupportSkinning then
							throw (Append "Wrong \"SupportSkinning\" parameter value at " ([ShaderSubTree.LineNumber, ShaderSubTree.LinePosition] as String))
							
						if not (ShaderSubTree.ReadToFollowing "ShaderParameters") then
							throw (Append "Can't find \"ShaderParameters\" parameter at " ([ShaderSubTree.LineNumber, ShaderSubTree.LinePosition] as String))
						local	ParamsSubTree = (ShaderSubTree.ReadSubTree())
						if No ParamsSubTree then
							throw (Append "Can't read shader items subtree at " ([ShaderSubTree.LineNumber, ShaderSubTree.LinePosition] as String))
						local	SPSParam = GIMS.CurrentGame.Core.TypeLibrary.SPSParam,
								AppendSorted = GIMS.Core.ArrayOps.AppendSorted
						while (ParamsSubTree.Read()) do (
							/*TODO remove, debug*	LogProfiler #PlainInfo "\tParam @\t" AddParam:[ParamsSubTree.LineNumber, ParamsSubTree.LinePosition]	/**/
							local	Item = (SPSParam())
							if (Item.Read ParamsSubTree) then
								AppendSorted ShaderParameters Item ValuePropertyName:#aName
						)
						
						if not (ShaderSubTree.ReadToFollowing "VertexDeclarations") then
							throw (Append "Can't find \"VertexDeclarations\" parameter at " ([ShaderSubTree.LineNumber, ShaderSubTree.LinePosition] as String))
						local	VertexDeclarationsSubTree = (ShaderSubTree.ReadSubTree())
						if No VertexDeclarationsSubTree then
							throw (Append "Can't read shader VertexDeclarations subtree at " ([ShaderSubTree.LineNumber, ShaderSubTree.LinePosition] as String))
							
						local	VDCount = 0
						VertexDeclarations.Count = 10
						while (VertexDeclarationsSubTree.Read()) do (
							/*TODO remove, debug*	LogProfiler #PlainInfo "\tVDInfo @\t" AddParam:[VertexDeclarationsSubTree.LineNumber, VertexDeclarationsSubTree.LinePosition]	/**/
						
							if
								XMLNode.HasAttributes and
								(TypeCast VertexDeclarationsSubTree.Name Name BufferID:BufferID) == #Name
							then (
								local	vdSkinned = (TypeCast (VertexDeclarationsSubTree.GetAttribute "skinned") BooleanClass BufferID:BufferID)
								if No vdSkinned then
									throw (Append "Can't find \"skinned\" parameter at " ([VertexDeclarationsSubTree.LineNumber, VertexDeclarationsSubTree.LinePosition] as String))
								
								if not VertexDeclarationsSubTree.Read() then
									throw (Append "Can't read VD \"Name\" parameter value at " ([VertexDeclarationsSubTree.LineNumber, VertexDeclarationsSubTree.LinePosition] as String))
								if not VertexDeclarationsSubTree.HasValue then
									throw (Append "Can't find VD \"Name\" parameter value at " ([VertexDeclarationsSubTree.LineNumber, VertexDeclarationsSubTree.LinePosition] as String))
								local	vdName = VertexDeclarationsSubTree.Value
								if No vdName then
									throw (Append "Wrong VD \"Name\" parameter value at " ([VertexDeclarationsSubTree.LineNumber, VertexDeclarationsSubTree.LinePosition] as String))
								
								VDCount += 1
								VertexDeclarations[VDCount] = #((TypeCast vdName Name BufferID:BufferID), vdSkinned)
							)
						)
						VertexDeclarations.Count = VDCount
						
						if VDCount != 0 then (
							if SupportSkinning then (
								local	HaveSkinnedVD = false
								for VD in VertexDeclarations where VD[2] while not HaveSkinnedVD do
									HaveSkinnedVD = true
								SupportSkinning = HaveSkinnedVD
							)
							true
						) else
							false
							
					) else
						false
				) else
					false
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		)
	)

	struct /*#PC*PATH	GIMS.CurrentGame.Core.TypeLibrary.grcCWMeta*/ strCWMeta (
		GIMSObjectLink = "GIMS.CurrentGame.Core.TypeLibrary.grcCWMeta",
		DiskPath,
		ObjName,
		Extension = ".xml",
		Kind = #Unknown,
		SourceFormat = #XML,
		SourceXMLPath = unsupplied,
		Items = #(),
		fn Read DummyParam ReportProgress:true CachePath:undefined = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	CWXML = GIMS.CurrentGame.Core.TypeLibrary.CWXML,
						FilePath = (DiskPath + ObjName + Extension),
						XMLDoc = (CWXML.LoadDocument FilePath)
				if No XMLDoc then
					return false
				SourceXMLPath = (CWXML.CacheSourceXML FilePath)
				ObjName = (CWXML.CleanResourceName ObjName)
				local	Root = XMLDoc.DocumentElement
				Kind = (CWXML.GetFileKindFromName FilePath)
				if Kind == #Unknown then
					Kind = (CWXML.GetFileKindFromRoot Root)
				Items = #()
				case Kind of (
					#MapData: (
						local	MapName = (CWXML.GetChildText Root "name")
						if MapName.Count != 0 then
							ObjName = MapName
						local	EntNodes = (Root.SelectNodes "entities/Item")
						for i = 0 to (EntNodes.Count - 1) do (
							local	EntNode = (EntNodes.Item[i]),
									EntName = (CWXML.GetChildText EntNode "archetypeName" DefaultVal:("entity_" + ((i + 1) as String)))
							Append Items #(
								#Entity,
								EntName,
								(CWXML.GetVec3 EntNode "position"),
								(CWXML.GetQuat EntNode "rotation"),
								(CWXML.GetChildFloat EntNode "scaleXY" DefaultVal:1.0),
								(CWXML.GetChildFloat EntNode "scaleZ" DefaultVal:1.0),
								(CWXML.GetChildInt EntNode "lodDist" DefaultVal:0),
								(CWXML.GetChildText EntNode "lodLevel")
							)
						)
						local	CarNodes = (Root.SelectNodes "carGenerators/Item")
						for i = 0 to (CarNodes.Count - 1) do (
							local	CarNode = (CarNodes.Item[i]),
									CarName = (CWXML.GetChildText CarNode "carModel" DefaultVal:("carGen_" + ((i + 1) as String)))
							Append Items #(
								#CarGen,
								CarName,
								(CWXML.GetVec3 CarNode "position"),
								(Quat 0 0 0 1),
								1.0,
								1.0,
								0,
								""
							)
						)
					)
					#MapTypes: (
						local	ArchNodes = (Root.SelectNodes "archetypes/Item")
						for i = 0 to (ArchNodes.Count - 1) do (
							local	ArchNode = (ArchNodes.Item[i]),
									ArchName = (CWXML.GetChildText ArchNode "name" DefaultVal:("archetype_" + ((i + 1) as String))),
									ArchType = (CWXML.GetAttr ArchNode "type" DefaultVal:"CBaseArchetypeDef"),
									RoomNames = #(),
									RoomNodes = (ArchNode.SelectNodes "rooms/Item")
							for r = 0 to (RoomNodes.Count - 1) do
								Append RoomNames (CWXML.GetChildText (RoomNodes.Item[r]) "name" DefaultVal:("room_" + ((r + 1) as String)))
							Append Items #(
								#Archetype,
								ArchName,
								[0, 0, 0],
								(Quat 0 0 0 1),
								1.0,
								1.0,
								(CWXML.GetChildInt ArchNode "lodDist" DefaultVal:0),
								ArchType,
								RoomNames
							)
						)
					)
					#ClipDictionary: (
						GIMS.Core.SystemMgr.AddResult #Warning "Clip dictionary XML imports clip names only. Animation curves are not applied."
						local	ClipNodes = (Root.SelectNodes "Clips/Item")
						if ClipNodes.Count == 0 then
							ClipNodes = (Root.SelectNodes "Clips/Hash")
						for i = 0 to (ClipNodes.Count - 1) do (
							local	ClipNode = (ClipNodes.Item[i]),
									ClipName = (CWXML.GetChildText ClipNode "Hash")
							if ClipName.Count == 0 then
								ClipName = (CWXML.GetChildText ClipNode "Name")
							if ClipName.Count == 0 then
								ClipName = (CWXML.GetAttr ClipNode "name" DefaultVal:("clip_" + ((i + 1) as String)))
							Append Items #(#Clip, ClipName, [0, 0, 0], (Quat 0 0 0 1), 1.0, 1.0, 0, "")
						)
					)
					default:
						return false
				)
				true
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#DiskPath, #ObjName, #Extension, #Kind), #(DiskPath, ObjName, Extension, Kind)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Write = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	CWXML = GIMS.CurrentGame.Core.TypeLibrary.CWXML,
						FilePath = (DiskPath + ObjName + Extension),
						SS = (StringStream ""),
						RootName = "CMapData"
				if
					Kind == #ClipDictionary and
					Supplied SourceXMLPath and
					Have SourceXMLPath and
					(DoesFileExist SourceXMLPath)
				then (
					MakeDir (GetFileNamePath FilePath) All:true
					if (DoesFileExist FilePath) then
						try (DeleteFile FilePath) catch ()
					CopyFile SourceXMLPath FilePath
					return OK
				)
				Format "%" "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" To:SS
				case Kind of (
					#MapTypes:
						RootName = "CMapTypes"
					#ClipDictionary:
						RootName = "ClipDictionary"
					#MapData:
						RootName = "CMapData"
					default:
						RootName = (Kind as String)
				)
				Format "%" ("<" + RootName + ">\n") To:SS
				Format "%" (" <name>" + (CWXML.XMLEscape ObjName) + "</name>\n") To:SS
				if Kind == #MapData then (
					Format "%" " <entities>\n" To:SS
					for Item in Items do (
						if
							Have Item and
							Item[1] == #Entity
						then (
							Format "%" "  <Item>\n" To:SS
							Format "%" ("   <archetypeName>" + (CWXML.XMLEscape Item[2]) + "</archetypeName>\n") To:SS
							Format "%" ("   <position " + (CWXML.Vec3Attrs Item[3]) + " />\n") To:SS
							Format "%" ("   <rotation " + (CWXML.QuatAttrs Item[4]) + " />\n") To:SS
							Format "%" (CWXML.ValueTag "   " "scaleXY" Item[5]) To:SS
							Format "%" (CWXML.ValueTag "   " "scaleZ" Item[6]) To:SS
							Format "%" (CWXML.ValueTag "   " "lodDist" Item[7]) To:SS
							if Have Item[8] then
								Format "%" ("   <lodLevel>" + (CWXML.XMLEscape Item[8]) + "</lodLevel>\n") To:SS
							Format "%" "  </Item>\n" To:SS
						)
					)
					Format "%" " </entities>\n" To:SS
					Format "%" " <carGenerators>\n" To:SS
					for Item in Items do (
						if
							Have Item and
							Item[1] == #CarGen
						then (
							Format "%" "  <Item>\n" To:SS
							Format "%" ("   <carModel>" + (CWXML.XMLEscape Item[2]) + "</carModel>\n") To:SS
							Format "%" ("   <position " + (CWXML.Vec3Attrs Item[3]) + " />\n") To:SS
							Format "%" "  </Item>\n" To:SS
						)
					)
					Format "%" " </carGenerators>\n" To:SS
				)
				if Kind == #MapTypes then (
					Format "%" " <archetypes>\n" To:SS
					for Item in Items do (
						if Have Item then (
							local	ArchType = "CBaseArchetypeDef"
							if Item.Count >= 8 then
								ArchType = (Item[8] as String)
							Format "%" ("  <Item type=\"" + (CWXML.XMLEscape ArchType) + "\">\n") To:SS
							Format "%" ("   <name>" + (CWXML.XMLEscape Item[2]) + "</name>\n") To:SS
							Format "%" (CWXML.ValueTag "   " "lodDist" Item[7]) To:SS
							Format "%" "  </Item>\n" To:SS
						)
					)
					Format "%" " </archetypes>\n" To:SS
				)
				if Kind == #ClipDictionary then (
					Format "%" " <Clips>\n" To:SS
					for Item in Items do (
						if Have Item then
							Format "%" ("  <Item>\n   <Name>" + (CWXML.XMLEscape Item[2]) + "</Name>\n  </Item>\n") To:SS
					)
					Format "%" " </Clips>\n" To:SS
				)
				Format "%" ("</" + RootName + ">\n") To:SS
				local	Merged = false
				if
					Supplied SourceXMLPath and
					Have SourceXMLPath and
					(DoesFileExist SourceXMLPath)
				then
					Merged = (CWXML.MergeEditedXML SourceXMLPath (SS as String) FilePath Kind)
				if not Merged then
					CWXML.WriteXMLFile FilePath (SS as String)
				Free SS
				OK
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#DiskPath, #ObjName, #Extension, #Kind), #(DiskPath, ObjName, Extension, Kind)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		),
		fn Create ParentNode ReportProgress:true = (
			/*<PROFILERSTART>*//*LogProfiler #Start (local SS = (StringStream ""); Stack ShowLocals:false FirstFrameOnly:true To:SS; SS); local PWS = (*//*<PROFILERSTARTED>*/
			/*<ERRHANDLERSTART>*/try (
				local	Result = (Dummy())
				Result.Name = ObjName
				if
					Have ParentNode and
					ParentNode != RootNode
				then
					Result.Parent = ParentNode
				for Item in Items do (
					local	HelperObj = (Point()),
							ItemKind = Item[1],
							ItemName = Item[2]
					HelperObj.Name = ItemName
					HelperObj.Size = 0.35
					HelperObj.Box = on
					HelperObj.Cross = on
					HelperObj.Parent = Result
					HelperObj.Pos = Item[3]
					HelperObj.Rotation = Item[4]
					HelperObj.Scale = [Item[5], Item[5], Item[6]]
					SetUserProp HelperObj "GIMS_CWKind" (ItemKind as String)
					SetUserProp HelperObj "GIMS_LodDist" (Item[7] as String)
					SetUserProp HelperObj "GIMS_Extra" Item[8]
					if
						ItemKind == #Archetype and
						Item.Count >= 9
					then (
						for RoomName in Item[9] do (
							local	RoomObj = (Dummy())
							RoomObj.Name = RoomName
							RoomObj.Parent = HelperObj
						)
					)
				)
				GIMS.CurrentGame.Core.TypeLibrary.CWXML.TagSceneNode Result SourceFormat Extension Kind:Kind SourceXML:SourceXMLPath
				Result
			/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS AddInfo:#(#(#DiskPath, #ObjName, #Extension, #Kind), #(DiskPath, ObjName, Extension, Kind)))/*<ERRHANDLEREND>*/
			/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
		)
	)

	struct /*#PC*PATH	GIMS.CurrentGame.Core.TypeLibrary*/ strTypeLibrary (
		/*Bounds*/		Bounds = strBounds,
		/*phBound*/		grcPhBoundDictionary = strPhBoundDictionary,
						grcPhBound = strPhBound,
		/*oF models*/	grcMeshVertex = strMeshVertex,
						grcLODMeshGeometry = strLODMeshGeometry,
						grcLODMesh = strLODMesh,
						grcLODGroup = strLODGroup,
						grcBone = strBone,
						grcSkeleton = strSkeleton,
						grcJointLimit = strJointLimit,
						grcJoints = strJoints,
						grcLight = strLight,
						grcLightAttributes = strLightAttributes,
						grcTexture = strTexture,
						grcTextureDictionary = strTextureDictionary,
						grcShadingGroup = strShadingGroup,
						grcDrawable = strDrawable,
						grcDrawableDictionary = strDrawableDictionary,
						grcCWMeta = strCWMeta,
		/*paths*/		grcDistantLights = strDistantLights,
						grcDistantLightGroup = strDistantLightGroup,
						grcVehicleRecordings = strVehicleRecordings,
						grcVehicleRecordingItem = strVehicleRecordingItem,
		/*shaders*/		SPSParamAnnotation = strSPSParamAnnotation,
						SPSParam = strSPSParam,
						SPSVertexDeclarationElement = strSPSVertexDeclarationElement,
						SPSVertexDeclaration = strSPSVertexDeclaration,
						SPS = strSPS,
		/*CodeWalker*/	CWXML = (strCWXML())
	)
	GIMS.CurrentGame.Core.TypeLibrary = strTypeLibrary()
/*<ERRHANDLER>*/) catch (local	CET = (GetCurrentException()),ESS;if not (MatchPattern CET Pattern:"*<THROW>*") then (ESS = (StringStream "");Stack ShowLocals:EGIMS_EHStackLocals FirstFrameOnly:EGIMS_EHFFO To:ESS); EGIMS_EHError CET ESS)/*<ERRHANDLEREND>*/
/*<PROFILEREND>*//*); LogProfiler #End 0; PWS*//*<PROFILERENDED>*/
)
