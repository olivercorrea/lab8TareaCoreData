import UIKit

class ViewControllerCrearCurso: UIViewController {

    @IBOutlet weak var txtNombreCurso: UITextField!
    @IBOutlet weak var txtPromedioLab: UITextField!
    @IBOutlet weak var txtPromedioPrac: UITextField!
    @IBOutlet weak var txtExamenFinal: UITextField!
    
    var anteriorVC = ViewController()
    
    @IBAction func agregarCurso(_ sender: Any) {
        // Crear una instancia de Curso
        let curso = Cursos()
        
        // Asignar los valores del formulario a la instancia de Curso
        if let nombreCurso = txtNombreCurso.text {
            curso.nombreCurso = nombreCurso
        }
        
        if let promedioLabText = txtPromedioLab.text,
           let promedioLab = Double(promedioLabText) {
            curso.promedioLab = promedioLab
        }
        
        if let promedioPracText = txtPromedioPrac.text,
           let promedioPrac = Double(promedioPracText) {
            curso.promedioPrac = promedioPrac
        }
        
        if let examenFinalText = txtExamenFinal.text,
           let examenFinal = Double(examenFinalText) {
            curso.examenFinal = examenFinal
        }
        anteriorVC.cursos.append(curso)
        anteriorVC.tableview.reloadData()
        navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
