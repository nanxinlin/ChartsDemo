//
//  TwoViewController.swift
//  ChartsDemo14
//
//  Created by 南鑫林 on 2018/9/8.
//  Copyright © 2018年 南鑫林. All rights reserved.
//

import UIKit
import Charts

class TwoViewController: UIViewController {

    //横向柱状图
    var chartView: HorizontalBarChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        //创建柱状图组件对象
        chartView = HorizontalBarChartView()
        chartView.frame = CGRect(x: 20, y: 80, width: self.view.bounds.width - 40,
                                 height: 260)
        self.view.addSubview(chartView)
        
        //不显示图例
        chartView.legend.enabled = false
        //x轴显示在左侧
        chartView.xAxis.labelPosition = .bottom
        
        //生成10条随机数据
        var dataEntries = [BarChartDataEntry]()
        for i in 0..<10 {
            let y = Double(arc4random() % 100) - 50
            let entry = BarChartDataEntry(x: Double(i), y: y)
            dataEntries.append(entry)
        }
        
        //根据正负值生成每个立柱使用的颜色
        let red = UIColor(red: 211/255, green: 74/255, blue: 88/255, alpha: 1)
        let green = UIColor(red: 110/255, green: 190/255, blue: 102/255, alpha: 1)
        let colors = dataEntries.map { (entry) -> NSUIColor in
            return entry.y > 0 ? green : red
        }
        
        //这10条数据作为柱状图的所有数据
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "图例1")
        //设置颜色
        chartDataSet.colors = colors
        //目前柱状图只包括1组立柱
        let chartData = BarChartData(dataSets: [chartDataSet])
        
        //设置柱状图数据
        chartView.data = chartData
        chartView.fitScreen()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
