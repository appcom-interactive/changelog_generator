require "git_changelog_generator/version"

module GitChangelogGenerator

  def self.generate_changelog output
    is_git_directory = File.directory? '.git'

    if is_git_directory
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

      puts "Created changelog. File is available under #{File.expand_path output}"
    else
      puts 'Not a git repository. Run this command inside a valid git directory.'
    end
  end

end
