require 'spec_helper'

describe Style do
  let(:style) { Style.create(name: 'American') }

  it 'checks correct slug' do
    expect(style.slug).to eq 'american'
  end
end
