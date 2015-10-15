require 'bike'

describe Bike do
  it { is_expected.to respond_to :working? }
  it 'returns working? as false a broken bike is reported' do
    expect(subject.working?(false)).to eq false
  end

  it 'returns working? as true as default value' do
    expect(subject.working).to eq true
  end


end