
//
//  ViewController.swift
//  MathApp-IOS
//
//  Created by ahmha02 on 2016-10-01.
//  Copyright © 2016 Haroon Ahmed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Define Properties
    @IBOutlet weak var hostTextField: UITextField!
    @IBOutlet weak var portTextField: UITextField!
    @IBOutlet weak var value1TextField: UITextField!
    @IBOutlet weak var value2TextField: UITextField!
    @IBOutlet weak var resultTextField: UITextField!
    @IBOutlet weak var operationSegmentControl: UISegmentedControl!
    
    //iniitialize variables
    var host = "localhost"
    var port = "8080"
    var operation: String = "add"
    var urlString: String = "unknown"
    
    
    @IBAction func operationButton(_ sender: AnyObject) {
        
        //get port and host
        host = hostTextField.text!
        port = portTextField.text!
        
        //get operation and values
        let value1String = value1TextField.text!
        let value2String = value2TextField.text!
        let index = operationSegmentControl.selectedSegmentIndex
        
        if index == 0 {
            operation = "add"
            urlString = "http://\(host):\(port)/MathProxy/rest/hello/math?operation=\(operation)&value1=\(value1String)&value2=\(value2String)"
            executeGetAdd()
        } else if index == 1 {
            operation = "subtract"
            urlString = "http://\(host):\(port)/MathProxy/rest/hello/math?operation=\(operation)&value1=\(value1String)&value2=\(value2String)"
            executeGetSubtract()
        } else if index == 2 {
            operation = "multiply"
            urlString = "http://\(host):\(port)/MathProxy/rest/hello/math?operation=\(operation)&value1=\(value1String)&value2=\(value2String)"
            executeGetMultiply()
        } else if index == 3 {
            operation = "divide"
            urlString = "http://\(host):\(port)/MathProxy/rest/hello/math?operation=\(operation)&value1=\(value1String)&value2=\(value2String)"
            executeGetDivide()
        } else if index == 4 {
            operation = "error"
            urlString = "http://\(host):\(port)/MathProxy/rest/hello/math?operation=\(operation)&value1=\(value1String)&value2=\(value2String)"
            executeGetError()
        } else if index == 5 {
            operation = "crash"
            fatalError()
            
        } else {
            operation = "error"
        }
        
        print("*** URL2 is: \(urlString)")
        
    }
    
    
    // This makes the GET call to httpbin.org. It simply gets the IP address and displays it on the screen.
    func executeGet() {
        let config = URLSessionConfiguration.default // Session Configuration
        let session = URLSession(configuration: config) // Load configuration into Session
        let url = URL(string: urlString)!
        
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            
            if error != nil {
                
                print(error!.localizedDescription)
                
            } else {
                
                do {
                    
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any]
                    {
                        
                        //Implement your logic
                        print(json)
                    }
                    
                } catch {
                    
                    print("error in JSONSerialization")
                    
                }
                
                
            }
            
        })
        task.resume()
    }
    
    
    
    // This makes the GET call to httpbin.org. It simply gets the IP address and displays it on the screen.
    func executeGetAdd() {
        
        // start AXA transaction
        CAMDOReporter.startApplicationTransaction(withName: "Add", service: "MathApp") { (YES, nil) in
            print("Add Started")
        }
        
        let config = URLSessionConfiguration.default // Session Configuration
        let session = URLSession(configuration: config) // Load configuration into Session
        let url = URL(string: urlString)!
        
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            
            if error != nil {
                
                print(error!.localizedDescription)
                
            } else {
                
                do {
                    
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any]
                    {
                        
                        //Implement your logic
                        print(json)
                    }
                    
                } catch {
                    
                    print("error in JSONSerialization")
                    
                }
                
            }
            
            // Stop AXA transaction
            CAMDOReporter.stopApplicationTransaction(withName: "Add", completionHandler: { (YES, nil) in
                print("Add Stopped")
            })
        })
        task.resume()
    }
    
    // This makes the GET call to httpbin.org. It simply gets the IP address and displays it on the screen.
    func executeGetSubtract() {
        
        // start AXA transaction
        CAMDOReporter.startApplicationTransaction(withName: "Subtract", service: "MathApp") { (YES, nil) in
            print("Subtract Started")
        }
        
        let config = URLSessionConfiguration.default // Session Configuration
        let session = URLSession(configuration: config) // Load configuration into Session
        let url = URL(string: urlString)!
        
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            
            if error != nil {
                
                print(error!.localizedDescription)
                
            } else {
                
                do {
                    
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any]
                    {
                        
                        //Implement your logic
                        print(json)
                    }
                    
                } catch {
                    
                    print("error in JSONSerialization")
                    
                }
                
                
            }
            
            // Stop AXA transaction
            CAMDOReporter.stopApplicationTransaction(withName: "Subtract", completionHandler: { (YES, nil) in
                print("Subtract Stopped")
            })
            
        })
        task.resume()
    }
    // This makes the GET call to httpbin.org. It simply gets the IP address and displays it on the screen.
    func executeGetMultiply() {
        
        // start AXA transaction
        CAMDOReporter.startApplicationTransaction(withName: "Multiply", service: "MathApp") { (YES, nil) in
            print("Multiply Started")
        }
        
        let config = URLSessionConfiguration.default // Session Configuration
        let session = URLSession(configuration: config) // Load configuration into Session
        let url = URL(string: urlString)!
        
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            
            if error != nil {
                
                print(error!.localizedDescription)
                
            } else {
                
                do {
                    
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any]
                    {
                        
                        //Implement your logic
                        print(json)
                    }
                    
                } catch {
                    
                    print("error in JSONSerialization")
                    
                }
                
                
            }
            // Stop AXA transaction
            CAMDOReporter.stopApplicationTransaction(withName: "Multiply", completionHandler: { (YES, nil) in
                print("Multiply Stopped")
            })
            
        })
        task.resume()
    }
    // This makes the GET call to httpbin.org. It simply gets the IP address and displays it on the screen.
    func executeGetDivide() {
        
        // start AXA transaction
        CAMDOReporter.startApplicationTransaction(withName: "Divide", service: "MathApp") { (YES, nil) in
            print("Divide Started")
        }
        
        let config = URLSessionConfiguration.default // Session Configuration
        let session = URLSession(configuration: config) // Load configuration into Session
        let url = URL(string: urlString)!
        
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            
            if error != nil {
                
                print(error!.localizedDescription)
                
            } else {
                
                do {
                    
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any]
                    {
                        
                        //Implement your logic
                        print(json)
                    }
                    
                } catch {
                    
                    print("error in JSONSerialization")
                    
                }
                
                
            }
            
            // Stop AXA transaction
            CAMDOReporter.stopApplicationTransaction(withName: "Divide", completionHandler: { (YES, nil) in
                print("Divide Stopped")
            })
            
        })
        task.resume()
    }
    
    func executeGetError() {
        
        // start AXA transaction
        CAMDOReporter.startApplicationTransaction(withName: "Divide", service: "MathApp") { (YES, nil) in
            print("Divide Started")
        }
        
        let config = URLSessionConfiguration.default // Session Configuration
        let session = URLSession(configuration: config) // Load configuration into Session
        let url = URL(string: urlString)!
        
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            
            if error != nil {
                
                print(error!.localizedDescription)
                
            } else {
                
                do {
                    
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any]
                    {
                        
                        //Implement your logic
                        print(json)
                    }
                    
                } catch {
                    
                    print("error in JSONSerialization")
                    
                }
                
                
            }
            
            // Stop AXA transaction
            CAMDOReporter.stopApplicationTransaction(withName: "Divide", completionHandler: { (YES, nil) in
                print("Divide Stopped")
            })
            
        })
        task.resume()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

