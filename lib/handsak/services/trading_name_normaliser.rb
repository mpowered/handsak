class TradingNameNormaliser
  attr_reader :original

  def initialize(name)
    @original = name.to_s
  end

  def normalised_name
    return unless original
    @name ||= transforms.inject(original) do |name, transform|
      send(transform, name)
    end
  end

  private
  def transforms
    %w(
      downcase
      rename_ampersand
      strip_non_alphanumeric
      strip_legal_suffixes
    )
  end

  def downcase(name)
    name.downcase
  end

  def rename_ampersand(name)
    name.gsub('&', 'and')
  end

  def strip_non_alphanumeric(name)
    name.gsub(/\W/, '')
  end

  def strip_legal_suffixes(name)
    # At this point, name should be downcase and without whitespace
    %w(
      ptyltd
      pty
      ltd
      proprietary
      limited
      cc
      inc
      incorporated
      ing
      ingelyf
    ).inject(name) do |name, suffix|
      name.gsub(/#{suffix}$/, '')
    end
  end
end