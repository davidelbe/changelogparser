class ChangelogParser
  def initialize(all = false)
    @all = all
    read_log
    parse_lines
  end

  def commit_parts_divider
    "__END_OF_PART__"
  end

  def commit_message_divider
    "__END_OF_COMMIT__\n"
  end

  def read_log
    format = %w(%s %B %an).join(commit_parts_divider)
    format << commit_message_divider
    @log = `git log -n 100 --no-merges --format='#{format}'`
  end

  def log_to_lines
    @log.split(commit_message_divider).collect{ |l| l.gsub("\n", " ") }
  end

  def parse_lines
    self.log_to_lines.each do |line|
      next if is_merge?(line)
      if is_version_bump?(line)
        print_version_bump(line)
      else
        print_changelog(line)
      end
    end
  end

  def is_merge?(line)
    line =~ /Merge/
  end

  def is_version_bump?(line)
    line =~ /Version bump to/
  end

  def print_version_bump(line)
    puts "=== #{line.split(commit_parts_divider)[0].gsub("Version bump to", "").gsub("  ", " ")}"
  end

  def print_changelog(line)
    commit_parts      = line.split(commit_parts_divider)
    author            = commit_parts[2]
    commit_message    = commit_parts[1].to_s
    changelog_message = commit_message.scan(/changelog:\s(.*)/i).flatten.first

    if changelog_message
      puts "   * #{changelog_message.strip} - #{author}"
    else
      puts "   * #{commit_message.strip} - #{author}" if @all
    end
  end
end
