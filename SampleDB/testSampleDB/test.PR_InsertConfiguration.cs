using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Text;
using Microsoft.Data.Tools.Schema.Sql.UnitTesting;
using Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace testSampleDB
{
    [TestClass()]
    public class test : SqlDatabaseTestClass
    {

        public test()
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
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction dbo_PR_InsertConfiguruationTest_TestAction;
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(test));
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.InconclusiveCondition inconclusiveCondition1;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction dbo_PR_InsertConfiguruationTest_PretestAction;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.ChecksumCondition checksumCondition1;
            this.dbo_PR_InsertConfiguruationTestData = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestActions();
            dbo_PR_InsertConfiguruationTest_TestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            inconclusiveCondition1 = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.InconclusiveCondition();
            dbo_PR_InsertConfiguruationTest_PretestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            checksumCondition1 = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.ChecksumCondition();
            // 
            // dbo_PR_InsertConfiguruationTest_TestAction
            // 
            dbo_PR_InsertConfiguruationTest_TestAction.Conditions.Add(inconclusiveCondition1);
            resources.ApplyResources(dbo_PR_InsertConfiguruationTest_TestAction, "dbo_PR_InsertConfiguruationTest_TestAction");
            // 
            // inconclusiveCondition1
            // 
            inconclusiveCondition1.Enabled = true;
            inconclusiveCondition1.Name = "inconclusiveCondition1";
            // 
            // dbo_PR_InsertConfiguruationTestData
            // 
            this.dbo_PR_InsertConfiguruationTestData.PosttestAction = null;
            this.dbo_PR_InsertConfiguruationTestData.PretestAction = dbo_PR_InsertConfiguruationTest_PretestAction;
            this.dbo_PR_InsertConfiguruationTestData.TestAction = dbo_PR_InsertConfiguruationTest_TestAction;
            // 
            // dbo_PR_InsertConfiguruationTest_PretestAction
            // 
            dbo_PR_InsertConfiguruationTest_PretestAction.Conditions.Add(checksumCondition1);
            resources.ApplyResources(dbo_PR_InsertConfiguruationTest_PretestAction, "dbo_PR_InsertConfiguruationTest_PretestAction");
            // 
            // checksumCondition1
            // 
            checksumCondition1.Checksum = null;
            checksumCondition1.Enabled = true;
            checksumCondition1.Name = "checksumCondition1";
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
        public void dbo_PR_InsertConfiguruationTest()
        {
            SqlDatabaseTestActions testActions = this.dbo_PR_InsertConfiguruationTestData;
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
        private SqlDatabaseTestActions dbo_PR_InsertConfiguruationTestData;
    }
}
