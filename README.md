# Qt for MCUs 2.12 contentItem parent deref bug reproducer

Illustrates a crash in Qt for MCUs 2.12.1, when a nested `CheckBox`
within an `Item` (or `Rectangle`, or I expect any `Item`) has a `Text`
`contentItem` defined, where the `leftPadding` property is bound to
`parent.<something>`. In this situation, a crash occurs when built with
Qt for MCUs 2.12.1, but does not crash with 2.11.2.

# Prerequisites

* Qt for MCUs 2.12 (found in 2.12.1) installed.
* Desktop build.
* Tested on Windows and Linux (both crash).

# Modifications that prevent crash

The following two modifications to the QML prevent the crash:

* Removing the `Item` container of `Checkbox`:
```qml
CheckBox {
    contentItem: Text {
        leftPadding: parent.indicator.width + parent.spacing
    }
}
```

* Giving CheckBox an id, and referencing it using the id instead of `parent`:
```qml
Item {
    CheckBox {
        id: cb
        contentItem: Text {
            leftPadding: cb.indicator.width + cb.spacing
        }
    }
}
```
