

import UIKit
import Charts

class ViewController: UIViewController {
    
    @IBOutlet weak var pieChart: PieChartView!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var monthChart: UIView!
    @IBOutlet weak var weekChart: UIView!
    @IBOutlet weak var dayChart: UIView!
    
    let transition = SlideInTransition()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //setupNavigationBarItems()
        pieChartLoad()
       
    }
    
    @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController
            else {return}
        menuViewController.didTapMenuType = { menuType in
            self.transitionToNew(menuType)
        }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true)
        
    }
    
    func transitionToNew(_ menuType : MenuType){
        switch menuType.rawValue {
        case 1 :
            let daysVC : DaysViewController = storyboard?.instantiateViewController(withIdentifier: "days") as! DaysViewController
            //self.present(daysVC, animated: true, completion: nil)
            self.navigationController?.pushViewController(daysVC, animated: true)
        default:
            NSLog("실패")
        }
    }
    
    //파이차트로드
    func pieChartLoad() {
        //사이즈
        pieChart.holeRadiusPercent = 0.8
        //차트가 빙글빙글 돌아가는거 막음
        pieChart.rotationEnabled = false
        //애니메이션 효과
        pieChart.animate(xAxisDuration: 1, yAxisDuration: 1)
        //차트 클릭시 확대되는 효과 막음
        pieChart.highlightPerTapEnabled = false
        //왼쪽 하단 label 사각형 값 없애기
        pieChart.legend.enabled = false

     
        
        //차트보여주려고 값 임의로 지정
        let expense = PieChartDataEntry(value: 30)
        let income = PieChartDataEntry(value: 70)
        var chart = [PieChartDataEntry]()
        chart = [expense,income]
        
        let chartDataSet = PieChartDataSet(values: chart, label: nil)

        chartDataSet.selectionShift = 0
        //그래프 사이에 여백 줌
        chartDataSet.sliceSpace = 5
        //차트 숫자 라벨 없애기
        chartDataSet.drawValuesEnabled = false
        
        let chartData = PieChartData(dataSet: chartDataSet)
        let colors = [UIColor.red, UIColor.purple]
        chartDataSet.colors = colors
        pieChart.data = chartData
    }
    
    @IBAction func segmentIndexChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            UIView.animate(withDuration: 0.0, animations: {
                self.monthChart.alpha = 1.0
                self.weekChart.alpha = 0.0
                self.dayChart.alpha = 0.0
                })
        }else if sender.selectedSegmentIndex == 1 {
            UIView.animate(withDuration: 0.0, animations:  {
                self.monthChart.alpha = 0.0
                self.weekChart.alpha = 1.0
                self.dayChart.alpha = 0.0
            })
        }else if sender.selectedSegmentIndex == 2 {
            UIView.animate(withDuration: 0.0, animations: {
                self.monthChart.alpha = 0.0
                self.weekChart.alpha = 0.0
                self.dayChart.alpha = 1.0
                })
        }
    }
    
}

extension ViewController : UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}

