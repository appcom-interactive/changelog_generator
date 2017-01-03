require "git_changelog_generator/version"
require 'git'

module GitChangelogGenerator

  def self.generate_changelog output
    tags = (`git tag --sort=taggerdate --list --format='%(refname:short)'`.split("\n") << "HEAD").reverse
    message = ''

    tags.each_with_index { |tag, index|
      if index < tags.length-1
        cmd =`git log #{tags[index+1]}...#{tag} --format="  * %s (%an <%ae>)"`
      else
        cmd = `git log #{tag} --format="  * %s (%an <%ae>)"`
      end

      unless cmd.strip.empty?
        message += index == 0 ? "Version #{tag} (" : "\nVersion #{tag[0..-1]} ("
        message += `git log #{tag} --format='%aD' -1`
        message = message[0..-2] + "):\n\n"

        message += cmd
      end
    }

    File.open(output, 'wb+') { |f|
      f << message
    }
  end

end
