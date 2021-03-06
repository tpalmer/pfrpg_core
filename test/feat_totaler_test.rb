require 'minitest/autorun'
require 'pfrpg_utility'
require 'pfrpg_core'
require_relative './test_helper'

class FeatTotalerTest < Minitest::Test
  include TestHelper

  MockFeat = Struct.new(:name) do
    def prereq_code
      nil
    end
  end

  class MockEntity
    attr_accessor :feats
    def initialize(feats = nil)
      @feats = feats
      @feats ||= default_feats
    end

    def default_feats
      [ MockFeat.new('Feat1') ]
    end
  end

  def test_filter_feats_by_owned
    e = MockEntity.new
    feats = [ MockFeat.new('Feat1') ]
    finder = PfrpgCore::FeatFinder.new(e, feats)
    assert finder.find_feats.empty?
  end

end