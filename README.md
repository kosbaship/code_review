In `main_cubit.dart`:
1. There are some unused imports which should be removed
2. MainCubit should be @Injectable instead of @LazySingleton
3. MockApiService should be final and private
4. Init() and Loading() should be const
5. MainState should have const constructor and shouldn't have mutable children
6. `list` and `error` fields from `Fetched` and `Error` states should be final

In `main_screen.dart`:
1. `MainCubit? mainCubit` should be late final, not nullable
2. `MainCubit? mainCubit` should be close() in dispose()
3. We should not use BlocProvider, if we don't use it in children widget we should add it to BlocConsumer
3. isLoading should be private or moved to state
5. should be ListView.builder instead of ListView
5. Should move logic inside ListView constructor from UI to cubit
7. it shouldn't add anything if state is not Loading/Error
6. Center should be changed to Stack
7. Hardcoded Strings
8. Rounded corners wont be visible if you don't set popper clipping
9. Hardcoded dimension values
10. Colors should be used from Theme
11. Missing allignment param in Container
12. Padding could be done as param in Container

In `mock_api_service.dart`:
1. get items should be run on a separate isolate
2. Too long lines
3. Duration should be const
4. showError should be final not var