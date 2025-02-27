//
//  sqlite.swift
//  Assigment_1
//
//  Created by Purv Sinojiya on 27/02/25.
//

import SQLite3
import Foundation

final class DatabaseHelper {
    private var db: OpaquePointer?
    static let shared = DatabaseHelper()

    private init() {
        openDatabase()
    }

    func openDatabase() {
        let fileManager = FileManager.default
        let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        let dbPath = documentsDirectory.appendingPathComponent("hmBetaLogin.sqlite").path

        if sqlite3_open(dbPath, &db) == SQLITE_OK {
            print("Successfully opened database at \(dbPath)")
            createTable()
        } else {
            print("Failed to open database")
        }
    }

    func createTable() {
        let createTableQuery = """
        CREATE TABLE IF NOT EXISTS Users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            first_name TEXT,
            last_name TEXT,
            gender TEXT,
            date_of_birth TEXT,
            height REAL
        );
        """

        var statement: OpaquePointer?

        if sqlite3_prepare_v2(db, createTableQuery, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Table created successfully")
            } else {
                print("Failed to create table")
            }
        } else {
            print("Failed to prepare table creation statement")
        }

        sqlite3_finalize(statement)
    }
    
    func insertUser(firstName: String, lastName: String, gender: String, dateOfBirth: String, height: Double) -> Bool {
        let insertQuery = "INSERT INTO Users (first_name, last_name, gender, date_of_birth, height) VALUES (?, ?, ?, ?, ?);"
        
        var statement: OpaquePointer?
        var success: Bool = false

        if sqlite3_prepare_v2(db, insertQuery, -1, &statement, nil) == SQLITE_OK {
            let firstNameCString = firstName.cString(using: .utf8)
            let lastNameCString = lastName.cString(using: .utf8)
            let genderCString = gender.cString(using: .utf8)
            let dobCString = dateOfBirth.cString(using: .utf8)
            
            sqlite3_bind_text(statement, 1, firstNameCString, -1, nil)
            sqlite3_bind_text(statement, 2, lastNameCString, -1, nil)
            sqlite3_bind_text(statement, 3, genderCString, -1, nil)
            sqlite3_bind_text(statement, 4, dobCString, -1, nil)
            sqlite3_bind_double(statement, 5, height)

            if sqlite3_step(statement) == SQLITE_DONE {
              
                success = true
            } else {
                print("Failed to insert user")
            }
        } else {
            print("Failed to prepare statement")
        }
        
        sqlite3_finalize(statement)
        return success
    }
    
    func fetchAllUsers() {
        let query = "SELECT * FROM Users;"
        var statement: OpaquePointer?

        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            while sqlite3_step(statement) == SQLITE_ROW {
                let id = sqlite3_column_int(statement, 0)
                let firstName = String(cString: sqlite3_column_text(statement, 1))
                let lastName = String(cString: sqlite3_column_text(statement, 2))
                let gender = String(cString: sqlite3_column_text(statement, 3))
                let dob = String(cString: sqlite3_column_text(statement, 4))
                let height = sqlite3_column_double(statement, 5)

                print("ID: \(id),Name: \(firstName) \(lastName),Gender: \(gender),DOB: \(dob),Height: \(height)")
            }
        } else {
            print("Failed to fetch users")
        }

        sqlite3_finalize(statement)
    }

    
}
