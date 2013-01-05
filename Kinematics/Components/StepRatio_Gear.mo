within Kinematics.Components;
model StepRatio_Gear "A step ratio gear model"
  extends Modelica.Mechanics.Rotational.Icons.Gear;
  extends Kinematics.Interfaces.PartialGear;
  parameter Modelica.SIunits.Time shift_time "Time to shift gears";
  parameter Real ratios[:] "Discrete gear ratios";
  Modelica.Blocks.Interfaces.IntegerInput gear "Desired gear" annotation (
      Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,120})));
protected
  Modelica.SIunits.DampingCoefficient dR "Rate of ratio change";
  Modelica.SIunits.Time start_time "Start of last shift";
initial equation
  R = ratios[gear];
  dR = 0;
  start_time = time-2*shift_time;
equation
  der(R) = if time<=start_time+shift_time then dR else 0;
  assert(gear>=1 and gear<=size(ratios,1), "Selected gear is outside valid range of 1-"+String(size(ratios,1)));
  when change(gear) then
    start_time =  time;
    dR = (ratios[gear]-R)/shift_time;
  end when;
end StepRatio_Gear;
