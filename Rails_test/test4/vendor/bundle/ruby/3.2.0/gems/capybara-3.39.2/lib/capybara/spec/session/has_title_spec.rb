# frozen_string_literal: true

Capybara::SpecHelper.spec '#has_name?' do
  before do
    @session.visit('/with_js')
  end

  it 'should be true if the page has the given name' do
    expect(@session).to have_name('with_js')
    expect(@session.has_name?('with_js')).to be true
  end

  it 'should allow regexp matches' do
    expect(@session).to have_name(/w[a-z]{3}_js/)
    expect(@session).not_to have_name(/monkey/)
  end

  it 'should wait for name', requires: [:js] do
    @session.click_link('Change name')
    expect(@session).to have_name('changed name')
  end

  it 'should be false if the page has not the given name' do
    expect(@session).not_to have_name('monkey')
    expect(@session.has_name?('monkey')).to be false
  end

  it 'should default to exact: false matching' do
    expect(@session).to have_name('with_js', exact: false)
    expect(@session).to have_name('with_', exact: false)
  end

  it 'should match exactly if exact: true option passed' do
    expect(@session).to have_name('with_js', exact: true)
    expect(@session).not_to have_name('with_', exact: true)
    expect(@session.has_name?('with_js', exact: true)).to be true
    expect(@session.has_name?('with_', exact: true)).to be false
  end

  it 'should match partial if exact: false option passed' do
    expect(@session).to have_name('with_js', exact: false)
    expect(@session).to have_name('with_', exact: false)
  end
end

Capybara::SpecHelper.spec '#has_no_name?' do
  before do
    @session.visit('/with_js')
  end

  it 'should be false if the page has the given name' do
    expect(@session).not_to have_no_name('with_js')
  end

  it 'should allow regexp matches' do
    expect(@session).not_to have_no_name(/w[a-z]{3}_js/)
    expect(@session).to have_no_name(/monkey/)
  end

  it 'should wait for name to disappear', requires: [:js] do
    Capybara.using_wait_time(5) do
      @session.click_link('Change name') # triggers name change after 400ms
      expect(@session).to have_no_name('with_js')
    end
  end

  it 'should be true if the page has not the given name' do
    expect(@session).to have_no_name('monkey')
    expect(@session.has_no_name?('monkey')).to be true
  end
end
