within Kinematics.Tests;
model TestCVT_Transmission "Test the CVT transmission model"
  extends Interfaces.TransmissionTest(redeclare Transmissions.CVT_Transmission
                                     transmission(tau=0.15, engagement_time=0.15),
      engage(period=10));
  Modelica.Blocks.Sources.Sine sine(
    amplitude=0.5,
    freqHz=0.25,
    offset=2.0,
    startTime=0.1)
    annotation (Placement(transformation(extent={{-40,50},{-20,70}})));
  AssertInitial initial_load_speed(expected=0.0,actual=load.w);
  AssertInitial initial_dyno_speed(expected=100.0,actual=dyno.w);
  AssertValueAt engaged_load_speed(at=23.22,expected=66.08,actual=load.w,eps=1e-1);
equation
  connect(sine.y, transmission.ratio) annotation (Line(
      points={{-19,60},{0,60},{0,12}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (experiment(StopTime=30, Tolerance=1e-006));
end TestCVT_Transmission;
