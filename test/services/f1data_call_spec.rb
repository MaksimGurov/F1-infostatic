require 'rails_helper'

describe 'F1Data' do
  it "returns data correctly" do
    expect(F1Data.api_call).to  be_kind_of(Hash)
  end
end