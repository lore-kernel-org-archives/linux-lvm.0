From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <199912171310.OAA18804@u9etz.ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] 0.7 Conflict with MD in 2.3.31
In-Reply-To: <Pine.LNX.4.21.9912162250390.24493-100000@orcas.net> from Terry Hardie at "Dec 16, 1999 10:53: 7 pm"
Date: Fri, 17 Dec 1999 14:10:39 +0100 (MET)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Terry Hardie <terryh@orcas.net>
Cc: linux-lvm@msede.com, mge@ez-darmstadt.telekom.de

> I applied the 0.7 LVM patch to a 2.3.31 kernel. I'm moving from a number 
> raid0 md devices to LVM, but if I have LVM in the kernel, and try to
> activate any of the MD devices, I get a kernel oops (Doesn't die, just
> kills the md program attempting to change the md array)
> 
> Is this a known incompatibility, and if not, should I post the oops with
> symbols?
> 

Yes, it is a known problem.
I'm working on it right now to send it to Linus.
It's caused by changes in the i/o request handling of the kernel.

Cheers,
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
