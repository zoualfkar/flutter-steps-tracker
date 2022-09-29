import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


class GraphQlManger{


  late ValueNotifier<GraphQLClient> clientNotifier;


  get client=>clientNotifier.value;

  init()async{

    await initHiveForFlutter();

    final HttpLink httpLink = HttpLink(
      'url',
    );

    final AuthLink authLink = AuthLink(
      getToken: ()  => 'Bearer token',
    );

    final Link link = authLink.concat(httpLink);

    
    clientNotifier = ValueNotifier(
      GraphQLClient(
        link: link,
        // The default store is the InMemoryStore, which does NOT persist to disk
        cache: GraphQLCache(store: HiveStore(),),
      ),
    );

    return clientNotifier;
  }
}