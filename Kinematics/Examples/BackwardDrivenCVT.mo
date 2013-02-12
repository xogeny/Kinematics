within Kinematics.Examples;
model BackwardDrivenCVT "An example of a CVT model driven backward"
  extends BackwardDrivenBase(redeclare Transmissions.CVT_Transmission
      transmission(tau=0.1));
  Modelica.Blocks.Sources.Ramp gear_ratio(
    height=1.0,
    duration=0.25,
    offset=1.0,
    startTime=1.0)
    annotation (Placement(transformation(extent={{-20,20},{0,40}})));
equation
  connect(gear_ratio.y, transmission.ratio) annotation (Line(
      points={{1,30},{30,30},{30,-28}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (experiment(StopTime=3));
end BackwardDrivenCVT;
