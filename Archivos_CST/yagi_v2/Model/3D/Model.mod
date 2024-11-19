'# MWS Version: Version 2022.0 - Aug 23 2021 - ACIS 31.0.1 -

'# length = cm
'# frequency = MHz
'# time = ns
'# frequency range: fmin = 300 fmax = 1500
'# created = '[VERSION]2022.4|31.0.1|20220426[/VERSION]


'@ use template: Antenna - Wire.cfg

'[VERSION]2022.4|31.0.1|20220426[/VERSION]
'set the units
With Units
    .Geometry "cm"
    .Frequency "MHz"
    .Voltage "V"
    .Resistance "Ohm"
    .Inductance "NanoH"
    .TemperatureUnit  "Celsius"
    .Time "ns"
    .Current "A"
    .Conductance "Siemens"
    .Capacitance "PikoF"
End With

ThermalSolver.AmbientTemperature "0"

'----------------------------------------------------------------------------

'set the frequency range
Solver.FrequencyRange "100", "1000"

'----------------------------------------------------------------------------

Plot.DrawBox True

With Background
     .Type "Normal"
     .Epsilon "1.0"
     .Mu "1.0"
     .XminSpace "0.0"
     .XmaxSpace "0.0"
     .YminSpace "0.0"
     .YmaxSpace "0.0"
     .ZminSpace "0.0"
     .ZmaxSpace "0.0"
End With

With Boundary
     .Xmin "expanded open"
     .Xmax "expanded open"
     .Ymin "expanded open"
     .Ymax "expanded open"
     .Zmin "expanded open"
     .Zmax "expanded open"
     .Xsymmetry "none"
     .Ysymmetry "none"
     .Zsymmetry "none"
End With

' switch on FD-TET setting for accurate farfields

FDSolver.ExtrudeOpenBC "True"

Mesh.FPBAAvoidNonRegUnite "True"
Mesh.ConsiderSpaceForLowerMeshLimit "False"
Mesh.MinimumStepNumber "5"
Mesh.RatioLimit "20"
Mesh.AutomeshRefineAtPecLines "True", "10"

With MeshSettings
     .SetMeshType "Hex"
     .Set "RatioLimitGeometry", "20"
     .Set "EdgeRefinementOn", "1"
     .Set "EdgeRefinementRatio", "10"
End With

With MeshSettings
     .SetMeshType "Tet"
     .Set "VolMeshGradation", "1.5"
     .Set "SrfMeshGradation", "1.5"
End With

With MeshSettings
     .SetMeshType "HexTLM"
     .Set "RatioLimitGeometry", "20"
End With

PostProcess1D.ActivateOperation "vswr", "true"
PostProcess1D.ActivateOperation "yz-matrices", "true"

With MeshSettings
     .SetMeshType "Srf"
     .Set "Version", 1
End With
IESolver.SetCFIEAlpha "1.000000"

With FarfieldPlot
	.ClearCuts ' lateral=phi, polar=theta
	.AddCut "lateral", "0", "1"
	.AddCut "lateral", "90", "1"
	.AddCut "polar", "90", "1"
End With

'----------------------------------------------------------------------------

With MeshSettings
     .SetMeshType "Hex"
     .Set "Version", 1%
End With

With Mesh
     .MeshType "PBA"
End With

'set the solver type
ChangeSolverType("HF Time Domain")

'----------------------------------------------------------------------------

'@ define material: Aluminum

'[VERSION]2022.4|31.0.1|20220426[/VERSION]
With Material
     .Reset
     .Name "Aluminum"
     .Folder ""
.FrqType "static"
.Type "Normal"
.SetMaterialUnit "Hz", "mm"
.Epsilon "1"
.Mu "1.0"
.Kappa "3.56e+007"
.TanD "0.0"
.TanDFreq "0.0"
.TanDGiven "False"
.TanDModel "ConstTanD"
.KappaM "0"
.TanDM "0.0"
.TanDMFreq "0.0"
.TanDMGiven "False"
.TanDMModel "ConstTanD"
.DispModelEps "None"
.DispModelMu "None"
.DispersiveFittingSchemeEps "General 1st"
.DispersiveFittingSchemeMu "General 1st"
.UseGeneralDispersionEps "False"
.UseGeneralDispersionMu "False"
.FrqType "all"
.Type "Lossy metal"
.MaterialUnit "Frequency", "GHz"
.MaterialUnit "Geometry", "mm"
.MaterialUnit "Time", "s"
.MaterialUnit "Temperature", "Kelvin"
.Mu "1.0"
.Sigma "3.56e+007"
.Rho "2700.0"
.ThermalType "Normal"
.ThermalConductivity "237.0"
.SpecificHeat "900", "J/K/kg"
.MetabolicRate "0"
.BloodFlow "0"
.VoxelConvection "0"
.MechanicsType "Isotropic"
.YoungsModulus "69"
.PoissonsRatio "0.33"
.ThermalExpansionRate "23"
.ReferenceCoordSystem "Global"
.CoordSystemType "Cartesian"
.NLAnisotropy "False"
.NLAStackingFactor "1"
.NLADirectionX "1"
.NLADirectionY "0"
.NLADirectionZ "0"
.Colour "1", "1", "0"
.Wireframe "False"
.Reflection "False"
.Allowoutline "True"
.Transparentoutline "False"
.Transparency "0"
.Create
End With

'@ new component: component1

'[VERSION]2022.4|31.0.1|20220426[/VERSION]
Component.New "component1"

'@ define cylinder: component1:reflector

'[VERSION]2022.4|31.0.1|20220426[/VERSION]
With Cylinder 
     .Reset 
     .Name "reflector" 
     .Component "component1" 
     .Material "Aluminum" 
     .OuterRadius "0.1" 
     .InnerRadius "0" 
     .Axis "x" 
     .Xrange "-8.25", "8.25" 
     .Ycenter "0" 
     .Zcenter "0" 
     .Segments "0" 
     .Create 
End With

'@ define cylinder: component1:antena_1

'[VERSION]2022.4|31.0.1|20220426[/VERSION]
With Cylinder 
     .Reset 
     .Name "antena_1" 
     .Component "component1" 
     .Material "Aluminum" 
     .OuterRadius "0.1" 
     .InnerRadius "0" 
     .Axis "x" 
     .Xrange "-6.75", "6.75" 
     .Ycenter "7" 
     .Zcenter "0" 
     .Segments "0" 
     .Create 
End With

'@ define cylinder: component1:antena_2

'[VERSION]2022.4|31.0.1|20220426[/VERSION]
With Cylinder 
     .Reset 
     .Name "antena_2" 
     .Component "component1" 
     .Material "Aluminum" 
     .OuterRadius "0.1" 
     .InnerRadius "0" 
     .Axis "x" 
     .Xrange "-0.5", "-6.75" 
     .Ycenter "7" 
     .Zcenter "0" 
     .Segments "0" 
     .Create 
End With

'@ define cylinder: component1:dir-1

'[VERSION]2022.4|31.0.1|20220426[/VERSION]
With Cylinder 
     .Reset 
     .Name "dir-1" 
     .Component "component1" 
     .Material "Aluminum" 
     .OuterRadius "0.1" 
     .InnerRadius "0" 
     .Axis "x" 
     .Xrange "-6", "6" 
     .Ycenter "16" 
     .Zcenter "0" 
     .Segments "0" 
     .Create 
End With

'@ define cylinder: component1:dir-2

'[VERSION]2022.4|31.0.1|20220426[/VERSION]
With Cylinder 
     .Reset 
     .Name "dir-2" 
     .Component "component1" 
     .Material "Aluminum" 
     .OuterRadius "0.1" 
     .InnerRadius "0" 
     .Axis "x" 
     .Xrange "-6", "6" 
     .Ycenter "25" 
     .Zcenter "0" 
     .Segments "0" 
     .Create 
End With

'@ define cylinder: component1:dir-3

'[VERSION]2022.4|31.0.1|20220426[/VERSION]
With Cylinder 
     .Reset 
     .Name "dir-3" 
     .Component "component1" 
     .Material "Aluminum" 
     .OuterRadius "0.1" 
     .InnerRadius "0" 
     .Axis "x" 
     .Xrange "-6", "6" 
     .Ycenter "34" 
     .Zcenter "0" 
     .Segments "0" 
     .Create 
End With

'@ pick circle center point

'[VERSION]2022.4|31.0.1|20220426[/VERSION]
Pick.PickCirclecenterFromId "component1:antena_2", "2"

'@ pick circle center point

'[VERSION]2022.4|31.0.1|20220426[/VERSION]
Pick.PickCirclecenterFromId "component1:antena_1", "1"

'@ define discrete port: 1

'[VERSION]2022.4|31.0.1|20220426[/VERSION]
With DiscretePort 
     .Reset 
     .PortNumber "1" 
     .Type "SParameter"
     .Label ""
     .Folder ""
     .Impedance "50.0"
     .VoltagePortImpedance "0.0"
     .Voltage "1.0"
     .Current "1.0"
     .Monitor "True"
     .Radius "0.0"
     .SetP1 "True", "-0.5", "7", "0"
     .SetP2 "True", "0.5", "7", "0"
     .InvertDirection "False"
     .LocalCoordinates "False"
     .Wire ""
     .Position "end1"
     .Create 
End With

'@ define time domain solver parameters

'[VERSION]2022.4|31.0.1|20220426[/VERSION]
Mesh.SetCreator "High Frequency" 

With Solver 
     .Method "Hexahedral"
     .CalculationType "TD-S"
     .StimulationPort "All"
     .StimulationMode "All"
     .SteadyStateLimit "-40"
     .MeshAdaption "False"
     .AutoNormImpedance "False"
     .NormingImpedance "50"
     .CalculateModesOnly "False"
     .SParaSymmetry "False"
     .StoreTDResultsInCache  "False"
     .RunDiscretizerOnly "False"
     .FullDeembedding "False"
     .SuperimposePLWExcitation "False"
     .UseSensitivityAnalysis "False"
End With

'@ set PBA version

'[VERSION]2022.4|31.0.1|20220426[/VERSION]
Discretizer.PBAVersion "2022042622"

'@ farfield plot options

'[VERSION]2022.4|31.0.1|20220426[/VERSION]
With FarfieldPlot 
     .Plottype "3D" 
     .Vary "angle1" 
     .Theta "90" 
     .Phi "90" 
     .Step "5" 
     .Step2 "5" 
     .SetLockSteps "True" 
     .SetPlotRangeOnly "False" 
     .SetThetaStart "0" 
     .SetThetaEnd "180" 
     .SetPhiStart "0" 
     .SetPhiEnd "360" 
     .SetTheta360 "False" 
     .SymmetricRange "False" 
     .SetTimeDomainFF "False" 
     .SetFrequency "-1" 
     .SetTime "0" 
     .SetColorByValue "True" 
     .DrawStepLines "False" 
     .DrawIsoLongitudeLatitudeLines "False" 
     .ShowStructure "True" 
     .ShowStructureProfile "True" 
     .SetStructureTransparent "False" 
     .SetFarfieldTransparent "True" 
     .AspectRatio "Free" 
     .ShowGridlines "True" 
     .InvertAxes "False", "False" 
     .SetSpecials "enablepolarextralines" 
     .SetPlotMode "Directivity" 
     .Distance "1" 
     .UseFarfieldApproximation "True" 
     .IncludeUnitCellSidewalls "True" 
     .SetScaleLinear "False" 
     .SetLogRange "40" 
     .SetLogNorm "0" 
     .DBUnit "0" 
     .SetMaxReferenceMode "abs" 
     .EnableFixPlotMaximum "False" 
     .SetFixPlotMaximumValue "1.0" 
     .SetInverseAxialRatio "False" 
     .SetAxesType "user" 
     .SetAntennaType "isotropic_linear" 
     .Phistart "1.000000e+00", "0.000000e+00", "0.000000e+00" 
     .Thetastart "0.000000e+00", "0.000000e+00", "1.000000e+00" 
     .PolarizationVector "0.000000e+00", "1.000000e+00", "0.000000e+00" 
     .SetCoordinateSystemType "ludwig2ae" 
     .SetAutomaticCoordinateSystem "True" 
     .SetPolarizationType "Slant" 
     .SlantAngle 0.000000e+00 
     .Origin "bbox" 
     .Userorigin "0.000000e+00", "0.000000e+00", "0.000000e+00" 
     .SetUserDecouplingPlane "False" 
     .UseDecouplingPlane "False" 
     .DecouplingPlaneAxis "X" 
     .DecouplingPlanePosition "0.000000e+00" 
     .LossyGround "False" 
     .GroundEpsilon "1" 
     .GroundKappa "0" 
     .EnablePhaseCenterCalculation "False" 
     .SetPhaseCenterAngularLimit "3.000000e+01" 
     .SetPhaseCenterComponent "boresight" 
     .SetPhaseCenterPlane "both" 
     .ShowPhaseCenter "True" 
     .ClearCuts 
     .AddCut "lateral", "0", "1"  
     .AddCut "lateral", "90", "1"  
     .AddCut "polar", "90", "1"  

     .StoreSettings
End With

'@ delete port: port1

'[VERSION]2022.0|31.0.1|20210823[/VERSION]
Port.Delete "1"

'@ new component: component2

'[VERSION]2022.0|31.0.1|20210823[/VERSION]
Component.New "component2"

'@ define brick: component2:barra central

'[VERSION]2022.0|31.0.1|20210823[/VERSION]
With Brick
     .Reset 
     .Name "barra central" 
     .Component "component2" 
     .Material "Aluminum" 
     .Xrange "-0.5", "0.5" 
     .Yrange "-5", "39" 
     .Zrange "-0.5", "0.5" 
     .Create
End With

'@ new component: component3

'[VERSION]2022.0|31.0.1|20210823[/VERSION]
Component.New "component3"

'@ define brick: component3:barra perpendicular

'[VERSION]2022.0|31.0.1|20210823[/VERSION]
With Brick
     .Reset 
     .Name "barra perpendicular" 
     .Component "component3" 
     .Material "Aluminum" 
     .Xrange "-0.4", "0.4" 
     .Yrange "6.6", "7.4" 
     .Zrange "-0.5", "-4" 
     .Create
End With

'@ define cylinder: component3:agujero barra vertical

'[VERSION]2022.0|31.0.1|20210823[/VERSION]
With Cylinder 
     .Reset 
     .Name "agujero barra vertical" 
     .Component "component3" 
     .Material "Vacuum" 
     .OuterRadius "0.1" 
     .InnerRadius "0" 
     .Axis "x" 
     .Xrange "-0.4", "0.4" 
     .Ycenter "7" 
     .Zcenter "-3" 
     .Segments "0" 
     .Create 
End With

'@ boolean subtract shapes: component3:barra perpendicular, component3:agujero barra vertical

'[VERSION]2022.0|31.0.1|20210823[/VERSION]
Solid.Subtract "component3:barra perpendicular", "component3:agujero barra vertical"

'@ define material: Copper (pure)

'[VERSION]2022.0|31.0.1|20210823[/VERSION]
With Material
     .Reset
     .Name "Copper (pure)"
     .Folder ""
.FrqType "all"
.Type "Lossy metal"
.MaterialUnit "Frequency", "GHz"
.MaterialUnit "Geometry", "mm"
.MaterialUnit "Time", "s"
.MaterialUnit "Temperature", "Kelvin"
.Mu "1.0"
.Sigma "5.96e+007"
.Rho "8930.0"
.ThermalType "Normal"
.ThermalConductivity "401.0"
.SpecificHeat "390", "J/K/kg"
.MetabolicRate "0"
.BloodFlow "0"
.VoxelConvection "0"
.MechanicsType "Isotropic"
.YoungsModulus "120"
.PoissonsRatio "0.33"
.ThermalExpansionRate "17"
.ReferenceCoordSystem "Global"
.CoordSystemType "Cartesian"
.NLAnisotropy "False"
.NLAStackingFactor "1"
.NLADirectionX "1"
.NLADirectionY "0"
.NLADirectionZ "0"
.FrqType "static"
.Type "Normal"
.SetMaterialUnit "Hz", "mm"
.Epsilon "1"
.Mu "1.0"
.Kappa "5.96e+007"
.TanD "0.0"
.TanDFreq "0.0"
.TanDGiven "False"
.TanDModel "ConstTanD"
.KappaM "0"
.TanDM "0.0"
.TanDMFreq "0.0"
.TanDMGiven "False"
.TanDMModel "ConstTanD"
.DispModelEps "None"
.DispModelMu "None"
.DispersiveFittingSchemeEps "Nth Order"
.DispersiveFittingSchemeMu "Nth Order"
.UseGeneralDispersionEps "False"
.UseGeneralDispersionMu "False"
.Colour "1", "1", "0"
.Wireframe "False"
.Reflection "False"
.Allowoutline "True"
.Transparentoutline "False"
.Transparency "0"
.Create
End With

'@ new component: cable

'[VERSION]2022.0|31.0.1|20210823[/VERSION]
Component.New "cable"

'@ define cylinder: cable:alambre

'[VERSION]2022.0|31.0.1|20210823[/VERSION]
With Cylinder 
     .Reset 
     .Name "alambre" 
     .Component "cable" 
     .Material "Copper (pure)" 
     .OuterRadius "0.02" 
     .InnerRadius "0" 
     .Axis "x" 
     .Xrange "0", "-15" 
     .Ycenter "7" 
     .Zcenter "-3" 
     .Segments "0" 
     .Create 
End With

'@ new component: ajuste cilindro

'[VERSION]2022.0|31.0.1|20210823[/VERSION]
Component.New "ajuste cilindro"

'@ define cylinder: ajuste cilindro:cilindro de ajuste

'[VERSION]2022.0|31.0.1|20210823[/VERSION]
With Cylinder 
     .Reset 
     .Name "cilindro de ajuste" 
     .Component "ajuste cilindro" 
     .Material "Aluminum" 
     .OuterRadius "0.15" 
     .InnerRadius "0.12" 
     .Axis "x" 
     .Xrange "-0.5 - (Desp/3)", "-7 - (Desp/3)" 
     .Ycenter "7" 
     .Zcenter "-3" 
     .Segments "0" 
     .Create 
End With

'@ new component: ajuste barra lateral

'[VERSION]2022.0|31.0.1|20210823[/VERSION]
Component.New "ajuste barra lateral"

'@ define brick: ajuste barra lateral:ajuste barra lateral

'[VERSION]2022.0|31.0.1|20210823[/VERSION]
With Brick
     .Reset 
     .Name "ajuste barra lateral" 
     .Component "ajuste barra lateral" 
     .Material "Aluminum" 
     .Xrange "-5.8 + Desp", "-6.8 + Desp" 
     .Yrange "6.7", "7.3" 
     .Zrange "-4", "0.5" 
     .Create
End With

'@ rename component: component3 to: soporte de abajo

'[VERSION]2022.0|31.0.1|20210823[/VERSION]
Component.Rename "component3", "soporte de abajo"

'@ rename component: component2 to: barra central

'[VERSION]2022.0|31.0.1|20210823[/VERSION]
Component.Rename "component2", "barra central"

'@ rename component: component1 to: barillas

'[VERSION]2022.0|31.0.1|20210823[/VERSION]
Component.Rename "component1", "barillas"

'@ rename component: barillas to: varillas

'[VERSION]2022.0|31.0.1|20210823[/VERSION]
Component.Rename "barillas", "varillas"

'@ define cylinder: ajuste barra lateral:agujero BL 1

'[VERSION]2022.0|31.0.1|20210823[/VERSION]
With Cylinder 
     .Reset 
     .Name "agujero BL 1" 
     .Component "ajuste barra lateral" 
     .Material "Vacuum" 
     .OuterRadius "0.12" 
     .InnerRadius "0" 
     .Axis "x" 
     .Xrange "-5.8 + Desp", "-6.8 + Desp" 
     .Ycenter "7" 
     .Zcenter "0" 
     .Segments "0" 
     .Create 
End With

'@ boolean subtract shapes: ajuste barra lateral:ajuste barra lateral, ajuste barra lateral:agujero BL 1

'[VERSION]2022.0|31.0.1|20210823[/VERSION]
Solid.Subtract "ajuste barra lateral:ajuste barra lateral", "ajuste barra lateral:agujero BL 1"

'@ define cylinder: ajuste barra lateral:agujero BL 2

'[VERSION]2022.0|31.0.1|20210823[/VERSION]
With Cylinder 
     .Reset 
     .Name "agujero BL 2" 
     .Component "ajuste barra lateral" 
     .Material "Vacuum" 
     .OuterRadius "0.17" 
     .InnerRadius "0" 
     .Axis "x" 
     .Xrange "-5.8 + Desp", "-6.8 + Desp" 
     .Ycenter "7" 
     .Zcenter "-3" 
     .Segments "0" 
     .Create 
End With

'@ boolean subtract shapes: ajuste barra lateral:ajuste barra lateral, ajuste barra lateral:agujero BL 2

'[VERSION]2022.0|31.0.1|20210823[/VERSION]
Solid.Subtract "ajuste barra lateral:ajuste barra lateral", "ajuste barra lateral:agujero BL 2"

'@ pick center point

'[VERSION]2022.0|31.0.1|20210823[/VERSION]
Pick.PickCenterpointFromId "soporte de abajo:barra perpendicular", "9"

'@ pick circle center point

'[VERSION]2022.0|31.0.1|20210823[/VERSION]
Pick.PickCirclecenterFromId "cable:alambre", "6"

'@ pick circle center point

'[VERSION]2022.4|31.0.1|20220426[/VERSION]
Pick.PickCirclecenterFromId "cable:alambre", "2"

'@ define discrete port: 1

'[VERSION]2022.0|31.0.1|20210823[/VERSION]
With DiscretePort 
     .Reset 
     .PortNumber "1" 
     .Type "SParameter"
     .Label ""
     .Folder ""
     .Impedance "50.0"
     .VoltagePortImpedance "0.0"
     .Voltage "1.0"
     .Current "1.0"
     .Monitor "True"
     .Radius "0.0"
     .SetP1 "True", "0.4", "7", "-2.2414895324553"
     .SetP2 "True", "2", "7", "-3"
     .InvertDirection "False"
     .LocalCoordinates "False"
     .Wire ""
     .Position "end1"
     .Create 
End With

'@ define farfield monitor: farfield (f=1000)

'[VERSION]2022.0|31.0.1|20210823[/VERSION]
With Monitor 
     .Reset 
     .Name "farfield (f=1000)" 
     .Domain "Frequency" 
     .FieldType "Farfield" 
     .MonitorValue "1000" 
     .ExportFarfieldSource "False" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-15", "8.25", "-5", "39", "-4", "0.5" 
     .SetSubvolumeOffset "10", "10", "10", "10", "10", "10" 
     .SetSubvolumeInflateWithOffset "False" 
     .SetSubvolumeOffsetType "FractionOfWavelength" 
     .EnableNearfieldCalculation "True" 
     .Create 
End With

'@ define monitor: e-field (f=1000)

'[VERSION]2022.0|31.0.1|20210823[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=1000)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .MonitorValue "1000" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-15", "8.25", "-5", "39", "-4", "0.5" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ define monitor: h-field (f=1000)

'[VERSION]2022.0|31.0.1|20210823[/VERSION]
With Monitor 
     .Reset 
     .Name "h-field (f=1000)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Hfield" 
     .MonitorValue "1000" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-15", "8.25", "-5", "39", "-4", "0.5" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ define monitor: current-density (f=1000)

'[VERSION]2022.0|31.0.1|20210823[/VERSION]
With Monitor 
     .Reset 
     .Name "current-density (f=1000)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Current" 
     .MonitorValue "1000" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-15", "8.25", "-5", "39", "-4", "0.5" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ define monitor: h-energy (f=1000)

'[VERSION]2022.0|31.0.1|20210823[/VERSION]
With Monitor 
     .Reset 
     .Name "h-energy (f=1000)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Henergy" 
     .MonitorValue "1000" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-15", "8.25", "-5", "39", "-4", "0.5" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ define monitor: e-energy (f=1000)

'[VERSION]2022.0|31.0.1|20210823[/VERSION]
With Monitor 
     .Reset 
     .Name "e-energy (f=1000)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Eenergy" 
     .MonitorValue "1000" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-15", "8.25", "-5", "39", "-4", "0.5" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ farfield plot options

'[VERSION]2022.0|31.0.1|20210823[/VERSION]
With FarfieldPlot 
     .Plottype "Polar" 
     .Vary "angle1" 
     .Theta "90" 
     .Phi "90" 
     .Step "1" 
     .Step2 "1" 
     .SetLockSteps "True" 
     .SetPlotRangeOnly "False" 
     .SetThetaStart "0" 
     .SetThetaEnd "180" 
     .SetPhiStart "0" 
     .SetPhiEnd "360" 
     .SetTheta360 "False" 
     .SymmetricRange "False" 
     .SetTimeDomainFF "False" 
     .SetFrequency "-1" 
     .SetTime "0" 
     .SetColorByValue "True" 
     .DrawStepLines "False" 
     .DrawIsoLongitudeLatitudeLines "False" 
     .ShowStructure "True" 
     .ShowStructureProfile "True" 
     .SetStructureTransparent "False" 
     .SetFarfieldTransparent "True" 
     .AspectRatio "Free" 
     .ShowGridlines "True" 
     .InvertAxes "False", "False" 
     .SetSpecials "enablepolarextralines" 
     .SetPlotMode "Directivity" 
     .Distance "1" 
     .UseFarfieldApproximation "True" 
     .IncludeUnitCellSidewalls "True" 
     .SetScaleLinear "False" 
     .SetLogRange "40" 
     .SetLogNorm "0" 
     .DBUnit "0" 
     .SetMaxReferenceMode "abs" 
     .EnableFixPlotMaximum "False" 
     .SetFixPlotMaximumValue "1.0" 
     .SetInverseAxialRatio "False" 
     .SetAxesType "user" 
     .SetAntennaType "directional_linear" 
     .Phistart "1.000000e+00", "0.000000e+00", "0.000000e+00" 
     .Thetastart "0.000000e+00", "0.000000e+00", "1.000000e+00" 
     .PolarizationVector "0.000000e+00", "1.000000e+00", "0.000000e+00" 
     .SetCoordinateSystemType "ludwig3" 
     .SetAutomaticCoordinateSystem "True" 
     .SetPolarizationType "Slant" 
     .SlantAngle 0.000000e+00 
     .Origin "bbox" 
     .Userorigin "0.000000e+00", "0.000000e+00", "0.000000e+00" 
     .SetUserDecouplingPlane "False" 
     .UseDecouplingPlane "False" 
     .DecouplingPlaneAxis "X" 
     .DecouplingPlanePosition "0.000000e+00" 
     .LossyGround "False" 
     .GroundEpsilon "1" 
     .GroundKappa "0" 
     .EnablePhaseCenterCalculation "False" 
     .SetPhaseCenterAngularLimit "3.000000e+01" 
     .SetPhaseCenterComponent "boresight" 
     .SetPhaseCenterPlane "both" 
     .ShowPhaseCenter "True" 
     .ClearCuts 
     .AddCut "lateral", "0", "1"  
     .AddCut "lateral", "90", "1"  
     .AddCut "polar", "90", "1"  

     .StoreSettings
End With

'@ define cylinder: cable:solid1

'[VERSION]2022.4|31.0.1|20220426[/VERSION]
With Cylinder 
     .Reset 
     .Name "solid1" 
     .Component "cable" 
     .Material "Copper (pure)" 
     .OuterRadius "2" 
     .InnerRadius "0" 
     .Axis "z" 
     .Zrange "-1.4", "0" 
     .Xcenter "-10" 
     .Ycenter "10" 
     .Segments "0" 
     .Create 
End With

'@ delete shape: cable:solid1

'[VERSION]2022.4|31.0.1|20220426[/VERSION]
Solid.Delete "cable:solid1"

'@ define cylinder: cable:aislante

'[VERSION]2022.4|31.0.1|20220426[/VERSION]
With Cylinder 
     .Reset 
     .Name "aislante" 
     .Component "cable" 
     .Material "Aluminum" 
     .OuterRadius "0.11" 
     .InnerRadius "0.02" 
     .Axis "x" 
     .Xrange "-0.5", "-14.5" 
     .Ycenter "7" 
     .Zcenter "-3" 
     .Segments "0" 
     .Create 
End With

'@ change material: cable:aislante to: Vacuum

'[VERSION]2022.4|31.0.1|20220426[/VERSION]
Solid.ChangeMaterial "cable:aislante", "Vacuum"

'@ delete shape: varillas:antena_2

'[VERSION]2022.4|31.0.1|20220426[/VERSION]
Solid.Delete "varillas:antena_2"

'@ delete component: soporte de abajo

'[VERSION]2022.4|31.0.1|20220426[/VERSION]
Component.Delete "soporte de abajo"

'@ delete port: port1

'[VERSION]2022.4|31.0.1|20220426[/VERSION]
Port.Delete "1"

'@ define discrete port: 1

'[VERSION]2022.4|31.0.1|20220426[/VERSION]
With DiscretePort 
     .Reset 
     .PortNumber "1" 
     .Type "SParameter"
     .Label ""
     .Folder ""
     .Impedance "50.0"
     .VoltagePortImpedance "0.0"
     .Voltage "1.0"
     .Current "1.0"
     .Monitor "True"
     .Radius "0.0"
     .SetP1 "False", "0.0", "7", "-0.5"
     .SetP2 "False", "0.0", "7", "-3"
     .InvertDirection "False"
     .LocalCoordinates "False"
     .Wire ""
     .Position "end1"
     .Create 
End With

'@ delete monitors

'[VERSION]2022.4|31.0.1|20220426[/VERSION]
Monitor.Delete "current-density (f=1000)" 
Monitor.Delete "e-energy (f=1000)" 
Monitor.Delete "e-field (f=1000)" 
Monitor.Delete "farfield (f=1000)" 
Monitor.Delete "h-energy (f=1000)" 
Monitor.Delete "h-field (f=1000)"

'@ define time domain solver parameters

'[VERSION]2022.4|31.0.1|20220426[/VERSION]
Mesh.SetCreator "High Frequency" 

With Solver 
     .Method "Hexahedral"
     .CalculationType "TD-S"
     .StimulationPort "All"
     .StimulationMode "All"
     .SteadyStateLimit "-20"
     .MeshAdaption "False"
     .AutoNormImpedance "False"
     .NormingImpedance "50"
     .CalculateModesOnly "False"
     .SParaSymmetry "False"
     .StoreTDResultsInCache  "False"
     .RunDiscretizerOnly "False"
     .FullDeembedding "False"
     .SuperimposePLWExcitation "False"
     .UseSensitivityAnalysis "False"
End With

'@ define frequency range

'[VERSION]2022.4|31.0.1|20220426[/VERSION]
Solver.FrequencyRange "300", "1500"

'@ define time domain solver acceleration

'[VERSION]2022.0|31.0.1|20210823[/VERSION]
With Solver 
     .UseParallelization "True"
     .MaximumNumberOfThreads "1024"
     .MaximumNumberOfCPUDevices "8"
     .RemoteCalculation "False"
     .UseDistributedComputing "False"
     .MaxNumberOfDistributedComputingPorts "64"
     .DistributeMatrixCalculation "True"
     .MPIParallelization "False"
     .AutomaticMPI "False"
     .HardwareAcceleration "True"
     .MaximumNumberOfGPUs "16"
End With
UseDistributedComputingForParameters "False"
MaxNumberOfDistributedComputingParameters "2"
UseDistributedComputingMemorySetting "False"
MinDistributedComputingMemoryLimit "0"
UseDistributedComputingSharedDirectory "False"
OnlyConsider0D1DResultsForDC "False"

