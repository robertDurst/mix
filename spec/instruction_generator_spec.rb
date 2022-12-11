require './lib/machine/word'
require './lib/machine/mix'
require './lib/machine/word'
require './lib/machine/number'
require './lib/machine/instruction_generator'
require './lib/machine/instruction_interpretar'

describe InstructionGenerator do
  it 'generates NOP' do
    instruction = InstructionGenerator.NOP
    expect(InstructionInterpretar.interpret(word: instruction)).to eq("NOP")
  end

  it 'generates LDA' do
    instruction = InstructionGenerator.LDA(address: 2172)
    expect(InstructionInterpretar.interpret(word: instruction)).to eq("LDA: +2172")
  end

  it 'generates LDi' do
    instruction = InstructionGenerator.LDi(address: 2172, index: 5)
    expect(InstructionInterpretar.interpret(word: instruction)).to eq("LDi (i = 5): +2172")
  end

  it 'generates LDX' do
    instruction = InstructionGenerator.LDX(address: 2172)
    expect(InstructionInterpretar.interpret(word: instruction)).to eq("LDX: +2172")
  end

  it 'generates LDAN' do
    instruction = InstructionGenerator.LDAN(address: 2172)
    expect(InstructionInterpretar.interpret(word: instruction)).to eq("LDAN: -2172")
  end

  it 'generates LDiN' do
    instruction = InstructionGenerator.LDiN(address: 2172, index: 1)
    expect(InstructionInterpretar.interpret(word: instruction)).to eq("LDiN (i = 1): -2172")
  end

  it 'generates LDXN' do
    instruction = InstructionGenerator.LDXN(address: 2172)
    expect(InstructionInterpretar.interpret(word: instruction)).to eq("LDXN: -2172")
  end

  it 'generates STA' do
    instruction = InstructionGenerator.STA(address: 2172)
    expect(InstructionInterpretar.interpret(word: instruction)).to eq("STA: +2172")
  end

  it "generates STi" do
    instruction = InstructionGenerator.STi(address: 2172, index: 3)
    expect(InstructionInterpretar.interpret(word: instruction)).to eq("STi (i = 3): +2172")
  end

  it "generates STX" do
    instruction = InstructionGenerator.STX(address: 2172)
    expect(InstructionInterpretar.interpret(word: instruction)).to eq("STX: +2172")
  end

  it "generates STJ" do
    instruction = InstructionGenerator.STJ(address: 2172)
    expect(InstructionInterpretar.interpret(word: instruction)).to eq("STJ: +2172")
  end

  it "generates STZ" do
    instruction = InstructionGenerator.STZ(address: 2172)
    expect(InstructionInterpretar.interpret(word: instruction)).to eq("STZ: +2172")
  end
end
