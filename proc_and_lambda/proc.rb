p_block = Proc.new { 'hello world' }
p p_block.call

p_block = Proc.new { |str| str }
p p_block.call('hello world')

p_block = proc { 'hello world' }
p p_block.call

p_block = proc { |str| str }
p p_block.call('hello world')

p p_block.class.name
Proc
####################

def call_proc
  a = 1
  p_block = proc do
    p a += 2

    return a
  end

  p_block.call

  'it will not be executed'
end

p call_proc
###########

p_block = proc { |a, b| "#{a}, #{b}" }
p p_block.call
p p_block.call(1, 2)
