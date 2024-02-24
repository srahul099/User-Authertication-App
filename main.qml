import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2
import LoginModule 1.0
import SignUpModule 1.0
import ChangePasswordModule 1.0
import CSVrwModule 1.0
import ValidationModule 1.0

Window {
    visible: true
    height: 1080
    width: 1920
    title: "Ohmic"
    FontLoader { id: poppinsFont; source: "qrc:/Poppins-SemiBold.ttf" }
    FontLoader { id: poppinsFontRegular; source: "qrc:/Poppins-Regular.ttf" }

    // registered as qml type
    Login {
        id: loginType //loginType.method() can be used anywhere
    }

    SignUp {
        id: signUpType
    }

    ChangePassword {
        id: chngPassType
    }

    CsvRW {
        id: csvRwType
    }

    Validation {
        id: validType
    }

    // same as above but with get() and set()
    Connections {
        target: loginType
        //onSomeVarChanged: id.text = loginType.getSomeVar()
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            Qt.quit();
        }
    }

    StackView {
        id: stackView
        anchors.fill:parent
        initialItem: loginPageComponent

        // COMPONENT - LOGIN PAGE
        Component {
            id: loginPageComponent

            Rectangle {
                id: loginRec1

                Image {
                    source: "qrc:/bg.png"
                    anchors.fill: parent
                    width: parent.width
                    height: parent.height
                }

                Rectangle {
                    id: loginRec2
                    height: 906
                    width: 672
                    color: "#FFFFFF"
                    radius: 30
                    anchors.centerIn: parent

                    ColumnLayout {
                        id: loginColLay1
                        width: parent.width
                        height: 0.8 * parent.height
                        spacing: 15
                        anchors.centerIn: parent

                        // Metrohm Logo
                        Image {
                            id: metrohmLogo
                            source: "qrc:/logo.png"
                            fillMode: Image.PreserveAspectFit
                            Layout.alignment: Qt.AlignCenter
                        }

                        // Login Text
                        Text {
                            id: loginText
                            text: "Login"
                            font.bold: true
                            font.family: poppinsFont.name
                            font.pointSize: 32
                            Layout.alignment: Qt.AlignCenter
                        }

                        // Username Field
                        Rectangle {
                            id: loginRec3
                            height: 72//0.05 * loginColLay1.height
                            width: 481//0.7 * loginColLay1.width
                            color: "#DEDEDE"
                            radius: 10
                            Layout.alignment: Qt.AlignCenter

                            TextField {
                                id: username
                                placeholderText: "Username"
                                anchors.fill: loginRec3
                                opacity: 0.5
                                font.pointSize: 30
                                font.family: poppinsFontRegular.name
                            }
                        }

                        // Password Field
                        Rectangle {
                            id: loginRec4
                            height: 72//0.05 * loginColLay1.height
                            width: 481//0.7 * loginColLay1.width
                            color: "#DEDEDE"
                            radius: 10
                            Layout.alignment: Qt.AlignCenter

                            TextField {
                                id: password
                                placeholderText: "Password"
                                anchors.fill: loginRec4
                                opacity: 0.5
                                font.pointSize: 30
                                font.family: poppinsFontRegular.name
                                echoMode: TextInput.Password
                            }
                        }

                        // Login Button
                        Rectangle {
                            id: loginRec5
                            height: 72//1.5 * loginRec4.height
                            width: 201//0.35 * loginRec4.width
                            radius: 50
                            color: "#DEDEDE"
                            Layout.alignment: Qt.AlignCenter

                            Text {
                                text: "Login"
                                font.family: poppinsFontRegular.name
                                anchors.centerIn: loginRec5
                                font.pointSize: 22.5
                            }

                            MessageDialog {
                                id: msgBox
                                visible: false
                            }

                            MouseArea {
                                anchors.fill: loginRec5
                                onClicked: {

                                    // if else conditions here call the login check api and check with loginType.someVar if exists or not and proceed to next page

                                    //loginClass.loginSlot(username.text, password.text) //context method check main.cpp
//                                    loginType.loginSlot(username.text, password.text)
//                                    loginType.lognFn()
//                                    loginType.setSomeVar(qsTr("True"))
//                                    loginType.someVar
//                                    loginType.getSomeVar

                                    var loginResp = csvRwType.checkUsernamePassword(username.text, password.text)
                                    if (loginResp === "Success! Password is correct") {
                                        msgBox.text = "Success! You are now logged in!"
                                        msgBox.visible = true
                                        stackView.push(welcomePageComponent)
                                    } else {
                                        msgBox.text = "Check your login credentials and try again!"
                                        msgBox.visible = true
                                        stackView.push(loginPageComponent)
                                    }
                                }
                            }
                        }

                        // New User? Sign Up
                        RowLayout {
                            id: loginRowLay1
                            anchors.horizontalCenter: loginRec5.horizontalCenter

                            Text {
                                id: newUserText
                                text: "              New User?"
                                font.family: poppinsFontRegular.name
                                font.pointSize: 18
                            }

                            Text {
                                id: signUpText
                                text: "Sign Up"
                                color: "BLUE"
                                font.family: poppinsFontRegular.name
                                font.pointSize: 18
                            }

                            MouseArea {
                                anchors.fill: signUpText
                                onClicked:{
                                    stackView.push(signUpPageComponent)
                                }
                            }
                        }
                    }
                }
            }
        }

        // COMPONENT - SIGN UP PAGE
        Component {
            id: signUpPageComponent

            Rectangle {
                id: signRec1

                Image {
                    source: "qrc:/bg.png"
                    anchors.fill: parent
                    width: parent.width
                    height: parent.height
                }

                Rectangle {
                    id: signRec2
                    height: 906
                    width: 672
                    color: "#FFFFFF"
                    radius: 30
                    anchors.centerIn: parent

                    ColumnLayout {
                        id: signColLay1
                        width: parent.width
                        height: 0.8 * parent.height
                        spacing: 15
                        anchors.centerIn: parent

                        // Metrohm Logo
                        Image {
                            id: metrohmLogo
                            source: "qrc:/logo.png"
                            fillMode: Image.PreserveAspectFit
                            Layout.alignment: Qt.AlignCenter
                        }

                        // Sign Up Text
                        Text {
                            id: signUpText
                            text: "Sign Up"
                            font.family: poppinsFont.name
                            font.pointSize: 32
                            font.bold: true
                            Layout.alignment: Qt.AlignCenter
                        }

                        // Username Field
                        ColumnLayout {
                            spacing: 2
                            anchors.horizontalCenter: signUpText.horizontalCenter

                            Text {
                                id: usernameText
                                text: "Username"
                                font.family: poppinsFontRegular.name
                                font.pointSize: 12
                                anchors.left: signRec3.left
                            }

                            Rectangle {
                                id: signRec3
                                height: 72//0.05 * signColLay1.height
                                width: 481//0.7 * signColLay1.width
                                color: "#DEDEDE"
                                radius: 10
                                Layout.alignment: Qt.AlignCenter

                                TextField {
                                    id: username
                                    //placeholderText: "Username"
                                    anchors.fill: signRec3
                                    opacity: 0.5
                                    font.pointSize: 30
                                    font.family: poppinsFontRegular.name
                                }
                            }
                        }

                        // Password Field
                        ColumnLayout {
                            spacing: 2
                            anchors.horizontalCenter: signUpText.horizontalCenter
                            Text {
                                id: passwordText
                                text: "Password"
                                font.family: poppinsFontRegular.name
                                font.pointSize: 12
                                anchors.left: signRec4.left
                            }

                            Rectangle {
                                id: signRec4
                                height: 72//0.05 * signColLay1.height
                                width: 481//0.7 * signColLay1.width
                                color: "#DEDEDE"
                                radius: 10
                                Layout.alignment: Qt.AlignCenter

                                TextField {
                                    id: password
                                    //placeholderText: "Password"
                                    anchors.fill: signRec4
                                    opacity: 0.5
                                    font.pointSize: 30
                                    font.family: poppinsFontRegular.name
                                    echoMode: TextInput.Password
                                }
                            }
                        }

                        //Confirm Password Field
                        ColumnLayout {
                            spacing: 2
                            anchors.horizontalCenter: signUpText.horizontalCenter

                            Text {
                                id: confirmPasswordText
                                text: "Re-Enter Password"
                                font.family: poppinsFontRegular.name
                                font.pointSize: 12
                                anchors.left: signRec5.left
                            }

                            Rectangle {
                                id: signRec5
                                height: 72//0.05 * signColLay1.height
                                width: 481//0.7 * signColLay1.width
                                color: "#DEDEDE"
                                radius: 10
                                Layout.alignment: Qt.AlignCenter

                                TextField {
                                    id: confirmPassword
                                    //placeholderText: "Enter Password Again"
                                    anchors.fill: signRec5
                                    opacity: 0.5
                                    font.pointSize: 30
                                    font.family: poppinsFontRegular.name
                                    echoMode: TextInput.Password
                                }
                            }
                        }

                        // Sign Up Button
                        Rectangle {
                            id:signRec6
                            height: 66//1.5 * signRec4.height
                            width: 308//0.35 * signRec4.width
                            radius: 10
                            color: "#DEDEDE"
                            Layout.alignment: Qt.AlignCenter

                            Text {
                                text: "Sign Up"
                                font.family: poppinsFont.name
                                anchors.centerIn: signRec6
                                font.pointSize: 12
                            }

                            MouseArea {
                                anchors.fill: signRec6
                                onClicked: {

                                    // check if username already exists in csv
                                    // else call csv write api
                                    // check response and then proceed to login page
                                    signUpType.setSignUpProp(qsTr("True"))
                                    signUpType.signUpProp
                                    stackView.push(loginPageComponent)

                                    //csvRwType.addNewUser(username.text, password.text)
                                    csvRwType.setCsvRwProp(qsTr("True"))
                                    csvRwType.csvRwProp

                                    var usernameCheck = csvRwType.usernameUnique(username.text)
                                    var passMatchCheck = validType.checkPassword(password.text, confirmPassword.text)
                                    var passValidCheck = validType.validatePassword(password.text)

                                    if (usernameCheck === "Success! Username is unique") {
                                        if (passMatchCheck === "Welcome" && passValidCheck === "Password is valid") {
                                            msgBox.text = "Sign Up Successful! Redirecting to Login Page."
                                            msgBox.visible = true
                                            csvRwType.addNewUser(username.text, password.text)
                                            stackView.push(loginPageComponent)
                                        } else {
                                            if (passMatchCheck !== "Welcome") {
                                                msgBox.text = "Passwords don't match! Try Again."
                                                msgBox.visible = true
                                                stackView.push(signUpPageComponent)
                                            } else {
                                                msgBox.text = "Passwords is not valid! Try Again."
                                                msgBox.visible = true
                                                stackView.push(signUpPageComponent)
                                            }
                                        }
                                    } else {
                                        msgBox.text = "Username already exists!"
                                        msgBox.visible = true
                                        stackView.push(signUpPageComponent)
                                    }
                                }
                            }
                        }

                        MessageDialog {
                            id: msgBox
                            visible: false
                        }

                        // Cancel Button
                        Rectangle {
                            id:signRec7
                            height: 66//1.5 * signRec4.height
                            width: 308//0.35 * signRec4.width
                            radius: 10
                            color: "#DEDEDE"
                            Layout.alignment: Qt.AlignCenter

                            Text {
                                text: "Cancel"
                                font.family: poppinsFont.name
                                anchors.centerIn: signRec7
                                font.pointSize: 12
                            }

                            MouseArea {
                                anchors.fill: signRec7
                                onClicked: {
                                    stackView.push(loginPageComponent)
                                }
                            }
                        }
                    }
                }
            }
        }

        // COMPONENT - WELCOME PAGE
        Component {
            id: welcomePageComponent

            Rectangle {
                id: welRec1

                Image {
                    source: "qrc:/bg.png"
                    anchors.fill: parent
                    width: parent.width
                    height: parent.height
                }

                Rectangle {
                    id: welRec2
                    height: 800
                    width: 1324
                    color: "#FFFFFF"
                    radius: 30
                    anchors.centerIn: parent

                    RowLayout {
                        id: welRowLay1
                        height: 0.8 * parent.height
                        width: 0.8 * parent.width
                        spacing: 15
                        Layout.fillWidth: true
                        anchors.centerIn: parent

                        // Welcome Text and Human Image
                        ColumnLayout {
                            id: welColLay1
                            //width: parent.width
                            //height: 0.8 * parent.height
                            spacing: 15

                            Text {
                                id: welcomeText
                                text: "Welcome\n"
                                font.family: poppinsFont.name
                                font.pointSize: 18
                                font.bold: true
                                //Layout.alignment: Qt.AlignCenter
                            }

                            Image {
                                id: humanImage
                                source: "qrc:/human.png"
                                fillMode: Image.PreserveAspectFit
                                anchors.horizontalCenter: welColLay1.horizontalCenter

                            }
                        }

                        // Essay, change passwd and cancel buttons
                        Column {
                            id: welColLay2
                            //height: 30 * parent.height
                            //width: parent.width
                            spacing: 15

                            // Essay
                            Text {
                                id: essay
                                text: "Welcome to our page where\n login functionality has been\n implemented along with a\n change password feature.\n"
                                font.pointSize: 20
                                font.family: poppinsFontRegular.name
                                anchors.horizontalCenter: parent.horizontalCenter
                            }

                            // Log Out Button
                            Rectangle {
                                id:welRec3
                                height: 57//1.85 * welcomeText.height
                                width: 338//2 * welcomeText.width
                                radius: 10
                                color: "#DEDEDE"
                                anchors.horizontalCenter: essay.horizontalCenter

                                Text {
                                    text: "Log Out"
                                    font.family: poppinsFont.name
                                    anchors.centerIn: welRec3
                                    font.pointSize: 12
                                }

                                MouseArea {
                                    anchors.fill: welRec3
                                    onClicked: {
                                        stackView.push(loginPageComponent)
                                    }
                                }
                            }

                            // Change Password Button
                            Rectangle {
                                id:welRec4
                                height: 57//1.85 * welcomeText.height
                                width: 338//2 * welcomeText.width
                                radius: 10
                                color: "#DEDEDE"
                                anchors.horizontalCenter: essay.horizontalCenter

                                Text {
                                    text: "Change Password"
                                    font.family: poppinsFont.name
                                    anchors.centerIn: welRec4
                                    font.pointSize: 12
                                }

                                MouseArea {
                                    anchors.fill: welRec4
                                    onClicked: {
                                        stackView.push(changePasswordComponent)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        // COMPONENT - CHANGE PASSWORD
        Component {
            id: changePasswordComponent

            Rectangle {
                id: changeRec1

                Image {
                    source: "qrc:/bg.png"
                    anchors.fill: parent
                    width: parent.width
                    height: parent.height
                }

                Rectangle {
                    id: changeRec2
                    height: 906
                    width: 672
                    color: "#FFFFFF"
                    radius: 30
                    anchors.centerIn: parent

                    ColumnLayout {
                        id: changeColLay1
                        width: parent.width
                        height: 0.8 * parent.height
                        spacing: 15
                        anchors.centerIn: parent

//                        Image {
//                            id: metrohmLogo
//                            source: "qrc:/logo.png"
//                            fillMode: Image.PreserveAspectFit
//                            Layout.alignment: Qt.AlignCenter
//                        }

                        // Change Password Text
                        Text {
                            id: changeText
                            text: "Change Password"
                            font.family: poppinsFont.name
                            font.pointSize: 32
                            Layout.alignment: Qt.AlignCenter
                        }

                        // Username Field
                        ColumnLayout {
                            anchors.horizontalCenter: changeText.horizontalCenter

                            Text {
                                text: "Username"
                                font.family: poppinsFontRegular.name
                                font.pointSize: 12
                                anchors.left: changeRec3.left
                            }

                            Rectangle {
                                id: changeRec3
                                height: 54//0.05 * changeColLay1.height
                                width: 464//0.7 * changeColLay1.width
                                color: "#DEDEDE"
                                radius: 10
                                Layout.alignment: Qt.AlignCenter

                                TextField {
                                    id: username
                                    //placeholderText: "Username"
                                    anchors.fill: changeRec3
                                    opacity: 0.5
                                    font.pointSize: 20
                                    font.family: poppinsFontRegular.name
                                }
                            }
                        }

                        // Old Password Field
                        ColumnLayout {
                            anchors.horizontalCenter: changeText.horizontalCenter

                            Text {
                                text: "Existing Password"
                                font.family: poppinsFontRegular.name
                                font.pointSize: 12
                                anchors.left: changeRec4.left
                            }

                            Rectangle {
                                id: changeRec4
                                height: 54//0.05 * changeColLay1.height
                                width: 464//0.7 * changeColLay1.width
                                color: "#DEDEDE"
                                radius: 10
                                Layout.alignment: Qt.AlignCenter

                                TextField {
                                    id: oldPassword
                                    //placeholderText: "Existing Password"
                                    anchors.fill: changeRec4
                                    opacity: 0.5
                                    font.pointSize: 20
                                    font.family: poppinsFontRegular.name
                                    echoMode: TextInput.Password
                                }
                            }
                        }

                        // New Password Field
                        ColumnLayout {
                            anchors.horizontalCenter: changeText.horizontalCenter

                            Text {
                                text: "New Password"
                                font.family: poppinsFontRegular.name
                                font.pointSize: 12
                                anchors.left: changeRec5.left
                            }
                            Rectangle {
                                id: changeRec5
                                height: 54//0.05 * changeColLay1.height
                                width: 464//0.7 * changeColLay1.width
                                color: "#DEDEDE"
                                radius: 10
                                Layout.alignment: Qt.AlignCenter

                                TextField {
                                    id: newPassword
                                    //placeholderText: "New Password"
                                    anchors.fill: changeRec5
                                    opacity: 0.5
                                    font.pointSize: 20
                                    font.family: poppinsFontRegular.name
                                    echoMode: TextInput.Password
                                }
                            }
                        }

                        // Confirm Password Field
                        ColumnLayout {
                            anchors.horizontalCenter: changeText.horizontalCenter

                            Text {
                                text: "Confirm Password"
                                font.family: poppinsFontRegular.name
                                font.pointSize: 12
                                anchors.left: changeRec6.left
                            }

                            Rectangle {
                                id: changeRec6
                                height: 54//0.05 * changeColLay1.height
                                width: 464//0.7 * changeColLay1.width
                                color: "#DEDEDE"
                                radius: 10
                                Layout.alignment: Qt.AlignCenter

                                TextField {
                                    id: confirmNewPassword
                                    //placeholderText: "Re-Enter New Password"
                                    anchors.fill: changeRec6
                                    opacity: 0.5
                                    font.pointSize: 20
                                    font.family: poppinsFontRegular.name
                                    echoMode: TextInput.Password
                                }
                            }
                        }

                        // Change Password Button
                        Rectangle {
                            id: changeRec7
                            height: 57//1.5 * changeRec4.height
                            width: 337//0.35 * changeRec4.width
                            radius: 10
                            color: "#DEDEDE"
                            Layout.alignment: Qt.AlignCenter

                            Text {
                                text: "Change Password"
                                font.family: poppinsFont.name
                                anchors.centerIn: changeRec7
                                font.pointSize: 12
                            }

                            MouseArea {
                                anchors.fill: changeRec7
                                onClicked: {

                                    // check if user exists
                                    // update the csv file using the api
                                    // after response move to the login page

                                    chngPassType.setChngPassProp(qsTr("True"))
                                    chngPassType.chngPassProp
                                    //stackView.push(loginPageComponent)

                                    var usernameCheck = csvRwType.usernameUnique(username.text)
                                    var passMatchCheck = validType.checkPassword(newPassword.text, confirmNewPassword.text)
                                    var passValidCheck = validType.validatePassword(newPassword.text)

                                    if (usernameCheck === "Error! Username already exists") {
                                        if (passMatchCheck === "Welcome" && passValidCheck === "Password is valid") {
                                            msgBox.text = "Changed Password Successfully! Redirecting to Login Page."
                                            msgBox.visible = true
                                            csvRwType.changePassword(username.text, oldPassword.text, newPassword.text)
                                            stackView.push(loginPageComponent)
                                        } else {
                                            if (passMatchCheck !== "Welcome") {
                                                msgBox.text = "Passwords don't match! Try Again."
                                                msgBox.visible = true
                                                stackView.push(changePasswordComponent)
                                            } else {
                                                msgBox.text = "Passwords is not valid! Try Again."
                                                msgBox.visible = true
                                                stackView.push(changePasswordComponent)
                                            }
                                        }
                                    } else {
                                        msgBox.text = "Username doesn't exist! Moving to Sign Up Page."
                                        msgBox.visible = true
                                        stackView.push(signUpPageComponent)
                                    }
                                }
                            }
                        }

                        MessageDialog {
                            id: msgBox
                            visible: false
                        }

                        // Cancel Button
                        Rectangle {
                            id: changeRec8
                            height: 57//1.5 * changeRec4.height
                            width: 337//0.35 * changeRec4.width
                            radius: 10
                            color: "#DEDEDE"
                            Layout.alignment: Qt.AlignCenter

                            Text {
                                text: "Cancel"
                                font.family: poppinsFont.name
                                anchors.centerIn: changeRec8
                                font.pointSize: 12
                            }

                            MouseArea {
                                anchors.fill: changeRec8
                                onClicked: {
                                    stackView.push(loginPageComponent)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

