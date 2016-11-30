//
//  ViewController.swift
//  MobiCloud
//
//  Created by Noopur Virmani on 18/11/16.
//  Copyright © 2016 Noopur Virmani. All rights reserved.
//


import UIKit

class ViewController: BaseViewController, UITextFieldDelegate, LoginTVCellDelegate {
    
    @IBOutlet var tableView: UITableView!
    var loginPressed: Bool = false
    
    var usernameTF: UITextField?
    var passwordTF: UITextField?
    
    var emailTF: UITextField?
    var mobileNoTF: UITextField?
    
    let PWD_PLACEHOLDER = "*Password"
    let EMAIL_PLACEHOLDER = "*Email"
    let USERNAME_PLACEHOLDER = "*Username"
    let USERNAME_EMAIL_PLACEHOLDER = "*Username"
    let MOBILE_NO_PLACEHOLDER = "Mobile No.(optional)"
    
    let I2FA_URL = "https://mobile.appspicket.com/module.php/extendtwofactorauthentication/ipragsaml.php";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTapGestureToView()
        AuthService.setServiceUrl(I2FA_URL)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showKeyboardNotification()
        self.tableView.isScrollEnabled = false
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: Tableview Datasource and Delegate
    
    func tableView(_ tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) ->
        CGFloat {
            if(indexPath.row == 0){
                return 270
            }else{
                return 55
            }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(loginPressed == true){
            return 4
        }else{
            return 6
        }
        
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0){
            let cell =  tableView.dequeueReusableCell(withIdentifier: "LoginTVCell") as! LoginTVCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.delegate = self
            if(loginPressed == true){
                cell.segmentControl.selectedSegmentIndex = 1
            }else{
                cell.segmentControl.selectedSegmentIndex = 0
            }
            return cell
            
        }else if (indexPath.row == 1){
            var placeholder = ""
            if(loginPressed == true){
                placeholder = USERNAME_EMAIL_PLACEHOLDER
            }else{
                placeholder = USERNAME_PLACEHOLDER
            }
            let cell = textFieldTVCell(tableView, indexPath: indexPath, placeHolder: placeholder)
            self.usernameTF = cell.textField
            return cell
            
        }else if (indexPath.row == 2){
            let cell = textFieldTVCell(tableView, indexPath: indexPath, placeHolder: PWD_PLACEHOLDER)
            self.passwordTF = cell.textField
            return cell
            
        }else{
            if(loginPressed == true){
                return submitBtnTVCell(tableView, indexPath: indexPath, buttonTitle: "Login")
                
            }else{
                
                if(indexPath.row == 3){
                    let cell = textFieldTVCell(tableView, indexPath: indexPath, placeHolder: EMAIL_PLACEHOLDER)
                    self.emailTF = cell.textField
                    return cell
                    
                }else if(indexPath.row == 4){
                    let cell = textFieldTVCell(tableView, indexPath: indexPath, placeHolder: MOBILE_NO_PLACEHOLDER)
                    self.mobileNoTF = cell.textField
                    return cell
                    
                }else{
                    
                    return submitBtnTVCell(tableView, indexPath: indexPath, buttonTitle: "Signup")
                    
                }
                
                
                
            }
            
        }
        
        
        
    }
    
    
    
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        dismiss(animated: true, completion: nil)
        
    }
    
    
    func textFieldTVCell(_ tableView: UITableView,indexPath: IndexPath, placeHolder: String?) -> TextFieldTVCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextFieldTVCell") as! TextFieldTVCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.textField.delegate = self
        cell.textField.clearButtonMode = UITextFieldViewMode.always
        
        cell.textField.placeholder = placeHolder
        
        if(placeHolder == PWD_PLACEHOLDER){
            cell.textField.isSecureTextEntry = true
        }else{
            cell.textField.isSecureTextEntry = false
        }
        
        if(placeHolder == EMAIL_PLACEHOLDER || placeHolder == USERNAME_EMAIL_PLACEHOLDER){
            cell.textField.keyboardType = UIKeyboardType.emailAddress
        }else if(placeHolder == MOBILE_NO_PLACEHOLDER){
            cell.textField.keyboardType = UIKeyboardType.phonePad
        }else{
            cell.textField.keyboardType = UIKeyboardType.default
        }
        
        return cell
        
    }
    
    
    func submitBtnTVCell(_ tableView: UITableView, indexPath: IndexPath, buttonTitle: String) -> LoginTVCell{
        let cell =  tableView.dequeueReusableCell(withIdentifier: "SubmitTVCell") as! LoginTVCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.delegate = self
        cell.submitBtn.setTitle(buttonTitle, for: UIControlState.normal)
        return cell
        
    }
    
    
    
    //MARK: Service Methods
    
    func authValidations() -> String{
        if(usernameTF?.text == ""){
            return "Username is mandatory"
        }
        
        if(passwordTF?.text == ""){
            return "Password is mandatory"
        }
        
        if(passwordTF?.text != "" && (passwordTF?.text?.characters.count)! < 6){
            return "Password should be atleast of 6 characters"
        }
        
        if(loginPressed == false && emailTF?.text == ""){
            return "Email is mandatory"
        }
        
        
        if(loginPressed == false &&
            (mobileNoTF?.text?.characters.count)! > 0 && (mobileNoTF?.text?.characters.count)! != 10){
            return "Please enter valid 10 digit mobile number"
        }
        
        
        
        
        if(loginPressed == false && Global.isValidEmail(string: emailTF?.text) == false){
            return "Email id is not valid"
        }
        
        return ""
    }
    
    
    func authMethod(){
        if(authValidations() == ""){
            if(loginPressed == true){
                showLoadingDialog(loadingText: "")
                loginUserServiceCalled()
            }else{
                signupRegisterUserServiceCalled()
            }
        }else{
            showAlert(message: authValidations())
        }
    }
    
    
    
    
    //MARK: LoginTVCellDelegate Method
    
    
    func submitBtnClickedDelegateMethod(){
        authMethod()
    }
    
    
    func segmentcontrolMethodClicked(segmentControl: UISegmentedControl){
        if(segmentControl.selectedSegmentIndex == 0){
            loginPressed = false
        }else{
            loginPressed = true
        }
        self.tableView.reloadData()
    }
    
    
    
    //MARK: UITextField Delegate Method
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
        
    }
    
    
    //MARK: Keyboard show hide method
    
    func showKeyboardNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    
    
    
    func keyboardWillShow(_ notification: NSNotification) {
        if let userInfo = notification.userInfo {
            if let keyboardSize =  (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                //keyboardSize.height+40
                let contentInsetsL = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height, 0.0)
                self.tableView.contentInset = contentInsetsL
                //self.tableView.contentOffset = CGPoint(x: 0, y: 125)
                self.tableView.scrollIndicatorInsets = contentInsetsL
                self.tableView.isScrollEnabled = true
                
            }
        }
    }
    
    func keyboardWillHide(_ notification: NSNotification) {
        self.tableView.contentInset = UIEdgeInsets.zero
        self.tableView.scrollIndicatorInsets = UIEdgeInsets.zero
        self.tableView.isScrollEnabled = false
        
    }
    
    
    //MARK: Methods
    
    func showOTPAlert(){
        var alertTextField: UITextField?
        let alert = UIAlertController(title: "", message: "Please enter your otp", preferredStyle: UIAlertControllerStyle.alert)
        alert.addTextField{ textField -> Void in
            textField.placeholder = "OTP"
            textField.font = UIFont.systemFont(ofSize: Color.font_size)
            
            alertTextField = textField
            
            // you can use this text field
            //inputTextField = textField
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        
        alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
            self.otpSubmitServiceCalled(otpL: alertTextField?.text)
            
        }))
        
        self.present(alert, animated: true, completion: {
            //    println("completion block")
        })
    }
    
    
    
    //MARK: Service Methods
    
    //MARK: Signup Step 1
    
    func signupRegisterUserServiceCalled(){
        DismissKeyboard()
        
        showLoadingDialog(loadingText: "")
        
        AuthService.signup(emailTF?.text, username: usernameTF?.text, password: passwordTF?.text, mobileNo: mobileNoTF?.text,
            errorBlock:{ (errorcode ,message) -> Void in
            
                    self.hideLoadingDialog()
                    self.showAlert(message: message!)
            
            },
            responseBlock:{ (response) -> Void in
                self.hideLoadingDialog()
                self.showOTPAlert()
        })
        
    }
    
    
    //MARK: Signup Step 2
    
    func otpSubmitServiceCalled(otpL: String?){
        DismissKeyboard()
        
        showLoadingDialog(loadingText: "")
        
        AuthService.signupOtp(otpL,
                              errorBlock:{ (errorcode, message) -> Void in
                                
                                self.hideLoadingDialog()
                                self.showAlert(message: message!)
                                
            },
                              responseBlock:{ (response) -> Void in
                                self.hideLoadingDialog()
                                self.mainViewControllerCalled()
        })
    }
    
    
    //MARK: Login Step 1
    
    func loginUserServiceCalled(){
        DismissKeyboard()
        
        AuthService.login(usernameTF?.text ,
                          password: passwordTF?.text,
                          errorBlock:{ (errorcode, message) -> Void in
                            
                            self.hideLoadingDialog()
                            self.showAlert(message: message!)
                           
                          },
                          responseBlock:{ (response) -> Void in
                            if(response?.status == true){}
                                self.hideLoadingDialog()
                               self.mainViewControllerCalled()
                          })
        
    }
    
}

