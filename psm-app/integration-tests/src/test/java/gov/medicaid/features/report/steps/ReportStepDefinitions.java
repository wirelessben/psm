/*
 * Copyright 2018 The MITRE Corporation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package gov.medicaid.features.report.steps;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;

import gov.medicaid.features.general.steps.GeneralSteps;

import net.thucydides.core.annotations.Steps;

public class ReportStepDefinitions {
    @Steps
    private ReportSteps reportSteps;

    @Steps
    private GeneralSteps generalSteps;

    @Given("^I am on the reports page$")
    public void i_am_on_the_reports_page() {
        generalSteps.clickLinkAssertTitle(".reportsLink", "Reports");
    }

    @Given("^I am on the applications by reviewer page$")
    public void i_am_on_the_applications_by_reviewer_page() {
        i_am_on_the_reports_page();
        generalSteps.clickLinkAssertTitle(
                ".applicationsByReviewerLink",
                "Applications by Reviewer"
        );
    }

    @Then("^I should see the reports page$")
    public void i_should_see_the_reports_page() {
        reportSteps.checkOnReportPage();
    }

    @Given("^I am on the draft applications page$")
    public void i_am_on_the_draft_applications_page() {
        i_am_on_the_reports_page();
        generalSteps.clickLinkAssertTitle(
                ".draftApplicationsLink",
                "Draft Applications"
        );
    }

    @Given("^I am on the time to review page$")
    public void i_am_on_the_time_to_review_page() {
        i_am_on_the_reports_page();
        generalSteps.clickLinkAssertTitle(
                ".timeToReviewLink",
                "Time to Review"
        );
    }

    @Given("^I am on the provider types page$")
    public void i_am_on_the_provider_types_page() {
        i_am_on_the_reports_page();
        generalSteps.clickLinkAssertTitle(
                ".providerTypesLink",
                "Provider Types"
        );
    }

    @Given("^I am on the reviewed documents page$")
    public void i_am_on_the_reviewed_documents_page() {
        i_am_on_the_reports_page();
        generalSteps.clickLinkAssertTitle(
                ".reviewedDocumentsLink",
                "Reviewed Documents"
        );
    }

    @Given("^I am on the risk levels page$")
    public void i_am_on_the_risk_levels_page() {
        i_am_on_the_reports_page();
        generalSteps.clickLinkAssertTitle(
                ".riskLevelsLink",
                "Risk Levels"
        );
    }

    @Then("^I should have no errors$")
    public void i_should_have_no_errors() {
        generalSteps.hasNoServerError();
    }
}
