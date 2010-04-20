Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3KENQwA012504
	for <linux-lvm@redhat.com>; Tue, 20 Apr 2010 10:23:26 -0400
Received: from EXHUB016-4.exch016.msoutlookonline.net
	(exhub016-4.exch016.msoutlookonline.net [207.5.72.225])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3KENBWD003000
	for <linux-lvm@redhat.com>; Tue, 20 Apr 2010 10:23:14 -0400
Message-ID: <4BCDB8CD.7030303@cfl.rr.com>
Date: Tue, 20 Apr 2010 10:23:09 -0400
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
References: <SNT144-w65AE38C3AAEDE1D8396FA3E40A0@phx.gbl>
In-Reply-To: <SNT144-w65AE38C3AAEDE1D8396FA3E40A0@phx.gbl>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] resize an LVM physical volume
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: behzad r <b_rahimi@hotmail.com>

On 4/20/2010 9:19 AM, behzad r wrote:
> umount /partition that must be increased
> pvdisplay /dev/sde2 | grep VG
> vgchange -a n myvg
> fdisk /dev/sde
> delete the partition and recreate a new one with same start cylinder and
> increase the number of cylinder
> pvresize /dev/sde1
> vgchange -a y myvg
> reiserfsck /dev/myvg/mylv

If you use the full disk as the physical volume instead of partitioning
it, then you would not need to take it offline to extend it.

> but on bladeframe when I use the fdisk to increase the partition the
> system destroy everything the physical volume reject the partion 
> /dev/sde1 (when I run pvdisplay it's not on the list anymore)and all the
> data is destroyed I got a feeling that fdisk remove the /dev/sda1 and
> re-create a new one
> here is the kernel information concerning the bladeframe

It sounds like fdisk did not recreate the partition with exactly the
same start location.  It is best to put fdisk into sector mode when
doing things like this so that it will not round cylinder numbers and
possibly hide minor changes from you.
