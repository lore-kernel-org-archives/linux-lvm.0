From: Kyle Hayes <khayes@quicknet.net>
Subject: Re: [linux-lvm] snapshot questions
References: <3.0.6.32.20011102140312.00806c50@mail.doorpi.net> <0111021621181I.08803@khayes-lin> <3BE66C5A.C5BA896C@promofinarsa.es>
In-Reply-To: <3BE66C5A.C5BA896C@promofinarsa.es>
MIME-Version: 1.0
Message-Id: <01110508512502.30934@khayes-lin>
Content-Transfer-Encoding: 8bit
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Mon Nov  5 10:50:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, Jesus Manuel NAVARRO LOPEZ <jesus_navarro@promofinarsa.es>

On Monday 05 November 2001 02:39, Jesus Manuel NAVARRO LOPEZ wrote:
> Hi again, Kyle:
>
> Kyle Hayes wrote:
>
>
> [...]
>
> > > Depending on your I/O and response requirements, you can do the
> > > backups while your tables are in hot backup mode, without using
> > > snapshots at all.
> >
> > With MySQL this is not possible at this time.  I suspect they'll have
> > it relatively soon.  They seem to add features based on demand and as
> > it expands in popularity, I suppose that better backup features will
> > be demanded.
>
> So, can I suppouse your RDBM is MySQL? If so, my previous assertion goes
> from *very sensible* to a totally must.  Don't go with snapshots, go
> with dump.  If it is safe to suppouse that there's not transaction-like
> operations spanning more than one database, write-block and dump on a
> per database basis, and pipe the dump to tar -z.  This will be safest
> method.  Well, there's no fool proof backup with MySQL apart from
> shuting down the engine and you can bet *there will be* database
> unconsistancies disregarding what you do to avoid them  (since even
> write blocking doesn't guard against bad programming practices and you
> can bet your database accessing programs will have more than a bug
> regarding "pseudo transacting" through multiple table locking).

Mysqldump is not an option due to the amount of time that it takes
to dump multiple databases of multiple gigabytes.  Far too slow.
We do not use transactions.  

MySQL has a separate tool called myisamchk for MyISAM tables (some
variation on ISAM I suppose) that does a very good job of correcting
problem.  Since MySQL only keeps index data in memory, only the indexes
tend to be corrupt.  We've had very good luck with this tool repairing
databases that have been corrupted due to hardware crashes etc.

> > The LVM solution seems like it will also be usable for other things
> > than databases.  I'd like to be able to create a set of scripts and
> > tools for our use that can be used for more than databases.
>
> What I would suggest is use snapshots for everything you want *except*
> database backups.  They can be acomplished easier and safer using
> mysqldump.

As stated above, far too slow.  We have remote replicas that we need to
rebuild from time to time (due to takedown for system maintenance etc.).
We do mysqldump backups on a few systems that are not time critical.  It
locks all tables while doing a dump of the whole system.  If you only
dump one database, it will then be out of sync with the others.  We have
written a lot of very specialized program code to get consistent/coherent
snapshots of our databases.  It is an ongoing struggle to do this and get
it right.

> > The locking tables part does this.  It prevents other threads from
> > writing to any table.  I explain this above.
>
> But it doesn't protect you against bad programming practices: *Any*
> multiple table writing *must* be wrapped between write blocks, *and*
> rollback code *must* be in place.  I bet that there's at least one
> operation on the code accesing those databases that doesn't follow this
> must.  In this case, sooner or later you will end up "cutting" a
> multiple writing operation by half when you write block tables for the
> backup.  *If* you're very carefull still you will be able to restore to
> a stable state using the mysqldump *and* a timestamped transaction log,
> but this is a pain in the ass.  Luckily enough MySQL is fairly stable,
> so you won't need your backups but very rarely.

Since we do not use transactions at all, we are able to relax the requirements
of "standard" database programs.  We can do a snapshot of the system with
partially completed transactions and our software and checking programs
have no problems.  We've written the code to expect that some things just
aren't complete yet.  This is not a standard database application.

> > You have the choice in MySQL of locking all tables, or a subset.  If
> > you lock a subset, then you'll probably get a partially incoherent
> > snapshot.
>
> Well yes.  As it usually turns to be even if you can find common groups
> of tables that can be locked since no operation crosses its boundaries,
> things will change tomorrow without you noting it.  The only safe
> asumption is that you can block database by database instead of all
> databases at a time... provided you can policy-force there won't be
> cross-database operations.

No operations cross table set boundaries.  We wrote it that way.

> > I really like the fact that SuSE bundles all this stuff already so
> > that I do not have to go hunting all over the place for an RPM that
> > might work.  I love source but I don't have time to compile everything
> > myself.
>
> Not being used to the SuSE way, I can't say for sure but it surprises my
> that SuSE will do "thingies" regarding drivers on a different way RH
> does, or that you have less problems "haunting" RPMs for SuSE than for
> RH.

SuSE simply comes with virtually everything we've ever needed.  Red Hat
required too much hunting on the Internet for RPMs that might or 
might not work.  

If SuSE generally doesn't have the RPM on their CDs or web site, it is
more than likely that no one has an RPM.  In that case, we use source.

The only problem we have with SuSE is that it is hard to strip it down
to a minimum for deployment on locked-down servers.  

This is getting rather off topic for the LVM list :-)

To bring it back on topic.  I have learned so far that:

1) if your apps think they left everything on the filesystem in a
coherent state and,

2) if your filesystem thinks that it left the disk in a coherent
state,

then you will be able to use the snapshot facility without a problem.

We can insure 1 with no problem.  2 seems to require either patches or
new versions of various code.  I have not yet seen a full reply as to
what patches are necessary for which kernels.

I have seen that the AC kernels are being patched nearly up to the level
of what is in CVS.  But, this is for 2.4.x.  What about 2.2.x?  Is 2.2.20
going to have the latest LVM patches?

Best,
Kyle

-- 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
MicroTelco Services saves money on every Fax:
- Fax to email (FREE)
- Fax to PSTN based Fax (Up to 95% Savings)
- Fax Broadcasting: Send 100s of faxes to fax machines
and email addresses in the time it takes to send just one!
===========================================================
    So send a fax today and let us know what you think! 
       For more info. visit: www.internetfaxjack.com
===========================================================
