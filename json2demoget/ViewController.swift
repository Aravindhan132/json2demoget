 
 import UIKit
 struct jsonstruct:Decodable {
    let name:String
    let capital:String
    let alpha2Code:String
    let alpha3Code:String
    let region:String
    let population:Int
 }
 
 class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableview1 : UITableView!
    
    @IBOutlet var tableview: UITableView!
    
    
    var arrdata = [jsonstruct]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        
        
        getdata()
    }
    func getdata() {
        let url = URL(string: "https://restcountries.eu/rest/v2/all")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do{if error == nil{
                let decoder = JSONDecoder()
                self.arrdata = try decoder.decode([jsonstruct].self, from: data!)
                for _ in self.arrdata{
                    DispatchQueue.main.async {
                        self.tableview.reloadData()
                    }
                    
                }
                }
                
            }catch{
                print("Error in get json data")
            }
            
            }.resume()
    }
    
    
    
    //TableView
    private func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?)->Int {
        
        return self.arrdata.count
    }
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        print(self.arrdata.count)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Section ",self.arrdata.count)
        return self.arrdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.lblname.text = "Name : \(arrdata[indexPath.row].name)"
        cell.lblcapital.text = "Capital : \(arrdata[indexPath.row].capital)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail:DetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "detail") as! DetailViewController
        detail.strregion = "Region :\(arrdata[indexPath.row].region)"
        detail.strpopulation = "SubRegion :\(arrdata[indexPath.row].population)"
        detail.stralpha3 = "First Code :\(arrdata[indexPath.row].alpha3Code)"
        detail.stralpha2 = "Second Code:\(arrdata[indexPath.row].alpha2Code)"
        self.navigationController?.pushViewController(detail, animated: true)
    }
    
    
    
    
    func main(id:Int , name:String , message:String)-> String{
        _ = DetailViewController()
        print("Data ",arrdata[0])
        return ""
    }
    
 }
 
