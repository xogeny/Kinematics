within Kinematics.Transmissions;
model StepRatioTransmission "A step ratio transmission"
  extends Interfaces.PartialTransmission(redeclare
      Kinematics.Components.StepRatio_Gear gear(shift_time=shift_time,
        ratios=ratios));
  Modelica.Blocks.Interfaces.IntegerInput gear_cmd "Desired gear" annotation (
      Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,120})));
  parameter Modelica.SIunits.Time shift_time "Time to shift gears";
  parameter Real ratios[:] "Discrete gear ratios";
equation
  connect(gear.gear, gear_cmd) annotation (Line(
      points={{0,12},{0,120}},
      color={255,127,0},
      smooth=Smooth.None));
  annotation (Diagram(graphics));
end StepRatioTransmission;
