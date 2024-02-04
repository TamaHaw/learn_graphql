const String getCountriesQuery = '''
  query {
    countries {
      code
      name
      continent {
        name
      }
    }
  }
''';