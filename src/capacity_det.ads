package capacity_det is

-- time is represented as integer

pragma Elaborate_Body;

-- data for one period
type PERIOD_T is
 record
  START_TIME: integer;
  END_TIME  : integer;  
  CAPACITY  : natural;
 end record;
-- array of periods
type PERIODS_T is array (natural range<>) of PERIOD_T;

-- layer priority
type LAYER_PRIORITY_T is (HIGH, MEDIUM, LOW);

-- max number of periods by layer
MAX_PERIOD_NUMBER_C: constant := 100;
type LAYER_T (MAX_PERIOD_NUMBER: natural := MAX_PERIOD_NUMBER_C) is
 record
  ACTUAL_NUMBER_OF_PERIODS: natural;                         -- actual number of periods in that layer 
  PERIODS                 : PERIODS_T (1..MAX_PERIOD_NUMBER);-- the periods in that layer
 end record;
-- access to one layer
type PTR_LAYER_T is access LAYER_T; 
-- the 3 layers
type LAYERS_T is array (LAYER_PRIORITY_T range<>) of LAYER_T;
-- access to the 3 layers 
type PTR_LAYERS_T is access LAYERS_T;

end capacity_det;