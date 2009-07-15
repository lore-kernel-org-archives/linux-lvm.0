Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6FLrcFP004400
	for <linux-lvm@redhat.com>; Wed, 15 Jul 2009 17:53:38 -0400
Received: from mailhost.anl.gov (mailhost.anl.gov [130.202.113.50])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n6FLrNfF019405
	for <linux-lvm@redhat.com>; Wed, 15 Jul 2009 17:53:23 -0400
Received: from mailhost.anl.gov (mailhost.anl.gov [130.202.113.50])
	by localhost.ctd.anl.gov (Postfix) with ESMTP id 038373D
	for <linux-lvm@redhat.com>; Wed, 15 Jul 2009 16:53:23 -0500 (CDT)
Received: from zimbra.anl.gov (zimbra.anl.gov [130.202.101.12])
	by mailhost.anl.gov (Postfix) with ESMTP id F16FB31
	for <linux-lvm@redhat.com>; Wed, 15 Jul 2009 16:53:22 -0500 (CDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zimbra.anl.gov (Postfix) with ESMTP id D49FC19E018C
	for <linux-lvm@redhat.com>; Wed, 15 Jul 2009 16:53:22 -0500 (CDT)
Received: from zimbra.anl.gov ([127.0.0.1])
	by localhost (zimbra.anl.gov [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tz2iswkxx3Lx for <linux-lvm@redhat.com>;
	Wed, 15 Jul 2009 16:53:18 -0500 (CDT)
Received: from zimbra.anl.gov (zimbra.anl.gov [130.202.101.12])
	by zimbra.anl.gov (Postfix) with ESMTP id 24C2F19E0037
	for <linux-lvm@redhat.com>; Wed, 15 Jul 2009 16:53:18 -0500 (CDT)
Date: Wed, 15 Jul 2009 16:53:17 -0500 (CDT)
From: finley@anl.gov
Sender: finley@anl.gov
Message-ID: <23821558.221921247694797978.JavaMail.root@zimbra>
In-Reply-To: <19502392.221881247694711520.JavaMail.root@zimbra>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] multipath works; lvm on multipath does not
Reply-To: Brian Elliott Finley <finley@anl.gov>,
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

How can I tell what is causing LVM on multipath volumes to fail, while direct multipath volumes are working?


The details:

I have several volumes that are multipathed over fibre channel (2 qlogic cards in the host) from a Fujitsu Eternus 4000 (4 controllers).  

When using a file system mounted on the dm-multipath device directly (Ie.: generating I/O via IOZone), it fails over gracefully when I pull out either of the fibre pairs, and the file system continues to operate.  This device is called /dev/mapper/zimbra-mb1-t2-v4_fujitsu1-lun66.

However, when I access an LVM volume created with sister devices as PVs, the LVM presented volume does not fail over.  Rather the LV device goes inaccessible and the file system (ext3) re-mounts itself as read-only.  If I try to access any of the underlying PVs, they still respond as available (Ie.: fdisk -l $PV).

I am not seeing duplicate devices, and am using the following filter in /etc/lvm/lvm.conf:

 filter = [ "a|^/dev/md.*|", "a|^/dev/mapper/zimbra-mb.*-t.*-v.*_.*-lun.*|", "r|.*|" ]


I have also added the following, but dm-multipath devices seem usable by LVM with or without this setting:

  types = [ "device-mapper", 1 ]


I have tried removing the /etc/lvm/cache/.cache file, but that seems to have had no effect.  I've also tried re-building the initrd after modifying the lvm.conf file, also with no effect.

Additional info:
root@zimbra-mb1:~# pvs
  PV                                          VG         Fmt  Attr PSize   PFree  
  /dev/mapper/zimbra-mb1-t1-v1_fujitsu1-lun55 mb1_t1     lvm2 a-   195.31G  60.31G
  /dev/mapper/zimbra-mb1-t1-v2_fujitsu1-lun56 mb1_t1     lvm2 a-   195.31G  60.31G
  /dev/mapper/zimbra-mb1-t1-v3_fujitsu1-lun57 mb1_t1     lvm2 a-   195.31G  60.31G
  /dev/mapper/zimbra-mb1-t1-v4_fujitsu1-lun58 mb1_t1     lvm2 a-   195.31G  60.31G
  /dev/mapper/zimbra-mb1-t2-v1_fujitsu1-lun63 mb1_t2     lvm2 a-   504.00G   4.00G
  /dev/mapper/zimbra-mb1-t2-v2_fujitsu1-lun64 mb1_t2     lvm2 a-   488.28G      0 
  /dev/mapper/zimbra-mb1-t2-v3_fujitsu1-lun65 mb1_t2     lvm2 a-   195.31G 195.31G
  /dev/mapper/zimbra-mb1-t2-v5_fujitsu1-lun67 mb1_t2     lvm2 a-   354.37G      0 
  /dev/mapper/zimbra-mb1-t2-v6_fujitsu1-lun68 mb1_t2     lvm2 a-   234.56G  77.21G
  /dev/md1                                    zimbra-mb1 lvm2 a-   136.50G  83.50G



kernel version:  2.6.24-24-server
distoro:         Ubuntu Hardy
multipath-tools: 0.4.8-7ubuntu2
lvm2:            2.02.26-1ubuntu9

Thanks!

-Brian
