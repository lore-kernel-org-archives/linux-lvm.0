From: James Hawtin <oolon@ankh.org>
Subject: Re: [linux-lvm] Backup costs (was: LVM reimplementationre)
In-Reply-To: <3C625CCE.1A213D80@lmco.com>
Message-Id: <Pine.LNX.4.10.10202071056180.8754-100000@pzat.meep.org>
MIME-Version: 1.0
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
Date: Thu Feb  7 05:31:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Meep, What I thread I started. I did orginally have an LVM related point,
but I kind of failed to include it and sent a rant insted ;-) Anyway my
point was that backups are slow and expensive and not everyone has them.
Many of the commands in lvm say "make sure you do a backup first" This is
not necessarily possible. I personally believe lvm should not in its self
FSCK period. Personally I have suffered with 1.0.1 release on a 2.4.17
system that would crash on vgremove operations, I also could not vgreduce 
my volume group etc (This was on an SMP system). I got damn good at
working arround it using reboots, dd and multiple disk... But dang I
should not have to. I know that problem is fixed in the CVS version that I
am currently using and now there (I believe there is a newer version). I
am sure I am not alone in not liking to run CVS version and prefer snap
shot releases which have identifiable version numbers. It took months for
1.0.2 to be released, then shortly after I hear there is LVM 2. As I said
I believe LVM should not fsck up, why was no time invested in doing a
1.0.1.1 release.

I beleive LVM operations should be undoable, unless, someone has rebuilt a
filesystem over the top of old data, it should not matter what you do to
the lvm in the vertual layout the orginal stats should be EASILY
restoreable. I am not talking about playting hunt the .conf file, An undo
should be included.

The time undo would come is most useful is for resize operations, at the
moment you have to resize the underlying filesystem, then strink the the
lvm, however if you strink the lvm too much your in problems. I was told
if you expand it again and lvm picks the same blocks to use in the same
order everything would be ok... Fine great.. why not just allow an undo so
you can aways get the right blocks.

The reasons resize scares me, is all in needs is someone to define MB or
GB differently and your up S..T creek, is the block could 1k or 512
bytes... Was that M option MiB or MB most people say MB whent hey mean
MiB. Was there and "overhead" of a few blocks magically required when i
asked for a 1GiB filesystem... etc.

James
