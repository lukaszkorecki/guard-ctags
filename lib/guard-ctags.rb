require 'guard'
require 'guard/guard'

module Guard
  class Ctags < Guard
    VERSION = '0.0.1'

    def initialize watchers=[], options = {}
      super(watchers, options)
      @watchers = watchers
      @options = options
      @ui_prefix = "[CTags]"
    end


    def start
      UI.info "#@ui_prefix Generatings tags"
      @map.each {|ext, tool| run_ctags("./**/*#{ext}", ext, tool) }
    end

    def run_on_changes(paths)
      UI.info "#@ui_prefix Regeneratings tags"
      paths.each do |path|
        ext = @map.keys.find {|e| path =~ /#{e}/ }
        run_ctags(path, ext, @map[ext]) if ext
      end
    end


    def run_ctags(file, ext, tool)
      STDOUT << `#{tool} -f #{ext.sub('.', '')}.tags #{file}`
    end
  end
end
