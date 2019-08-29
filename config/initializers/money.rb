MoneyRails.configure do |config|

  config.default_format = {
    priority: 1,
    iso_code: "br",
    name: "Unidade brasileira",
    symbol: "R$ ",
    symbol_first: true,
    subunit: "Subcent",
    subunit_to_unit: 100,
    thousands_separator: ".",
    decimal_mark: ",",
    no_cents_if_whole: false
  }
end