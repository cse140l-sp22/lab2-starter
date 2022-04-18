// CSE140L  
// see Structural Diagram in Lab2 Part 3 assignment writeup
// fill in missing connections and parameters
module lab2_part3_top_level(
  input Reset,
        Timeset, 	  // manual buttons
        Alarmset,	  //	(five total)
		Minadv,
		Hrsadv,
        Dayadv,
        Monthadv,
        Dateadv,
		Alarmon,
		Pulse,		  // assume 1/sec.
// 6 decimal digit display (7 segment)
  output[6:0] S1disp, S0disp, 	   // 2-digit seconds display
               M1disp, M0disp, 
               H1disp, H0disp,     // hours display
               D0disp,             // day of week display
               Month1disp, Month0disp,     // 2-digit month display
               Date1disp, Date0disp,     // date display
  output logic Buzz);	           // alarm sounds

//...

endmodule