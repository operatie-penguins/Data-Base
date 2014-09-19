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
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.ComponentModel;
using System.Globalization;

namespace KIS
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        KISEntities kisEntites = new KISEntities();
        IBindingList plans;

        public MainWindow()
        {
            InitializeComponent();
            init();
            
        }

        private void init()
        {
            plans = ((from e in kisEntites.Plans.Include("ProductsLists.Product1") select e) as IListSource).GetList() as IBindingList;
            listViewPlans.DataContext = plans;
            
        }

        private void MenuItem_Click(object sender, RoutedEventArgs e)
        {
            //Создать план
            WindowPlan windowsPlan = new WindowPlan();
            windowsPlan.ShowDialog();
            if (windowsPlan.DialogResult.Value && windowsPlan.DialogResult.HasValue)
            {
                init();
            }
        }

        private void MenuItem_Click_1(object sender, RoutedEventArgs e)
        {
            //создать продукт
            WindowProducts windowProducts = new WindowProducts();
            windowProducts.ShowDialog();
            if (windowProducts.DialogResult.Value && windowProducts.DialogResult.HasValue)
            {
                init();
            }
              
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {

        }

        private void listViewPlans_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            List<Tuple<string, int>> list = new List<Tuple<string, int>>();
            listViewAllItems.Items.Clear();
            if (listViewPlans.SelectedItem != null)
            {
                foreach (ProductsList item in ((listViewPlans.SelectedItem as Plan).ProductsLists))
                {
                    if (item.Plan == (listViewPlans.SelectedItem as Plan).ID)
                    {
                        int count = 0;
                        string name = "";
                        foreach (Structure st in item.Product1.Structures)
                        {
                            if (st.Product == item.Product)
                            {
                                count = st.ItemsNumber * item.ProductsNumber;
                                name = st.Item1.Name;
                                if (count > 0)
                                {
                                    bool isFind = false;

                                    Tuple<string, int> newT = new Tuple<string, int>(name, count);
                                    int index = 0;
                                    foreach (Tuple<string, int> t in listViewAllItems.Items)
                                    {
                                        if (t.Item1 == newT.Item1)
                                        {
                                            int temp = newT.Item2;
                                            newT = new Tuple<string, int>(name, t.Item2 + temp);
                                            listViewAllItems.Items.Add(newT);
                                            isFind = true;
                                            index = listViewAllItems.Items.IndexOf(t);
                                            break;
                                        }
                                    }
                                    if (!isFind)
                                        listViewAllItems.Items.Add(newT);
                                    else
                                    {
                                        listViewAllItems.Items.RemoveAt(index);
                                    }
                                    count = 0;
                                }
                            }

                        }

                    }
                }
            }
        }

        private void MenuItem_Click_2(object sender, RoutedEventArgs e)
        {
            WindowCompany windowCompany = new WindowCompany();
            windowCompany.ShowDialog();
            if (windowCompany.DialogResult.Value && windowCompany.DialogResult.HasValue)
            {
                init();
            }
        }

        private void MenuItem_Click_3(object sender, RoutedEventArgs e)
        {
            WindowCompanyPlan windowCompanyPlan = new WindowCompanyPlan();
            windowCompanyPlan.ShowDialog();
            if (windowCompanyPlan.DialogResult.Value && windowCompanyPlan.DialogResult.HasValue)
            {
                init();
            }
        }


        private void MenuItem_Click_5(object sender, RoutedEventArgs e)
        {
            if (listViewPlans.SelectedItem != null)
            {
                plans.Remove(listViewPlans.SelectedItem);
            }
        }


    }

    public class MuConverter : IValueConverter
    {

        #region IValueConverter Members
        

        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            List<Tuple<string, int>> list = new List<Tuple<string, int>>();

            foreach (ProductsList item in (value as System.Data.Objects.DataClasses.EntityCollection<ProductsList>))
            {
                int count =0;
                string name = "";
                foreach (Structure st in item.Product1.Structures)
                {
                    if(st.Product==item.Product)
                    {
                        count=st.ItemsNumber * item.ProductsNumber;
                        name=st.Item1.Name;
                    }

                }
                if(count>0) list.Add(new Tuple<string,int>(name,count));

            }

            return list;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }

        #endregion
    }

         public class MuConverter2 : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            System.Data.Objects.DataClasses.EntityCollection<Structure> two1 = (value as System.Data.Objects.DataClasses.EntityCollection<Structure>);
            string two = ((from e in two1 select e.Item1.Name).First<string>());
            return two;
        }
        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotSupportedException();
        }

    }
}


