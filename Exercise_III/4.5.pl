#!/usr/bin/perl

sub absolute{
    my(@result);
    foreach(@_){
        push(@result,$_);
        if($_< 0){
        $result[-1] *= -1;
        }
    }
    @result;
}

@list = qw(1 -2 3 -4 5);
@list = absolute(@list);
print "@list"."\n";