class Symbol
  def plus(other_sym)
    ( to_s + other_sym.to_s ).to_sym
  end

  alias_method :+, :plus
end
