# simple prompt is nice
#IRB.conf[:PROMPT_MODE] = :SIMPLE

# but invisible prompt is better!
IRB.conf[:PROMPT][:XMP][:RETURN] = "\#   => %s\n"
IRB.conf[:PROMPT][:XMP][:PROMPT_I] = ""
IRB.conf[:PROMPT_MODE] = :XMP
IRB.conf[:AUTO_INDENT] = true

# enables tab completion (extrememememly important)
require 'irb/completion'

# pretty printing
require 'pp'

# saved history
require 'irb/ext/save-history'
IRB.conf[:USE_READLINE] = true
IRB.conf[:SAVE_HISTORY] = 500
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

# local methods listing much handier than full blast
class Object
  def local_methods
    self.methods.sort - self.class.superclass.methods
  end
end

module IRB
  class WorkSpace

    alias original_evaluate evaluate

    def evaluate(context, statements, file = __FILE__, line = __LINE__)
      result = original_evaluate(context, statements, file, line)
      
      # There's a weird extra thing in the statements list, drop it
      if IRB.conf[:USE_LOGGING] and not (statements.match /(IRB.CurrentContext|^log$)/) then
        File.open "irb.log", "a" do |log|
          log.puts "#{statements}#   => #{result.inspect}"
        end
      end

      result
    end
  end
end

def log
  IRB.conf[:USE_LOGGING] = true
end


# vim:ft=ruby
