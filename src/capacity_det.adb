package body capacity_det is

-- function that takes as input the 3 layers and the current time
-- Based on that it returns the capacity at the current time
-- The assumption is that the layers are ordered from HIGH to LOW priority
function determine_current_capacity(P_LAYERS      : in PTR_LAYERS_T;
                                    P_CURRENT_TIME: in integer) return natural
is
 CURRENT_CAPACITY: natural;-- the capacity at the current time
begin

 Boucle_1:
 for CURRENT_LAYER in P_LAYERS.all'range loop
  for CURRENT_PERIOD in 1..P_LAYERS.all(CURRENT_LAYER).ACTUAL_NUMBER_OF_PERIODS loop
   if P_CURRENT_TIME in P_LAYERS.all(CURRENT_LAYER).PERIODS(CURRENT_PERIOD).START_TIME .. P_LAYERS.all(CURRENT_LAYER).PERIODS(CURRENT_PERIOD).END_TIME then
     CURRENT_CAPACITY := P_LAYERS.all(CURRENT_LAYER).PERIODS(CURRENT_PERIOD).CAPACITY;
	 exit Boucle_1;
   end if;
  end loop; 
 end loop Boucle_1;
 return CURRENT_CAPACITY;
end determine_current_capacity;

-- procedure that determine the consolidated capacity between T0 and T1
-- it takes as input the 3 layers and T0 and T1
-- it outputs a consolidated layer  
procedure determine_consolidated_capacity(P_LAYERS             : in PTR_LAYERS_T;
                                          P_T0                 : in integer;
                                          P_T1                 : in integer;
										  P_CONSOLIDATED_LAYER : in out PTR_LAYER_T)
is
 CURRENT_CAPACITY : natural := 0;
 OLD_CAPACITY : natural := 0;
 CONSOLIDATED_PERIODS: PERIODS_T(1..3*MAX_PERIOD_NUMBER_C);
 OLD_TIME: integer := 0;
 NUMBER_OF_PERIOD_COUNTER: natural := 0;
begin 
 
 for CURRENT_TIME in P_T0 .. P_T1 loop
  --determine capacity for current time
  CURRENT_CAPACITY := determine_current_capacity(P_LAYERS       => P_LAYERS,
                                                 P_CURRENT_TIME => CURRENT_TIME);
  -- Change of capacity detected
  if CURRENT_CAPACITY /= OLD_CAPACITY then
   -- Add one period
   CONSOLIDATED_PERIODS(NUMBER_OF_PERIOD_COUNTER) :=( START_TIME => OLD_TIME,
                                                      END_TIME   => (CURRENT_TIME - 1),
						                              CAPACITY   => OLD_CAPACITY
                                                     );						 
   OLD_CAPACITY := CURRENT_CAPACITY;
   OLD_TIME := CURRENT_TIME;
   NUMBER_OF_PERIOD_COUNTER := NUMBER_OF_PERIOD_COUNTER + 1;    
  end if;   
 end loop;
 -- Store all periods
 P_CONSOLIDATED_LAYER.all := (MAX_PERIOD_NUMBER        => 3*MAX_PERIOD_NUMBER_C,
                              ACTUAL_NUMBER_OF_PERIODS => NUMBER_OF_PERIOD_COUNTER,
                              PERIODS                  => CONSOLIDATED_PERIODS 
					         );
 
end determine_consolidated_capacity;

end capacity_det;