within Kinematics.Examples;
partial model ForwardDrivenBase
  "Use a transmission model in a forward driven way"

  Modelica.Blocks.Sources.Ramp ramp(
    duration=0.5,
    startTime=0.25,
    height=50,
    offset=100)
    annotation (Placement(transformation(extent={{-90,-10},{-70,10}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque(useSupport=true)
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=0.067)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.Inertia load(J=0.17)
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Modelica.Mechanics.Rotational.Components.Damper damper(d=1)
    annotation (Placement(transformation(extent={{60,-40},{80,-20}})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed
    annotation (Placement(transformation(extent={{30,-40},{50,-20}})));
  replaceable Interfaces.PartialTransmission transmission(engagement_time=0.125)
    annotation (Placement(transformation(extent={{30,-10},{50,10}})));
  Modelica.Blocks.Sources.BooleanConstant engaged(k=true)
    annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
equation
  connect(transmission.support, fixed.flange)     annotation (Line(
      points={{40,-10},{40,-30}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(load.flange_b, damper.flange_b) annotation (Line(
      points={{80,0},{90,0},{90,-30},{80,-30}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(damper.flange_a, fixed.flange) annotation (Line(
      points={{60,-30},{40,-30}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(transmission.output_shaft, load.flange_a)     annotation (Line(
      points={{50,0},{60,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(inertia.flange_b, transmission.input_shaft)     annotation (Line(
      points={{10,0},{30,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(torque.flange, inertia.flange_a) annotation (Line(
      points={{-30,0},{-10,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(torque.support, fixed.flange) annotation (Line(
      points={{-40,-10},{-40,-30},{40,-30}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(ramp.y, torque.tau) annotation (Line(
      points={{-69,0},{-52,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(engaged.y, transmission.engage)     annotation (Line(
      points={{-19,30},{16,30},{16,4},{28,4}},
      color={255,0,255},
      smooth=Smooth.None));
end ForwardDrivenBase;
