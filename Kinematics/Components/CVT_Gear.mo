within Kinematics.Components;
model CVT_Gear "A continuously variable gear"
  extends Modelica.Mechanics.Rotational.Icons.Gear;
  extends Kinematics.Interfaces.PartialGear;
  Modelica.Blocks.Interfaces.RealInput ratio "Desired gear ratio" annotation (
      Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,120})));
equation
  R = ratio;
end CVT_Gear;
