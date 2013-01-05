within Kinematics.Tests;
model TestSmoothCVT_Gear "Same step change test but with smoothing"
  extends TestCVT_Gear(redeclare Components.SmoothCVT_Gear gear(tau=0.1));
end TestSmoothCVT_Gear;
