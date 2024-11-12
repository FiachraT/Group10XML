for $report in doc("car_report.xml")/reports/*
let $reportID := $report/@reportID,
    $reportDate := $report/reports.ReportDate,
    $reportType := $report/reports.ReportType,
    $status := $report/reports.Details/@status,
    $description := $report/reports.Details/Description,
    $customerID := $report/reports.Details/CustomerID,
    $bookingID := $report/reports.Details/BookingID,
    $carID := $report/reports.Details/CarID,
    $rating := if ($report/name() = "FeedbackReport") then $report/FeedbackReport.rating else (),
    $comment := if ($report/name() = "FeedbackReport") then $report/FeedbackReport.comment else ()
return
    (
        if ($report/name() = "MaintenanceReport") then
            (
                "We have a maintenance report with details:",
                <MaintenanceReport>
                    <ReportID>{ $reportID }</ReportID>
                    <ReportDate>{ $reportDate/text() }</ReportDate>
                    <ReportType>{ $reportType/text() }</ReportType>
                    <Status>{ $status }</Status>
                    <Description>{ $description/text() }</Description>
                    <CustomerID>{ $customerID/text() }</CustomerID>
                    <BookingID>{ $bookingID/text() }</BookingID>
                    <CarID>{ $carID/text() }</CarID>
                </MaintenanceReport>
            )
        else
            (
                "We have a feedback report with details:",
                <FeedbackReport>
                    <ReportID>{ $reportID }</ReportID>
                    <ReportDate>{ $reportDate/text() }</ReportDate>
                    <ReportType>{ $reportType/text() }</ReportType>
                    <Status>{ $status }</Status>
                    <Description>{ $description/text() }</Description>
                    <CustomerID>{ $customerID/text() }</CustomerID>
                    <BookingID>{ $bookingID/text() }</BookingID>
                    <CarID>{ $carID/text() }</CarID>
                    <Rating>{ $rating/text() }</Rating>
                    <Comment>{ $comment/text() }</Comment>
                </FeedbackReport>
            )
    )
