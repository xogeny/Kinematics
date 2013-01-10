within Kinematics.Tests;
model TestCVT_Gear "Test CVT with a step ratio change (won't work)"
  extends Kinematics.Interfaces.GearTest(redeclare replaceable
      Components.CVT_Gear gear constrainedby Kinematics.Components.CVT_Gear);
  Modelica.Blocks.Sources.Step step(
    offset=2.0,
    startTime=0.5,
    height=2.0)
    annotation (Placement(transformation(extent={{-52,30},{-32,50}})));
equation
  connect(step.y, gear.ratio) annotation (Line(
      points={{-31,40},{0,40},{0,12}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(graphics),
    Documentation(info="<html>
<p>This model does not (in general) work. This is because index reduction necessitates differentiation of the kinematic constraint and the gear ratio <tt>R</tt> is not smooth. The correct way to implement the CVT gear is as shown in the <a href=\"modelica://Kinematics.Components.SmoothCVT_Gear\"><tt>SmoothCVT_Gear</tt></a> model.</p>
<p>
Additional discussion about this model can be found in the Xogeny Blog post title <a href=\"http://blog.xogeny.com/blog/kinematic-transmissions/\">\"Kinematic Transmissions\"</a>.
</p>
</html>"));
end TestCVT_Gear;
