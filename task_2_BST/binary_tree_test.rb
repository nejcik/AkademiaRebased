require 'minitest/autorun'
require 'minitest/pride'
require_relative 'binary_tree.rb'

class BinaryTreeTest < Minitest::Test
  def test_create_bst_empty_array
    array = []
    bst = BinaryTree.create(array)
    assert bst.nil?
  end

  def test_create_bst_one_element_array
    array = [3]
    bst = BinaryTree.create(array)
    assert_equal array[0], bst.value.to_i
  end

  def test_create_bst
    array = [3, 2, 4]
    bst = BinaryTree.create(array)
    assert_equal array[1], bst.value.to_i
    assert_equal array[0], bst.left.value.to_i
    assert_equal array[2], bst.right.value.to_i
  end
end
