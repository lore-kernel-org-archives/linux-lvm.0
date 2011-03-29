Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p2THigQG026694
	for <linux-lvm@redhat.com>; Tue, 29 Mar 2011 13:44:42 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2THicpt028786
	for <linux-lvm@redhat.com>; Tue, 29 Mar 2011 13:44:39 -0400
Received: from r74-192-17-33.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.17.33] helo=localhost)
	by ps536.phatservers.com with esmtpa (Exim 4.66)
	(envelope-from <support@bettercgi.com>) id 1Q4cy3-0005yO-HJ
	for linux-lvm@redhat.com; Tue, 29 Mar 2011 10:44:35 -0700
Date: Tue, 29 Mar 2011 12:44:34 -0500
From: Ray Morris <support@bettercgi.com>
Message-ID: <20110329124434.3cf62c3e@bettercgi.com>
In-Reply-To: <DE6049702F6A4634890B18D047C27E03@caramon>
References: <DE6049702F6A4634890B18D047C27E03@caramon>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] How to fix missmatch between VG-size and LV-size?
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

> While adding a new disk to my LV i ended up with a crash during the
> resize2fs.

resize2fs would be run AFTER lvextend, so if resize2fs was running, 
the LV would need to be the new, larger size.  Yet, you said 
"the system still thinks the LV is the old size".  Did you run
vgcfgrestore already, restoring to the point between where you 
ran vgextend and lvextend?  Perhaps you forgot to run lvextend, 
but then one would expect resize2fs to tell you it was already 
full sized.  Double check what you did, because this information
is not consistent.

> If I can revert the adding of the new drive, I planned on
> trying to vgcfgrestore to an archived config from before I added the
> drive and did the lvextend and resize2fs. 

Indeed you could "undo" the vgextend and lvextend via vgcfgrestore, 
or via lvreduce + vgreduce, but first you probably need to undo 
resize2fs.  Use fsck to get the filesystem consistent, if possible.
Then resize it back to the old smaller size.  At this point you 
can move forward by using lvextend, then resize2fs. You could also 
move backward from that point with lvreduce and vgreduce.
-- 
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php




On Tue, 29 Mar 2011 17:21:55 +0200
"Fredrik Skog" <fredrik.skog@rodang.se> wrote:

> Hello,
> 
> While adding a new disk to my LV i ended up with a crash during the
> resize2fs. Now I have LVM reporting different sizes for my VG and LV.
> How do I fix this?
> 
> I tried to do a "vgreduce vgftp /dev/sde1" to remove my new drive
> again. This only gives me an error "Physical volume "/dev/sde1" still
> in use" If I can revert the adding of the new drive, I planned on
> trying to vgcfgrestore to an archived config from before I added the
> drive and did the lvextend and resize2fs. Is this a good way of
> solving the problem? I guess it's not possible to lvreduce the LV by
> the same amount i did lvextend it before, because the system still
> thinks the LV is the old size. I just want to get rid of the PV i
> added to the VG
> 
> I'm a bit confused on how to do this.
> 
> # vgdisplay
>   --- Volume group ---
>   VG Name               vgftp
>   System ID             
>   Format                lvm2
>   Metadata Areas        13
>   Metadata Sequence No  67
>   VG Access             read/write
>   VG Status             resizable
>   MAX LV                0
>   Cur LV                1
>   Open LV               0
>   Max PV                0
>   Cur PV                12
>   Act PV                12
>   VG Size               5.59 TiB
>   PE Size               4.00 MiB
>   Total PE              1464180
>   Alloc PE / Size       1089649 / 4.16 TiB
>   Free  PE / Size       374531 / 1.43 TiB
>   VG UUID               kOApX5-oTeV-cPWr-h41J-NxML-sbbj-WcKObC
> 
>  # lvdisplay
>   --- Logical volume ---
>   LV Name                /dev/vgftp/lvftp
>   VG Name                vgftp
>   LV UUID                l4EWSh-GOfD-n0Sx-7ZSG-RTVi-p7fC-ApyHZS
>   LV Write Access        read/write
>   LV Status              NOT available
>   LV Size                4.16 TiB
>   Current LE             1089649
>   Segments               14
>   Allocation             inherit
>   Read ahead sectors     auto
>    
> 
> thank you
> /Fredrik Skog
