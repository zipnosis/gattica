require File.expand_path('../helper', __FILE__)

class TestEngine < Test::Unit::TestCase

  DEFAULT_AUTH = {
      :email => 'test@gmail.com',
      :password => 'password',
      :debug => false
  }
  DEFAULT_QUERY = {
      :start_date => '2010-01-01',
      :end_date => '2011-01-01',
      :dimensions => ['date'],
      :metrics => ['visits']
  }
  PROFILE_ID = 12345678

  def test_login_with_good_password
    assert Gattica.new(@auth), "should have been able to login"
  end

  def test_login_with_bad_user_password
    assert_raise GatticaError::CouldNotAuthenticate do
      Gattica.new({ :email => 'bad-email@gmail.com', :password => 'bad-password'})
    end
  end

  def test_raise_error_when_no_user_pass_or_token_specified
    assert_raise GatticaError::NoLoginOrToken do
      Gattica.new()
    end
  end

  def test_use_an_existing_token
    token = Gattica.new(@auth).token
    assert Gattica.new({ :token => token })
  end

  def test_max_results
    response = ga_get({ :max_results => 5 })
    assert response.points.count == 5, "should only return 5 results"
  end

  def test_start_index
    response = ga_get({ :start_index => 5, :max_results => 5 })
    assert response.points.first.title == "ga:date=20100105", "should start on the 5th"
  end

private

  def ga(options={}, profile_id=PROFILE_ID)
    unless defined? @ga
      @ga = Gattica.new(DEFAULT_AUTH)
      @ga.profile_id = profile_id
    end
    @ga
  end

  def ga_get(options={}, profile_id=PROFILE_ID)
    ga.get(DEFAULT_QUERY.merge(options))
  end
  
end
