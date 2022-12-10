require './lib/machine/word'
require './lib/machine/mix'
require './lib/machine/word'
require './lib/machine/number'

# mix = Mix.new

# word = Word.new(byte_1: Byte.new(content: [1,1,0,0,0]), byte_3: Byte.new(content: [0,0,0,1,1]))

# mix.load_a(word: word)
# mix.store_a(address: 7)

# mix.increment_a
# mix.load_a(word: Word.new)

# b = Byte.new(63)


# while true
#   puts b
#   b.decrement

#   sleep 0.1
# end

num = Number.new(478)
pp num.to_s
