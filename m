From: Kyle Hayes <khayes@quicknet.net>
Subject: Re: [linux-lvm] snapshot questions
References: <3.0.6.32.20011102140312.00806c50@mail.doorpi.net> <0111021341411E.08803@khayes-lin> <20011102153947.P746@lynx.no>
In-Reply-To: <20011102153947.P746@lynx.no>
MIME-Version: 1.0
Message-Id: <0111021621181I.08803@khayes-lin>
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
Date: Fri Nov  2 18:20:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Friday 02 November 2001 14:39, Andreas Dilger wrote:
> On Nov 02, 2001  13:41 -0800, Kyle Hayes wrote:
> > I am confused by the claim (see below) that you need the same amount
> > of space for the snapshot partition as you had on the original LV.
>
> They are wrong.

Phwew!

> > Under what circumstances do snapshots work?  I am confused by the
> > claims that a snapshot partition is going to be "corrupt" as far as
> > the OS is concerned.
>
> You need to ensure that the the data/filesystem is "synced" at the
> time that you create the snapshot.  With journaling filesystems,
> you need to use the VFS locking.  With other filesystems, you
> should be OK with a "sync" (which is done for you in the kernel).
> For oracle, you need to put your tablespaces into hot backup mode.

So, the act of creating a snapshot partition actually does the same
thing that running 'sync' would?  I.e. all the dirty write buffers
are flushed to disk.

For the database partition we will probably use Ext2.

> > 1) lock all tables against writes.
>
> Is this the same as hot backup?  At a company I used to work for, we
> did live backups without any kind of outage.  Oracle would commit
> the writes into a journal (or whatever, don't know the correct term)
> and then commit them once the table was out of hot backup mode.  No
> need to lock all writes.

The lock prevents other apps from changing anything.  This ensures that
nothing will change (perhaps atime entries in the inode since reads can
still occur).

The flush tables action after that will cause MySQL to flush anything it
buffered to disk.  

At that point, I have an unchanging, flushed (to the filesystem) version
of the tables.  It is coherent at this point if the filesystem is OK.

> Depending on your I/O and response requirements, you can do the backups
> while your tables are in hot backup mode, without using snapshots at
> all.

With MySQL this is not possible at this time.  I suspect they'll have it
relatively soon.  They seem to add features based on demand and as it
expands in popularity, I suppose that better backup features will be 
demanded.

The LVM solution seems like it will also be usable for other things
than databases.  I'd like to be able to create a set of scripts and
tools for our use that can be used for more than databases.

On Friday 02 November 2001 15:50, Kenny Gorman wrote:
> I use cooked file systems for Oracle not RAW.  I am not sure MySQL has
> an similar function to Oracle Hot Backup.  Basically, oracle suspends
> writes to the datafiles for the tablespaces in Hot Backup by keeping the
> whole blocks in the redo logs.  Since MySQL (to my knowledge) doesn't do
> something like this, your datafiles will get corrupted when you
> snapshot.   I am not sure the 'flush to disk' idea will work... unless
> (and maybe your saying this and I am not getting it) MySQL will suspend
> writes until your snapshot is done.  I suppose that would work...

The locking tables part does this.  It prevents other threads from writing
to any table.  I explain this above.

> In Oracle, the files that are part of the snapshot are not consistent
> (corrupted).  Thats just how it works.  Then when you use Oracle to
> recover, it puts together the coherent database image using the System
> Change Number and the blocks in the redo logs (recovery structures) and
> archive logs.  It's pretty advanced in this regard.

You have the choice in MySQL of locking all tables, or a subset.  If you
lock a subset, then you'll probably get a partially incoherent snapshot.

The lock plus flush actions are fast enough that I think we can use them
successfully for this purpose.

> We use Veritas in production with Sun.  I am evaluating using Linux in
> production.  I am using a SuSE Linux box in production for another
> project, and it's stable. Plan to start using snapshots soon in both
> environments if the evaluation works out.  Currently snapshots are in
> use on testing/dev boxes.

I am doing all my testing on SuSE as well.  We have deployed Red Hat
in the past, but have not been thrilled with the stability of the
product.  By the time you get to a X.2 or so, they are fine.  We had
problems with installation of binary drivers on Red Hat (they were our
own drivers!) too, so that also has soured us on it.  We have since
released our drivers under the GPL, so that isn't as much of an issue,
but about 75% of the extra work in the configuration and installation
testing just tests Red Hat specific quirks.  Sigh.

I really like the fact that SuSE bundles all this stuff already so
that I do not have to go hunting all over the place for an RPM that
might work.  I love source but I don't have time to compile everything
myself.

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
