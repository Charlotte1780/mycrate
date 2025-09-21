with Ada.Text_IO;
with dichotom_search;
with string_pattern;
with binary_tree;

procedure Mycrate 
is
 use Ada.Text_IO;
 use dichotom_search;
 use string_pattern;
 use binary_tree; 
 
 LIST_INTEGERS : LIST_INTEGERS_T := (12, 15, 17, 32, 40, 47, 61);
 item_to_find  : Integer := 47;
 return_flag   : Boolean;
 
 input_string:  String:="Bruxelles est une belle ville de Belgique et elle en est la capitale.";
 input_pattern: String:="elle";
 output_pattern: String:="lui";  
 output_string : String(1 .. 2*input_string'Length);
 output_string_length: Integer;
 
begin
   -- dichotomic search in ADA
   new_line;
   put_line("*** Dichotomic search in ADA ***");
   new_line;   
   put("Find item "& Integer'Image(item_to_find)&" in");
   for I in LIST_INTEGERS'Range loop
    put(" "&Integer'Image(LIST_INTEGERS(I)));
   end loop;  
   new_line;
   return_flag := find_number(p_list_integers => LIST_INTEGERS, 
                              p_item_to_find => item_to_find);
   put_Line("Found?: "& Boolean'Image(return_flag));
   new_line;
   
   -- string pattern find and replace in ADA
   put_line("*** String pattern find and replace in ADA ***");
   new_line;
   put("Input string is: ");
   for I in input_string'Range loop
    put(input_string(I));
   end loop;
   new_line;
   new_line;
   put("Pattern to replace: ");
   for I in input_pattern'Range loop
    put(input_pattern(I));
   end loop;
   new_line;
   put("Replacement pattern: ");
   for I in output_pattern'Range loop
    put(output_pattern(I));
   end loop;
   new_line;
   
   replace_pattern(p_string_in         => input_string, 
                   p_pattern_in        => input_pattern, 
				   p_pattern_out       => output_pattern, 
				   p_string_out        => output_string, 
				   p_string_out_length => output_string_length);
				   
   new_line;
   put("Output string is: ");
   for I in output_string'First .. output_string_length loop
    put(output_string(I));
   end loop;
   new_line;
   new_line;
   
   -- print binary tree in ADA
   put_line("*** String pattern find and replace in ADA ***");   
   new_line;
   print_binary_tree(p_tree_element_ptr => binary_tree_element1'Access);
   
end Mycrate;
