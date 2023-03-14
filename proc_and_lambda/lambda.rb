l_block = lambda { 'hello world' }
p l_block.call

l_block = ->(str) { str }
p l_block.call('hello world')

p l_block.class.name
# Proc
####################

def call_lambda
  a = 1
  l_block = lambda do
    p a += 2

    return a
  end

  l_block.call

  'it will be executed'
end

p call_lambda
###########

l_block = lambda { |a, b| "#{a}, #{b}" }
p l_block.call
p l_block.call(1, 2)
