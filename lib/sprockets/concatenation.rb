module Sprockets
  class Concatenation
    attr_reader :source_lines
    
    def initialize
      @source_lines = []
      @source_file_mtimes = {}
    end
    
    def record(source_line)
      source_lines << source_line
      record_mtime_for(source_line.source_file)
      source_line
    end
    
    def to_s
      source_lines.join
    end

    def mtime
      @source_file_mtimes.values.max
    end
    
    def save_to(filename)
      raise "`Sprockets::Concatenation#save_to` is no longer supported, use `Sprockets::Secretary#save_output_to` instead."
    end

    protected
      def record_mtime_for(source_file)
        @source_file_mtimes[source_file] ||= source_file.mtime
      end
  end
end
