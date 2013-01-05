within Kinematics.Components;
model SingleGear2
  "Gear with a single, constant gear ratio extends from PartialTransmission"
  extends Modelica.Mechanics.Rotational.Icons.Gear;
  extends Kinematics.Interfaces.PartialGear;
  parameter Real ratio(start=1)
    "Transmission ratio (flange_a.phi/flange_b.phi)";
equation
  R = ratio;
end SingleGear2;
