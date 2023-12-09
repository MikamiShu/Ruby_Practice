# frozen_string_literal: true

Capybara::SpecHelper.spec '#frame_name', requires: [:frames] do
  before do
    @session.visit('/within_frames')
  end

  it 'should return the name in a frame' do
    @session.within_frame('frameOne') do
      expect(@session.driver.frame_name).to eq 'This is the name of frame one'
    end
  end

  it 'should return the name in FrameTwo' do
    @session.within_frame('frameTwo') do
      expect(@session.driver.frame_name).to eq 'This is the name of frame two'
    end
  end

  it 'should return the name in the main frame' do
    expect(@session.driver.frame_name).to eq 'With Frames'
  end
end
