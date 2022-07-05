def func(*args, clb, &block)
  p args

  clb.call(*args)
  block.call
end

def print_world(str)
  p str
end

func('hello', method(:print_world)