package com.hellokoding.springboot.test.table;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author yq
 */
@Controller
public class ReportTableController {
    @RequestMapping("/test/table")
    public String reportTableTest() {
        return "jsp/report/table";
    }

    @RequestMapping("/test/table/css")
    public String reportTableTestByCss() {
        return "jsp/report/tablebycss";
    }
}
