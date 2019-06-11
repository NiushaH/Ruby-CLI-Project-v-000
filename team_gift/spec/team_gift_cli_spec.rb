require 'spec_helper'

describe TeamGiftCLI do
  it 'has a version number' do
    expect(TeamGiftCLI::VERSION).not_to be nil
  end

  context 'TeamGiftCLI::CLI' do
    it 'Welcomes the user to Sports Treasures Team Gift App upon call' do
      cli = TeamGiftCLI::CLI.new

      expect{cli.call}.to output("Thanks for choosing Sports Treasures to create a thoughtful end of season gift.
        ").to_stdout
      expect{cli.call}.to output(list_sports)
    end
  end
end