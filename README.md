# popup_meeting_rooms

Installing dependencies

    flutter pub add http
        This package contains a set of high-level functions and classes that make it easy
        to consume HTTP resources and make individual HTTP requests.

    flutter pub add json_annotation
        Defines the annotations used by json_serializable to create code for JSON serialization
        and deserialization.

    dart pub add json_serializable --dev
        To generate to/from JSON code for a class

    dart pub add build_runner --dev
        This package provides a concrete way of generating files using Dart code, outside of
        tools like pub. Unlike pub serve/build, files are always generated directly on disk,
        and rebuilds are incremental.

        In pubspec.yaml, pub get to update dependencies before to run build_runner

        flutter pub run build_runner build
            Runs the code generator that generates the serialization boilerplate for our models
            whenever they are needed.
