Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o8KBGSOw030545
	for <linux-lvm@redhat.com>; Mon, 20 Sep 2010 07:16:28 -0400
Received: from smtp135.mail.ukl.yahoo.com (smtp135.mail.ukl.yahoo.com
	[77.238.184.66])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id o8KBGGgF024774
	for <linux-lvm@redhat.com>; Mon, 20 Sep 2010 07:16:17 -0400
Date: Mon, 20 Sep 2010 12:16:22 +0100
From: Stephane Chazelas <stephane_chazelas@yahoo.fr>
Message-ID: <chaz20100920111622.GA3547@yahoo.fr>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] restoring snapshots
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hiya,

I was wondering about how to restore/apply a LVM snapshot to the
original partition. Looking at the archive, I can see it's
advised to dump the snapshot content into a file and then dump
that onto the original device after having removed the snapshot.

What's wrong with:

lvcreate -n lv -L1G vg
...
mount /dev/vg/lv /x
...
lvcreate -s -n lv_snap /dev/vg/lv
...
mount /dev/vg/lv_snap /y

Them to apply the snapshot:

umount /x /y
dd bs=4M < /dev/mapper/vg-lv_snap > /dev/mapper/vg-lv-real
lvremote /dev/vg/lv_snap

It's still not optimal as it writes the whole volume, but at
least, I don't have to find a storage area big enough to hold an
extra copy of the whole volume and it's faster.

It seems to be working on a test on /dev/loop. Is there any
circumstance (as long as there's only one snapshot of the
volume) where it wouldn't work, or what would be the potential
pitfalls (other than if there's a crash in the middle, you're
screwed)?

Is there any plan to add the feature to efficiently
restore/apply/commit a snapshot (that is only dump the cow data
onto the original volume without writing the whole volume) or
does that feature exist already and I missed it?

Thanks,
Stephane
