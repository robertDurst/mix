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
        when Machine::Instruction::Opcode::INCA,
          Machine::Instruction::Opcode::DECA,
          Machine::Instruction::Opcode::ENTA,
          Machine::Instruction::Opcode::ENNA
          case word.byte_4.to_decimal
          when 0
            operation_inca(word)
          when 1
            operation_deca(word)
          when 2
            operation_enta(word)
          when 3
            operation_enna(word)
          else
            raise "Undefined operation code received: #{word.byte_4.to_decimal}"
          end
        when Machine::Instruction::Opcode::INCI_BASE + 1 .. Machine::Instruction::Opcode::INCI_BASE + 5,
          Machine::Instruction::Opcode::DECI_BASE + 1 .. Machine::Instruction::Opcode::DECI_BASE + 5,
          Machine::Instruction::Opcode::ENNI_BASE + 1 .. Machine::Instruction::Opcode::ENNI_BASE + 5,
          Machine::Instruction::Opcode::ENNI_BASE + 1 .. Machine::Instruction::Opcode::ENNI_BASE + 5
          case word.byte_4.to_decimal
          when 0
            operation_inci(word)
          when 1
            operation_deci(word)
          when 2
            operation_enti(word)
          when 3
            operation_enni(word)
          else
            raise "Undefined operation code received: #{word.byte_4.to_decimal}"
          end
        when Machine::Instruction::Opcode::INCX,
          Machine::Instruction::Opcode::DECX,
          Machine::Instruction::Opcode::ENTX,
          Machine::Instruction::Opcode::ENNX
          case word.byte_4.to_decimal
          when 0
            operation_incx(word)
          when 1
            operation_decx(word)
          when 2
            operation_entx(word)
          when 3
            operation_ennx(word)
          else
            raise "Undefined operation code received: #{word.byte_4.to_decimal}"
          end
        else
          raise "Undefined operation code received: #{word.byte_5.to_decimal}"
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
        "LDi (i = #{word.byte_5.to_decimal - Machine::Instruction::Opcode::LDI_BASE}): #{word.sign.to_s}#{Number.bytes_to_decimal([word.byte_1, word.byte_2])}"
      end

      def operation_ldx(word)
        "LDX: #{word.sign.to_s}#{Number.bytes_to_decimal([word.byte_1, word.byte_2])}"
      end

      def operation_ldan(word)
        "LDAN: #{word.sign.to_s}#{Number.bytes_to_decimal([word.byte_1, word.byte_2])}"
      end

      def operation_ldin(word)
        "LDiN (i = #{word.byte_5.to_decimal - Machine::Instruction::Opcode::LDIN_BASE}): #{word.sign.to_s}#{Number.bytes_to_decimal([word.byte_1, word.byte_2])}"
      end

      def operation_ldxn(word)
        "LDXN: #{word.sign.to_s}#{Number.bytes_to_decimal([word.byte_1, word.byte_2])}"
      end

      def operation_sta(word)
        "STA: #{word.sign.to_s}#{Number.bytes_to_decimal([word.byte_1, word.byte_2])}"
      end

      def operation_sti(word)
        "STi (i = #{word.byte_5.to_decimal - Machine::Instruction::Opcode::STI_BASE}): #{word.sign.to_s}#{Number.bytes_to_decimal([word.byte_1, word.byte_2])}"
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

      def operation_inca(word)
        "INCA: #{word.sign.to_s}#{Number.bytes_to_decimal([word.byte_1, word.byte_2])}"
      end

      def operation_deca(word)
        "DECA: #{word.sign.to_s}#{Number.bytes_to_decimal([word.byte_1, word.byte_2])}"
      end

      def operation_enta(word)
        "ENTA: #{word.sign.to_s}#{Number.bytes_to_decimal([word.byte_1, word.byte_2])}"
      end

      def operation_enna(word)
        "ENNA: #{word.sign.to_s}#{Number.bytes_to_decimal([word.byte_1, word.byte_2])}"
      end

      def operation_inci(word)
        "INCi (i = #{word.byte_5.to_decimal - Machine::Instruction::Opcode::INCI_BASE}): #{word.sign.to_s}#{Number.bytes_to_decimal([word.byte_1, word.byte_2])}"
      end

      def operation_deci(word)
        "DECi (i = #{word.byte_5.to_decimal - Machine::Instruction::Opcode::DECI_BASE}): #{word.sign.to_s}#{Number.bytes_to_decimal([word.byte_1, word.byte_2])}"
      end

      def operation_enti(word)
        "ENTi (i = #{word.byte_5.to_decimal - Machine::Instruction::Opcode::ENTI_BASE}): #{word.sign.to_s}#{Number.bytes_to_decimal([word.byte_1, word.byte_2])}"
      end

      def operation_enni(word)
        "ENNi (i = #{word.byte_5.to_decimal - Machine::Instruction::Opcode::ENNI_BASE}): #{word.sign.to_s}#{Number.bytes_to_decimal([word.byte_1, word.byte_2])}"
      end

      def operation_incx(word)
        "INCX: #{word.sign.to_s}#{Number.bytes_to_decimal([word.byte_1, word.byte_2])}"
      end

      def operation_decx(word)
        "DECX: #{word.sign.to_s}#{Number.bytes_to_decimal([word.byte_1, word.byte_2])}"
      end

      def operation_entx(word)
        "ENTX: #{word.sign.to_s}#{Number.bytes_to_decimal([word.byte_1, word.byte_2])}"
      end

      def operation_ennx(word)
        "ENNX: #{word.sign.to_s}#{Number.bytes_to_decimal([word.byte_1, word.byte_2])}"
      end
    end
  end
end
