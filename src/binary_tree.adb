with Ada.Text_IO;

package body binary_tree is

 Index: Integer := 0;

 procedure print_binary_tree(p_tree_element_ptr : in tree_element_access_T)
 is
  use Ada.Text_IO;
 begin
 
       Index := Index + 1;     
 	   Put_line("Node: "&Index'Img);
 	   for I in p_tree_element_ptr.all.label'First .. p_tree_element_ptr.all.label_actual_length loop
 		Put(p_tree_element_ptr.all.label(I));
 	   end loop;
 	   new_line;
 	   -- print left leaf
 	   if (p_tree_element_ptr.all.left_ptr /= NULL) then
 	    -- recursive call
 		print_binary_tree(p_tree_element_ptr.all.left_ptr);
 	   end if;	
 	   -- print right leaf
 	   if (p_tree_element_ptr.all.right_ptr /= NULL) then
 	    -- recursive call
 		print_binary_tree(p_tree_element_ptr.all.right_ptr);
 	   end if; 	
  
 end print_binary_tree;

begin
 null;
end binary_tree;