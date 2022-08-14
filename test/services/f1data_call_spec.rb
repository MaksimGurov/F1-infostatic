require 'rails_helper'

describe 'F1Data' do
  it "returns data correctly" do
    expect(F1Data.api_call).to  be_kind_of(Hash)
  end
end

describe 'F1Data' do
  it "API call to get data for next race" do
    expect(F1dataCall.next_race).to  be_kind_of(Array)
  end
end