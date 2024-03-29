# spec/requests/root_spec.rb

RSpec.describe "Root", type: :request do
  it "is successful" do
    get "/"

    expect(last_response.body).to include "Welcome to Bookshelf"
    expect(last_response).to be_successful
  end
end
