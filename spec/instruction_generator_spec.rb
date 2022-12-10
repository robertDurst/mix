require './lib/machine/word'
require './lib/machine/mix'
require './lib/machine/word'
require './lib/machine/number'
require './lib/machine/instruction_generator'
require './lib/machine/instruction_interpretar'

describe InstructionGenerator do
  it 'generates STA' do
    instruction = InstructionGenerator.STA(value: 2172)
    expect(InstructionInterpretar.interpret(word: instruction)).to eq("STA: 2172")
  end
end
