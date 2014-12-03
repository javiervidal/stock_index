class SymbolParser

  def initialize(symbol)
    @symbol = symbol
  end

  def sp500_to_bsym
    case @symbol
      # BRK.B => BRK/B (Berkshire Hathaway Inc)
      # BF.B  => BF/B  (Brown-Forman Corp)
      when /(\w+)\.B/
        "#{$1}/B"
      else
        @symbol
    end
  end

  def bsym_to_cik
    case @symbol
      # BRK/B (Berkshire Hathaway Inc)
      when 'BRK/B'
        '0001067983'
      # BF/B (Brown-Forman Corp)
      when 'BF/B'
        '0000014693'
      # QVCA (Liberty Interactive Corp)
      when 'QVCA'
        '0001355096'
      # LMCK (Liberty Media Corp)
      when 'LMCK'
        '0001560385'
      else
        @symbol
    end
  end

end