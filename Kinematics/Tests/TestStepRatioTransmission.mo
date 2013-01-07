within Kinematics.Tests;
model TestStepRatioTransmission "Test the step ratio transmission"
  extends Interfaces.TransmissionTest(redeclare
      Transmissions.StepRatioTransmission transmission(
      engagement_time=0.15,
      shift_time=0.15,
      ratios={1.0,2.0,4.0}), engage(period=20));
  Modelica.Blocks.Sources.IntegerTable gear_selection(table=[-1,1; 1.5,2; 3.0,
        3]) annotation (Placement(transformation(extent={{-40,60},{-20,80}})));
  AssertInitial initial_load_speed(expected=0.0,actual=load.w);
  AssertInitial initial_dyno_speed(expected=100.0,actual=dyno.w);
  AssertValueAt engaged_load_speed1(at=1.0,expected=100.0,actual=load.w,eps=1e-3);
  AssertValueAt engaged_load_speed2(at=2.0,expected=50.0,actual=load.w,eps=1e-3);
  AssertValueAt engaged_load_speed4(at=4.0,expected=25.0,actual=load.w,eps=1e-3);
equation
  connect(gear_selection.y, transmission.gear_cmd) annotation (Line(
      points={{-19,70},{0,70},{0,12}},
      color={255,127,0},
      smooth=Smooth.None));
  annotation (Diagram(graphics),
    experiment(StopTime=30, Tolerance=1e-006),
    __Dymola_experimentSetupOutput);
end TestStepRatioTransmission;
