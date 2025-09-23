with Ada.Text_IO;

package body dichotom_search is

counter : Integer := 0;

function find_number(p_list_integers : in LIST_INTEGERS_T; 
					 p_item_to_find  : in Integer)
return Boolean					  
is
 low_born          : Integer := p_list_integers(p_list_integers'first);
 high_born         : Integer := p_list_integers(p_list_integers'last);
 number_of_element : Integer := p_list_integers'length;
 mid               : Integer :=  number_of_element/2;
 return_flag       : Boolean := False;
 use Ada.Text_IO;
 
begin
 counter := counter + 1;
 Put_line("Iteration: "&counter'img);
 Put_line(" VLow "    &low_born'img&
          " VHigh "   &high_born'img& 
 		  " PFirst "  &Integer'Image(p_list_integers'first)&
 		  " PLast "   &Integer'Image(p_list_integers'last)&
 		  " PMid "    &Integer'Image(mid)&
 		  " #Elem "  &Integer'Image(number_of_element) 
 		);
 if (p_item_to_find >= low_born and p_item_to_find <= high_born) and (number_of_element > 2) then
 
  -- recursive call
  return_flag := find_number(p_list_integers => p_list_integers(p_list_integers'first .. p_list_integers'first + mid), 
                             p_item_to_find  => p_item_to_find);
  Put_line("Debug1 returned flag: "& Boolean'Image(return_flag));
  if  return_flag = False then
   -- recursive call
   return_flag := find_number(p_list_integers => p_list_integers((p_list_integers'first + mid+1) .. p_list_integers'last), 
                              p_item_to_find  => p_item_to_find);
   Put_line("Debug2 returned flag: "& Boolean'Image(return_flag));
  end if; 
 else
   if p_item_to_find = low_born or p_item_to_find = high_born then
    return_flag := True;
   else
    return_flag := False;   
   end if;
   Put_line("Debug3 returned flag: "& Boolean'Image(return_flag));
 end if;
 
return return_flag;

end find_number;

end dichotom_search;