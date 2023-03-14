
def iterate_numbers_and_yeild_with_args
  (0..9).each do |number|
    p yield(number)
  end
end

def iterate_numbers_and_yeild_without_args
  (0..9).each do |number|
    p "#{yield} #{number}"
  end
end

iterate_numbers_and_yeild_with_args do |number|
  number**2
end 

iterate_numbers_and_yeild_without_args do
  'this is'
end
