within Kinematics.Components;
model CrankSlider "More robust because it uses differentials"
  parameter Modelica.SIunits.Length crank_radius;
  parameter Modelica.SIunits.Length rod_length;
  Modelica.Mechanics.Rotational.Interfaces.Flange_a crank "The crank portion"
    annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a slider
    "The slider portion"
    annotation (Placement(transformation(extent={{-10,90},{10,110}})));
  import Modelica.Math.*;
protected
  Real ds_dphi(unit="m/rad");
equation
  slider.s = crank_radius+rod_length-(sqrt(rod_length^2-crank_radius^2*sin(crank.phi)^2))+crank_radius*cos(crank.phi);
  ds_dphi = (crank_radius^2*sin(crank.phi)*cos(crank.phi))/(sqrt(rod_length^2-crank_radius^2*sin(crank.phi)^2))-crank_radius*sin(crank.phi);
  slider.f*ds_dphi + crank.tau = 0;
  annotation (
    Icon(graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-60,100},{60,-20}},
          lineColor={0,0,0},
          fillPattern=FillPattern.VerticalCylinder,
          fillColor={215,215,215}),
        Polygon(
          points={{-60,-24},{-48,-8},{48,-8},{60,-24},{-60,-24}},
          fillPattern=FillPattern.VerticalCylinder,
          smooth=Smooth.None,
          fillColor={255,255,255},
          pattern=LinePattern.None),
        Ellipse(
          extent={{-6,24},{6,12}},
          pattern=LinePattern.None,
          fillPattern=FillPattern.Solid,
          fillColor={0,0,0},
          lineColor={0,0,0}),
        Polygon(
          points={{-2,16},{30,-60},{36,-58},{4,16},{-2,16}},
          pattern=LinePattern.None,
          smooth=Smooth.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{0,-96},{32,-52},{36,-58},{4,-100},{0,-96}},
          pattern=LinePattern.None,
          smooth=Smooth.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid)}),
    Documentation(info="<html>
<p>This is based on <a href=\"http://www.engr.colostate.edu/~allan/thermo/page2/page2.html\">this analysis of a crank slider mechanism</a>.</p>
</html>"));
end CrankSlider;
