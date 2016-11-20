using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Text;
using Microsoft.Data.Tools.Schema.Sql.UnitTesting;
using Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace DacpacDemoSQL_UnitTest
{
    [TestClass()]
    public class Test_PR_CreateEmployee : SqlDatabaseTestClass
    {

        public Test_PR_CreateEmployee()
        {
            InitializeComponent();
        }

        [TestInitialize()]
        public void TestInitialize()
        {
            base.InitializeTest();
        }
        [TestCleanup()]
        public void TestCleanup()
        {
            base.CleanupTest();
        }

        #region Designer support code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction dbo_PR_CreateEmployeeTest_TestAction;
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Test_PR_CreateEmployee));
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.RowCountCondition rowCountCondition1;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction testInitializeAction;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction dbo_PR_CreateEmployeeTest_PretestAction;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction dbo_PR_CreateEmployeeTest_PosttestAction;
            this.dbo_PR_CreateEmployeeTestData = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestActions();
            dbo_PR_CreateEmployeeTest_TestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            rowCountCondition1 = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.RowCountCondition();
            testInitializeAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            dbo_PR_CreateEmployeeTest_PretestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            dbo_PR_CreateEmployeeTest_PosttestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            // 
            // dbo_PR_CreateEmployeeTest_TestAction
            // 
            dbo_PR_CreateEmployeeTest_TestAction.Conditions.Add(rowCountCondition1);
            resources.ApplyResources(dbo_PR_CreateEmployeeTest_TestAction, "dbo_PR_CreateEmployeeTest_TestAction");
            // 
            // rowCountCondition1
            // 
            rowCountCondition1.Enabled = true;
            rowCountCondition1.Name = "rowCountCondition1";
            rowCountCondition1.ResultSet = 1;
            rowCountCondition1.RowCount = 1;
            // 
            // testInitializeAction
            // 
            resources.ApplyResources(testInitializeAction, "testInitializeAction");
            // 
            // dbo_PR_CreateEmployeeTest_PretestAction
            // 
            resources.ApplyResources(dbo_PR_CreateEmployeeTest_PretestAction, "dbo_PR_CreateEmployeeTest_PretestAction");
            // 
            // dbo_PR_CreateEmployeeTest_PosttestAction
            // 
            resources.ApplyResources(dbo_PR_CreateEmployeeTest_PosttestAction, "dbo_PR_CreateEmployeeTest_PosttestAction");
            // 
            // dbo_PR_CreateEmployeeTestData
            // 
            this.dbo_PR_CreateEmployeeTestData.PosttestAction = dbo_PR_CreateEmployeeTest_PosttestAction;
            this.dbo_PR_CreateEmployeeTestData.PretestAction = dbo_PR_CreateEmployeeTest_PretestAction;
            this.dbo_PR_CreateEmployeeTestData.TestAction = dbo_PR_CreateEmployeeTest_TestAction;
            // 
            // Test_PR_CreateEmployee
            // 
            this.TestInitializeAction = testInitializeAction;
        }

        #endregion


        #region Additional test attributes
        //
        // You can use the following additional attributes as you write your tests:
        //
        // Use ClassInitialize to run code before running the first test in the class
        // [ClassInitialize()]
        // public static void MyClassInitialize(TestContext testContext) { }
        //
        // Use ClassCleanup to run code after all tests in a class have run
        // [ClassCleanup()]
        // public static void MyClassCleanup() { }
        //
        #endregion

        [TestMethod()]
        public void dbo_PR_CreateEmployeeTest()
        {
            SqlDatabaseTestActions testActions = this.dbo_PR_CreateEmployeeTestData;
            // Execute the pre-test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.PretestAction != null), "Executing pre-test script...");
            SqlExecutionResult[] pretestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PretestAction);
            try
            {
                // Execute the test script
                // 
                System.Diagnostics.Trace.WriteLineIf((testActions.TestAction != null), "Executing test script...");
                SqlExecutionResult[] testResults = TestService.Execute(this.ExecutionContext, this.PrivilegedContext, testActions.TestAction);
            }
            finally
            {
                // Execute the post-test script
                // 
                System.Diagnostics.Trace.WriteLineIf((testActions.PosttestAction != null), "Executing post-test script...");
                SqlExecutionResult[] posttestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PosttestAction);
            }
        }
        private SqlDatabaseTestActions dbo_PR_CreateEmployeeTestData;
    }
}
