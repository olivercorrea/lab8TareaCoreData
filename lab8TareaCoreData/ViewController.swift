//
//  ViewController.swift
//  lab8TareaCoreData
//
//  Created by oliver1 on 8/05/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    var cursos:[Curso] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func crearCursos() -> [Curso] {
        let curso1 = Curso()
        curso1.nombreCurso = "Matematica1"
        curso1.promedioPracticas = 10
        curso1.promedioLaboratorios = 12
        curso1.examenFinal = 25
            
        let curso2 = Curso()
        curso2.nombreCurso = "Matematica1"
        curso2.promedioPracticas = 10
        curso2.promedioLaboratorios = 12
        curso2.examenFinal = 25
        
        let curso3 = Curso()
        curso2.nombreCurso = "Matematica1"
        curso2.promedioPracticas = 10
        curso2.promedioLaboratorios = 12
        curso2.examenFinal = 25
            
        return [curso1, curso2, curso3]
    }
}

