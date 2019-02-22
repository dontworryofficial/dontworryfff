
import UIKit
import Charts

class MonthChartViewController: UIViewController {
    @IBOutlet var monthBarChart: HorizontalBarChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        monthChartLoad()
        
    }
    
    func monthChartLoad(){
//        //달 구하기
//        let date = Date()
//        let calender = Calendar.current
//        var month : Int = calender.component(.month, from: date)
//        var lastMonth : Int = Int(month) - 1
//        var twoMonthAgo : Int = Int(lastMonth) - 2
//
//        if twoMonthAgo < 0 {
//            twoMonthAgo = 13 + twoMonthAgo
//        }
//
//        NSLog("이번 달 :\(month), 저번달:\(lastMonth), 지지난달:\(twoMonthAgo)")
//
//        var months : [Int]!
//        //x축
//        months = [month, lastMonth, twoMonthAgo]
//        //지출내역 임의지정
//        var expence = [300,180,230]
//        //y축
//        let moneys = [0, 100, 200, 300, 400]
//
//        monthBarChart.noDataText = "월간 데이터가 존재하지 않습니다."
//        var dataEntries : [BarChartDataEntry] = []
//
//        for i in 0 ..< months.count {
//            let dataEntry = BarChartDataEntry(x: Double(months[i]), y: Double(moneys[i]))
//            dataEntries.append(dataEntry)
//        }
//        let chartDataSet = BarChartDataSet(values: dataEntries, label: "이게라벨")
//        let chartData = BarChartData()
//        chartData.addDataSet(chartDataSet)
//        monthBarChart.data = chartData
//        chartDataSet.colors = ChartColorTemplates.colorful()
//        //monthBarChart.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
//    }
        
        monthBarChart.drawBarShadowEnabled = false
        monthBarChart.drawValueAboveBarEnabled = true
        
        monthBarChart.maxVisibleCount = 60
        
        
        
        let xAxis  = monthBarChart.xAxis
        xAxis.labelPosition = .bottom
        xAxis.drawAxisLineEnabled = true
        xAxis.drawGridLinesEnabled = false
        xAxis.granularity = 10.0
        
        let leftAxis = monthBarChart.leftAxis;
        leftAxis.drawAxisLineEnabled = true;
        leftAxis.drawGridLinesEnabled = true;
        leftAxis.axisMinimum = 0.0; // this replaces startAtZero = YES
        
        let rightAxis = monthBarChart.rightAxis
        rightAxis.enabled = true;
        
        rightAxis.drawAxisLineEnabled = true;
        rightAxis.drawGridLinesEnabled = false;
        rightAxis.axisMinimum = 0.0; // this replaces startAtZero = YES
        
        let l = monthBarChart.legend
        l.enabled =  false
        
        monthBarChart.fitBars = true;
        
        setDataCount(count: 12, range: 50)
    }
    
    func setDataCount(count: Int, range: Double){
        
        let barWidth = 9.0
        let spaceForBar =  10.0;
        
        var yVals = [BarChartDataEntry]()
        
        for i in 0..<count{
            
            
            let mult = (range + 1)
            let val = (Double)(arc4random_uniform(UInt32(mult)))
            
            yVals.append(BarChartDataEntry(x: Double(i) * spaceForBar, y: val))
            
        }
        
        var set1 : BarChartDataSet!
        
        
        if let count = monthBarChart.data?.dataSetCount, count > 0{
            set1 = monthBarChart.data?.dataSets[0] as! BarChartDataSet
            set1.values = yVals
            monthBarChart.data?.notifyDataChanged()
            monthBarChart.notifyDataSetChanged()
            
        }else{
            set1 = BarChartDataSet(values: yVals, label: "DataSet")
            
            
            var dataSets = [BarChartDataSet]()
            dataSets.append(set1)
            
            let data = BarChartData(dataSets: dataSets)
            
            data.barWidth =  barWidth;
            
            monthBarChart.data = data
            
        }
        
        
        
    }
    
}
