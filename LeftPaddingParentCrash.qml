import QtQuick
import QtQuick.Controls

Item {
    CheckBox {
        contentItem: Text {
            leftPadding: parent.indicator.width + parent.spacing
        }
    }
}
