import 'dart:convert';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql/client.dart';

import 'graphql_queries.dart';

void main() async {
  final GraphQLClient client = GraphQLClient(
    link: HttpLink('https://countries.trevorblades.com/'),
    cache: GraphQLCache(),
  );

  final QueryResult result = await client.query(QueryOptions(
    document: gql(getCountriesQuery),
  ));

  if (result.hasException) {
    print('Error: ${result.exception.toString()}');
  } else {
    final jsonData = jsonEncode(result.data);
    print('Data: $jsonData');
  }
}