//
//  GraphQL.swift
//  CalCoin
//
//  Created by Andrew Kruszka on 4/6/24.
//

import Foundation

struct GraphQL {
    static let getAllCoins = """
    query getAllCoints {
      coin {
        created_at
        id
        name
        updated_at
      }
    }
    """

    static let createCoin = """
    mutation CreateCoin($name: String = "hello") {
      insert_coin(objects: {name: $name}) {
        affected_rows
      }
    }
    """
    static let updateUser = """
    mutation UpdateUser($id: Int!, $name: String, $email: String) {
        update_users_by_pk(pk_columns: {id: $id}, _set: {name: $name, email: $email}) {
            id
            name
            email
        }
    }
    """
    static let deleteUser = """
    mutation DeleteUser($id: Int!) {
        delete_users_by_pk(id: $id) {
            id
            name
            email
        }
    }
    """
}
