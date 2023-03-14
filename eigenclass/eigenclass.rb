class Greeting
  def self.hello
    'Hello guys'
  end

  def self.eigenclass
    class << self
      self
    end
  end

  def hello
    'hello guys'
  end
end

Greeting.instance_methods.include?(:hello) # => true

hey  = Greeting.new
hola = Greeting.new

p hey.hello  # => "hello guys"
p hola.hello # => "hello guys"
############################

p Greeting.instance_methods.include?(:hello)  # => true
p Greeting.singleton_methods.include?(:hello) # => true

p Greeting.hello # => "Hello guys"
################################

p Greeting.eigenclass      # => #<Class:Greeting>
p Greeting
p Greeting.eigenclass.name # => nil

p Greeting.singleton_methods                  # => [:hello, :eigenclass]
p Greeting.eigenclass.instance_methods(false) # => [:hello, :eigenclass]
