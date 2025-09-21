package string_pattern is

procedure replace_pattern (p_string_in  : in String;
                           p_pattern_in : in String;
                           p_pattern_out: in String;
						   p_string_out : out String;
						   p_string_out_length: out Integer);

end string_pattern;