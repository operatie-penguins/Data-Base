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


    public partial class WindowProducts : Window
    {
        KISEntities kisEntites = new KISEntities();
        IBindingList items;

        public WindowProducts()
        {
            InitializeComponent();
            items = ((from e in kisEntites.Items select e) as IListSource).GetList() as IBindingList;
            listViewItems.DataContext = items;
        }

        private void listViewStructure_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ButtonAddRemove.Content = "Удалить";
        }

        private void listViewItems_SelectionChanged(object sender, SelectionChangedEventArgs e)
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
                    if (listViewItems.SelectedItem != null)
                    {
                        Tuple<int, string, int> item = new Tuple<int, string, int>((listViewItems.SelectedItem as Item).ID, (listViewItems.SelectedItem as Item).Name, windowHowMuch.Result);
                        listViewStructure.Items.Add(item);
                    }
                }
            }
            else
            {
                listViewStructure.Items.Remove(listViewStructure.SelectedItem);
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (textBoxProductName.Text.Length != 0  && listViewStructure.Items.Count != 0)
            {
                Product product = Product.CreateProduct(0, textBoxProductName.Text);
                kisEntites.AddToProducts(product);
                kisEntites.SaveChanges();
                foreach (Tuple<int, string, int> item in listViewStructure.Items)
                {
                    kisEntites.AddToStructures(new Structure { Product = product.ID, Item = item.Item1, ItemsNumber = item.Item3 });
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

        private void AddItem_Click(object sender, RoutedEventArgs e)
        {
            if (textBoxItemName.Text.Length != 0)
            {
                items.Add(Item.CreateItem(0, textBoxItemName.Text));
                kisEntites.SaveChanges();
            }
        }
    }
}
