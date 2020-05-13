//
//  ViewController.swift
//  FirebaseConfiguracao
//
//  Created by Victor Rodrigues Novais on 12/05/20.
//  Copyright © 2020 Victoriano. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var textoLabel: UILabel!
    
    let firebase = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        do {
//            try Auth.auth().signOut()
//        } catch {
//            print("Erro ao deslogar o usuário")
//        }
        
        Auth.auth().signIn(withEmail: "victor@gmail.com", password: "vic123456") { (User, error) in
            if error == nil {
                print("Sucesso ao logar o usuário")
            } else {
                print("Erro ao logar usuário: \(String(describing: error?.localizedDescription))")
            }
        }
        
        Auth.auth().addStateDidChangeListener { (Auth, User) in
            if let usuarioLogado = User {
                print("Usuario está logado \(String(usuarioLogado.email!))")
            } else {
                print("Usuario não está logado")
            }
         }
        

        // Criar usuario no Firebase Auth
//        Auth.auth().createUser(withEmail: "victor@gmail.com", password: "vic123456") { (user, error) in
//
//            if error == nil { //sucesso
//                print("Sucesso ao cadastrar usuario!")
//            } else { // erro
//                print("Erro ao cadastrar usuario: \(String(describing: error?.localizedDescription))")
//            }
//
//        }

//        Auth.auth().addStateDidChangeListener { (Auth, User) in
//            if let usuarioLogado = User {
//                print("Usuario está logado \(String(usuarioLogado.email!))")
//            } else {
//                print("Usuario não está logado")
//            }
//        }
        
        
//
//        // Adiciona no Firebase Databae Realtime
//
//        let pontuacao = firebase.child("pontuacao").child("valor")
////        pontuacao.child("valor").setValue("200")
//
//        // Remove valores do Firebase Database Realtime
//        //pontuacao.removeValue()
//
//        // Recupera os dados do Firebase Database Realtime
//        pontuacao.observe(DataEventType.value, with: {(dados) in
//            let ponto = dados.value as? String
//            self.textoLabel.text = ponto
//
//        })
    }


}

