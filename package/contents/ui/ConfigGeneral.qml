import QtQuick 2.0
import QtQuick.Window 2.2
import QtWebEngine 1.10
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras

Item {
    id: generalSettings

    property alias cfg_updateInterval: updateTime.value
    property alias cfg_twitchToken: authFlow.cfg_twitchToken

    Window {
        id: authFlow
        visible: false
        height: 600
        width: 800
        property string cfg_twitchToken: ""

        WebEngineView {
            id: webView
            anchors.fill: parent
            profile: WebEngineProfile {
                offTheRecord: true
            }
            onUrlChanged: {
                if (webView.url.toString().startsWith("http://localhost")) { //success
                    let tokenData = webView.url.toString().replace("http://localhost/#access_token=", "");
                    let idTokenStart = tokenData.indexOf("&");
                    let token = tokenData.substring(0, idTokenStart);
                    authFlow.cfg_twitchToken = token;
                    authFlow.visible = false;
                    console.log("New token: "+token);
                }
            }
        }

        function relogin() {
            if (!authFlow.visible) authFlow.show();
            webView.url = "https://id.twitch.tv/oauth2/authorize?client_id=yoilemo3cudfjaqm6ukbew2g2mgm2v&redirect_uri=http://localhost&response_type=token+id_token&scope=openid";
        }
    }

    ColumnLayout {
        anchors.right: parent.right
        anchors.left: parent.left

        RowLayout {
            Label {
                id: token
                text: "Twitch access token"
            }
            Button {
                text: "Relogin"
                onClicked: {
                    authFlow.relogin();
                }
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