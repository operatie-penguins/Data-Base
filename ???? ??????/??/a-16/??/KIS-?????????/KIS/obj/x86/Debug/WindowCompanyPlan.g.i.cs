﻿#pragma checksum "..\..\..\WindowCompanyPlan.xaml" "{406ea660-64cf-4c82-b6f0-42d48172a799}" "54B99A0D75A5A8261B75B041D03A16B6"
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.1
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace KIS {
    
    
    /// <summary>
    /// WindowCompanyPlan
    /// </summary>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
    public partial class WindowCompanyPlan : System.Windows.Window, System.Windows.Markup.IComponentConnector {
        
        
        #line 19 "..\..\..\WindowCompanyPlan.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox textBoxPlanName;
        
        #line default
        #line hidden
        
        
        #line 22 "..\..\..\WindowCompanyPlan.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.DatePicker datePickerStart;
        
        #line default
        #line hidden
        
        
        #line 26 "..\..\..\WindowCompanyPlan.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.DatePicker datePickerEnd;
        
        #line default
        #line hidden
        
        
        #line 28 "..\..\..\WindowCompanyPlan.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ListView listViewCompany;
        
        #line default
        #line hidden
        
        
        #line 35 "..\..\..\WindowCompanyPlan.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button ButtonAddRemove;
        
        #line default
        #line hidden
        
        
        #line 36 "..\..\..\WindowCompanyPlan.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ListView listViewProductsLists;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/KIS;component/windowcompanyplan.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\WindowCompanyPlan.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.textBoxPlanName = ((System.Windows.Controls.TextBox)(target));
            return;
            case 2:
            this.datePickerStart = ((System.Windows.Controls.DatePicker)(target));
            return;
            case 3:
            this.datePickerEnd = ((System.Windows.Controls.DatePicker)(target));
            return;
            case 4:
            this.listViewCompany = ((System.Windows.Controls.ListView)(target));
            
            #line 28 "..\..\..\WindowCompanyPlan.xaml"
            this.listViewCompany.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.listViewCompany_SelectionChanged);
            
            #line default
            #line hidden
            return;
            case 5:
            this.ButtonAddRemove = ((System.Windows.Controls.Button)(target));
            
            #line 35 "..\..\..\WindowCompanyPlan.xaml"
            this.ButtonAddRemove.Click += new System.Windows.RoutedEventHandler(this.ButtonAddRemove_Click);
            
            #line default
            #line hidden
            return;
            case 6:
            this.listViewProductsLists = ((System.Windows.Controls.ListView)(target));
            
            #line 36 "..\..\..\WindowCompanyPlan.xaml"
            this.listViewProductsLists.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.listViewProductsLists_SelectionChanged);
            
            #line default
            #line hidden
            return;
            case 7:
            
            #line 48 "..\..\..\WindowCompanyPlan.xaml"
            ((System.Windows.Controls.Button)(target)).Click += new System.Windows.RoutedEventHandler(this.Button_Click);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}

