with Ada.Text_IO;

package body string_pattern is



procedure replace_pattern (p_string_in         : in String;
                           p_pattern_in        : in String;
                           p_pattern_out       : in String;
						   p_string_out        : out String;
						   p_string_out_length : out Integer)
is
 pattern_in_found : Boolean := False;
 J : Integer;
 IStart, IStart1, IIgnore : Integer;
 use Ada.Text_IO; 
   
begin

 IIgnore := 0;
 J:=p_string_in'First;
 
 for I in p_string_in'Range loop
  if IIgnore = 0 then
	  if p_string_in(I) = p_pattern_in(p_pattern_in'First) then
	   pattern_in_found := True;
	   IStart  := I;
	  end if;
	  -- Possible detection
	  if pattern_in_found then
	   for K in p_pattern_in'Range loop
		if p_pattern_in(K) /= p_string_in(IStart) then
		 pattern_in_found := False;
		 exit; 	 
		end if;
		IStart := IStart + 1;
	   end loop;
	   
	   if pattern_in_found = False then
		-- Negative detection
		p_string_out(J) := p_string_in(I);
		J := J + 1;
	   else
		-- Positive detection
		for K in p_pattern_out'Range loop
		 p_string_out(J) := p_pattern_out(K);
		 J := J + 1;
		end loop;
		IIgnore := p_pattern_in'Length - 1;
		pattern_in_found := False;
	   end if;    
	  else
	   -- Normal case 
	   p_string_out(J) := p_string_in(I);
	   J := J + 1;   
	  end if;
	  put_line("Debug Index: "&I'Img);
  else
	  IIgnore := IIgnore - 1;
  end if; 
 end loop;
 
 p_string_out_length := J-1;
 
end replace_pattern; 						   

end string_pattern;