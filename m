Message-Id: <199902161324.AA26397@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] User count, general question for all y'all
Date: Tue, 16 Feb 1999 14:22:45 MET
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com


> 
> Are we all (on this list) actively using lvm, and in what
> configuration? How many of us are there?
> 

I use it 8*)))

> Also, has anyone encountered deadlocks during heavy IO?

Yes, i did from the early 2.1.x times on.
The question is which Linux version you are using _and_
which aic7xxx version if any.

It turned out to be a mass i/o lock which can be seen without LVM too.
Things turned out to be better in the later 2.1.x and in 2.2.x.

A problem still stays which Stephen Tweedie and others are addressing right now:
with large quantity i/o 2.2.1 preferes allocation of buffer pages vs.
keeping process pages in memory making the system _very_ lazy ;*)


> I'm
> only using LVM at this point as a method of easy partitioning.
> No mirroring, etc. I suspect reiserfs is to blaim on my system,
> but I just thought I'd ask.
> 

Mybe it's a big mkreiserfs forcing the metioned behaviour?

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
