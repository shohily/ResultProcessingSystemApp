using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ResultProcessingSystemApp
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private string connectionstring = @"server =USER;database=DB_ResultProcessing;integrated security=true";

        private void saveButton_Click(object sender, EventArgs e)
        {

            string rollNo,
                studentName,
                softwareEngineeringMarks,
                compilerDesignMarks,
                numericalAnalysisMarks,
                softwareEngineeringGrade,
                compilerDesignGrade,
                numericalAnalysisGrade;
            double sumofPoint;
            rollNo = rollTextBox.Text;
            studentName = nameTextBox.Text;
            softwareEngineeringMarks = softengTextBox.Text;
            compilerDesignMarks = compilerTextBox.Text;
            numericalAnalysisMarks = neumaricalTextBox.Text;
            softwareEngineeringGrade = GradeResult(GradePoint(Convert.ToDouble(softwareEngineeringMarks)));
            compilerDesignGrade = GradeResult(GradePoint(Convert.ToDouble(compilerDesignMarks)));
            numericalAnalysisGrade = GradeResult(GradePoint(Convert.ToDouble(numericalAnalysisMarks)));
            sumofPoint = GradePoint(Convert.ToDouble(softwareEngineeringMarks)) +
                         GradePoint(Convert.ToDouble(compilerDesignMarks)) +
                         GradePoint(Convert.ToDouble(numericalAnalysisMarks));
            sumofPoint /= 3;
            if (sumofPoint < 2)
                sumofPoint = 0;
            SqlConnection aConnection = new SqlConnection(connectionstring);
            aConnection.Open();

            string query =
                string.Format(@"insert into Result_Table(Roll,Name,SoftEngMarks,CompilerDesignMarks,NeumaricalMarks,SoftEngGPA,CompilerDesignGPA,NeumaricalGPA,GPA,Grade)
                                 values('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}')"
                ,rollNo,studentName,softwareEngineeringMarks,compilerDesignMarks,numericalAnalysisMarks,softwareEngineeringGrade
                ,compilerDesignGrade,numericalAnalysisGrade,GradeResult(sumofPoint),Convert.ToString(sumofPoint) );
            SqlCommand aCommand = new SqlCommand(query, aConnection);
            MessageBox.Show("Saved Successfully! ");
            rollTextBox.Text = "";
            nameTextBox.Text = "";
            softengTextBox.Text = "";
            compilerTextBox.Text = "";
            neumaricalTextBox.Text = "";
            aCommand.ExecuteNonQuery();
            aConnection.Close();
        }
        public double GradePoint(double marks)
        {
            if (marks >= 80)
                return 4.0;
            else if (marks >= 75) return 3.75;
            else if (marks >= 70) return 3.50;
            else if (marks >= 65) return 3.25;
            else if (marks >= 60) return 3.0;
            else if (marks >= 55) return 2.75;
            else if (marks >= 50) return 2.50;
            else if (marks >= 45) return 2.25;
            else if (marks >= 40) return 2.0;
            else return 0.0;
        }

        public string GradeResult(double point)
        {
            if (point >= 4.0) return "A+";
            else if (point >= 3.75) return "A";
            else if (point >= 3.50) return "A-";
            else if (point >= 3.25) return "B+";
            else if (point >= 3.00) return "B";
            else if (point >= 2.75) return "B-";
            else if (point >= 2.50) return "C+";
            else if (point >= 2.25) return "C";
            else if (point >= 2.00) return "D";
            else return "F";
        }

        private void resultButton_Click(object sender, EventArgs e)
        {
            dataGridView.Rows.Clear();
            dataGridView.Refresh();
            SqlConnection aConnection = new SqlConnection(connectionstring);
            aConnection.Open();

            string tableSql = "SELECT * FROM Result_Table";
            SqlCommand selectAllTableSqlCommand = new SqlCommand(tableSql, aConnection);

            SqlDataReader tableReader = selectAllTableSqlCommand.ExecuteReader();

            if (tableReader != null)
                while (tableReader.Read())
                {
                    dataGridView.Rows.Add(tableReader[0].ToString(), tableReader[1].ToString(),
                                                 tableReader[2].ToString(), tableReader[3].ToString(),
                                                 tableReader[4].ToString(), tableReader[5].ToString(),
                                                 tableReader[6].ToString(), tableReader[7].ToString(),
                                                 tableReader[8].ToString(),tableReader[9].ToString());
                }
            tableReader.Close();
            aConnection.Close();
 
        }

    }
}
