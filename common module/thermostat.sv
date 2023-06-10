/*
The thermostat can be in one of two modes: heating (mode = 1) and cooling (mode = 0). 
    In heating mode, turn the heater on when it is too cold (too_cold = 1) but do not use the air conditioner. 
    In cooling mode, turn the air conditioner on when it is too hot (too_hot = 1), but do not turn on the heater. 
    When the heater or air conditioner are on, also turn on the fan to circulate the air. 
In addition, the user can also request the fan to turn on (fan_on = 1), even if the heater and air conditioner are off.

*/

module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
); 

    assign fan = fan_on == 1'b1 ? 1 : 
                    heater == 1'b1 ? 1 : 
                        aircon == 1'b1 ? 1 : 0;

    assign heater = mode == 1'b0 ? 0 :
                        too_cold == 1'b1 ? 1 : 0;

    assign aircon = mode == 1'b1 ? 0 :
                        too_hot == 1'b1 ? 1 : 0; 

endmodule