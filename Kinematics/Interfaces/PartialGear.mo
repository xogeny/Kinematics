within Kinematics.Interfaces;
partial model PartialGear "Base class for a variety of kinematic gear models"
  extends
    Modelica.Mechanics.Rotational.Interfaces.PartialElementaryTwoFlangesAndSupport2;
protected
  Real R;
  Modelica.SIunits.Angle phi_a "Angle between left shaft flange and support";
  Modelica.SIunits.Angle phi_b "Angle between right shaft flange and support";
equation
  phi_a = flange_a.phi - phi_support;
  phi_b = flange_b.phi - phi_support;
  der(phi_a) = R*der(phi_b);
  0 = R*flange_a.tau + flange_b.tau;
end PartialGear;
