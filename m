From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200003080812.JAA11917@u9etz.ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] Snapshot documentation
Date: Wed, 8 Mar 2000 09:12:51 +0100 (MET)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com


Enabling you to create snapshots with less space than that of the
Original Logical Volume is an option to save space in case you have
data which doesn't change a lot.

The only chance to deal with for eg. a filesystem which changes rapidly
and in the extrem case totally is to create equal sized snapshots.

Heinz

> Hi,
> 
> Been playing with snapshots and am noticing I can create a snapshot with
> less PE's than my source LV that I'm snapshotting, with the small side
> effect of:
> 
> lvcreate -- WARNING: all snapshots will be disabled if more than 12 MB are
> changed
> 
> Is the above message implying that if I change more than 12MB of data on
> my source LV that the snapshot is then defunct/useless?  Does that include
> deletes, etc?
> 
> Mainly a pointer to any information or documentation regarding how this
> all works would be well appreciated.  I'm noticing LVM has some HP history
> involved, so I'll go see if they have relevant data in their HPUX docs.
> 
> Maybe this is included in the recent EN-HOWTO I noticed mention of as
> well?
> 
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
