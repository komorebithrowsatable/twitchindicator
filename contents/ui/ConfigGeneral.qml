import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras

Item {
    id: generalSettings

    property alias cfg_updateInterval: updateTime.value
    property alias cfg_twitchAccountLogin: twitchAccountLogin.text


    ColumnLayout {
        anchors.right: parent.right
        anchors.left: parent.left

        RowLayout {
            Label {
                text: "Your twitch account login"
            }
            TextField {
			    id: twitchAccountLogin
			    Layout.fillWidth: true
		    }
        }

        RowLayout {
		    Label {
			    text: "Update every"
		    }
		    SpinBox {
			    id: updateTime
			    minimumValue: 1
			    stepSize: 1
			    maximumValue: 60
			    suffix: "min"
		    }
	    }
    }
}