package dichotom_search is

type LIST_INTEGERS_T is array (Natural range <>) of Integer;

function find_number(p_list_integers : in LIST_INTEGERS_T; 
					 p_item_to_find  : in Integer) return Boolean;


end dichotom_search;