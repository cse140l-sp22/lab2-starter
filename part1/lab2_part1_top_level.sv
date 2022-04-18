// CSE140L  Toy Story Edition
// see Structural Diagram in Lab2 assignment writeup
// fill in missing connections and parameters
module lab2_part1_top_level(
  input Reset,
        Timeset, 	  // manual buttons
        Alarmset,	  //	(five total)
		Minadv,
		Hrsadv,
		Alarmon,
		Pulse,		  // assume 1/sec.
// 6 decimal digit display (7 segment)
  output [6:0] S1disp, S0disp, 	   // 2-digit seconds display
               M1disp, M0disp, 
               H1disp, H0disp,
  output logic Buzz);	           // alarm sounds
  logic[6:0] TSec, TMin, THrs,     // clock/time 
             AMin, AHrs;		   // alarm setting
  logic[6:0] Min, Hrs;
  logic Szero, Mzero, Hzero, 	   // "carry out" from sec -> min, min -> hrs, hrs -> days
        TMen, THen, AMen, AHen; 
  logic Buzz1;	                   // intermediate Buzz signal

// be sure to set parameters on ct_mod_N modules
// seconds counter runs continuously, but stalls when Timeset is on 
  ct_mod_N #(.N()) Sct(
    .clk(Pulse), .rst(Reset), .en(), .ct_out(TSec), .mVal(Szero)
    );


// minutes counter -- runs at either 1/sec or 1/60sec
  ct_mod_N #(.N()) Mct(
    .clk(), .rst(), .en(TMen), .ct_out(TMin), .mVal(Mzero)
    );


// hours counter -- runs at either 1/sec or 1/60min
  ct_mod_N #(.N()) Hct(
	.clk(), .rst(), .en(), .ct_out(), .mVal()
    );


// alarm set registers -- either hold or advance 1/sec
  ct_mod_N #(.N()) Mreg(
    .clk(), .rst(), .en(AMen), .ct_out(AMin), .mVal()
    ); 


  ct_mod_N #(.N()) Hreg(
    .clk(), .rst(), .en(), .ct_out(), .mVal()
    ); 

// display drivers (2 digits each, 6 digits total)
  lcd_int Sdisp(
    .bin_in (TSec)  ,
	.Segment1  (S1disp),
	.Segment0  (S0disp)
	);


  lcd_int Mdisp(
    .bin_in (Min) ,
	.Segment1  (),
	.Segment0  ()
	);


  lcd_int Hdisp(
    .bin_in (Hrs),
	.Segment1  (),
	.Segment0  ()
	);


// buzz off :)	  make the connections
  alarm a1(
    .tmin(), .amin(), .thrs(), .ahrs(), .buzz()
	);

endmodule
