package com.hellokoding.springboot.test.table.plugin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReportTableByPlugin {
    @RequestMapping("test/plugin/example1")
    public String reportTableTestByDatatableExapmleOne() {
        return "jsp/datatable/firstexample";
    }
}
