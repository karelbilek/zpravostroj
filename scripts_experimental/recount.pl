#!/usr/bin/perl

use strict;

use Zpravostroj::Walker;

print "27-11-2009\n";
redo_it(day=>"27-11-2009", do_counting=>1);

print "28-11-2009\n";
redo_it(day=>"28-11-2009", do_counting=>1);

print "29-11-2009\n";
redo_it(day=>"29-11-2009", do_counting=>1);

print "30-11-2009\n";
redo_it(day=>"30-11-2009", do_counting=>1);

print "1-12-2009\n";
redo_it(day=>"1-12-2009", do_counting=>1);

print "2-12-2009 prazdny :) \n";
redo_it(day=>"2-12-2009", do_counting=>1);

print "3-12-2009 prazdny :) \n";
redo_it(day=>"3-12-2009", do_counting=>1);

print "4-12-2009\n";
redo_it(day=>"4-12-2009", do_counting=>1);

print "5-12-2009 opet prazdny, wtf...\n";
redo_it(day=>"5-12-2009", do_counting=>1);

print "6-12-2009 nastesti zas plny\n";
redo_it(day=>"6-12-2009", do_counting=>1);

print "7-12-2009\n";
redo_it(day=>"7-12-2009", do_counting=>1);

print "8-12-2009\n";
redo_it(day=>"8-12-2009", do_counting=>1);

print "9-12-2009\n";
redo_it(day=>"9-12-2009", do_counting=>1);

print "10-12-2009 - doing ALL\n";
redo_it(day=>"10-12-2009", do_reading=>1, do_extracting=>1, do_tagging=>1, do_counting=>1);

print "11-12-2009\n";
redo_it(day=>"11-12-2009", do_counting=>1);

print "12-12-2009\n";
redo_it(day=>"12-12-2009", do_counting=>1);


#redo_it(day=>"24-11-2009", do_reading=>1, do_extracting=>1, do_tagging=>1, do_counting=>1);