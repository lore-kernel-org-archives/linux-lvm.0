Date: Fri, 9 Jun 2000 08:59:45 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@Sistina.com>
Subject: Re: [linux-lvm] LVM 0.8final for 2.2.15/2.2.16?
Message-ID: <20000609085945.C6522@hmsysv.t-online.de>
Reply-To: Mauelshagen@Sistina.com
References: <20000608103415.A3935@gruyere.muc.suse.de> <Pine.LNX.4.21.0006081245010.3252-100000@rossi.itg.ie> <20000608143407.D9694@jadzia.josv.com>
Mime-Version: 1.0
In-Reply-To: <20000608143407.D9694@jadzia.josv.com>; from josv@osp.nl on Thu, Jun 08, 2000 at 02:34:07PM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jos Visser <josv@osp.nl>
Cc: linux-lvm@msede.com

On Thu, Jun 08, 2000 at 02:34:07PM +0200, Jos Visser wrote:
> And thus it came to pass that Paul Jakma wrote:
> (on Thu, Jun 08, 2000 at 12:49:53PM +0100 to be exact)
> 
> > On Thu, 8 Jun 2000, Andi Kleen wrote:
> > 
> > > consider a database that uses user space journaling using fsync:
> > > to make its disk files consistent after the snapshot it requires
> > > both the log write and the data write. When one is missing the
> > > log needs to be replayed, which requires writes.
> > 
> > but doesn't the call to block_fsync that Heinz confirmed exists cover
> > this?
> > 
> > nothing can cover the case where app data consistency depends on a future
> > write(). But that's the app's problem, and anyway a good database should
> > be consistent/recover itself if it's died between write(?)'s. right?
> > 
> > (in which case lvm snapshot is perfectly suitable for backing up
> > databases..)
> 
> Most databases want you to store their log and data spaces in different 
> (logical) volumes.

Exactly.

That's why i'll implement atomic activation off multiple snapshot.

The idea is:

 - prepare multiple _inactive_ snapshots
 - activate them afterwards at once

Heinz

> To create a consistent image you would want to be
> able to snapshot multiple logical volumes atomically in one operation.
> HP's LVM supports this through the "multiple atomical lvsplit"
> feature (as of HP-UX 10 if memory serves me right).
> 
> ++Jos
> 
> -- 
> The InSANE quiz master is always right!
> (or was it the other way round? :-)

-- 

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                Sistina Software Inc.
Senior Consultant/Developer                      Bartningstr. 12
                                                 64289 Darmstadt
                                                 Germany
Mauelshgen@Sistina.com                           +49 6151 710386
                                                      FAX 710396
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
