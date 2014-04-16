Received: from mx4-phx2.redhat.com (mx02.colomx.prod.int.phx2.redhat.com
	[10.5.7.2])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s3GDVlB6001136
	for <linux-lvm@redhat.com>; Wed, 16 Apr 2014 09:31:47 -0400
Received: from zmail18.collab.prod.int.phx2.redhat.com
	(zmail18.collab.prod.int.phx2.redhat.com [10.5.83.21])
	by mx4-phx2.redhat.com (8.13.8/8.13.8) with ESMTP id s3GDVlBB004260
	for <linux-lvm@redhat.com>; Wed, 16 Apr 2014 09:31:47 -0400
Date: Wed, 16 Apr 2014 09:31:47 -0400 (EDT)
From: Rahul Hinduja <rhinduja@redhat.com>
Message-ID: <494273392.10071876.1397655107769.JavaMail.zimbra@redhat.com>
In-Reply-To: <1326353213.10069520.1397654927537.JavaMail.zimbra@redhat.com>
References: <1326353213.10069520.1397654927537.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Issue in creating thinpool when used different pool
 metadatasize
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




----- Original Message -----
> From: "Rahul Hinduja" <rhinduja@redhat.com>
> To: linux-lvm@redhat.com
> Sent: Wednesday, April 16, 2014 6:58:47 PM
> Subject: Issue in creating thinpool when used different pool metadatasize
> 
> Hello All,
> 
> This might be some basic mistake I would be doing with respect to different
> poolmetadata size.
> 
> When I am trying to create thinpool with poolmetadatasize as 4m it fails but
> similar is successful when I try to create with 5m. Default poolmetadatasize
> can be 2m to 16g so I am not sure what is error I am enforcing it to fail.
> 
> Kindly help me out with this issue.
> 
> 
> Case 1: poolmetadatasize as 4m
> 
> #script to create thinpool with poolmetadatasize 4m
> 
> [root@rahul ~]# cat temp
> pvcreate /dev/vdb
> pvcreate /dev/vdc
> pvcreate /dev/vdd
> pvcreate /dev/vde
>  
> vgcreate snap_vg0 /dev/vdb /dev/vdc /dev/vdd /dev/vde
> lvcreate -L 90G --poolmetadatasize 4m -T /dev/snap_vg0/snap_thin_pool0
> #lvcreate -L 90G -T /dev/snap_vg0/snap_thin_pool0
> lvcreate -V90G -T /dev/snap_vg0/snap_thin_pool0 -n snap_thin_vol0
> [root@rahul ~]#
> [root@rahul ~]#

#Creation Fails

[root@rahul ~]# ./temp 
  Physical volume "/dev/vdb" successfully created
  Physical volume "/dev/vdc" successfully created
  Physical volume "/dev/vdd" successfully created
  Physical volume "/dev/vde" successfully created
  Volume group "snap_vg0" successfully created
  Logical volume "lvol0" created
  device-mapper: reload ioctl on  failed: Invalid argument
  Failed to suspend pool snap_thin_pool0.
  Thin pool snap_thin_pool0 not found in Volume group snap_vg0.
[root@rahul ~]#


> 
> 
> 
> 
> Case 2: poolmetadatasize as 5m
> 
> #script to create thinpool with poolmetadatasize 5m
> 
> [root@rahul ~]# cat temp
> pvcreate /dev/vdb
> pvcreate /dev/vdc
> pvcreate /dev/vdd
> pvcreate /dev/vde
>  
> vgcreate snap_vg0 /dev/vdb /dev/vdc /dev/vdd /dev/vde
> lvcreate -L 90G --poolmetadatasize 5m -T /dev/snap_vg0/snap_thin_pool0
> #lvcreate -L 90G -T /dev/snap_vg0/snap_thin_pool0
> lvcreate -V90G -T /dev/snap_vg0/snap_thin_pool0 -n snap_thin_vol0
> [root@rahul ~]#
> [root@rahul ~]#
> 
> 
> 
> #Creation Success
> 
> [root@rahul ~]# ./temp
>   Physical volume "/dev/vdb" successfully created
>   Physical volume "/dev/vdc" successfully created
>   Physical volume "/dev/vdd" successfully created
>   Physical volume "/dev/vde" successfully created
>   Volume group "snap_vg0" successfully created
>   Rounding up size to full physical extent 8.00 MiB
>   Logical volume "lvol0" created
>   Logical volume "snap_thin_pool0" created
>   Logical volume "snap_thin_vol0" created
> [root@rahul ~]#
> 
> 
> Please find the attachment with detailed outputs of different lv commands
> 
> Thanks,
> Rahul
