require 'yaml'
require './kashiramozi.rb'

class YAMLManager
	def initialize( filename )
		open( filename )
	end

	def initialize()

	end

	def open( filename )
		@file = YAML.load_file( filename )
	end

	def get()
		return @file
	end

	def write( filename, contents  )
		open( filename, "w" ) do |f|
			YAML.dump( contents, f )
		end
	end
end

class Word
	def initialize( word, first, last )
		@word = word
		@first = first
		@last = last
	end
end


class WordDataBase
	#linenameで連想配列

	def initialze()
		@filetable = Hash.new( "none" )

		@filetable["あ"] = "a.yaml"
		@filetable["か"] = "ka.yaml"
		@filetable["さ"] = "sa.yaml"
		@filetable["た"] = "ta.yaml"
		@filetable["な"] = "na.yaml"

		
	end

	def open_database( linename )
		if @filename[ linename ] == "none"
			return nil
		end
		@yaml_manager = YAMLManager.new( @filename[ linename ] )
		return 0
	end

	#wordが存在するかどうか
	def get_database( word )
	
	end 

	def write_word( word, first, last )
		linename  = get_head( first )
		if open_database( linename ) != nil
			w = Word( word, first, last )
			#wの@wordは地味に無駄
			yaml = @yaml_manager.get()
			yaml[ w ] = word
			@yaml_manager.write( linename, yaml )
		end
	end

end






