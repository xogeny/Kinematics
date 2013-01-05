within Kinematics.Transmissions;
model StepRatioTransmission "A step ratio transmission"
  extends Interfaces.PartialTransmission(redeclare
      Kinematics.Components.StepRatio_Gear partialGear(shift_time=shift_time,
        ratios=ratios));
  Modelica.Blocks.Interfaces.IntegerInput gear "Desired gear" annotation (
      Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,120})));
  parameter Modelica.SIunits.Time shift_time "Time to shift gears";
  parameter Real ratios[:] "Discrete gear ratios";
equation
  connect(partialGear.gear, gear) annotation (Line(
      points={{0,12},{0,120}},
      color={255,127,0},
      smooth=Smooth.None));
  annotation (Diagram(graphics));
end StepRatioTransmission;
