Message-Id: <199904171108.AA17853@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] SYLOG MESSAGES
Date: Sat, 17 Apr 1999 13:06:55 METDST
In-Reply-To: <000d01be889c$1a9f8450$1401a6c0@aloha.lc.ca.org>; from "parkercj" at Apr 16, 99 11:32 pm
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cparker1@pacbell.net
Cc: mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com


On Fri, 16 Apr 1999 23:32:43 -0700, C.J. Parker
<cparker1@pacbell.net> wrote:

> 
> This is a great feature for Linux and looong overdue. I'm usually using some
> form of volume management  be it Dec OSF Volume Manager, Solaris's Veritas
>  really DEC's version of a.k.a Veritas) , IBM's AIX ( really great product)
> , and even HP's LVM ( which can be tricky without patches). This software is
> closer to HP's implementation than the others I usually deal with.

Yes, i like HPs for quite a lot of years ;*)

> 
> I only have one small sniggling problem. Whenever I issue any type of "pv"
> or "vg" command  I see a number of the following messages in my syslog file:
> 
> 
> Apr 16 23:16:11 sabrina modprobe: can't locate module block-major-33
> Apr 16 23:16:11 sabrina last message repeated 5 times
> Apr 16 23:16:11 sabrina modprobe: can't locate module block-major-34
> Apr 16 23:16:11 sabrina last message repeated 5 times
> Apr 16 23:16:11 sabrina modprobe: can't locate module block-major-9
> Apr 16 23:16:12 sabrina last message repeated 9 times
> Apr 16 23:16:12 sabrina modprobe: can't locate module block-major-8
> 

This is no severe problem.

> 
> This doesn't happen with any of the "lv" commands, but I'm keeping my eyes
> open for anything strange.  Am I missing something in my module
> configuration????

Your modprobe config seems to contain active entries for the above majors
and a LVM library function called by some LVM command (pvscan for eg.) scans all
disk/MD majors to find online disks/MDs/PVs.

<SNIP config...> 

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
