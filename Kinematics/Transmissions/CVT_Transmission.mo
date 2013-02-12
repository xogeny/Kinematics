within Kinematics.Transmissions;
model CVT_Transmission "A transmission with a continuous variable gear ratio"
  extends Interfaces.PartialTransmission(redeclare
      Kinematics.Components.SmoothCVT_Gear gear(tau=tau));
  Modelica.Blocks.Interfaces.RealInput ratio "Desired gear ratio" annotation (
      Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,120})));
  parameter Modelica.SIunits.Time tau "Time constant for ratio change";
equation
  connect(gear.ratio, ratio) annotation (Line(
      points={{0,12},{0,120}},
      color={0,0,127},
      smooth=Smooth.None));
end CVT_Transmission;
