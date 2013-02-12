within Kinematics.Tests;
model TestCrankSlider_TimeDerivative
  "This fails in some tools because it uses time derivatives."
  replaceable Kinematics.Components.CrankSlider_TimeDerivative crankSlider(
      crank_radius=1, rod_length=2)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=0.25)
    annotation (Placement(transformation(extent={{-30,-50},{-10,-30}})));
  Modelica.Mechanics.Translational.Sources.Force force annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,30})));
  Modelica.Blocks.Sources.Ramp ramp(
    startTime=0.25,
    height=1,
    duration=0.5,
    offset=0) annotation (Placement(transformation(extent={{-40,50},{-20,70}})));
equation
  connect(inertia.flange_b, crankSlider.crank) annotation (Line(
      points={{-10,-40},{0,-40},{0,-10}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(force.flange, crankSlider.slider) annotation (Line(
      points={{-1.83697e-015,20},{0,20},{0,10}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(ramp.y, force.f) annotation (Line(
      points={{-19,60},{2.20436e-015,60},{2.20436e-015,42}},
      color={0,0,127},
      smooth=Smooth.None));
end TestCrankSlider_TimeDerivative;
