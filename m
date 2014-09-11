Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8BDnDwN030280
	for <linux-lvm@redhat.com>; Thu, 11 Sep 2014 09:49:13 -0400
Received: from michael.mail.tiscali.it (michael.mail.tiscali.it
	[213.205.33.246])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8BDnAuj020608
	for <linux-lvm@redhat.com>; Thu, 11 Sep 2014 09:49:11 -0400
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Thu, 11 Sep 2014 15:49:02 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <53B41EA2.3010203@assyoma.it>
References: <53B41EA2.3010203@assyoma.it>
Message-ID: <ec2642484312b60a76e570e45a4f2bc9@assyoma.it>
Subject: Re: [linux-lvm]
	=?utf-8?q?LVM_and_I/O_block_size_=28max=5Fsectors=5Fk?=
	=?utf-8?q?b=29?=
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com
Cc: g.danti@assyoma.it

> Hi all,
> it seems that, when using LVM, I/O block transfer size has an hard
> limit at about 512 KB/iop. Large I/O transfers can be crucial for
> performance, so I am trying to understand if I can change that.
> 
> Some info: uname -a (CentOS 6.5 x86_64)
> Linux blackhole.assyoma.it 2.6.32-431.20.3.el6.x86_64 #1 SMP Thu Jun
> 19 21:14:45 UTC 2014 x86_64 x86_64 x86_64 GNU/Linux
> 
> From my understanding, maximum I/O block size for physical device can
> be tuned from /sys/block/sdX/queue/max_sectors_kb.
> 
> Some quick iostat -k -x 1 show that, for physical device, the tunable 
> works:
> 
> # max_sectors_kb=512 (default)
> dd if=/dev/zero of=/dev/sdd1 bs=2M count=16 oflag=direct
> iostat -x -k 1 /dev/sdd: avgrq-sz=1024 (1024 sectors = 512KB = 
> max_sectors_kb)
> 
> # max_sectors_kb=2048
> dd if=/dev/zero of=/dev/sdd1 bs=2M count=16 oflag=direct
> iostat -x -k 1 /dev/sdd: avgrq-sz=2048 (2048 sectors = 1024 KB)
> 
> dd if=/dev/zero of=/dev/sdd1 bs=4M count=16 oflag=direct
> iostat -x -k 1 /dev/sdd: avgrq-sz=2730.67 (2730 sectors = ~1350 KB)
> 
> As you can see, I can't always reach 100% efficienty but I came
> reasonably close.
> 
> 
> The problem is that, when using LVM2 (on software raid10), I can not
> really increase I/O transfer size. Setting both sd*, md* and dm-* to
> max_sectors_kb=2048 leads to _no_ increase in I/O blocks, while
> decreasing the max_sectors_kb works properly:
> 
> # max_sectors_kb=2048
> dd if=/dev/zero of=/dev/vg_kvm/TEST bs=2M count=64 oflag=direct
> iostat -x -k 1 /dev/vg_kvm/TEST: avgrq-sz=1024.00 (it remains as 512KB)
> 
> # max_sectors_kb=256
> dd if=/dev/zero of=/dev/vg_kvm/TEST bs=2M count=64 oflag=direct
> iostat -x -k 1 /dev/vg_kvm/TEST: avgrq-sz=512.00 (512 sectors = 256KB
> = max_sectors_kb)
> 
> Now, two questions:
> 1) why I see this hard limit?
> 2) can I change this behavior?
> 
> Thank you very much.

Hi all,
sorry for bumping up this thread.

Anyone has an explanation for what I see? I am missing something?

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
