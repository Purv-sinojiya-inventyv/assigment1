//
//  SignupViewController.swift
//  Assignment_1
//
//  Created by Purv Sinojiya on 25/02/25.
//

import UIKit
import SQLite3

class SignupViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!

   

    @IBOutlet weak var dateOfBirthPicker: UIDatePicker!
    @IBOutlet weak var heightPicker: UIPickerView!
    
    @IBOutlet weak var saveButton: UIButton!

    var selectedGender: String = "Not Specified" // Default value
    var heightOptions = ["4.5 ft", "5.0 ft", "5.5 ft", "6.0 ft", "6.5 ft"]
    var selectedHeight: String = "5.0 ft" // Default height

    var db: OpaquePointer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        heightPicker.delegate = self
        heightPicker.dataSource = self

        setupDatabase()
    }

    // MARK: - Gender Selection
  
    // MARK: - Save Data to SQLite
    @IBAction func signupButtonTapped(_ sender: UIButton) {
        guard let firstName = firstNameField.text, !firstName.isEmpty,
              let lastName = lastNameField.text, !lastName.isEmpty else {
            print("❌ Please enter all fields")
            return
        }

        let dateOfBirth = formatDate(dateOfBirthPicker.date)

        insertData(firstName: firstName, lastName: lastName, gender: selectedGender, dob: dateOfBirth, height: selectedHeight)
    }

    // MARK: - SQLite Database Setup
    func setupDatabase() {
        let fileURL = try! FileManager.default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("UserDatabase.sqlite")

        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("❌ Error opening database")
        }

        let createTableQuery = """
        CREATE TABLE IF NOT EXISTS Users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            firstName TEXT NOT NULL,
            lastName TEXT NOT NULL,
            gender TEXT DEFAULT 'Not Specified',
            dob TEXT NOT NULL,
            height TEXT NOT NULL
        );
        """

        if sqlite3_exec(db, createTableQuery, nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db))
            print("❌ Error creating table: \(errmsg)")
        }
    }

    // MARK: - Insert Data
    func insertData(firstName: String, lastName: String, gender: String, dob: String, height: String) {
        let insertQuery = "INSERT INTO Users (firstName, lastName, gender, dob, height) VALUES (?, ?, ?, ?, ?);"
        var statement: OpaquePointer?

        if sqlite3_prepare_v2(db, insertQuery, -1, &statement, nil) == SQLITE_OK {
            sqlite3_bind_text(statement, 1, (firstName as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 2, (lastName as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 3, (gender as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 4, (dob as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 5, (height as NSString).utf8String, -1, nil)

            if sqlite3_step(statement) == SQLITE_DONE {
                print("✅ User registered successfully!")
            } else {
                let errmsg = String(cString: sqlite3_errmsg(db))
                print("❌ Failed to insert data: \(errmsg)")
            }
        }

        sqlite3_finalize(statement)
    }

    // MARK: - Date Formatting
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        return formatter.string(from: date)
    }

    // MARK: - Picker View (Height Selection)
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return heightOptions.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return heightOptions[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedHeight = heightOptions[row]
    }
}
