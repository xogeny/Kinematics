within Kinematics.Tests;
model TestSingleGear2 "A test of the SingleGear model"
  extends Kinematics.Interfaces.GearTest(
                                      redeclare Components.SingleGear2
      gear(ratio=2.0));
end TestSingleGear2;
