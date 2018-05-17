using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace mil_grau
{
    public class ModelReceita
    {
        public int cod_receita { get; set; }

        public string nomeReceita { get; set; }

        public double maxima { get; set; }

        public double minima { get; set; }

        public DateTime tempo_preparo { get; set; }
    }
}