require 'spec_helper'

describe Buscalibre::Tag do
  let!(:base) { Buscalibre::Base.new('development', Dir.pwd) }
  let!(:tree) { Buscalibre::Tag.tree }

  it { tree.should_not be nil }
  it { tree.should be_an_instance_of Array }
end