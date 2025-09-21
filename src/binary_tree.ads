package binary_tree is

type tree_element_T;
type tree_element_access_T is access all tree_element_T;
type tree_element_T (label_actual_length: Integer := 20) is
 record
  label    : String(1..label_actual_length);
  left_ptr : tree_element_access_T;
  right_ptr: tree_element_access_T;
 end record;
 
 binary_tree_element4  : aliased tree_element_T := (label_actual_length => 13,
                                                    label               => "1limmo michel",
  										            left_ptr            => NULL,
										            right_ptr           => NULL); 
 
 binary_tree_element5  : aliased tree_element_T := (label_actual_length => 13,
                                                    label               => "1nimmo michel",
  										            left_ptr            => NULL,
										            right_ptr           => NULL); 
 
 
 binary_tree_element3  : aliased tree_element_T := (label_actual_length => 12,
                                                    label               => "limmo michel",
  										            left_ptr            => binary_tree_element4'Access,
										            right_ptr           => NULL); 
 
 
 binary_tree_element2 : aliased tree_element_T := (label_actual_length => 12,
                                                   label               => "nimmo michel",
										           left_ptr            => NULL,
										           right_ptr           => binary_tree_element5'Access);

 
 binary_tree_element1 : aliased tree_element_T := (label_actual_length => 12,
                                                   label               => "mimmo michel",
										           left_ptr            => binary_tree_element2'Access,
										           right_ptr           => binary_tree_element3'Access); 
												   
 Index: Integer := 0;												   
 
 
procedure print_binary_tree(p_tree_element_ptr : in tree_element_access_T); 


end binary_tree;