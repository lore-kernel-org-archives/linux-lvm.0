Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6FM9U7S012965
	for <linux-lvm@redhat.com>; Wed, 15 Jul 2009 18:09:30 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n6FM8nfv025811
	for <linux-lvm@redhat.com>; Wed, 15 Jul 2009 18:08:49 -0400
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e32.co.us.ibm.com (8.13.1/8.13.1) with ESMTP id n6FM4eXT021537
	for <linux-lvm@redhat.com>; Wed, 15 Jul 2009 16:04:40 -0600
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v9.2) with ESMTP id
	n6FM8lhq211294
	for <linux-lvm@redhat.com>; Wed, 15 Jul 2009 16:08:47 -0600
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	n6FM8kHS030745
	for <linux-lvm@redhat.com>; Wed, 15 Jul 2009 16:08:46 -0600
Subject: Re: [linux-lvm] multipath works; lvm on multipath does not
From: Chandra Seetharaman <sekharan@us.ibm.com>
In-Reply-To: <23821558.221921247694797978.JavaMail.root@zimbra>
References: <23821558.221921247694797978.JavaMail.root@zimbra>
Date: Wed, 15 Jul 2009 15:11:47 -0700
Message-Id: <1247695907.9792.26.camel@chandra-ubuntu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: sekharan@linux.vnet.ibm.com,
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
To: Brian Elliott Finley <finley@anl.gov>, LVM general discussion and development <linux-lvm@redhat.com>

Can you send the o/p of "dmsetup ls" and "dmsetup table"

On Wed, 2009-07-15 at 16:53 -0500, finley@anl.gov wrote:
> How can I tell what is causing LVM on multipath volumes to fail, while direct multipath volumes are working?
> 
> 
> The details:
> 
> I have several volumes that are multipathed over fibre channel (2 qlogic cards in the host) from a Fujitsu Eternus 4000 (4 controllers).  
> 
> When using a file system mounted on the dm-multipath device directly (Ie.: generating I/O via IOZone), it fails over gracefully when I pull out either of the fibre pairs, and the file system continues to operate.  This device is called /dev/mapper/zimbra-mb1-t2-v4_fujitsu1-lun66.
> 
> However, when I access an LVM volume created with sister devices as PVs, the LVM presented volume does not fail over.  Rather the LV device goes inaccessible and the file system (ext3) re-mounts itself as read-only.  If I try to access any of the underlying PVs, they still respond as available (Ie.: fdisk -l $PV).
> 
> I am not seeing duplicate devices, and am using the following filter in /etc/lvm/lvm.conf:
> 
>  filter = [ "a|^/dev/md.*|", "a|^/dev/mapper/zimbra-mb.*-t.*-v.*_.*-lun.*|", "r|.*|" ]
> 
> 
> I have also added the following, but dm-multipath devices seem usable by LVM with or without this setting:
> 
>   types = [ "device-mapper", 1 ]
> 
> 
> I have tried removing the /etc/lvm/cache/.cache file, but that seems to have had no effect.  I've also tried re-building the initrd after modifying the lvm.conf file, also with no effect.
> 
> Additional info:
> root@zimbra-mb1:~# pvs
>   PV                                          VG         Fmt  Attr PSize   PFree  
>   /dev/mapper/zimbra-mb1-t1-v1_fujitsu1-lun55 mb1_t1     lvm2 a-   195.31G  60.31G
>   /dev/mapper/zimbra-mb1-t1-v2_fujitsu1-lun56 mb1_t1     lvm2 a-   195.31G  60.31G
>   /dev/mapper/zimbra-mb1-t1-v3_fujitsu1-lun57 mb1_t1     lvm2 a-   195.31G  60.31G
>   /dev/mapper/zimbra-mb1-t1-v4_fujitsu1-lun58 mb1_t1     lvm2 a-   195.31G  60.31G
>   /dev/mapper/zimbra-mb1-t2-v1_fujitsu1-lun63 mb1_t2     lvm2 a-   504.00G   4.00G
>   /dev/mapper/zimbra-mb1-t2-v2_fujitsu1-lun64 mb1_t2     lvm2 a-   488.28G      0 
>   /dev/mapper/zimbra-mb1-t2-v3_fujitsu1-lun65 mb1_t2     lvm2 a-   195.31G 195.31G
>   /dev/mapper/zimbra-mb1-t2-v5_fujitsu1-lun67 mb1_t2     lvm2 a-   354.37G      0 
>   /dev/mapper/zimbra-mb1-t2-v6_fujitsu1-lun68 mb1_t2     lvm2 a-   234.56G  77.21G
>   /dev/md1                                    zimbra-mb1 lvm2 a-   136.50G  83.50G
> 
> 
> 
> kernel version:  2.6.24-24-server
> distoro:         Ubuntu Hardy
> multipath-tools: 0.4.8-7ubuntu2
> lvm2:            2.02.26-1ubuntu9
> 
> Thanks!
> 
> -Brian
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
