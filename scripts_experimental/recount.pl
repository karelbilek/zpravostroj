#!/usr/bin/perl

use strict;

use Zpravostroj::Walker;

#redo_it(day=>"24-11-2009", do_counting=>1);

redo_it(day=>"24-11-2009", do_extracting=>1, do_tagging=>1, do_counting=>1);