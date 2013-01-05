within Kinematics.Tests;
model TestCVT_Gear "Test CVT with a step ratio change (won't work)"
  extends Kinematics.Interfaces.GearTest(redeclare replaceable
      Components.CVT_Gear gear constrainedby Kinematics.Components.CVT_Gear);
  Modelica.Blocks.Sources.Step step(
    offset=2.0,
    startTime=0.5,
    height=2.0)
    annotation (Placement(transformation(extent={{-52,30},{-32,50}})));
equation
  connect(step.y, gear.ratio) annotation (Line(
      points={{-31,40},{0,40},{0,12}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(graphics),
    experiment(StopTime=5, Tolerance=1e-006),
    __Dymola_experimentSetupOutput);
end TestCVT_Gear;
