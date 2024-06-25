//
//  ViewController.swift
//  lab8TareaCoreData
//
//  Created by oliver1 on 8/05/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableview: UITableView!
    
    var cursos:[Cursos] = []
    
    @IBAction func agregarTarea(_ sender: Any) {
        performSegue(withIdentifier: "agregarSegue", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        
        cursos = crearCursos()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cursos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let curso = cursos[indexPath.row]
        
        cell.textLabel?.text = curso.nombreCurso
        
        let promedioTotal = (curso.promedioLab + curso.promedioPrac + curso.examenFinal) / 3.0
        
        if promedioTotal > 14 {
            cell.backgroundColor = UIColor.green
            cell.textLabel?.text?.append(" 😀")
        } else {
            cell.backgroundColor = UIColor.red
            cell.textLabel?.text?.append(" 😞")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            cursos.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let siguienteVC = segue.destination as! ViewControllerCrearCurso
        siguienteVC.anteriorVC = self
    }
     
    func crearCursos() -> [Cursos] {
        let curso1 = Cursos()
        curso1.nombreCurso = "Base de Datos"
        curso1.promedioLab = 20.0
        curso1.promedioPrac = 20.0
        curso1.examenFinal = 20.0
        
        let curso2 = Cursos()
        curso2.nombreCurso = "Desarrollo de Aplicaciones Web"
        curso2.promedioLab = 18.0
        curso2.promedioPrac = 11.0
        curso2.examenFinal = 17.0
        
        let curso3 = Cursos()
        curso3.nombreCurso = "Programacion en moviles Avanzado"
        curso3.promedioLab = 15.0
        curso3.promedioPrac = 13.0
        curso3.examenFinal = 17.0
        
        return [curso1,curso2,curso3]
    }
}
