Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6DFWBV01623
	for <linux-lvm@redhat.com>; Wed, 13 Jul 2005 11:32:11 -0400
Received: from mx2.netapp.com (mx2.netapp.com [216.240.18.37])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j6DFW6Am026069
	for <linux-lvm@redhat.com>; Wed, 13 Jul 2005 11:32:06 -0400
Received: from baby ([10.42.16.16])
	by smtp2.corp.netapp.com (8.13.1/8.13.1/NTAP-1.6) with SMTP id
	j6DFW0sC017528
	for <linux-lvm@redhat.com>; Wed, 13 Jul 2005 08:32:00 -0700 (PDT)
Message-Id: <200507131532.j6DFW0sC017528@smtp2.corp.netapp.com>
Date: Wed, 13 Jul 2005 08:33:01 -0700 (PDT)
From: Igor Feoktistov <igorf@netapp.com>
Subject: Re: [linux-lvm] iSCSI lun resize
MIME-Version: 1.0
Content-MD5: RAlywRzJ4qvnZhi434zskA==
Reply-To: Igor Feoktistov <igorf@netapp.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I've heard there is the plan to implement pvresize.
The sequence below works. However, it requires reboot.
--
vgcfgbackup
edit file
pvcreate --restorefile --uuid
vgcfgrestore
--
Not sure if new pvresize will do it on fly.
May be somebody from lvm development team can answer this.
Yes, I know that partitioning works.
However, there is a restriction on the number of partitions.

Thanks,
Igor.

>From: Alex Owen <r.alex.owen@gmail.com>
>To: linux-lvm@redhat.com
>Content-Disposition: inline
>Subject: [linux-lvm] iSCSI lun resize
>
>Igor, the trick is to partition the iSCSI device. I have not done this
>with iSCSI but have with a Fibre Channel SAN.
>
>You made sdb  a PV. LVM cannot resize a PV.
>If you partitioned sdb and made sdb1 a PV then you could using iSCSI
>resize sdb, then make a new partition from the new free space on
>sdb... lets call this sdb5 (logical partition). Then pvcreate
>/dev/sdb5 then vgextend your VG onto /dev/sdb5 then resize the LV then
>grow the filesystem.
>
>The problem may be that you need to reboot to get the kernel to
>re-read the partition table...
>
>Alternativly present a new iSCSI LUN lets call this sdc. Make a PV on
>that and add that PV to the VG... then resize the LV then grow the
>filesystem.
>
>Regards
>Alex Owen
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
