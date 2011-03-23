require 'helper'
require 'test/unit'


class TestGemversus < Test::Unit::TestCase
  
    should "true first test" do
        assert true
    end
    
    should "gemversus  test" do
      aa = GemVersus.go
      assert_not_nil aa
    end
    
    should "gemversus.go test" do
      assert_equal(4, GemVersus.go)
    end
    
    should "gemversus.foo test" do
      assert_equal("Gem Versus module", GemVersus.foo)
    end
    
    should "gemversus Foo class test" do
      bb = GemVersus::Foo.new
      assert_not_nil bb.boo
      assert_equal("foo boo", bb.boo)
    end
end
