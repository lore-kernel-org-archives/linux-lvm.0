From: Kyle Hayes <khayes@quicknet.net>
Subject: Re: [linux-lvm] snapshot questions
References: <3.0.6.32.20011102140312.00806c50@mail.doorpi.net>
In-Reply-To: <3.0.6.32.20011102140312.00806c50@mail.doorpi.net>
MIME-Version: 1.0
Message-Id: <0111021341411E.08803@khayes-lin>
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
Date: Fri Nov  2 15:40:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hmm, seems to be quite a range of opinion.  However, I must say that
having so many negative options is not a good sign.  Do snapshots
work at all?

If I get a corrupted filesystem in my snapshot, then it doesn't work.

If I have to bend over backwards and change all my apps, then it does
not work.

It is good to hear that it works more like Veritas and less like the
SuSE whitepaper claims.  That paper claimed that the changes will go
to the snapshot partition.  This implied that there would be a terrible
IO hit when you deleted the snapshot partition and the changes need to
be written back to the original partition.

I am confused by the claim (see below) that you need the same amount
of space for the snapshot partition as you had on the original LV.
From what I understood in the HOWTOs and the whitepapers, you only need
as much space as you will have changes during the lifetime of the
snapshot LV.  And, if it works like Veritas, that implies that once
a PE was copied, any further data changes to it would not be copied.
This means that in situations like database systems, you'd actually
need less than the number of PEs that changed.  Is this correct?

Under what circumstances do snapshots work?  I am confused by the
claims that a snapshot partition is going to be "corrupt" as far as
the OS is concerned.  In my scenario, here is what I am planning on
doing:

1) lock all tables against writes.

2) flush all logs and tables to disk.

3) create a snapshot partition for the filesystem (ext2 or probably)
on which the database data resides.  These are not raw disks.

4) unlock the tables.

5) mount the snapshot partition and copy the database data out.

From what I have guessed so far (guesses, which makes me nervous),
if I make sure all changes are flushed to disk, then I am OK.  However,
the responses I have received are not clear on what conditions caused
the problems.

I am also not clear on which kernel and what patches I need to make
sure that the filesystems (ext2,ext3 and reiserfs) will deal with the
VFS patches.

We run 24/7 systems and it is not an option to take down a system to 
back it up.  We can handle slightly degraded performance, but even
that is a problem.

On Friday 02 November 2001 12:03, Brent Harding wrote:
> The only real issue with snapshots is needing a partition reserved for
> it, as you get more and more data, this gets difficult, once half the
> hard disk is full, you can't copy any more. I'd say it sounds easier to
> just use whatever backup program with cron to execute late at night,
> maybe after midnight, depends how far backup is when a file changes,
> it'll get included if it wasn't backed up yet, otherwise if you change
> something the system already backed up, it gets done on the next run.

This is not what I understood from the HOWTO's and the SuSE whitepaper.
They are quite clear that you only need enough space to contain the
changes that occur while the snapshot partition exists.  

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
