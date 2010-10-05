Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o95EAWHm028898
	for <linux-lvm@redhat.com>; Tue, 5 Oct 2010 10:10:32 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o95EAMIc012398
	for <linux-lvm@redhat.com>; Tue, 5 Oct 2010 10:10:22 -0400
Received: from r74-192-2-154.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.2.154] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1P38Dl-0007iq-Hi
	for linux-lvm@redhat.com; Tue, 05 Oct 2010 07:10:22 -0700
Date: Tue, 05 Oct 2010 09:10:17 -0500
From: Ray Morris <support@bettercgi.com>
References: <AANLkTikruA=C7O-uNbf-8VqNHycg751Q55Qi=tZQVHXP@mail.gmail.com>
In-Reply-To: <AANLkTikruA=C7O-uNbf-8VqNHycg751Q55Qi=tZQVHXP@mail.gmail.com>
	(from mightydreams@gmail.com on Tue Oct  5 07:18:11 2010)
Message-Id: <1286287817.31895.2@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] partition 2 different type of filesystem in an LVM
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
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="Flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Then use mkfs on each /dev/mapper/nintendo-lvm1p*
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 10/05/2010 07:18:11 AM, Tapas Mishra wrote:
> Step 1) pvcreate /dev/sdb
> Step 2) vgcreate nintendo /dev/sbd
>   Volume group "nintendo" successfully created
> 
> Step 3) lvcreate --name lvm1 --size 10G nintendo
> 
> Step 4) vgscan
> Reading all physical volumes.  This may take a while...
>   Found volume group "nintendo" using metadata type lvm2
> 
> Step 5) lvdisplay
> 
> --- Logical volume ---
>   LV Name                /dev/nintendo/lvm1
>   VG Name                nintendo
>   LV UUID                280Mup-H9aa-sn0S-AXH3-04cP-V6p9-lfoGgJ
>   LV Write Access        read/write
>   LV Status              available
>   # open                 0
>   LV Size                10.00 GB
> 
> Step 6) cfdisk /dev/nintendo/lvm1
> 
> Step 7) kpartx -av /dev/nintendo/lvm1
> lvscan
> ACTIVE            '/dev/nintendo/lvm1' [10.00 GiB] inherit
> 
> vgscan
> Reading all physical volumes.  This may take a while...
>   Found volume group "nintendo" using metadata type lvm2
> 
> 
> Step 8) Create two partitions on /dev/nintendolvm1
> now how do I convert them to filesystem
> 
> as in lvscan it does not come as two different blocks I see them as
> only one block device
> 
> ACTIVE            '/dev/nintendo/lvm1' [10.00 GiB] inherit
> 
> What I am doing manually in step 8 is some thing done when using
> virt-manager to install guest OS.
> If some  one can point me to script that is doing this I will be able
> to understand.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
