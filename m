Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p6FE49X9017162
	for <linux-lvm@redhat.com>; Fri, 15 Jul 2011 10:04:09 -0400
Received: from mail-fx0-f49.google.com (mail-fx0-f49.google.com
	[209.85.161.49])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p6FE47Gh010189
	for <linux-lvm@redhat.com>; Fri, 15 Jul 2011 10:04:08 -0400
Received: by fxd20 with SMTP id 20so1957604fxd.36
	for <linux-lvm@redhat.com>; Fri, 15 Jul 2011 07:04:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAH5HgO9aRwAsjH2hprM=HhnKhZV4h1hewNp8G_VEm0Fvs8bptQ@mail.gmail.com>
References: <CAH5HgO9aRwAsjH2hprM=HhnKhZV4h1hewNp8G_VEm0Fvs8bptQ@mail.gmail.com>
Date: Fri, 15 Jul 2011 10:04:07 -0400
Message-ID: <CAEhu1-6hX4RpATAwQuWNUwG2ZD-eQikwF7qzTxCRyCwUFwHZ9g@mail.gmail.com>
From: John Drescher <drescherjm@gmail.com>
Subject: Re: [linux-lvm] Recovery from a failed motherboard
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Jul 15, 2011 at 9:48 AM, Tom Epperly <tepperly@gmail.com> wrote:
> I had a Linux system that I used for backups running Bacula. It had
> two physical volumes (actual separate SATA hard disks) that were
> combined into a logical volume group. The motherboard of this system
> is dead, but there is some reason to believe the physical hard disks
> may be fine.
>
> I am wondering if there is a way I can plug these two physical disks
> into another Linux box and access the file system that's on the
> logical volume group.

Yes. It should work without issue. Many times I have booted a system
(home and work) with volume groups on a sysrescuecd and my volume
groups show up without issue.

John
