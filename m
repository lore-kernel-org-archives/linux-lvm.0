From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200001260001.BAA19078@u9etz.ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] 0.8i pvcreate doesn't recognise Mylex RAID
In-Reply-To: <15AD5D7936F8D21198240000F831776E3E8158@dboexc1.dbo.cpqcorp.net> from "Jakma, Paul" at "Jan 25, 2000  5:21:24 pm"
Date: Wed, 26 Jan 2000 01:01:42 +0100 (MET)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Jakma Paul <Paul.Jakma@compaq.com>
Cc: mge@ez-darmstadt.telekom.de, linux-lvm@msede.com

> > Any solution to this problem? Where can i teach pv_get_size about
> > Mylex /dev/rd? Also does it matter that I'm using devfs and hence
> > have long nested /dev/ path names?
> > 
> > thanks,
> 
> Ok, it turns out to be related to the new devfs namespace. I grep'ed for
> /dev/rd in tools/lib, and replaced the 2 occurances i found with
> /dev/rd/disc0 and got LVM working.
> 

Yep.

> So the problem is that the scanning functions only descend down one level.
> Eg in my case the tools/lib/* routines know about /dev/rd, so only nodes in
> /dev/rd will be found, which is not where they are in latest devfs.
> 
> However.. this begs the question:
> 
> Why in the name of god do the LVM tools use such elaborate and convulated
> methods for verifying the supplied device name? LVM tools are effectively
> tied to a very specific /dev namespace, and changing it is non-trivial.

Yes, it's an obvious disadvantage to do this 8-{(((

The simple reason for it is performance enhancement.

If you don't have devfs and you have an overpopulated /dev, it
takes to long to scan all device nodes and open them in turn.

> 
> I would much prefer that LVM tools only do basic sanity-checking on the
> device file, and leave as much of the namespace policy/sanity as possible up
> to the administrator.

Yep.
If an admin removes all uneccessary device nodes in an non devfs system ->
full scanning of /dev is o.k. like with devfs.

A disadvantage still persists: you can't count on 16 minors per disk for eg.
like you can see with DAC960 with only 8 minors per volume.
Scanning all device nodes still causes pain (s.b.).

> As is the Unix way. If i want to change my /dev the
> LVM tools should be able to handle it.

Yep.
That's why a change to use /proc/partitions is
in the current developement code.

I think we can count on the existence of /proc and can fallback
to scanning /dev, if /proc doesn't exist by accident.

> 
> Apart from this LVM works very very nicely. (apart from small issues which
> I'll send a seperate mail about). LVM turns linux into a very capable
> storage server. 
> 
> Congratulations!! 

Thanks 8-{)

Heinz

-- 

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement CS-TS                           T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@EZ-Darmstadt.Telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
