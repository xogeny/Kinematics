within Kinematics.Interfaces;
partial model TransmissionTest "A base class to test transmissions"

  Modelica.Mechanics.Rotational.Sources.ConstantSpeed dyno(w_fixed=100,
      useSupport=true)
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  replaceable Interfaces.PartialTransmission transmission constrainedby
    Interfaces.PartialTransmission(start_engaged=false)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed
    annotation (Placement(transformation(extent={{-10,-46},{10,-26}})));
  Modelica.Mechanics.Rotational.Components.Inertia load(J=2.0,
    phi(start=0, fixed=true),
    w(start=0, fixed=true))
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  Modelica.Blocks.Sources.BooleanPulse engage(period=2, startTime=0.5)
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  Modelica.Mechanics.Rotational.Components.Damper damper(d=1) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={50,-26})));
initial equation
  dyno.flange.phi = 0;

equation
  connect(dyno.flange, transmission.input_shaft) annotation (Line(
      points={{-30,0},{-10,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dyno.support, fixed.flange) annotation (Line(
      points={{-40,-10},{-40,-26},{0,-26},{0,-36}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(transmission.support, fixed.flange) annotation (Line(
      points={{0,-10},{0,-36}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(load.flange_a, transmission.output_shaft) annotation (Line(
      points={{40,0},{10,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(engage.y, transmission.engage) annotation (Line(
      points={{-59,30},{-26,30},{-26,4},{-12,4}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(damper.flange_a, load.flange_b) annotation (Line(
      points={{60,-26},{70,-26},{70,0},{60,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(damper.flange_b, fixed.flange) annotation (Line(
      points={{40,-26},{0,-26},{0,-36}},
      color={0,0,0},
      smooth=Smooth.None));
  annotation (Diagram(graphics));
end TransmissionTest;
