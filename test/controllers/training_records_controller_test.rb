require "test_helper"

class TrainingRecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get training_records_new_url
    assert_response :success
  end
end
