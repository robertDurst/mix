require './lib/machine/number'

module Machine
  module Instruction
    class BaseInterpreter
      def initialize(word:)
        @word = word
      end

      def self.call(*args)
        new(*args).call
      end

      def call
        interpret
      end

      private

      attr_reader :word

      def interpret
        case word.byte_5.to_decimal
        when Machine::Instruction::Opcode::NOP
          operation_nop(word)
        when Machine::Instruction::Opcode::LDA
          operation_lda(word)
        when Machine::Instruction::Opcode::LDI_BASE + 1 .. Machine::Instruction::Opcode::LDI_BASE + 5
          operation_ldi(word)
        when Machine::Instruction::Opcode::LDX
          operation_ldx(word)
        when Machine::Instruction::Opcode::LDAN
          operation_ldan(word)
        when Machine::Instruction::Opcode::LDIN_BASE + 1 .. Machine::Instruction::Opcode::LDIN_BASE + 5
          operation_ldin(word)
        when Machine::Instruction::Opcode::LDXN
          operation_ldxn(word)
        when Machine::Instruction::Opcode::STA
          operation_sta(word)
        when Machine::Instruction::Opcode::STI_BASE + 1 .. Machine::Instruction::Opcode::STI_BASE + 5
          operation_sti(word)
        when Machine::Instruction::Opcode::STX
          operation_stx(word)
        when Machine::Instruction::Opcode::STJ
          operation_stj(word)
        when Machine::Instruction::Opcode::STZ
          operation_stz(word)
        else
          raise "Undefined operation code received: #{word.byte_5.to_decimal}"
          "UNDEFINED"
        end
      end

      # if not overriden, just prints out the instruction

      def operation_nop(word)
        "NOP"
      end

      def operation_lda(word)
        "LDA: #{word.sign.to_s}#{Number.bytes_to_decimal([word.byte_1, word.byte_2])}"
      end

      def operation_ldi(word)
        "LDi (i = #{word.byte_5.to_decimal - 8}): #{word.sign.to_s}#{Number.bytes_to_decimal([word.byte_1, word.byte_2])}"
      end

      def operation_ldx(word)
        "LDX: #{word.sign.to_s}#{Number.bytes_to_decimal([word.byte_1, word.byte_2])}"
      end

      def operation_ldan(word)
        "LDAN: #{word.sign.to_s}#{Number.bytes_to_decimal([word.byte_1, word.byte_2])}"
      end

      def operation_ldin(word)
        "LDiN (i = #{word.byte_5.to_decimal - 16}): #{word.sign.to_s}#{Number.bytes_to_decimal([word.byte_1, word.byte_2])}"
      end

      def operation_ldxn(word)
        "LDXN: #{word.sign.to_s}#{Number.bytes_to_decimal([word.byte_1, word.byte_2])}"
      end

      def operation_sta(word)
        "STA: #{word.sign.to_s}#{Number.bytes_to_decimal([word.byte_1, word.byte_2])}"
      end

      def operation_sti(word)
        "STi (i = #{word.byte_5.to_decimal - 24}): #{word.sign.to_s}#{Number.bytes_to_decimal([word.byte_1, word.byte_2])}"
      end

      def operation_stx(word)
        "STX: #{word.sign.to_s}#{Number.bytes_to_decimal([word.byte_1, word.byte_2])}"
      end

      def operation_stj(word)
        "STJ: #{word.sign.to_s}#{Number.bytes_to_decimal([word.byte_1, word.byte_2])}"
      end

      def operation_stz(word)
        "STZ: #{word.sign.to_s}#{Number.bytes_to_decimal([word.byte_1, word.byte_2])}"
      end


    end
  end
end
