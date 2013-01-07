within Kinematics.Interfaces;
partial model PartialTransmission

  Modelica.Mechanics.Rotational.Interfaces.Support support
    "Transmission housing"
    annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b output_shaft "Output shaft"
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Components.KinematicClutch kinematicClutch(shift_time=engagement_time,
      start_engaged=start_engaged)
    annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a input_shaft "Input shaft"
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Blocks.Interfaces.BooleanInput engage
    annotation (Placement(transformation(extent={{-140,20},{-100,60}})));
protected
  replaceable PartialGear gear(final useSupport=true)
    annotation (choicesAllMatching=true, Placement(transformation(extent={{-10,-10},{10,10}})));
public
  parameter Modelica.SIunits.Time engagement_time;
  parameter Boolean start_engaged=true;
equation
  connect(gear.support, support)        annotation (Line(
      points={{0,-10},{0,-100}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(gear.flange_b, output_shaft)        annotation (Line(
      points={{10,0},{100,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(kinematicClutch.flange_b, gear.flange_a)        annotation (Line(
      points={{-50,0},{-10,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(kinematicClutch.flange_a, input_shaft) annotation (Line(
      points={{-70,0},{-100,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(kinematicClutch.command, engage) annotation (Line(
      points={{-60,11},{-60,40},{-120,40}},
      color={255,0,255},
      smooth=Smooth.None));
  annotation (Diagram(graphics));
end PartialTransmission;
