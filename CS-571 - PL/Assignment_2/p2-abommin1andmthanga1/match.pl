
open FILE,  "input.txt" or die $!;
while (<FILE>)
{
    chomp $_;
    if ($_=~m/or/) { print "$_ contains or\n";}
    if ($_=~m/([a-zA-Z0-9]*)([a|e|i|o|u])([a-zA-Z0-9]*)([a|e|i|o|u])([a-zA-Z0-9]*)/) { print "$_ contains at least two vowel letters\n";}
    if ($_=~m/^[^h]/) { print "$_ does not start with h\n";}
    if ($_=~m/[a-zA-Z0-9][e]\w*[y]$/) { print "$_ has e as the second symbol and ends with y\n";}
    if (($_=~m/[a-zA-Z]/)&&($_=~m/[0-9]/)) { print "$_ contains both letters and digits\n";}

}
close(FILE)
