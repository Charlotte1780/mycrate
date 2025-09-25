with Ada.Text_IO;
with dichotom_search;
with string_pattern;
with binary_tree;

package body test is
 
 -- exemple for binary tree browsing
 binary_tree_element4 : aliased binary_tree.tree_element_T := (label_actual_length => 13,
                                                               label               => "1limmo michel",
             												   left_ptr            => NULL,
             										           right_ptr           => NULL); 
  
 binary_tree_element5 : aliased binary_tree.tree_element_T := (label_actual_length => 13,
                                                               label               => "1nimmo michel",
                  								               left_ptr            => NULL,
              										           right_ptr           => NULL);  
  
 binary_tree_element3 : aliased binary_tree.tree_element_T := (label_actual_length => 12,
                                                               label               => "limmo michel",
               										           left_ptr            => binary_tree_element4'Access,
              										           right_ptr           => NULL);  
  
 binary_tree_element2 : aliased binary_tree.tree_element_T := (label_actual_length => 12,
                                                               label               => "nimmo michel",
              										           left_ptr            => NULL,
              										           right_ptr           => binary_tree_element5'Access);
  
 binary_tree_element1 : aliased binary_tree.tree_element_T := (label_actual_length => 12,
                                                               label               => "mimmo michel",
              										           left_ptr            => binary_tree_element2'Access,
              										           right_ptr           => binary_tree_element3'Access);   
procedure mytest
is
 use Ada.Text_IO;
 use dichotom_search;
 use string_pattern;
 use binary_tree;
  
 -- exemple for dichotomic search
 LIST_INTEGERS : LIST_INTEGERS_T := (12, 15, 17, 32, 40, 47, 61);
 item_to_find  : Integer := 47;
 
 return_flag   : Boolean;
 
 -- exemple for pattern find and replace
 input_string:  String:="Bruxelles est une belle ville de Belgique et elle en est la capitale.";
 input_pattern: String:="elle";
 output_pattern: String:="lui";  
 
 output_string : String(1 .. 2*input_string'Length);
 output_string_length: Integer;
    
begin
   -- dichotomic search in ADA
   New_line;
   Put_line("*** Dichotomic search in ADA ***");
   New_line;   
   Put("Find item "& Integer'Image(item_to_find)&" in");
   for I in LIST_INTEGERS'Range loop
    Put(" "&Integer'Image(LIST_INTEGERS(I)));
   end loop;  
   New_line;
   return_flag := find_number(p_list_integers => LIST_INTEGERS, 
                              p_item_to_find => item_to_find);
   Put_line("Found?: "& Boolean'Image(return_flag));
   New_line;
   
   -- string pattern find and replace in ADA
   Put_line("*** String pattern find and replace in ADA ***");
   New_line;
   Put("Input string is: ");
   for I in input_string'Range loop
    Put(input_string(I));
   end loop;
   New_line;
   New_line;
   Put("Pattern to replace: ");
   for I in input_pattern'Range loop
    Put(input_pattern(I));
   end loop;
   New_line;
   Put("Replacement pattern: ");
   for I in output_pattern'Range loop
    Put(output_pattern(I));
   end loop;
   New_line;
   
   replace_pattern(p_string_in         => input_string, 
                   p_pattern_in        => input_pattern, 
				   p_pattern_out       => output_pattern, 
				   p_string_out        => output_string, 
				   p_string_out_length => output_string_length);
				   
   New_line;
   Put("Output string is: ");
   for I in output_string'First .. output_string_length loop
    Put(output_string(I));
   end loop;
   New_line;
   New_line;
   
   -- print binary tree in ADA
   Put_line("*** String pattern find and replace in ADA ***");   
   New_line;
   print_binary_tree(p_tree_element_ptr => binary_tree_element1'Access);
   
end mytest;
end test;
