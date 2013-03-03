Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r23BiMXR001001
	for <linux-lvm@redhat.com>; Sun, 3 Mar 2013 06:44:22 -0500
Received: from rrba-ip-smtp-3-4.saix.net (rrba-ip-smtp-3-4.saix.net
	[196.25.240.214])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r23BiIcH016779
	for <linux-lvm@redhat.com>; Sun, 3 Mar 2013 06:44:19 -0500
Received: from atlantis.dyndns.uls.co.za (dsl-144-201-64.telkomadsl.co.za
	[41.144.201.64])
	by rrba-ip-smtp-3-4.saix.net (Postfix) with ESMTP id 4BF2A16D
	for <linux-lvm@redhat.com>; Sun,  3 Mar 2013 13:44:14 +0200 (SAST)
Received: from [192.168.40.204]
	by atlantis.dyndns.uls.co.za with esmtpa (Exim 4.76)
	(envelope-from <jaco@uls.co.za>) id 1UC7Kw-0006q8-FH
	for linux-lvm@redhat.com; Sun, 03 Mar 2013 13:44:14 +0200
Message-ID: <513337DE.4030409@uls.co.za>
Date: Sun, 03 Mar 2013 13:45:34 +0200
From: Jaco Kroon <jaco@uls.co.za>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------060800020009080704090405"
Subject: [linux-lvm] co-operative snapshots
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------060800020009080704090405
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Guys,

I've got a client who wants hourly snapshots for "backup" (rollback
rather) purposes.  Currently it seems each snapshot maintains the fill
difference between the time it was made and the "current" copy.  I was
wondering whether there is a way to get them to co-operate/fork/chain
them or in such a way that every time a write happens not all snapshots
needs to be updated.  Since I really don't know what the concept
should/would be called (or if it even exists) let me describe what I'm
thinking.

As I understand it, a LV is just a logical block - whilst it can consist
of a bunch of smaller blocks it's effectively a linear sequence of bytes.

A snapshot is made by continually copying blocks in the original LV
that's written to into the snapshot and keeping track of which blocks
has been changed.

Let's assume a small LV of 10 blocks.  All the blocks are "0" initially.

Now we immediately create a snapshot (s1), then write a "1" to block 1. 
So now the original block is copied into the snapshot, and the origin LV
is updated.

Now we create another snapshot of the origin LV (s2).  Now, if we write
to block 1 s2 will copy the new data, and s1 will not do anything since
it already made a copy of the block.  If, however we write to block 2
*both* snapshots will copy the block (if I'm not mistaken).  This is
wasteful in terms of resources (for my use case least).

Now, if s1 stopped copying stuff once s2 was made, but somehow indicated
that it's "origin" is now s2 instead of the actual origin, then the
*presented* data from s2 would not change, thus negating the need to
copy further blocks into s1.  Thus effectively if, at the time of
creating s2 I can change the origin of s1 from the original LV to s2
then when block 2 above changes it will *only* be copied to s2, not to
s1 as well.

I know that snapshots of snapshots is possible, but I have no idea how
to use that to achieve the above (if it is even possible).  Basically
every hour currently I create a new snapshot, I keep those for 24 hours,
after which I remove all snapshots where the hour is not divisable by 6,
those I keep for 3 days, after which I keep the 0:00 snapshots for a
week.  After a while the IO to maintain all the identical copies of the
data seem to be getting very significant, and I am hoping there's a way
to reduce that.  Obviously I'd also like to be able to combine two
sequential snapshots.

There are obviously a miriad of impact here, for example, how do you
merge/collapse/remove snapshots, for example, let's I now want to roll
back the original LV to s1 then I'd first need to merge back to s2 and
then I can merge s1.  Like when I have s1, s2 and s3 (in that order)
from LV, then I decide I no longer need s2 - this doesn't affect s3, but
does have impact for s1 - so one would need to collapse/fold s2 into s1
somehow.

In principle I think this would be extremely useful, less wasteful of IO
capacity for my purposes perfect.  There is however one major risk that
I can see, if s2 becomes invalid, then all snapshots that's chained to
it also becomes invalid (s1 in this case).  It should be noted that this
is a MAJOR risk.  I think thin pools would be extremely useful in
combination here so that one can over-allocate the snapshots by a
reasonable margin, and also so that snapshots that becomes chained don't
use more space than actually required.

Opinions please?

-- 
Kind Regards,
Jaco Kroon

--------------060800020009080704090405
Content-Type: text/x-vcard; charset=utf-8;
 name="jaco.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="jaco.vcf"

begin:vcard
fn:Jaco Kroon
n:Kroon;Jaco
org:Ultimate Linux Solutions CC
email;internet:jaco@uls.co.za
title:Managing Member
tel;work:0873513298
tel;fax:0866488561
tel;cell:0845158255
url:http://www.uls.co.za/
version:2.1
end:vcard


--------------060800020009080704090405--
