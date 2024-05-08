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
        
        // Configurar el texto del nombre del curso
        cell.textLabel?.text = curso.nombreCurso
        
        // Calcular el promedio total
        let promedioTotal = (curso.promedioLab + curso.promedioPrac + curso.examenFinal) / 3.0
        
        // Establecer el color de fondo de la celda basado en el promedio total
        if promedioTotal > 14 {
            cell.backgroundColor = UIColor.green
            // Emoji de felicidad
            cell.textLabel?.text?.append(" 😀")
        } else {
            cell.backgroundColor = UIColor.red
            // Emoji de tristeza
            cell.textLabel?.text?.append(" 😞")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Eliminar el curso del arreglo de cursos
            cursos.remove(at: indexPath.row)
            
            // Eliminar la fila de la tabla
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let siguienteVC = segue.destination as! ViewControllerCrearCurso
        siguienteVC.anteriorVC = self
    }
     
    func crearCursos() -> [Cursos] {
        let curso1 = Cursos()
        curso1.nombreCurso = "Programacion Web"
        curso1.promedioLab = 11.0
        curso1.promedioPrac = 11.0
        curso1.examenFinal = 11.0
        
        let curso2 = Cursos()
        curso2.nombreCurso = "Programacion Moviles"
        curso2.promedioLab = 15.0
        curso2.promedioPrac = 11.0
        curso2.examenFinal = 17.0
        
        let curso3 = Cursos()
        curso3.nombreCurso = "Bases de Datos Avanzados"
        curso3.promedioLab = 15.0
        curso3.promedioPrac = 11.0
        curso3.examenFinal = 17.0
        
        return [curso1,curso2,curso3]
    }
}
