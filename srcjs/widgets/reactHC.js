import "widgets";
import React from "react";
import { render } from "react-dom";
import Highcharts from "highcharts";
import HighchartsReact from "highcharts-react-official";

HTMLWidgets.widget({
  name: "reactHC",

  type: "output",

  factory: function (el, width, height) {

    return {
      renderValue: function (x) {
        const options = x.options;

        const App = () => (
          <div>
            <HighchartsReact highcharts={Highcharts} options={options} />
          </div>
        );

        render(<App />, document.getElementById(el.id));
      },

      resize: function (width, height) {

      }
    };
  }
});
