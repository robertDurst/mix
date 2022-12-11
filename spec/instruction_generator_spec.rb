require './lib/machine/word'
require './lib/machine/instruction/generator'
require './lib/machine/instruction/pretty_formatter'

describe Machine::Instruction::Generator do
  let(:address) { 2172 }

  it 'generates NOP' do
    instruction = Machine::Instruction::Generator.NOP
    expect(Machine::Instruction::PrettyFormatter.call(word: instruction)).to eq("NOP")
  end

  it 'generates LDA' do
    instruction = Machine::Instruction::Generator.LDA(address: address)
    expect(Machine::Instruction::PrettyFormatter.call(word: instruction)).to eq("LDA: +#{address}")
  end

  it 'generates LDi' do
    5.times.each do |i|
      index = i + 1
      instruction = Machine::Instruction::Generator.LDi(address: address, index: index)
      expect(Machine::Instruction::PrettyFormatter.call(word: instruction)).to eq("LDi (i = #{index}): +#{address}")
    end
  end

  it 'generates LDX' do
    instruction = Machine::Instruction::Generator.LDX(address: address)
    expect(Machine::Instruction::PrettyFormatter.call(word: instruction)).to eq("LDX: +#{address}")
  end

  it 'generates LDAN' do
    instruction = Machine::Instruction::Generator.LDAN(address: address)
    expect(Machine::Instruction::PrettyFormatter.call(word: instruction)).to eq("LDAN: -#{address}")
  end

  it 'generates LDiN' do
    5.times.each do |i|
      index = i + 1
      instruction = Machine::Instruction::Generator.LDiN(address: address, index: index)
      expect(Machine::Instruction::PrettyFormatter.call(word: instruction)).to eq("LDiN (i = #{index}): -#{address}")
    end
  end

  it 'generates LDXN' do
    instruction = Machine::Instruction::Generator.LDXN(address: address)
    expect(Machine::Instruction::PrettyFormatter.call(word: instruction)).to eq("LDXN: -#{address}")
  end

  it 'generates STA' do
    instruction = Machine::Instruction::Generator.STA(address: address)
    expect(Machine::Instruction::PrettyFormatter.call(word: instruction)).to eq("STA: +#{address}")
  end

  it 'generates STi' do
    5.times.each do |i|
      index = i + 1
      instruction = Machine::Instruction::Generator.STi(address: address, index: index)
      expect(Machine::Instruction::PrettyFormatter.call(word: instruction)).to eq("STi (i = #{index}): +#{address}")
    end
  end

  it "generates STX" do
    instruction = Machine::Instruction::Generator.STX(address: address)
    expect(Machine::Instruction::PrettyFormatter.call(word: instruction)).to eq("STX: +#{address}")
  end

  it "generates STJ" do
    instruction = Machine::Instruction::Generator.STJ(address: address)
    expect(Machine::Instruction::PrettyFormatter.call(word: instruction)).to eq("STJ: +#{address}")
  end

  it "generates STZ" do
    instruction = Machine::Instruction::Generator.STZ(address: address)
    expect(Machine::Instruction::PrettyFormatter.call(word: instruction)).to eq("STZ: +#{address}")
  end
end
