<?xml version="1.0" encoding="UTF-8"?>
<MetaResultFile version="20210114" creator="SolverPP secondary quantity evaluation">
  <MetaGeometryFile filename="model.gex" lod="1"/>
  <SimulationProperties fieldname="e-energy (f=1000)" frequency="1000" encoded_unit="&amp;U:J^1.:m^-3" quantity="energy_density" fieldtype="Electric Energy Density" fieldscaling="TIME_AVERAGE" dB_Amplitude="10" excitation="1">
    <PrimaryResults>
      <PrimaryResult name="e-field (f=1000)_1,1_m3d.rex"/>
    </PrimaryResults>
  </SimulationProperties>
  <ResultDataType vector="0" complex="0" timedomain="0" frequencymap="0"/>
  <SimulationDomain min="-28.6269302 -18.6269302 -17.6269302" max="21.8769302 52.6269302 14.1269302"/>
  <PlotSettings Plot="4" ignore_symmetry="0" deformation="0" enforce_culling="0" default_arrow_type="ARROWS"/>
  <Source type="POSTPROCESSING"/>
  <SpecialMaterials>
    <Background type="NORMAL"/>
    <Material name="Aluminum" type="FIELDFREE"/>
    <Material name="Copper (pure)" type="FIELDFREE"/>
    <Material name="PEC" type="FIELDFREE"/>
  </SpecialMaterials>
  <AuxGeometryFile/>
  <AuxResultFile/>
  <FieldFreeNodes/>
  <SurfaceFieldCoefficients/>
  <UnitCell/>
  <SubVolume/>
  <Units/>
  <ProjectUnits/>
  <TimeSampling/>
  <ResultGroups num_steps="1" transformation="1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1" process_mesh_group="0">
    <Frame index="0">
      <FieldResultFile filename="e-energy (f=1000)_1.m3d" type="m3d"/>
    </Frame>
  </ResultGroups>
</MetaResultFile>
