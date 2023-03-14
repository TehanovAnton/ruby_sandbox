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
  prepend A1Methods
  prepend A2Methods

  def a1_print_hello_i
    print 'hello'
  end

  def a2_print_hello_i
    print 'hello'
  end
end

p A.ancestors
# [A2Methods, A1Methods, A, Object, ...

p A.new.methods
# [:a2_print_hello, :a1_print_hello, :a1_print_hello_i, :a2_print_hello_i, :singleton_class, ...
