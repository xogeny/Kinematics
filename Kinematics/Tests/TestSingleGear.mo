within Kinematics.Tests;
model TestSingleGear "A test of the SingleGear model"
  extends Kinematics.Interfaces.GearTest(
                                      redeclare Components.SingleGear
      gear(ratio=2.0));
end TestSingleGear;
