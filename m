Message-Id: <199905110921.AA31521@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] Easy way to expend to the maximum length???
Date: Tue, 11 May 1999 11:17:52 METDST
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com


> 
> 
> Is there an easy way to expand to the maximum length of a lv?
> I used lvexpand until it wouldn't allow me to continue, but I figure there
> has to be an easy way to simple expand to maximum.
> 

Sorry, no direct support for that with LVM commands today.


But if you have next free allocation policy (as oposed to
contiguous/striped etc.), you can solve your need by

lvextend -l+`vgdisplay YourVG|awk '{if(/^Free PE/){print $3}}'` \
   /dev/YourVG/YourLV

If you put it into a script and do some parameter magic to parse
the VG name etc. -> that's it.

Have to implement an option for that in lvextend ;*)

Regards,
Heinz
--

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement C/S                             Deutsche Telekom AG
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@ez-darmstadt.telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
