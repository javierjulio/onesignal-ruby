require File.dirname(__FILE__) + '/helper'

class PlayerTest < MiniTest::Test

  def setup
    base_url = "https://onesignal.com/api/v1/players"
    @create_uri = URI.parse(base_url)
    @csv_export_uri = URI.parse(base_url + "/csv_export")
    @all_uri = URI.parse(base_url)
    @player_id = "fake-id-123"
    @get_uri = URI.parse(base_url + "/#{@player_id}")
    @update_uri = URI.parse(base_url + "/#{@player_id}")
    @delete_uri = URI.parse(base_url + "/#{@player_id}")
    @create_session_uri = URI.parse(base_url + "/#{@player_id}/on_session")
    @create_purchase_uri = URI.parse(base_url + "/#{@player_id}/on_purchase")
    @create_focus_uri = URI.parse(base_url + "/#{@player_id}/on_focus")

    @params = {
      foo: "bar",
      widget: "acme"
    }
    @api_key = "fake api key 123"
    @api_key_2 = "fake api key 456"
    @opts = {
      key1: "value1",
      key2: "vaue2",
      auth_key: @api_key_2
    }
    @default_opts = {
      auth_key: @api_key
    }
    OneSignal::OneSignal.api_key = @api_key
  end

  def test_create_raises_error
    response = mock_response_ko
    OneSignal::OneSignal.expects(:send_post_request)
                        .with(uri: @create_uri, body: @params, opts: @default_opts)
                        .returns(response)
    assert_raises OneSignal::OneSignalError do
      OneSignal::Player.create(params: @params)
    end
  end

  def test_csv_export
    response = mock_response_ok
    OneSignal::OneSignal.expects(:send_post_request)
                        .with(uri: @csv_export_uri, body: @params, opts: @default_opts)
                        .returns(response)
    assert_equal response, OneSignal::Player.csv_export(params: @params)
  end

  def test_csv_export_with_auth_key
    response = mock_response_ok
    OneSignal::OneSignal.expects(:send_post_request)
                        .with(uri: @csv_export_uri, body: @params, opts: @opts)
                        .returns(response)
    assert_equal response, OneSignal::Player.csv_export(params: @params, opts: @opts)
  end

  def test_all
    response = mock_response_ok
    OneSignal::OneSignal.expects(:send_get_request)
                        .with(uri: @all_uri, params: @params, opts: @default_opts)
                        .returns(response)
    assert_equal response, OneSignal::Player.all(params: @params)
  end

  def test_all_with_auth_key
    response = mock_response_ok
    OneSignal::OneSignal.expects(:send_get_request)
                        .with(uri: @all_uri, params: @params, opts: @opts)
                        .returns(response)
    assert_equal response, OneSignal::Player.all(params: @params, opts: @opts)
  end

  def test_get
    response = mock_response_ok
    OneSignal::OneSignal.expects(:send_get_request)
                        .with(uri: @get_uri, params: nil, opts: @default_opts)
                        .returns(response)
    assert_equal response, OneSignal::Player.get(id: @player_id)
  end

  def test_get_with_auth_key
    response = mock_response_ok
    OneSignal::OneSignal.expects(:send_get_request)
                        .with(uri: @get_uri, params: nil, opts: @opts)
                        .returns(response)
    assert_equal response, OneSignal::Player.get(id: @player_id, opts: @opts)
  end

  def test_create
    response = mock_response_ok
    OneSignal::OneSignal.expects(:send_post_request)
                        .with(uri: @create_uri, body: @params, opts: @default_opts)
                        .returns(response)
    assert_equal response, OneSignal::Player.create(params: @params)
  end

  def test_create_with_auth_key
    response = mock_response_ok
    OneSignal::OneSignal.expects(:send_post_request)
                        .with(uri: @create_uri, body: @params, opts: @opts)
                        .returns(response)
    assert_equal response, OneSignal::Player.create(params: @params, opts: @opts)
  end

  def test_update_raises_error
    response = mock_response_ko
    OneSignal::OneSignal.expects(:send_put_request)
                        .with(uri: @update_uri, body: @params, opts: @default_opts)
                        .returns(response)
    assert_raises OneSignal::OneSignalError do
      OneSignal::Player.update(id: @player_id, params: @params)
    end
  end

  def test_update
    response = mock_response_ok
    OneSignal::OneSignal.expects(:send_put_request)
                        .with(uri: @update_uri, body: @params, opts: @default_opts)
                        .returns(response)
    assert_equal response, OneSignal::Player.update(id: @player_id, params: @params)
  end

  def test_update_with_auth_key
    response = mock_response_ok
    OneSignal::OneSignal.expects(:send_put_request)
                        .with(uri: @update_uri, body: @params, opts: @opts)
                        .returns(response)
    assert_equal response, OneSignal::Player.update(id: @player_id,
                                                    params: @params,
                                                    opts: @opts)
  end

  def test_create_session
    response = mock_response_ok
    OneSignal::OneSignal.expects(:send_post_request)
                        .with(uri: @create_session_uri, body: @params, opts: @default_opts)
                        .returns(response)
    assert_equal response, OneSignal::Player.create_session(id: @player_id,
                                                            params: @params)
  end

  def test_create_session_with_auth_key
    response = mock_response_ok
    OneSignal::OneSignal.expects(:send_post_request)
                        .with(uri: @create_session_uri, body: @params, opts: @opts)
                        .returns(response)
    assert_equal response, OneSignal::Player.create_session(id: @player_id,
                                                            params: @params,
                                                            opts: @opts)
  end

  def test_create_purchase
    response = mock_response_ok
    OneSignal::OneSignal.expects(:send_post_request)
                        .with(uri: @create_purchase_uri,
                              body: @params,
                              opts: @default_opts)
                        .returns(response)
    assert_equal response, OneSignal::Player.create_purchase(id: @player_id,
                                                             params: @params)
  end

  def test_create_purchase_with_auth_key
    response = mock_response_ok
    OneSignal::OneSignal.expects(:send_post_request)
                        .with(uri: @create_purchase_uri,
                              body: @params,
                              opts: @opts)
                        .returns(response)
    assert_equal response, OneSignal::Player.create_purchase(id: @player_id,
                                                             params: @params,
                                                             opts: @opts)
  end

  def test_create_focus
    response = mock_response_ok
    OneSignal::OneSignal.expects(:send_post_request)
                        .with(uri: @create_focus_uri, body: @params, opts: @default_opts)
                        .returns(response)
    assert_equal response, OneSignal::Player.create_focus(id: @player_id,
                                                          params: @params)
  end

  def test_create_focus_with_auth_key
    response = mock_response_ok
    OneSignal::OneSignal.expects(:send_post_request)
                        .with(uri: @create_focus_uri, body: @params, opts: @opts)
                        .returns(response)
    assert_equal response, OneSignal::Player.create_focus(id: @player_id,
                                                          params: @params,
                                                          opts: @opts)
  end

  def test_delete
    response = mock_response_ok
    OneSignal::OneSignal.expects(:send_delete_request)
                        .with(uri: @delete_uri, params: @params, opts: @default_opts)
                        .returns(response)
    assert_equal response, OneSignal::Player.delete(id: @player_id,
                                                    params: @params)
  end

  def test_delete_with_auth_key
    response = mock_response_ok
    OneSignal::OneSignal.expects(:send_delete_request)
                        .with(uri: @delete_uri, params: @params, opts: @opts)
                        .returns(response)
    assert_equal response, OneSignal::Player.delete(id: @player_id,
                                                    params: @params,
                                                    opts: @opts)
  end

end
