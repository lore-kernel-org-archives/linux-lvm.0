Message-Id: <199911111249.AA26995@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] modular MD and LVM
Date: Thu, 11 Nov 1999 13:46:47 MET
In-Reply-To: <5lr9hzf1lc.fsf@tequila.cs.yale.edu>; from "Stefan Monnier" at Nov 09, 99 10:49 pm
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: monnier+lists/linux/lvm/news/@tequila.cs.yale.edu
Cc: mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com


Hi Stefan,

basically the generic functions in the blk_dev_struct structure 
will be reduced to one because this is sufficient for MD, GFS and LVM.

But due to the fact that you can't push a lot of things to Linux
at this point in time it will take us a while...

Heinz

> 
> 
> What happened to the patch that provided `map_fn' and `makerq_fn'
> to allow MD, LVM (and GFS' Pool) to be made more modular ?
> 
> 
> 	Stefan
> 
> PS: see http://linux.msede.com/lvm/mlist/archive/0269.html
> 


--

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement CS-TS                           T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@ez-darmstadt.telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
