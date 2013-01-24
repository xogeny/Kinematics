within Kinematics.Tests;
model TestCrankSlider "This uses the robust model"
  extends TestCrankSlider_TimeDerivative(redeclare Components.CrankSlider
      crankSlider);
end TestCrankSlider;
