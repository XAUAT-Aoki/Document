using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using TestHTMLJM.Models;

namespace TestHTMLJM.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult indexWe()
        {
            return View();
        }

        public IActionResult form()
        {
            ViewData["Message"] = "Your application description page.";

            return View();
        }

        public IActionResult table()
        {
            ViewData["Message"] = "Your contact page.";

            return View();
        }

       
    }
}
