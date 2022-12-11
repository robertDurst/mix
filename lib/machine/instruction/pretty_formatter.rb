require './lib/machine/number'
require './lib/machine/instruction/base_interpreter'

module Machine
  module Instruction
    # syntactic sugar for the default base class behavior
    class PrettyFormatter < BaseInterpreter
    end
  end
end
