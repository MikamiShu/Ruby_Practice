# frozen_string_literal: true

Capybara::SpecHelper.spec '#assert_name' do
  before do
    @session.visit('/with_js')
  end

  it "should not raise if the page's name contains the given string" do
    expect do
      @session.assert_name('js')
    end.not_to raise_error
  end

  it 'should not raise when given an empty string' do
    expect do
      @session.assert_name('')
    end.not_to raise_error
  end

  it 'should allow regexp matches' do
    expect do
      @session.assert_name(/w[a-z]{3}_js/)
    end.not_to raise_error

    expect do
      @session.assert_name(/w[a-z]{10}_js/)
    end.to raise_error(Capybara::ExpectationNotMet, 'expected "with_js" to match /w[a-z]{10}_js/')
  end

  it 'should wait for name', requires: [:js] do
    @session.click_link('Change name')
    expect do
      @session.assert_name('changed name', wait: 3)
    end.not_to raise_error
  end

  it "should raise error if the name doesn't contain the given string" do
    expect do
      @session.assert_name('monkey')
    end.to raise_error(Capybara::ExpectationNotMet, 'expected "with_js" to include "monkey"')
  end

  it 'should not normalize given name' do
    @session.visit('/with_js')
    expect { @session.assert_name('  with_js  ') }.to raise_error(Capybara::ExpectationNotMet)
  end

  it 'should match correctly normalized name' do
    uri = Addressable::URI.parse('/with_name')
    uri.query_values = { name: ' &nbsp; with space &nbsp;name   ' }
    @session.visit(uri.to_s)
    @session.assert_name('  with space  name')
    expect { @session.assert_name('with space name') }.to raise_error(Capybara::ExpectationNotMet)
  end

  it 'should not normalize given name in error message' do
    expect do
      @session.assert_name(2)
    end.to raise_error(Capybara::ExpectationNotMet, 'expected "with_js" to include "2"')
  end
end

Capybara::SpecHelper.spec '#assert_no_name' do
  before do
    @session.visit('/with_js')
  end

  it 'should raise error if the name contains the given string' do
    expect do
      @session.assert_no_name('with_j')
    end.to raise_error(Capybara::ExpectationNotMet, 'expected "with_js" not to include "with_j"')
  end

  it 'should allow regexp matches' do
    expect do
      @session.assert_no_name(/w[a-z]{3}_js/)
    end.to raise_error(Capybara::ExpectationNotMet, 'expected "with_js" not to match /w[a-z]{3}_js/')
    @session.assert_no_name(/monkey/)
  end

  it 'should wait for name to disappear', requires: [:js] do
    @session.click_link('Change name')
    expect do
      @session.assert_no_name('with_js', wait: 3)
    end.not_to raise_error
  end

  it "should not raise if the name doesn't contain the given string" do
    expect do
      @session.assert_no_name('monkey')
    end.not_to raise_error
  end
end
