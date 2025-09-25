package binary_tree is

 type tree_element_T;
 type tree_element_access_T is access all tree_element_T;
 type tree_element_T (label_actual_length: Integer := 20) is
  record
   label    : String(1..label_actual_length);
   left_ptr : tree_element_access_T;
   right_ptr: tree_element_access_T;
  end record; 
  
 procedure print_binary_tree(p_tree_element_ptr : in tree_element_access_T); 
 
 
  
end binary_tree;