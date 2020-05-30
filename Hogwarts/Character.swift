import Foundation
import SQLite3

struct Character: Codable {
    let name: String
    let image: String
}

//class CharacterManager {
//    var database: OpaquePointer!
//
//    static let main = CharacterManager()
//
//    private init() {
//    }
//
//    func connect() {
//        if database != nil {
//            return
//        }
//        do {
//            let databaseURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("characters.sqlite3")
//            if sqlite3_open(databaseURL.path, &database) == SQLITE_OK {
//                if sqlite3_exec(database, "CREATE TABLE IF NOT EXISTS characters (name TEXT, image TEXT)", nil, nil, nil) == SQLITE_OK {
//
//                } else {
//                    print("Could not create table")
//                }
//            } else {
//                print("Could not connect")
//            }
//        }
//        catch let error {
//            print("Could not create database", error)
//        }
//    }
//
//    func favorite(character: Character) -> Int {
//        connect()
//
//        var statement: OpaquePointer!
//        if sqlite3_prepare_v2(database, "INSERT INTO characters (name, image) VALUES (?, ?)", -1, &statement, nil) != SQLITE_OK {
//            print("Could not create query")
//            return -1
//        }
//        sqlite3_bind_text(statement, 1, NSString(string: character.name).utf8String, -1, nil)
//        sqlite3_bind_text(statement, 2, NSString(string: character.image).utf8String, -1, nil)
//        
//        if sqlite3_step(statement)  != SQLITE_DONE {
//            print("Could not insert character")
//            return -1
//        }
//
//        sqlite3_finalize(statement)
//        return Int(sqlite3_last_insert_rowid(database))
//    }
//
//    func getAllCharacters() -> [Character] {
//        connect()
//        var result: [Character] = []
//
//        var statement: OpaquePointer!
//        if sqlite3_prepare_v2(database, "SELECT name, image FROM characters", -1, &statement, nil) != SQLITE_OK {
//            print("Error creating select")
//            return []
//        }
//
//        while sqlite3_step(statement) == SQLITE_ROW {
//            result.append(Character(
//                name: String(cString: sqlite3_column_text(statement, 0)),
//                image: String(cString: sqlite3_column_text(statement, 1))))
//        }
//
//        sqlite3_finalize(statement)
//        return result
//    }
//
//    func delete(character: Character) {
//        connect()
//
//        var statement: OpaquePointer!
//        if sqlite3_prepare_v2(database, "DELETE FROM characters WHERE name = ?", -1, &statement, nil) != SQLITE_OK {
//            print("Could not create delete statement")
//        }
//
//        sqlite3_bind_text(statement, 1, NSString(string: character.name).utf8String, -1, nil)
//
//        if sqlite3_step(statement)  != SQLITE_DONE {
//            print("Could not delete character")
//        }
//
//        sqlite3_finalize(statement)
//    }
//
//    func deleteAllCharacters() {
//        connect()
//
//        var statement: OpaquePointer!
//        if sqlite3_prepare_v2(database, "DELETE FROM characters", -1, &statement, nil) != SQLITE_OK {
//            print("Could not create delete statement")
//        }
//
//        if sqlite3_step(statement)  != SQLITE_DONE {
//            print("Could not delete characters")
//        }
//
//        sqlite3_finalize(statement)
//    }
//}
