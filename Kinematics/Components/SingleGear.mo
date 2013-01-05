within Kinematics.Components;
model SingleGear "Gear a single, constant gear ratio"
  extends Modelica.Mechanics.Rotational.Icons.Gear;
  extends
    Modelica.Mechanics.Rotational.Interfaces.PartialElementaryTwoFlangesAndSupport2;
  parameter Real ratio(start=1)
    "Transmission ratio (flange_a.phi/flange_b.phi)";
protected
  Modelica.SIunits.Angle phi_a "Angle between left shaft flange and support";
  Modelica.SIunits.Angle phi_b "Angle between right shaft flange and support";
equation
  phi_a = flange_a.phi - phi_support;
  phi_b = flange_b.phi - phi_support;
  der(phi_a) = ratio*der(phi_b);
  0 = ratio*flange_a.tau + flange_b.tau;
end SingleGear;
