require './lib/machine/number'
require './lib/machine/instruction/opcode'

module Machine
  module Instruction
    module Generator
      # NOP C = 0
      def self.NOP
        base_word(op_code: Machine::Instruction::Opcode::NOP)
      end

      # LDA (load A) C = 8; F = field
      # TODO: handle field
      def self.LDA(address:)
        base_word(op_code: Machine::Instruction::Opcode::LDA, address_or_value: address)
      end

      # LDi (load i) C = 8 + i; F = field
      # TODO: handle field
      def self.LDi(address:, index:)
        base_word(op_code: Machine::Instruction::Opcode::LDI_BASE + index, address_or_value: address)
      end

      # LDX (load X) C = 15; F = field
      # TODO: handle field
      def self.LDX(address:)
        base_word(op_code: Machine::Instruction::Opcode::LDX, address_or_value: address)
      end

      # LDAN (load A negative) C = 16; F = field
      # TODO: handle field
      def self.LDAN(address:)
        base_word(op_code: Machine::Instruction::Opcode::LDAN, address_or_value: address, negative: true)
      end

      # LDiN (load i negative) C = 16 + i; F = field
      # TODO: handle field
      def self.LDiN(address:, index:)
        base_word(op_code: Machine::Instruction::Opcode::LDIN_BASE + index, address_or_value: address, negative: true)
      end

      # LDXN (load X negative) C = 23; F = field
      # TODO: handle field
      def self.LDXN(address:)
        base_word(op_code: Machine::Instruction::Opcode::LDXN, address_or_value: address, negative: true)
      end

      # STA (store A) C = 24; F = field
      # TODO: handle field
      def self.STA(address:)
        base_word(op_code: Machine::Instruction::Opcode::STA, address_or_value: address)
      end

      # STi (store i) C = 24 + i; F = field
      # TODO: handle field
      def self.STi(address:, index:)
        base_word(op_code: Machine::Instruction::Opcode::STI_BASE + index, address_or_value: address)
      end

      # STX (store X) C = 31; F = field
      # TODO: handle field
      def self.STX(address:)
        base_word(op_code: Machine::Instruction::Opcode::STX, address_or_value: address)
      end

      # STJ (store J) C = 32; F = field
      # TODO: handle field
      def self.STJ(address:)
        base_word(op_code: Machine::Instruction::Opcode::STJ, address_or_value: address)
      end

      # STZ (store zero) C = 33; F = field
      # TODO: handle field
      def self.STZ(address:)
        base_word(op_code: Machine::Instruction::Opcode::STZ, address_or_value: address)
      end

      # INCA (increase A) C = 48; F = 0
      def self.INCA(value:)
        base_word(op_code: Machine::Instruction::Opcode::INCA, address_or_value: value, field: 0)
      end

      # DECA (decrease A) C = 48; F = 1
      def self.DECA(value:)
        base_word(op_code: Machine::Instruction::Opcode::DECA, address_or_value: value, field: 1)
      end

      # ENTA (enter A) C = 48; F = 2
      def self.ENTA(value:)
        base_word(op_code: Machine::Instruction::Opcode::ENTA, address_or_value: value, field: 2)
      end

      # ENNA (enter negative A) C = 48; F = 3
      def self.ENNA(value:)
        base_word(op_code: Machine::Instruction::Opcode::ENNA, address_or_value: value, field: 3, negative: true)
      end

      # INCi (enter i) C = 48 + i; F = 0
      def self.INCi(value:, index:)
        base_word(op_code: Machine::Instruction::Opcode::INCI_BASE + index, address_or_value: value, field: 0)
      end

      # DECi (enter i) C = 48 + i; F = 1
      def self.DECi(value:, index:)
        base_word(op_code: Machine::Instruction::Opcode::DECI_BASE + index, address_or_value: value, field: 1)
      end

      # ENTi (enter i) C = 48 + i; F = 2
      def self.ENTi(value:, index:)
        base_word(op_code: Machine::Instruction::Opcode::ENTI_BASE + index, address_or_value: value, field: 2)
      end

      # ENNi (enter negative i) C = 48 + i; F = 3
      def self.ENNi(value:, index:)
        base_word(op_code: Machine::Instruction::Opcode::ENNI_BASE + index, address_or_value: value, field: 3, negative: true)
      end

      # INCX (increase X) C = 55; F = 0
      def self.INCX(value:)
        base_word(op_code: Machine::Instruction::Opcode::INCX, address_or_value: value, field: 0)
      end

      # DECX (decrease X) C = 55; F = 1
      def self.DECX(value:)
        base_word(op_code: Machine::Instruction::Opcode::DECX, address_or_value: value, field: 1)
      end

      # ENTX (enter X) C = 55; F = 2
      def self.ENTX(value:)
        base_word(op_code: Machine::Instruction::Opcode::ENTX, address_or_value: value, field: 2)
      end

      # ENNX (enter negative X) C = 55; F = 3
      def self.ENNX(value:)
        base_word(op_code: Machine::Instruction::Opcode::ENNX, address_or_value: value, field: 3, negative: true)
      end

      def self.base_word(op_code:, address_or_value: nil, negative: false, field: nil)
        word = Word.new
        word.byte_5 = Number.new(op_code, bytes: 1).bytes[0]

        unless address_or_value.nil?
          address_or_value_bytes = Number.new(address_or_value, bytes: 2).bytes
          word.byte_1 = address_or_value_bytes[0]
          word.byte_2 = address_or_value_bytes[1]
        end

        word.sign.set_negative if negative

        unless field.nil?
          word.byte_4 = Number.new(field, bytes: 1).bytes[0]

          pp word.byte_4
          pp field
        end

        word
      end
    end
  end
end
