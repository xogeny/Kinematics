within Kinematics.Tests;
model TestSmoothCVT_Gear "Same step change test but with smoothing"
  extends TestCVT_Gear(redeclare Components.SmoothCVT_Gear gear(tau=0.1));
  AssertInitial initial_load_speed(expected=50.0,actual=load.w);
  AssertFinal final_load_speed(expected=25.0,actual=load.w);
  AssertInitial initial_dyno_speed(expected=100.0,actual=dyno.w);
  AssertFinal final_dyno_speed(expected=100.0,actual=dyno.w);
  annotation (experiment(StopTime=5, Tolerance=1e-006));
end TestSmoothCVT_Gear;
