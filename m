Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s2C0247I025854
	for <linux-lvm@redhat.com>; Tue, 11 Mar 2014 20:02:04 -0400
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2C022Nj027268
	for <linux-lvm@redhat.com>; Tue, 11 Mar 2014 20:02:03 -0400
Received: by mail-pa0-f50.google.com with SMTP id kq14so271266pab.9
	for <linux-lvm@redhat.com>; Tue, 11 Mar 2014 17:02:02 -0700 (PDT)
Received: from leela (host-134-71-248-24.allocated.csupomona.edu.
	[134.71.248.24])
	by mx.google.com with ESMTPSA id sm5sm3908926pab.19.2014.03.11.17.02.00
	for <linux-lvm@redhat.com>
	(version=TLSv1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Mar 2014 17:02:01 -0700 (PDT)
Sender: Paul Henson <paul.b.henson@gmail.com>
From: "Paul B. Henson" <henson@acm.org>
Date: Tue, 11 Mar 2014 17:01:55 -0700
Message-ID: <0b4701cf3d86$4a25d8a0$de7189e0$@acm.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Language: en-us
Subject: [linux-lvm] migrating a thick LV to a thin LV
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
To: linux-lvm@redhat.com

I'm looking at converting a system to using thin provisioning, and have a
handful of existing fixed size LV's I want to migrate to the thinpool.
Ideally, after the migration they would also be thinly provisioned, only
taking up the amount of space they are actually using, not their existing
size. All of them have ext4 filesystems on them.

One option would be to use resize2fs to shrink the filesystems down to their
bare minimum, resize the existing LV to that, dd it onto a thin LV of the
original size, and then run resize2fs again to bring the filesystem back to
full capacity without any blocks wasted.

However, I was wondering if I just dd'd the existing LV onto a thin LV of
the same size, and then ran fstrim, would that release the unused space? I
see that thin pools support passing down discards to the underlying device,
but it's not clear whether they also process them internally, freeing up
space in the thinpool that is no longer in use by the thin LV.

Any thoughts?

Thanks.
