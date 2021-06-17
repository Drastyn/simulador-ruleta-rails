class Player < ApplicationRecord
    validates :name, uniqueness: { case_sensitive: false, message: " ya registrado (puedes usar un apodo)" }
    validates :name, length: { in: 4..20, message:" demasiado corto" }
    validates :name, :age, :mount, presence: { message: " no puede estar en blanco" }
    validates :name, format: { :with => /\A+[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ\s]+\z/, message: " solo permite letras" }
    validates :mount, :age, numericality: {only_integer: true, message: " solo permite números"}
    validate :minimunMount
    validate :ageRange

    private

    # Validaciones
    # Verifica monto mínimo inicial
    def minimunMount
      if mount.blank? != true
        errors.add(:mount, " mínimo debe ser de $10000") if mount < 10000
      end
    end
    # Verifica edad mínima y posible edad máxima
    def ageRange
      if age.blank? != true
        errors.add(:age, " debe ser superior a 18 años") if age < 18
        errors.add(:age, " inválida, ¿quizás?") if age > 105
      end
    end
    # Funciones de consulta
    def self.players_data
      self.select(:id, :name, :token, :age, :mount)
    end
end
