within Kinematics.Components;
model KinematicClutch "A kinematic clutch model"
  extends Modelica.Mechanics.Rotational.Interfaces.PartialTwoFlanges;
  Modelica.Blocks.Interfaces.BooleanInput command annotation(Placement(visible=true, transformation(origin={-195.3463,59.8666}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0), iconTransformation(origin={0.0,110.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=-90)));
  parameter Modelica.SIunits.Time shift_time(min=Modelica.Constants.eps);
  parameter Boolean start_engaged=true;
public
  Modelica.SIunits.AngularVelocity w_rel=der(flange_a.phi) - der(flange_b.phi);
  Modelica.SIunits.AngularAcceleration a_rel=der(w_rel);
  Modelica.SIunits.Torque tau=flange_a.tau;
  Boolean free;
  Modelica.SIunits.AngularAcceleration a_close;
  Modelica.SIunits.Torque tau_hold;
  Modelica.SIunits.Time start_time;
initial equation
  start_time= -Modelica.Constants.inf;
  flange_a.phi = flange_b.phi;
  free = not start_engaged;
  if start_engaged then
    w_rel = 0;
  end if;
equation
  flange_a.tau + flange_b.tau=0 "Conservation of angular momentum";
  if free then
    tau=if time - start_time <= shift_time then tau_hold*((time - start_time)/shift_time) else 0;
  else
    a_rel=if time - start_time <= shift_time then a_close else 0;
  end if;
algorithm
  when command and free then
    free:=false;
    a_close:=-pre(w_rel)/shift_time;
    start_time:=pre(time);
  end when;
  when not free and not command then
    free:=true;
    tau_hold:=pre(tau);
    start_time:=pre(time);
  end when;
  annotation(Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={255,0,255}, fillColor={255,0,255},
            fillPattern=                                                                                                    FillPattern.Solid, points={{-30.0,40.0},{-60.0,50.0},{-60.0,30.0},{-30.0,40.0}}),Line(visible=true, points={{0.0,90.0},{-90.0,70.0},{-90.0,40.0},{-30.0,40.0}}, color={255,0,255}),Line(visible=true, points={{0.0,90.0},{90.0,70.0},{90.0,40.0},{30.0,40.0}}, color={255,0,255}),Polygon(visible=true, lineColor={255,0,255}, fillColor={255,0,255},
            fillPattern=                                                                                                    FillPattern.Solid, points={{30.0,40.0},{60.0,50.0},{60.0,30.0},{30.0,40.0}}),Rectangle(visible=true, fillColor={192,192,192},
            fillPattern=                                                                                                    FillPattern.HorizontalCylinder, extent={{10.0,-60.0},{30.0,60.0}}),Rectangle(visible=true, fillColor={192,192,192},
            fillPattern=                                                                                                    FillPattern.HorizontalCylinder, extent={{-30.0,-60.0},{-10.0,60.0}}),Rectangle(visible=true, fillColor={192,192,192},
            fillPattern=                                                                                                    FillPattern.HorizontalCylinder, extent={{30.0,-10.0},{100.0,10.0}}),Rectangle(visible=true, fillColor={192,192,192},
            fillPattern=                                                                                                    FillPattern.HorizontalCylinder, extent={{-100.0,-10.0},{-30.0,10.0}}),Text(visible=true, lineColor={0,0,255}, extent={{-150.0,-110.0},{150.0,-70.0}}, textString=
                                                                                                    "%name", fontName="Arial")}));
end KinematicClutch;
