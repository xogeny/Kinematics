within Kinematics.Tests;
model TestStepRatioTransmission "Test the step ratio transmission"
  extends Interfaces.TransmissionTest(redeclare
      Transmissions.StepRatioTransmission transmission(
      engagement_time=0.15,
      shift_time=0.15,
      ratios={1.0,2.0,4.0}), engage(period=20));
  Modelica.Blocks.Sources.IntegerTable gear_selection(table=[-1,1; 1.5,2; 3.0,3])
    annotation (Placement(transformation(extent={{-40,60},{-20,80}})));
equation
  connect(transmission.gear, gear_selection.y) annotation (Line(
      points={{0,12},{0,70},{-19,70}},
      color={255,127,0},
      smooth=Smooth.None));
  annotation (Diagram(graphics));
end TestStepRatioTransmission;
