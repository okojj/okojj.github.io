#!/usr/local/bin/perl

$request_method = $ENV{'REQUEST_METHOD'};

if ($request_method eq "GET") {
    $form_info = $ENV{'QUERY_STRING'};
} else {
    $size_of_form_information = $ENV{'CONTENT_LENGTH'};
    read (STDIN, $form_info, $size_of_form_information);
}

($field_name, $command) = split (/=/, $form_info);

print "Content-type: text/plain", "\n\n";

if ($command eq "fortune") {
    print `/usr/local/bin/fortune`;
} elsif ($command eq "finger") {
    print `/usr/ucb/finger`;
} else {
    print `/usr/local/bin/date`;
}

exit (0);
