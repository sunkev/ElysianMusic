require 'spec_helper'

describe Product do

  it { should have_valid(:brand).when('Heiner', 'String') }
  it { should_not have_valid(:brand).when(nil, '') }

  it { should have_valid(:model).when('string', 'Swanson') }
  it { should_not have_valid(:model).when(nil, '') }

  it { should have_valid(:price).when(12.38, 29312.98) }
  it { should_not have_valid(:price).when(nil, '') }

  it { should validate_presence_of :brand }
  it { should validate_presence_of :price }
  it { should validate_presence_of :model }
end