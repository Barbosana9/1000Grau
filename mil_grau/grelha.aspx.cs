﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mil_grau
{
    public partial class grelha : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnNovoPreparo_Click(object sender, EventArgs e)
        {
            
        }

        [System.Web.Services.WebMethod]
        public static double getTempeture()
        {
            ConnectionFactory bancoDeDados = new ConnectionFactory();

            return double.Parse(bancoDeDados.getTempeture().ToString());
        }
        

        
    }
}