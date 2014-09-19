using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace KIS
{
    /// <summary>
    /// Interaction logic for WindowHowMuch.xaml
    /// </summary>
    public partial class WindowHowMuch : Window
    {
        public WindowHowMuch()
        {
            InitializeComponent();
        }

        public int Result
        {
            get 
            {
                return int.Parse(textBoxNumber.Text);
            }
            private set
            {
                Result = value;
            }

        }

        private void buttonOK_Click(object sender, RoutedEventArgs e)
        {
            DialogResult = true;
            Close();
        }

        private void buttonCancel_Click(object sender, RoutedEventArgs e)
        {
            DialogResult = false;
            Close();
        }

    }
}
