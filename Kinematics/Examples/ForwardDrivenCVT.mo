within Kinematics.Examples;
model ForwardDrivenCVT "A forward driven CVT model"
  extends ForwardDrivenBase(redeclare Transmissions.CVT_Transmission
      transmission(tau=0.1));
  Modelica.Blocks.Sources.Ramp ramp1(
    height=1.0,
    duration=0.25,
    offset=1.0,
    startTime=1.5)
    annotation (Placement(transformation(extent={{-10,50},{10,70}})));
equation
  connect(ramp1.y, transmission.ratio) annotation (Line(
      points={{11,60},{40,60},{40,12}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (experiment(StopTime=3));
end ForwardDrivenCVT;
