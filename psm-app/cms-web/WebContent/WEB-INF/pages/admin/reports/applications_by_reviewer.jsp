<%--
  Copyright 2018 The MITRE Corporation
  
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at
  
      http://www.apache.org/licenses/LICENSE-2.0
  
  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
--%>
<%@ include file="/WEB-INF/pages/admin/includes/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="en-US">
  <c:set var="title" value="Applications by Reviewer"/>
  <c:set var="includeD3" value="true" />
  <fmt:formatDate value="${startDate}" pattern="MM/dd/yyyy" var="searchStartDate" />
  <fmt:formatDate value="${endDate}" pattern="MM/dd/yyyy" var="searchEndDate" />
  <h:handlebars template="includes/html_head" context="${pageContext}" />
  <body>
    <div id="wrapper">
      <h:handlebars template="includes/header" context="${pageContext}"/>
      <div id="mainContent">
        <div class="contentWidth">
          <div class="mainNav">
            <h:handlebars template="includes/logo" context="${pageContext}"/>
            <h:handlebars template="includes/banner" context="${pageContext}"/>
            <c:set var="activeTabReports" value="true" />
            <h:handlebars template="includes/nav" context="${pageContext}"/>
          </div>
          <div class="breadCrumb">
            <a href="<c:url value='/admin/reports' />">Reports</a>
            <span>Applications by Reviewer</span>
          </div>
          <div class="head">
            <h1 class="text">Applications by Reviewer</h1>
            <a
              class="downloadApplicationsByReviewerLink"
              href="${ctx}/admin/reports/applicationreviewers.csv?startDate=${searchStartDate}&endDate=${searchEndDate}"
              >Download this report</a>
          </div>
          <div class="tabSection">
            <div class="detailPanel">
              <form action="${ctx}/admin/reports/applications-by-reviewer" :method "get">
                <div class="row">
                  Enter a date range or leave both dates blank to include all
                  historical data.
                </div>
                <div class="row rowDateRange">
                  <span class="dateWrapper floatL">
                    <input
                      name="startDate"
                      id="startDate"
                      class="date hasDatePicker inputBox"
                      title="Date Start"
                      placeholder="Start Date"
                      class="date"
                      type="text"
                      value="${searchStartDate}"
                    />
                  </span>
                  <span class="floatL">-</span>
                  <span class="dateWrapper floatL">
                    <input
                      name="endDate"
                      id="endDate"
                      class="date hasDatePicker inputBox"
                      title="Date End"
                      placeholder="End Date"
                      class="date"
                      type="text"
                      value="${searchEndDate}"
                    />
                  </span>
                </div>
                <div class="row">
                  <input
                    type="submit"
                    value="Update Dates"
                    class="purpleBtn viewApplicationsByReviewerButton"
                  />
                </div>
              </form>
            </div>
          </div>
          <c:choose>
            <c:when test="${fn:length(applications) gt 0}">
              <div class="reportTable tableData">
                <div class="tableData">
                  <table class="generalTable linedTable">
                    <thead>
                      <tr>
                        <th>Application ID</th>
                        <th>Provider Name</th>
                        <th>Provider Type</th>
                        <th>Submission Date</th>
                        <th>Reviewed By</th>
                        <th>Review Date</th>
                        <th>Status</th>
                      </tr>
                    </thead>
                    <c:forEach
                      var="application"
                      items="${applications}"
                      varStatus="status"
                    >
                      <tr class="reportRow ${status.index % 2 == 0 ? 'odd' : 'even'}">
                        <td>
                          <a href="${ctx}/provider/application/view?id=${application.applicationId}">
                            ${application.applicationId}
                          </a>
                        </td>
                        <td>${application.details.entity.name}</td>
                        <td>${application.details.entity.providerType.description}</td>
                        <td><fmt:formatDate value="${application.createdOn}" pattern="dd MMMM yyyy" /></td>
                        <td>${application.lastUpdatedBy.username}</td>
                        <td><fmt:formatDate value="${application.statusDate}" pattern="dd MMMM yyyy" /></td>
                        <td>${application.status.description}</td>
                      </tr>
                    </c:forEach>
                  </table>
                </div>
              </div>
            </c:when>
            <c:otherwise>
              <div class="tabSection">
                <div class="detailPanel">
                  <h2 class="noResults">No results found</h2>
                </div>
              </div>
            </c:otherwise>
          </c:choose>
        </div>
      </div>
      <!-- /#mainContent -->

      <h:handlebars template="includes/footer" context="${pageContext}"/>
    </div>
    <!-- /#wrapper -->
  </body>
</html>
