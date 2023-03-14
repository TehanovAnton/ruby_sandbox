module A1Methods
  def a1_print_hello
    print 'hello'
  end
end

module A2Methods
  def a2_print_hello
    print 'hello'
  end
end

class A
  include A1Methods
  include A2Methods

  def a1_print_hello_i
    print 'hello'
  end

  def a2_print_hello_i
    print 'hello'
  end
end

# p A.ancestors
# [A, A2Methods, A1Methods, Object, Kernel, BasicObject]

p A.new.methods
# [:a1_print_hello_i, :a2_print_hello_i, :a2_print_hello, ...