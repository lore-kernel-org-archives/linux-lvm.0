Message-ID: <2D92FEBFD3BE1346A6C397223A8DD3FC092055@THOR.goeci.com>
From: Murthy Kambhampaty <murthy.kambhampaty@goeci.com>
MIME-Version: 1.0
Subject: [linux-lvm] RE: Recent dissections
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
Date: Fri Oct 25 12:36:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Luben Tuikov' <luben@splentec.com>, linux-xfs <linux-xfs@oss.sgi.com>, linux-lvm <linux-lvm@sistina.com>

BTW, is this with LVM from the kernel (1.0.3 in 2.4.19, and XFS CVS) or some
other? Does the problem(s) appear when using LVM 1.0.3 and LVM tools
1.0.[345] ?

Thanks,
	Murthy

-----Original Message-----
From: Luben Tuikov [mailto:luben@splentec.com]
Sent: Friday, October 25, 2002 12:55
To: linux-xfs; linux-lvm
Subject: Recent dissections


As the folks on linux-xfs know, I've recently tried to
get xfs on top of lvm on top of raid5 on top of some
scsi disks to work.

Here are some recent curiosities which for now seem
to reconcile mount-s in D and BUG() in unlock_page():

Here is the basic framework:

 FS --> LVM --> md(raid5) --> scsi disks           (1)

when FS = ext2, the above set up works alright,
when FS = xfs, then as you know either mount
would sleep indefinitely on down(), or BUG() in unlock_page().

I've written a tiny SCSI simulator driver for
block devices (non-SCSI; unrelated to all this),
lets call it ``sbs''.

Strangely when the above set up is like so:

 xfs --> LVM --> sbs --> md(raid5) --> scsi disks  (2)

then everything works all right.

The only way I can explain this, is that the transformation
that bh's get along the way down and up somehow confuse
xfs in setup (1), (remember ext2 works all right in (1)),
but when sbs is in between LVM and md then things are ok
for xfs.

This ``solution'', was prompted by other curiosities we found
out here, like when either md or LVM was missing from (1)
with xfs, then things worked ok.

So, to make everyone happy, we put sbs in the middle of
LVM and md (see (2)), so that from xfs's point of view
it looks like LVM is talking to a scsi block device, and
from md's point of view it looks like it (md) is getting
its bh's from the linux block layer.

I hope those curiosities help ppl get some/any clue(s)
as to what could be happening and resolve this -- especially
those who know what fs/xfs/pagebuf/*.c is all about...

Bh's transformation, collecting them back into a page in
xfs from xx_end_io(), etc... where could it be?

-- 
Luben

P.S. No sensible performance penalties for putting sbs in
the middle. But that's irrelevant.
