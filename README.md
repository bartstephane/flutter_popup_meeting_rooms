# popup_meeting_rooms documentation

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

Define the API URL

    To define the API URL, the value of the static const String apiUrl in file config/strings.dart
    can be changed (currently 'http://206.189.16.14/getAllRoomsTesting')

Format of the json file

    The format of the json file is the following, with nested objects:

    [
        {
            "name":"Helsinki",
            "floors":[
                {
                    "id":1,
                    "rooms":[
                        {
                            "id":100,
                            "room_name":"Mercury",
                            "detected":false
                        }
                    ]
                },
                {
                    "id":3,
                    "rooms":[
                        {
                            "id":101,
                            "room_name":"Venus",
                            "detected":false
                        },
                        {
                            "id":102,
                            "room_name":"Earth",
                            "detected":false
                        }
                    ]
                },
                {
                    "id":2,
                    "rooms":[
                        {
                            "id":103,
                            "room_name":"Mars",
                            "detected":false
                        },
                        {
                            "id":104,
                            "room_name":"Jupiter",
                            "detected":false
                        }
                    ]
                }
            ]
        },
        {
            "name":"Oulu",
            "floors":[
                {
                    "id":3,
                    "rooms":[
                        {
                            "id":105,
                            "room_name":"Saturn",
                            "detected":false
                        },
                        {
                            "id":106,
                            "room_name":"Ganymede",
                            "detected":false
                        },
                        {
                            "id":108,
                            "room_name":"Pluto",
                            "detected":false
                        }
                    ]
                },
                {
                    "id":4,
                    "rooms":[
                        {
                            "id":107,
                            "room_name":"Callisto",
                            "detected":false
                        }
                    ]
                }
            ]
        }
    ]
