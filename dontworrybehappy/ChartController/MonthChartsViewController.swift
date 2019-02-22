

import UIKit
import Charts

class ChartsViewController: UIViewController {
    
    
    @IBOutlet var monthBarChart: BarChartView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        monthChartLoad()
    }
    
    
    func monthChartLoad() {
       monthBarChart.noDataText = "데이터가 없습니다."
    }
    




}
