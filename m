Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o86KGn4L028812
	for <linux-lvm@redhat.com>; Mon, 6 Sep 2010 16:16:49 -0400
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o86KGauL032035
	for <linux-lvm@redhat.com>; Mon, 6 Sep 2010 16:16:37 -0400
Received: from racke (bk2.linbit [10.9.9.7])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 2EE3C108D420
	for <linux-lvm@redhat.com>; Mon,  6 Sep 2010 22:16:35 +0200 (CEST)
Date: Mon, 6 Sep 2010 22:16:34 +0200
From: Lars Ellenberg <lars.ellenberg@linbit.com>
Message-ID: <20100906201634.GC2377@racke>
References: <001901cb4ddf$d3bff6d0$7b3fe470$@com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <001901cb4ddf$d3bff6d0$7b3fe470$@com>
Subject: Re: [linux-lvm] Does LVM-LV take system cache? Sure.
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

On Tue, Sep 07, 2010 at 12:23:23AM +0800, Kirby Zhou wrote:
> Does LVM-LV take system cache?
> 
> In my test, it does not take system cache on a RHEL5 box, is it a bug or a
> feature?
> 
> Test1, run dd with raw block device, it seems system cache can boost up
> reread operation.
> 
> [@djt_18_69 ~]# dd if=/dev/sdc bs=1M of=/dev/null count=500
> 524288000 bytes (524 MB) copied, 1.88267 seconds, 278 MB/s
> [@djt_18_69 ~]# dd if=/dev/sdc bs=1M of=/dev/null count=500
> 524288000 bytes (524 MB) copied, 0.13445 seconds, 3.9 GB/s
>  
> 
> Test2, run dd with lv, it seems system cache CAN NOT boost up reread
> operation.
> 
> [@djt_18_69 ~]# dd if=/dev/vgext/lvtest5 bs=1M of=/dev/null count=500
> 524288000 bytes (524 MB) copied, 2.17848 seconds, 241 MB/s
> [@djt_18_69 ~]# dd if=/dev/vgext/lvtest5 bs=1M of=/dev/null count=500
> 524288000 bytes (524 MB) copied, 2.17451 seconds, 241 MB/s
> 
> Both 2.6.18-164.15.1.el5 and 2.6.18-194.el5 do the same behavior.

The last close() on a block device releases its cache.

As for sdc dd is most likely not the exclusive user at that time
(any mounts or other references on sdc itself, or its partitions,
count), dd's close() does not have this effect there.

Try this:

# sleep 3600 < /dev/vgext/lvtest5 & sleep_pid=$!
# dd if=/dev/vgext/lvtest5 bs=1M of=/dev/null count=500
# dd if=/dev/vgext/lvtest5 bs=1M of=/dev/null count=500
# kill $sleep_pid
# dd if=/dev/vgext/lvtest5 bs=1M of=/dev/null count=500

	Lars
