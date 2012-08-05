require 'guard'
require 'guard/guard'

module Guard
  class Ctags < Guard
    VERSION = '0.0.1'

    def initialize watchers=[], options = {}
      @ui_prefix = 'CTags'
      puts "HELLO FRM #@ui_prefix"

      commands = generate_commands_for_options(options)
      commands.each do |ext, func|
        watcher = watchers.find {|w| w.pattern.to_s =~ /#{ext}/}
        STDERR << "found #{watcher} for #{ext} with #{watcher.pattern}" unless watcher.nil?
        watcher.action = func unless watcher.nil?
      end

      super(watchers, options)
      @watchers = watchers

    end


    def generate_commands_for_options options
      options.map do |ext, tool|
        name = ext.sub('.','')+'.tags'
        [
          ext,
          lambda do
            STDERR << "Generating tags for #{ext} with #{tool}"
            STDERR << `#{tool} ./**/*#{ext} -f '#{name}'`
          end
        ]

      end
    end

    def start
      UI.info "#@ui_prefix Generatings tags"
      @watchers.each {|w| w.action.call }
    end

    def run_on_changes(paths)
      UI.info "#@ui_prefix Regeneratings tags"
      @watchers.each {|w| w.action.call }
    end


    def run_ctags(file, ext, tool)
      STDOUT << `#{tool} -f #{ext.sub('.', '')}.tags #{file}`
    end
  end
end
