Message-Id: <199902161420.AA06705@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] User count, general question for all y'all
Date: Tue, 16 Feb 1999 15:18:37 MET
In-Reply-To: <4.1.19990216073849.00953be0@mail.msy.bellsouth.net>; from "Daniel Whicker" at Feb 16, 99 7:39 am
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Whicker <heimdall@mail.org>
Cc: linux-lvm@msede.com

> 
> I haven't experience any I/O deadlocks, but I'm using IDE disks and a
> 2.0.36 kernel with ext2 fses.  Has anyone attempted using of the JFSes out
> there with LVM?  
> 

No, i didn't test with a JFS.

Only with reiserfs which worked o.k. so far.

Only the below mentioned restrictions applied.

BTW: i have not been able to test any performance boosts with reiserfs;
     reiserfsck is far to slow to be usefull


Heinz

P.S.: does somebody know about any Linux JFSes available for testing?


> At 07:22 AM 2/16/99 , you wrote:
> >
> >> 
> >> Are we all (on this list) actively using lvm, and in what
> >> configuration? How many of us are there?
> >> 
> >
> >I use it 8*)))
> >
> >> Also, has anyone encountered deadlocks during heavy IO?
> >
> >Yes, i did from the early 2.1.x times on.
> >The question is which Linux version you are using _and_
> >which aic7xxx version if any.
> >
> >It turned out to be a mass i/o lock which can be seen without LVM too.
> >Things turned out to be better in the later 2.1.x and in 2.2.x.
> >
> >A problem still stays which Stephen Tweedie and others are addressing right 
> >now:
> >with large quantity i/o 2.2.1 preferes allocation of buffer pages vs.
> >keeping process pages in memory making the system _very_ lazy ;*)
> >
> >
> >> I'm
> >> only using LVM at this point as a method of easy partitioning.
> >> No mirroring, etc. I suspect reiserfs is to blaim on my system,
> >> but I just thought I'd ask.
> >> 
> >
> >Mybe it's a big mkreiserfs forcing the metioned behaviour?
> >
> >Heinz
>
> 		Daniel Whicker  (heimdall@mail.org)
> 
> 


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
