package org.pgg.web;
import javax.servlet.http.HttpServletRequest;

import org.pgg.domain.Foo;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/foos")
@Controller
@RooWebScaffold(path = "foos", formBackingObject = Foo.class)
public class FooController {
	
	@RequestMapping(value = "/demo", produces = "text/html")
	public String show(Model uiModel, HttpServletRequest request) {
	    uiModel.addAttribute("anything", "No need to load the whole page every time I want to update the model!");
	    return "index";
	}
}
