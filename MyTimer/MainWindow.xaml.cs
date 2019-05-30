using Hardcodet.Wpf.TaskbarNotification;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Threading;

namespace MyTimer
{
    public partial class MainWindow : Window
    {
        private static int WorkTimeMINUTES = 55;
        private static int RestTimeMINUTES = 5;

        private static string DisplayWorkTimeMINUTES = WorkTimeMINUTES.ToString();
        private static string DisplayRestTimeMINUTES = RestTimeMINUTES.ToString();

        private string DisplayStartWorkingTime = DisplayWorkTimeMINUTES + " : " + "00";
        private string DisplayStartRestingTime = DisplayRestTimeMINUTES + " : " + "00";

        private static int WorkingTimeSECONDS = TimeSpan.FromSeconds(WorkTimeMINUTES).Seconds;
        private static int RestTimeSECONDS = TimeSpan.FromSeconds(WorkTimeMINUTES).Seconds;

        public string currentTimeForToolTip;

        private bool isRestState = false;
        private double currentTime = WorkingTimeSECONDS;
        private int restCount = 0;
        DispatcherTimer dispatcherTimer = new DispatcherTimer();

        public MainWindow()
        {
            InitializeComponent();
            notifyIcon.TrayMouseDoubleClick += _notifyIcon_DoubleClick;

            currentTimeForToolTip = DisplayStartWorkingTime;
            this.CurrentTimeTextBlock.Text = currentTimeForToolTip;
        }

        void _notifyIcon_DoubleClick(object sender, EventArgs e)
        {
            if (!IsVisible)
            {
                Show();
            }

            if (WindowState == WindowState.Minimized)
            {
                WindowState = WindowState.Normal;
            }
        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            e.Cancel = true;
            this.ShowInTaskbar = false;
        }

        private void Window_Closed(object sender, EventArgs e)
        {
            this.WindowState = WindowState.Minimized;
        }

        protected override void OnStateChanged(EventArgs e)
        {
            if (WindowState == WindowState.Minimized)
                this.Hide();
        }

        private void RestState()
        {
            RestLabel.Visibility = Visibility.Visible;
            restCount++;

            if (RestCounter.Content.ToString().CompareTo("-") == 0 && restCount > 0)
            {
                RestCounter.Content = "";
            }

            if (restCount > 0)
            {
                RestCounter.Content += "|";
            }

            currentTime = RestTimeSECONDS;
            SetTimeTable(DisplayStartRestingTime);
        }

        private void WorkState()
        {
            currentTime = WorkingTimeSECONDS;
            SetTimeTable(DisplayStartWorkingTime);
            RestLabel.Visibility = Visibility.Hidden;
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            dispatcherTimer.Interval = TimeSpan.FromSeconds(1);
            dispatcherTimer.Tick += Timer;

            WorkState();
        }

        private void SetTimeTable(string timeTable)
        {
            TimerLabel.Content = timeTable;
        }

        private void RunButton_Click(object sender, RoutedEventArgs e)
        {
            dispatcherTimer.Start();
        }

        private void ResetButton_Click(object sender, RoutedEventArgs e)
        {
            ResetApp();
        }

        private void ResetApp()
        {
            SetTimeTable(DisplayStartWorkingTime);
            currentTime = WorkingTimeSECONDS;
            RestLabel.Visibility = Visibility.Hidden;
            RestCounter.Content = "-";
        }

        private void StopButton_Click(object sender, RoutedEventArgs e)
        {
            dispatcherTimer.Stop();
        }

        private void Timer(object sender, EventArgs e)
        {
            currentTime--;
            if (currentTime >= 0)
            {
                var incrementMinutes = currentTime / 60;
                var secondFraction = incrementMinutes % 1;
                var minutes = incrementMinutes - secondFraction;
                var seconds = Math.Round(secondFraction * 60, 0);
                var minutesInText = minutes.ToString();
                var secondsInText = seconds.ToString();


                if (minutesInText.Length < 2)
                {
                    minutesInText = "0" + minutesInText;
                }

                if (secondsInText.Length < 2)
                {
                    secondsInText = "0" + secondsInText;
                }

                TimerLabel.Content = currentTimeForToolTip = this.CurrentTimeTextBlock.Text = minutesInText + " : " + secondsInText;
            }
            else
            {
                SwitchState();
            }
        }

        private void SwitchState()
        {
            if (isRestState)
            {
                WorkState();
                isRestState = false;
            }
            else
            {
                if (RestCounter.Content.ToString().Length < 4)
                {
                    RestState();
                }
                else
                {
                    restCount = 0;
                    RestCounter.Content = "-";
                    ResetApp();
                }
                isRestState = true;
            }
        }
    }
}