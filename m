content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: [linux-lvm] snapshot questions
Message-ID: <D880FFC9CFDBA84FA13E9B166D06A123B64805@daedalus.kenamea.com>
From: "Kenny Gorman" <kenny@kenamea.com>
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
Date: Fri Nov  2 17:49:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: khayes@quicknet.net, linux-lvm@sistina.com

I use cooked file systems for Oracle not RAW.  I am not sure MySQL has
an similar function to Oracle Hot Backup.  Basically, oracle suspends
writes to the datafiles for the tablespaces in Hot Backup by keeping the
whole blocks in the redo logs.  Since MySQL (to my knowledge) doesn't do
something like this, your datafiles will get corrupted when you
snapshot.   I am not sure the 'flush to disk' idea will work... unless
(and maybe your saying this and I am not getting it) MySQL will suspend
writes until your snapshot is done.  I suppose that would work...

In Oracle, the files that are part of the snapshot are not consistent
(corrupted).  Thats just how it works.  Then when you use Oracle to
recover, it puts together the coherent database image using the System
Change Number and the blocks in the redo logs (recovery structures) and
archive logs.  It's pretty advanced in this regard.

We use Veritas in production with Sun.  I am evaluating using Linux in
production.  I am using a SuSE Linux box in production for another
project, and it's stable. Plan to start using snapshots soon in both
environments if the evaluation works out.  Currently snapshots are in
use on testing/dev boxes.

-kg


-----Original Message-----
From:	Kyle Hayes
Sent:	Fri 11/2/2001 3:05 PM
To:	linux-lvm@sistina.com; Kenny Gorman
Cc:=09
Subject:	Re: [linux-lvm] snapshot questions

On Friday 02 November 2001 13:59, Kenny Gorman wrote:
> I will try to quicky summarize what _I_ do:
>
> - Yes snapshots work.
> - No, it's not a 1 to 1 disk usage ratio between the vg and the
snapshot
> vol.  It's much less.  I dont know how to test for fullness using
> Linux/LVM yet.
> - I use Oracle, your DB may be different.
> 1) put the tablespaces in hot backup mode
> 2) take a snapshot (mount the snapshot vol) of the volume/s that the
> tablespace is on
> 3) take the db out of hot backup mode.

I use MySQL in a mode that uses files in the filesystem.  Does your
Oracle installation use raw disk or files?  If it is raw disk, then
I probably need to do something that will flush disk changes somehow.
I am hoping that the VFS hooks will make the filesystem flush its=20
buffers to disk so that I don't get a snapshot full of garbage.  I
suppose that Oracle will flush all buffers to disk (thus making a
coherent disk image) when you put it into hot backup mode.

When I tell MySQL to flush its tables, it simply writes out everything
it
can, closes and reopens the files.  Thus it is up to the filesystem/OS
to
get the data to the disk in a reasonable fashion.

Interestingly, this may imply (and this seems to be in line with some of
the responses I read) that journaling filesystems may actually be more
of a problem than non-journaling ones.  Weird, but seems to make sense.

> - I also do some checkpointing, etc in my script.

We keep live remote replicas, but sometimes the replica needs to be
rebuild.  In that case, it is very important to have a means of getting
a completely coherent database snapshot.  Right now, this process is
very
carefully done with lots of highly database specific code.  Ick.  It is
a
pain to maintain and has a lot of edge cases that we find from time to
time :-)  We'd like something a little simpler and more complete.

> - the tape drive can then get the backup from the snapshot.

In our case, we spool it off remotely, but I get the idea.

> - You would restore the image from tape, to a new or the orig. volume
> when you recover.
> - no noticable effect on end users, it's a 24/7 thing.  Restores work
> fine.

So you have this in production?

> It's really not all that scary. Sorry for not going into more
technical
> detail.

No problem.  I am still figuring out how to deal with LVM.  It looks
like
the solution to all our problems, but I want to make sure before we
spend=20
more time on it.  Our existing solution works, but it costly to
maintain.

Best,
Kyle

--=20
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
MicroTelco Services saves money on every Fax:
- Fax to email (FREE)
- Fax to PSTN based Fax (Up to 95% Savings)
- Fax Broadcasting: Send 100s of faxes to fax machines
and email addresses in the time it takes to send just one!
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
    So send a fax today and let us know what you think!=20
       For more info. visit: www.internetfaxjack.com
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
