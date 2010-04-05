Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o35GpYWv012222
	for <linux-lvm@redhat.com>; Mon, 5 Apr 2010 12:51:34 -0400
Received: from mail-vw0-f46.google.com (mail-vw0-f46.google.com
	[209.85.212.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o35GpLXt019058
	for <linux-lvm@redhat.com>; Mon, 5 Apr 2010 12:51:24 -0400
Received: by vws13 with SMTP id 13so1609569vws.33
	for <linux-lvm@redhat.com>; Mon, 05 Apr 2010 09:51:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4BB9EDDF.8020003@cfl.rr.com>
References: <4BB9EDDF.8020003@cfl.rr.com>
Date: Mon, 5 Apr 2010 09:51:20 -0700
Message-ID: <t2oea5cdf451004050951q3abe7897g2a51eee78f323aa1@mail.gmail.com>
From: Bryan Whitehead <driver@megahappy.net>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Strange errors trying to mirror
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

What's up with "-i 5"? Doesn't that map to striping? you can't stripe
across 5 pv's if you only have 2.

On Mon, Apr 5, 2010 at 7:04 AM, Phillip Susi <psusi@cfl.rr.com> wrote:
> I'm trying to mirror my root fs and get errors that make no sense. �What
> am I missing?
>
> �PV � � � � VG � Fmt �Attr PSize � PFree
> �/dev/sda1 �vg0 �lvm2 a- � 111.79G �61.79G
> �/dev/sdb1 �vg0 �lvm2 a- � 111.79G 111.79G
>
> lvconvert -m1 -i 5 vg0/root
> �Insufficient suitable allocatable extents for logical volume : 7680
> more required
> �Unable to allocate extents for mirror(s).
>
> Then I tried explicitly telling it to allocate from sdb1:
>
> lvconvert -m1 -i 5 vg0/root /dev/sdb1
> �Not enough PVs with free space available for parallel allocation.
> �Consider --alloc anywhere if desperate.
> �Unable to allocate extents for mirror(s).
>
> There are two PVs so why does it complain?
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
