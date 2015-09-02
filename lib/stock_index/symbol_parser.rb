class SymbolParser

  def initialize(symbol)
    @symbol = symbol
  end

  def symbol_to_bsym
    if @symbol
      @symbol.sub('-', '/')
    else
      nil
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
      # QRVO (Qorvo, Inc.)
      # when 'QRVO'
      #   '0001604778'
      # QVCA (Liberty Interactive Corp)
      # when 'QVCA'
      #   '0001355096'
      # LMCK (Liberty Media Corp)
      # when 'LMCK'
      #   '0001560385'
      else
        @symbol
    end
  end

end