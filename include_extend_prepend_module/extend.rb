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
  extend A1Methods
  extend A2Methods
end

p A.ancestors
# A, Object, Kernel, BasicObject]

p A.methods
# [:a2_print_hello, :a1_print_hello, :allocate, ...
