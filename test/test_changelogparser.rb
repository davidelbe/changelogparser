require 'helper'

describe ChangelogParser do

  # TODO: add tests
  # Just ported a working Rake task to a gem

  describe 'version bumps' do
    it 'handles version bumps' do
      text = 'Version bump to 1.2.3'
      cp = ChangelogParser.new()
      cp.is_version_bump?(text).must_equal(true)
    end

    it 'does not return version bump for all lines' do
      text = 'something else'
      cp = ChangelogParser.new()
      cp.is_version_bump?(text).must_equal(false)
    end
  end

end
