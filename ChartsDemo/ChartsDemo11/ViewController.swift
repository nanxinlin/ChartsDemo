//
//  ViewController.swift
//  ChartsDemo11
//
//  Created by 南鑫林 on 2018/9/5.
//  Copyright © 2018年 南鑫林. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {

    var chartView : LineChartView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //创建折线图组件对象
        chartView = LineChartView()
        chartView.frame = CGRect(x: 20, y: 80, width: self.view.bounds.width - 40,
                                 height: 250)
        self.view.addSubview(chartView)
        
        //生成20条随机数据
        var dataEntries = [ChartDataEntry]()
        for i in 0..<20 {
            let y = arc4random()%100
            let entry = ChartDataEntry.init(x: Double(i), y: Double(y))
            dataEntries.append(entry)
        }
        //这50条数据作为1根折线里的所有数据
        let chartDataSet = LineChartDataSet(values: dataEntries, label: "图例1")
        //目前折线图只包括1根折线
        let chartData = LineChartData(dataSets: [chartDataSet])
        
        //设置折现图数据
        chartView.data = chartData
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonAction(_ sender: UIButton) {
        //获取图片
        let image = chartView.getChartImage(transparent: true)
        //将其显示在imageView中
        imageView.image = image
        //将其保存到系统相册中
        UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
    }
    @IBAction func pushAction(_ sender: UIButton) {
        self.present(OneViewController(), animated: true) {
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

