within Kinematics.Components;
model IdealGear "Robust ideal gear model"
  parameter Real R "Gear ratio";
  extends Modelica.Mechanics.Rotational.Interfaces.PartialTwoFlanges;
protected
  Real da_db = R;
equation
  flange_a.phi = R*flange_b.phi;
  flange_a.tau*da_db + flange_b.tau = 0 "Conservation of energy";
  annotation (Icon(graphics={
        Rectangle(
          extent={{-100,10},{-40,-10}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={192,192,192}),
        Rectangle(
          extent={{-40,20},{-20,-20}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={192,192,192}),
        Rectangle(
          extent={{-40,100},{-20,20}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={192,192,192}),
        Rectangle(
          extent={{-20,70},{20,50}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={192,192,192}),
        Rectangle(
          extent={{20,80},{40,39}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={192,192,192}),
        Rectangle(
          extent={{20,40},{40,-40}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={192,192,192}),
        Rectangle(
          extent={{40,10},{100,-10}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={192,192,192}),
        Text(
          extent={{-100,-40},{100,-100}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="%name")}));
end IdealGear;
