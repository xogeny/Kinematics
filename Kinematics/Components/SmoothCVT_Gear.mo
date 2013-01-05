within Kinematics.Components;
model SmoothCVT_Gear "A continuously variable gear with smoothing"
  extends Modelica.Mechanics.Rotational.Icons.Gear;
  extends Kinematics.Interfaces.PartialGear;
  parameter Modelica.SIunits.Time tau "Time constant for ratio change";
  Modelica.Blocks.Interfaces.RealInput ratio "Desired gear ratio" annotation (
      Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,120})));
initial equation
  R = ratio;
equation
  tau*der(R) = ratio-R;
end SmoothCVT_Gear;
