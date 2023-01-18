# Kat

## TABLE OF CONTENTS

- [What I learned](#what-i-learned)
  - [Flutterhooks](#flutterhooks)
  - [Riverpod](#riverpod)
  - [Equality in Dart](#equality-in-dart)
  - [Automated Testing in Flutter](#automated-testing-in-flutter)
    - [Unit Testing](#unit-testing)
    - [Widget Testing](#widget-testing)
    - [Integration Testing](#integration-testing)

## What I learned

### Flutterhooks

  Hooks are a way to reuse code more efficiently and are not technically a state-management solution ( [docs]((https://github.com/rrousselGit/flutter_hooks)) )

- hooks can only be used in the `build` method of a widget
- hooks are retrieved by their index, and any change in their order will affect all of the hooks that come after
- hooks aren't rebuilt with hot-reloads as the `HookWidget` holds on to them, and if it finds they haven't been changed ( depending on the index and class ) they won't be rebuilt
- `useTextingEditingController` handles the initialization and disposing of the controller as any hook you create within a `HookWidget` is registered within that instance using it's index and class so the lifetime of the controller would be automatically handled
- `HookWidget` is a `StatelessWidget` so in order to create and maintain a state we use the `useState` hook which returns a `ValueNotifier`

> `useEffect`
> 
> Useful for side-effects and optionally canceling them.
> 
> [useEffect](https://pub.dev/documentation/flutter_hooks/latest/flutter_hooks/useEffect.html) is called synchronously on every `build`, unless `keys` is specified. In which case [useEffect](https://pub.dev/documentation/flutter_hooks/latest/flutter_hooks/useEffect.html) is called again only if any value inside `keys` as changed.
> 
> It takes an `effect` callback and calls it synchronously. That `effect` may optionally return a function, which will be called when the `effect` is called again or if the widget is disposed.
> 
> By default `effect` is called on every `build` call, unless `keys` is specified. In which case, `effect` is called once on the first [useEffect](https://pub.dev/documentation/flutter_hooks/latest/flutter_hooks/useEffect.html) call and whenever something within `keys` change
> 
> [useEffect function - flutter_hooks library - Dart API](https://pub.dev/documentation/flutter_hooks/latest/flutter_hooks/useEffect.html)

- `useFuture` can be used to create an `AsyncSnapshot` that rebuilds a widget whenever the future is resolved 

- `useMemoized` allows for caching of complex objects. If it has a cached version of that object from before it will return it otherwise it will kick off that future and hold on to it afterwards ( I wanna create something, hold on to it )

- `useAppLifecycleState` can be used to keep track of the state of the application e.g. resumed, paused, inactive, or detached

- `useEffect` can be the equivalent of `initState` + `didUpdateWidget` + `dispose` ( depending on the implementation )

- hooks should **NOT** be used within loops, conditionally, or inside a user interaction lifecycle such as `onPressed` ( [read more](https://docs-v2.riverpod.dev/docs/about_hooks#what-are-hooks) )

### Riverpod

- I learned that this guy "Remi Rousselet" is fkin insane

- three packages,
  
  - `riverpod`, Dart only (NO flutter)
  
  - `flutter_riverpod`, A basic way of using Riverpod with flutter. You mostly use it for state management.
  
  - If you are using hook widgets(`flutter_hooks`) that reduce the boilerplate code like dispose, you can use `hooks_riverpod`

- `ref` is basically your window to the outside world. Providers are usually global functions with no idea about any other variable unless they're global and that's where `ref` comes in.

- `ProviderScope` should be used to specify the scope of the providers whether for example for the entire app ( at the root of the application ), or actually for the widgets or part of the tree that needs those providers. 

- "it is possible to insert other `ProviderScope` anywhere inside the widget tree to override the behavior of a provider for only a part of the application" [ProviderScope class - flutter_riverpod library - Dart API](https://pub.dev/documentation/flutter_riverpod/latest/flutter_riverpod/ProviderScope-class.html#:~:text=it%20is%20possible%20to%20insert%20other%20ProviderScope%20anywhere%20inside%20the%20widget%20tree%20to%20override%20the%20behavior%20of%20a%20provider%20for%20only%20a%20part%20of%20the%20application)

- `ref.watch` can be used to "watch" or listen to changes within a provider

- `ref.read` obtains the current snapshot of the object specified. ( it reads basically, duh )

- `Consumer` can be used to be more efficient in rebuilding the UI, you only rebuild the parts of the UI the actually needs to be rebuilt.
  
   [Consumer class - flutter_riverpod library - Dart API](https://pub.dev/documentation/flutter_riverpod/latest/flutter_riverpod/Consumer-class.html)
  
  ```
  "If you pass the pre-built subtree as the child parameter, the Consumer will pass it back to your builder function so that you can incorporate it into your build.
  
  Using this pre-built child is entirely optional, but can improve performance significantly in some cases and is therefore a good practice."
  ```
  
  ```
  [StateProvider] vs [StateNotifierProvider]
  
  SP: provides you with a getter/setter [state] that can be changed from the outside
  SNP: provides you with a getter [state] that can be manipulated with prediffined methods
  
  "
  
  StateProvider is a provider that exposes a way to modify its state. It is a simplification of StateNotifierProvider, designed to avoid having to write a StateNotifier class for very simple use-cases.
  
  StateProvider exists primarily to allow the modification of simple variables by the User Interface.
   The state of a StateProvider is typically one of:
  
  an enum, such as a filter type
   a String, typically the raw content of a text field
   a boolean, for checkboxes
   a number, for pagination or age form fields
   You should not use StateProvider if:
  
  your state needs validation logic
   your state is a complex object (such as a custom class, a list/map, ...)
   the logic for modifying your state is more advanced than a simple count++.
   For more advanced cases, consider using StateNotifierProvider instead and create a StateNotifier class.
   While the initial boilerplate will be a bit larger, having a custom StateNotifier class is critical for the long-term maintainability of your project – as it centralizes the business logic of your state in a single place.
  
  "
  
  Sources ( official docs are really good )
       - https://developermemos.com/posts/different-providers-riverpod
       - https://riverpod.dev/docs/providers/state_provider/ 
       - https://riverpod.dev/docs/providers/state_notifier_provider/
  ```

- `FutureProvider` allows you to handle various states ( loading, done, error ) very 
  
  conveniently with the `when` method 

- `FutureProvider` is used for caching asynchronous computations, and if this `Future` is used in multiples places throughout the code, it'll only be resolved once unless you're e.g. combining other providers states

- all different types of providers at their core conform to another provider `AlwaysAliveProviderBase` so you can work with different types of providers easily  or somewhat generically 

- under the hood, riverpod checks for equality when providing us with new values so we might wanna override the equality to work as expected 

- `.family` modifier can be used to get a unique provider based on external parameters. [docs](https://riverpod.dev/docs/concepts/modifiers/family/)

- `.autoDispose` modifier can be used to dispose of a provider when it's no longer being used ( using auto-dispose adds an extra property to the ref object `keepAlive` if you want to programatically decide whether or not you should dispose off the provider )

- `ref.read` should be avoided as much as possible even when the state may never change. Even then, `ref.watch` should be used for maintability purposes. [ref.read - docs](https://riverpod.dev/docs/concepts/reading#using-refread-to-obtain-the-state-of-a-provider)

- `ref.refresh` can be used to reset the value of the provider

- `.select` can be used to explicitly tell Riverpod that we want to listen to a certain property that we care about
  
  ```
  Using StreamProvider over StreamBuilder has numerous benefits:
  
  * it allows other providers to listen to the stream using ref.watch.
  * it ensures that loading and error cases are properly handled, thanks to AsyncValue.
  * it removes the need for having to differentiate broadcast streams vs normal streams.
  * it caches the latest value emitted by the stream, ensuring that if a listener is added after an event is emitted, the listener will still have immediate access to the most up-to-date event.
  * it allows easily mocking the stream during tests by overriding the StreamProvider.
  ```

- `ProviderObserver` can be used to observe changes in a `ProviderContainer` such as adding, disposing, or updating a provider

### Equality in Dart

- Equality in dartlang is referential by default meaning it compares references to objects.
  
  When instantiating an object `final potato = Potato();` the variable `potato` actually referes or points to an object the lives in the memory. Unless a constant constructer is used ( both in the defintion and declaration ) and instantiated with the same values, each object would refer to or instantiate a new object.
  
  ```dart
  void main(){
      final mrPotato1 = Potato('Michael Scott', '123');
      final mrPotato2 = Potato('Michael Scott', '123');
      print(mrPotato1 == mrPotato2); // false
  
      // mrPotato1 --refersTo--> Object1 in the memory
      // mrPotato2 --refersTo--> Object2 in the memory
  
      final mrPotato3 = const Potato('Michael Scott', '123');
      final mrPotato4 = const Potato('Michael Scott', '123');
      print(mrPotato3 == mrPotato4); // true
  
      // mrPotato3 --refersTo--> Object3 in the memory
      // mrPotato4 --refersTo--> Object3 in the memory
  }
  
  @immutable
  class Potato{
      final String name;
      final String ssn;
  
      const Potato(this.name, this.ssn);
  }
  ```
  
  ```dart
  class Potato{
      ...
      /// To fix this, we can override the equality operator to be value equlaity instead
      @override
      bool operator ==(covariant Potato other) =>
          identical(this, other) || // by defintion, if they reference the same object then they're equal
          other is Potato &&
          other.runtimeType == runtimeType &&
          other.name == name &&
          other.ssn == ssn;
          // or [other.hashCode == hashCode] instead of comparing the attributes indivdually
  
       @override
       int get hashCode => name.hashCode ^ ssn.hashCode;
  }
  ```
  
  [Dart Data Class Generator vscode extension](https://marketplace.visualstudio.com/items?itemName=hzgood.dart-data-class-generator)
  
  [equatable | Dart Package](https://pub.dev/packages/equatable) ( no need for explicit overriding )

### Automated Testing in Flutter

- The `_test` in the filename syntax marks the file as a testing file.

#### Unit Testing

- testing a small piece or a "unit" of code possibly with fake data to mock an api call or the original data source

```dart
test("Define what the test will do", (){

   // Arrange: Get the resources needed for testing

   // Act: Perform operations you need

   // Assert: Check if the output generated is the one you expected

});
```

- if you wish to perform ur test with the real API, ur gonna need to create ur own `HttpClient` which can be done by extending `HttpOverrides` and then using`HttpOverrides.global = _MyHttpOverrides();` inside the test

- common instructions can be refactored into the `setUpAll` function which exectues before any test ( [docs](https://api.flutter.dev/flutter/flutter_test/setUpAll.html) )
  
  ```dart
  setUpAll(() async {
      HttpOverrides.global = _MyHttpOverrides();
    });
  ```

- related tests can be grouped in a `group` function to be run together

#### Widget Testing

- checking to see if a widget (UI) behaves as expected with real or mocked data

```dart
testWidget('desc',
(tester) async {
    /// if you wish to use async code you have to use `runAsync`
    /// as widget testing doesn't support real async code 
    await tester.runAsync(() async {
        //
    });
});
```

- `.pumpWidget` "Renders the UI from the given `widget`"

- `.pumpAndSettle` "This essentially waits for all animations to have completed"

- you can interact with the widget through the `tester` as it exposes methods such as `.tap` or `.enterText` on a given widget that can be found through e.g. type `find.byType` [(see more finders)](https://docs.flutter.dev/cookbook/testing/widget/finders)

- `.pump` acts like a `setState`

- for test assert we can use a `matcher` [(all matchers)](https://github.com/flutter/flutter/blob/master/packages/flutter_test/lib/src/matchers.dart)

#### Integration Testing

- testing the complete application flow in real-world conditions

- The integration test runs in a real device

- we need to add a dev dependancy to our project
  
  ```yaml
  integration_test:
      sdk: flutter
  ```

> *"Integration tests are used to check the complete app or to check the flow of the application. So here real HTTP requests are made and run in a real async environment. So we don’t need to create our custom HttpClient or use `tester.runAsync` to run asynchronous statements."*

- directory structure
  
  ```
  lib/
    ...
  integration_test/
    foo_test.dart
    bar_test.dart
  test/
    # Other unit tests go here
  ```

- basic setup would look like
  
  ```dart
  void main() {
    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
        as IntegrationTestWidgetsFlutterBinding;
  
    // fullyLive ensures that every frame is shown, suitable for heavy animations and navigation
    if (binding is LiveTestWidgetsFlutterBinding) {
      binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
    }
  }
  ```

> *" You should only use `testWidgets` to declare your tests, or errors won’t be reported correctly."*

|              | unit    | widget | integration |
| ------------ | ------- | ------ | ----------- |
| speed        | fastest | fast   | slow        |
| dependencies | few     | more   | most        |
| usage freq.  | high    | low    | moderate    |