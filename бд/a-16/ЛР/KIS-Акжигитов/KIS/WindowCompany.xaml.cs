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
using System.ComponentModel;

namespace KIS
{
    /// <summary>
    /// Interaction logic for WindowCompany.xaml
    /// </summary>
    public partial class WindowCompany : Window
    {
        KISEntities kisEntites = new KISEntities();
        IBindingList products;
        public WindowCompany()
        {
            InitializeComponent();
            products = ((from e in kisEntites.Products select e) as IListSource).GetList() as IBindingList;
            listViewProducts.DataContext = products;
        }


        private void listViewCompanyProducts_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ButtonAddRemove.Content = "Удалить";
        }

        private void listViewCompany_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ButtonAddRemove.Content = "Добавить";
        }

        private void ButtonAddRemove_Click(object sender, RoutedEventArgs e)
        {
            if (ButtonAddRemove.Content.ToString() == "Добавить")
            {
                WindowHowMuch windowHowMuch = new WindowHowMuch();
                windowHowMuch.ShowDialog();

                if (windowHowMuch.DialogResult.HasValue && windowHowMuch.DialogResult.Value)
                {
                    if (listViewProducts.SelectedItem != null)
                    {
                        Tuple<int, string, int> item = new Tuple<int, string, int>((listViewProducts.SelectedItem as Product).ID, (listViewProducts.SelectedItem as Product).Name, windowHowMuch.Result);
                        listViewCompanyProducts.Items.Add(item);
                    }
                }
            }
            else
            {
                listViewCompanyProducts.Items.Remove(listViewCompanyProducts.SelectedItem);
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (textBoxCompanyName.Text.Length != 0 && listViewCompanyProducts.Items.Count != 0)
            {
                Company company = Company.CreateCompany(0, textBoxCompanyName.Text);
                kisEntites.AddToCompanies(company);
                kisEntites.SaveChanges();
                foreach (Tuple<int, string, int> item in listViewCompanyProducts.Items)
                {
                    kisEntites.AddToCompanyProducts(new CompanyProduct { Company = company.ID, Product = item.Item1, ProuctsNumber = item.Item3 });
                }
                kisEntites.SaveChanges();
                DialogResult = true;
                Close();

            }
            else
            {
                MessageBox.Show("Заполните все поля!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
