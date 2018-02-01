require 'minitest/autorun'
require 'mocha/test_unit'

require_relative 'graph'

require 'mocha'


class GraphTest < Minitest::Test

  # A very simple test to get you back into the swing of things!
  # Creates a graph, refutes that it's nil, and asserts that it is a
  # kind of Graph object.
  
  def test_new_graph_not_nil
    g = Graph::new
    refute_nil g
    assert_kind_of Graph, g
  end

  # This is a "regular" add node test.
  # We are checking to see if we add a node, does the graph report
  # the correct number of nodes.
  # Note though that we now have a dependency on the Node class now,
  # even though we are testing 
  
  def test_add_node
    n = Node::new 1, [2,3]
    g = Graph::new
    
    g.add_node n

    assert_equal g.num_nodes, 1
    
  end

  # We are using a dummy node which is just nil, because we don't
  # really care what happens to that node.  We're just adding something,
  # just as if we were adding a real node, but we are looking at it
  # from the Graph g's perspective and then graph G goes away at the
  # end of the method.
  # So now we are able to test this by passing in a dummy node and
  # see if no exception is raised.
 
  
  def test_has_node_dummy
    g = Graph::new
    dummy_node = nil
    refute g.has_node? dummy_node
  end
  
  # Sometimes, though, a dummy isn't enough, because we need a real
  # object of the right class there.  This is where we can use a
  # test double with a stub.
  # This allows us to bypass any issues in the doubled class.
  # Even if id does not work,
  
  def test_add_node_double
    g = Graph::new
    n = Node.new 7, [1,2]
    Node.any_instance.stubs(:id).returns(1)
    # Note - this will print 1, NOT 7!
    # puts n.id
    # But THIS will show Node 7: [ 1,2 ]
    # g.print
    # Why? Because this only covers the call to
    # id, whereas Node.to_s looks at @id directly
    g.add_node n
    assert_equal 1, g.num_nodes
  end

  # We may also want to verify that id gets called
  # exactly ONE time when we add a node.
  # This is where we can use a mock.
  # A mock is a double which verifies that a method
  # is called a certain number of times.
  
  def test_add_node_mock
    g = Graph::new
    mocked_node = Mocha::Mock::new 'a'
    # If you comment out the .id reference in
    # graph.add_node, this will fail
    mocked_node.expects(:id).once
    g.add_node mocked_node
  end
  
end
