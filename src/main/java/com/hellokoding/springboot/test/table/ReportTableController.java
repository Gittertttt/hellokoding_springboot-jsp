package com.hellokoding.springboot.test.table;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author yq
 */
@Controller
public class ReportTableController {
    @RequestMapping("/test/table")
    public String reportTableTest(@RequestParam(value = "col", required = false)String colNum, Model model) {
        if(colNum == null) {
            colNum = "5";
        }
        model.addAttribute("colNum", colNum);
        return "jsp/report/table";
    }

    @RequestMapping("/test/table/css")
    public String reportTableTestByCss() {
        return "jsp/report/tablebycss";
    }

    @RequestMapping("/test/table/jquery")
    public String reportTableTestByJquery() {
        return "jsp/report/tablebyjquery";
    }

    @RequestMapping("/test/table/easyui")
    public String reportTableTestByeaysui() {
        return "jsp/report/easyuitable";
    }
}
