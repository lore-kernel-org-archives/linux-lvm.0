Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i7U7ni310367
	for <linux-lvm@redhat.com>; Mon, 30 Aug 2004 03:49:44 -0400
Received: from edmi.com.au (203-173-42-55.perm.iinet.net.au [203.173.42.55])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i7U7naS0016746
	for <linux-lvm@redhat.com>; Mon, 30 Aug 2004 03:49:37 -0400
Received: from christianh by edmi.com.au (MDaemon.PRO.v7.2.0.R)
	with ESMTP id md50000077316.msg
	for <linux-lvm@redhat.com>; Mon, 30 Aug 2004 17:49:27 +1000
From: "Christian Hack" <christianh@edmi.com.au>
Subject: RE: [linux-lvm] Why do I only have 11.51GB Free PE's when DF says
	Ihave 441GB free in the volume?
Date: Mon, 30 Aug 2004 17:49:33 +1000
Message-ID: <006501c48e65$e40461b0$1c01010a@christianh>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <000001c48e44$4c38d5d0$1400000a@nforce>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

Your file system although only 59% used still occupies the PEs. The space is
allocated by the file system and thus also by the logical volume group.

To fix this you need to:
1) Unmount and reduce your file system size first. 
2) Then reduce the logical volume using lvreduce
3) Then use pvmove to remove the failing physical device

The tool you use to resize your file system is obviously dependant on the
file system, and I can't see what you are using so you'll have to work that
out yourself.

I think this is all right, but it's off the top of my head so if I'm wrong
please correct me guys.

CH

.
> -----Original Message-----
> From: linux-lvm-bounces@redhat.com 
> [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Benjamin Runnels
> Sent: Monday, 30 August 2004 1:49 PM
> To: 'LVM general discussion and development'
> Subject: [linux-lvm] Why do I only have 11.51GB Free PE's 
> when DF says Ihave 441GB free in the volume?
> 
> 
> Anyone know how I can free up some PE's so I can do pvmove on 
> a 160gb PV I
> think may be failing?
> 
> 
> 
> p4:~ # vgdisplay
>   --- Volume group ---
>   VG Name               solar
>   System ID             
>   Format                lvm2
>   Metadata Areas        6
>   Metadata Sequence No  20
>   VG Access             read/write
>   VG Status             resizable
>   MAX LV                256
>   Cur LV                1
>   Open LV               1
>   Max PV                256
>   Cur PV                6
>   Act PV                6
>   VG Size               1.01 TB
>   PE Size               4.00 MB
>   Total PE              265091
>   Alloc PE / Size       262144 / 1.00 TB
>   Free  PE / Size       2947 / 11.51 GB
>   VG UUID               nEwuBX-aKsk-gFIb-DrqQ-zREN-33SE-R09Q4b
>    
> p4:~ # df
> Filesystem           1K-blocks      Used Available Use% Mounted on
> /dev/hda2             38569376  11102844  27466532  29% /
> tmpfs                   128216         4    128212   1% /dev/shm
> /dev/mapper/solar-saturn
>                      1073709052 632227192 441481860  59% /media/saturn
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
