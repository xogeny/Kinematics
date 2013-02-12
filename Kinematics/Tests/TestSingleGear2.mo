within Kinematics.Tests;
model TestSingleGear2 "A test of the SingleGear model"
  extends Kinematics.Interfaces.GearTest(
                                      redeclare Components.SingleGear2
      gear(ratio=2.0));
  AssertInitial initial_load_speed(expected=50.0,actual=load.w);
  AssertFinal final_load_speed(expected=50.0,actual=load.w);
  AssertInitial initial_dyno_speed(expected=100.0,actual=dyno.w);
  AssertFinal final_dyno_speed(expected=100.0,actual=dyno.w);
  annotation (experiment(StopTime=5, Tolerance=1e-006));
end TestSingleGear2;
