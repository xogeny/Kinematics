within Kinematics.Interfaces;
partial model GearTest "A base class to test gears"

  Modelica.Mechanics.Rotational.Sources.ConstantSpeed dyno(w_fixed=100,
      useSupport=true)
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  replaceable
    Modelica.Mechanics.Rotational.Interfaces.PartialElementaryTwoFlangesAndSupport2
                                                                                              gear(useSupport=true)
    constrainedby
    Modelica.Mechanics.Rotational.Interfaces.PartialElementaryTwoFlangesAndSupport2
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed
    annotation (Placement(transformation(extent={{-10,-46},{10,-26}})));
  Modelica.Mechanics.Rotational.Components.Inertia load(J=2.0)
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  Modelica.Mechanics.Rotational.Components.Damper damper(d=1) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={50,-26})));
equation
  connect(dyno.flange, gear.flange_a) annotation (Line(
      points={{-30,0},{-10,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dyno.support, fixed.flange) annotation (Line(
      points={{-40,-10},{-40,-26},{0,-26},{0,-36}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(gear.support, fixed.flange) annotation (Line(
      points={{0,-10},{0,-36}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(load.flange_a, gear.flange_b) annotation (Line(
      points={{40,0},{10,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(damper.flange_a, load.flange_b) annotation (Line(
      points={{60,-26},{70,-26},{70,0},{60,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(damper.flange_b, fixed.flange) annotation (Line(
      points={{40,-26},{0,-26},{0,-36},{0,-36}},
      color={0,0,0},
      smooth=Smooth.None));
  annotation (Diagram(graphics));
end GearTest;
