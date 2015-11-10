
#頭文字を得る
def get_head( word )
	k = %w(あ か さ た な は ま や ら わ)
	return k[ k.index{|i| i > word[0]}.to_i - 1 ]
end

#puts getkashira( "たまち") => た
#puts getkashira( "つむじ") => た


