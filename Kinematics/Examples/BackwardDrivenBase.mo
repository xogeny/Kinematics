within Kinematics.Examples;
partial model BackwardDrivenBase
  "Use a transmission model in a backward driven way"

  Modelica.Mechanics.Rotational.Sources.Torque torque(useSupport=true)
    annotation (Placement(transformation(extent={{-60,-50},{-40,-30}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=0.067)
    annotation (Placement(transformation(extent={{-20,-50},{0,-30}})));
  Modelica.Mechanics.Rotational.Components.Inertia load(J=0.17)
    annotation (Placement(transformation(extent={{50,-50},{70,-30}})));
  Modelica.Mechanics.Rotational.Components.Damper damper(d=1)
    annotation (Placement(transformation(extent={{50,-80},{70,-60}})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed
    annotation (Placement(transformation(extent={{20,-80},{40,-60}})));
  replaceable Interfaces.PartialTransmission transmission(engagement_time=0.125)
    annotation (Placement(transformation(extent={{20,-50},{40,-30}})));
  Modelica.Blocks.Sources.BooleanConstant engaged(k=true)
    annotation (Placement(transformation(extent={{-50,-20},{-30,0}})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor output_speed annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={50,-10})));
  Modelica.Blocks.Sources.Ramp desired_speed(
    height=100,
    duration=1.5,
    offset=100,
    startTime=0.5)
    annotation (Placement(transformation(extent={{-20,60},{0,80}})));
  Modelica.Blocks.Math.InverseBlockConstraints inverseBlockConstraints
    annotation (Placement(transformation(extent={{30,58},{70,82}})));
equation
  connect(transmission.support, fixed.flange)     annotation (Line(
      points={{30,-50},{30,-70}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(load.flange_b, damper.flange_b) annotation (Line(
      points={{70,-40},{80,-40},{80,-70},{70,-70}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(damper.flange_a, fixed.flange) annotation (Line(
      points={{50,-70},{30,-70}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(transmission.output_shaft, load.flange_a)     annotation (Line(
      points={{40,-40},{50,-40}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(inertia.flange_b, transmission.input_shaft)     annotation (Line(
      points={{0,-40},{20,-40}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(torque.flange, inertia.flange_a) annotation (Line(
      points={{-40,-40},{-20,-40}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(torque.support, fixed.flange) annotation (Line(
      points={{-50,-50},{-50,-70},{30,-70}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(engaged.y, transmission.engage)     annotation (Line(
      points={{-29,-10},{6,-10},{6,-36},{18,-36}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(desired_speed.y, inverseBlockConstraints.u1) annotation (Line(
      points={{1,70},{28,70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(output_speed.flange, load.flange_a) annotation (Line(
      points={{50,-20},{50,-40}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(output_speed.w, inverseBlockConstraints.u2) annotation (Line(
      points={{50,1},{50,70},{34,70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(inverseBlockConstraints.y1, torque.tau) annotation (Line(
      points={{71,70},{80,70},{80,90},{-80,90},{-80,-40},{-62,-40}},
      color={0,0,127},
      smooth=Smooth.None));
end BackwardDrivenBase;
