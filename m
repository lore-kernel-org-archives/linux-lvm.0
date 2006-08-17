Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7HCxwY3024417
	for <linux-lvm@redhat.com>; Thu, 17 Aug 2006 08:59:58 -0400
Received: from bluewhale.planbit.co.uk (82-71-36-240.dsl.in-addr.zen.co.uk
	[82.71.36.240])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k7HCxpxt018295
	for <linux-lvm@redhat.com>; Thu, 17 Aug 2006 08:59:52 -0400
Received: from wolverine (unknown [192.168.1.127])
	by bluewhale.planbit.co.uk (Postfix) with ESMTP id BD37C12EDE
	for <linux-lvm@redhat.com>; Thu, 17 Aug 2006 13:59:45 +0100 (BST)
From: "Roger Lucas" <roger@planbit.co.uk>
Date: Thu, 17 Aug 2006 13:59:32 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20060817125945.BD37C12EDE@bluewhale.planbit.co.uk>
Subject: [linux-lvm] Merging snapshots - does lvmerge or similar exist for
	Linux
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

Hi,

I have seen a few questions about this but could not find any answers.

I am working with Debian, the 2.16.20 kernel and the latest LVM+DMAPPER
releases.

I have a logical volume that I want to be able to make changes to, but
unroll these changes again if necessary.  When the operations are finished,
I want to end up with just one LV and no additional snapshots.  The LV would
either have its original contents or the updated contents, and this decision
isn't made until all the changes have been done.

With LVM2, the snapshots are r/w so I could either:

1) Snapshot the original LV and keep the snapshot safe, then make the
changes to the original LV.  If I don't need to restore the LV after
applying the changes, then I can just delete the snapshot.  If I do want to
restore the original LV, however, what is the best way to flush the changes
in the snapshot back onto the original LV ?

I appreciate that I could just "dd" the snapshot onto the LV to restore its
orignal state, but this will rewrite a lot of data that hasn't actually
changed.  Apart from being slower than I would like, I don't know if writing
exactly the same data to the LV will trigger the data to be written to the
snapshot - if it does then the snapshot will grow in size to the original LV
whilst the "dd" happens, and I do not have enough disk space for that.

Or

2) Snapshot the original LV and make the changes to the snapshot.  If I want
to restore the original LV, then all I need to do is delete the snapshot.
But, if I want to keep the changes (and not have to keep the snapshot), how
can I flush the changes that have been made to the snapshot back onto the
original LV.  

I appreciate that I could just "dd" the snapshot onto the LV to update it to
the new values, but I don't like this for the same reasons as in (1) above.

Is there an "lvmerge" command or similar on Linux LVM.  There appears to be
one for the HP-UX LVM but I couldn't see one for Linux.

Alternatively, is the snapshot disk format easy enough to analyse so that a
lvmerge utility could be written relatively easily ?

Thanks,

Roger
