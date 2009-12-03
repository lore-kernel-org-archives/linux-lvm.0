Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nB3Ii89j013564
	for <linux-lvm@redhat.com>; Thu, 3 Dec 2009 13:44:08 -0500
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nB3Ihv7F018890
	for <linux-lvm@redhat.com>; Thu, 3 Dec 2009 13:43:58 -0500
Received: from r74-192-24-94.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.24.94] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1NGGej-0005O7-3W
	for linux-lvm@redhat.com; Thu, 03 Dec 2009 10:43:57 -0800
Date: Thu, 03 Dec 2009 12:43:56 -0600
From: Ray Morris <support@bettercgi.com>
Subject: Re: [linux-lvm] Questions regarding LVM
In-Reply-To: <89A593F9810AA744B420746E2755B8480DFE0A@xmb-sjc-224.amer.cisco.com>
	(from vishaver@cisco.com on Thu Dec  3 12:22:11 2009)
Message-Id: <1259865836.6713.13@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="Flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

> 1.       Under scenario where, several hard-drives are part of LVM
> volume group and if one of hard-disk gets corrupted then would whole
> volume group be inaccessible ?


See the --partial option.  See also vgcfgrestore. (rtfm)
Basically, if the drive is merely "corrupted" as you said,
there could be some currupted data.  If the drive is missing
or largely unuseable those extents are gone, so LVs with
important extents on that PV would have serious problems,
but LVs with no extents on that PV should be fine.  "Important"
extents means, for example, if a 400GB LV which is only 10%
full has only it's last couple on extents on the missing PV
that may not be a major problem, if no data is stored there
yet.  On the other hand, the first extent of the filesystem
probably contains very important information about the
filesystem as a whole, so if that first extent is unuseable
you're probably reduced to greping the LV, or using an automated
search tool that basically greps the LV - the same type of
tools used for undelete or corrupted disks without LVM.

> What would be impact on volume group's filesystem ?

    VGs don't have filesystems.  LVs do. This is the same
question as "if I'm NOT using LVM and parts of my drive go
bad what is the effect on the filesystem?" The ability to
salvage files from the filesystems of affected LVs depends
on how many extents are missing or corrupted, which extents
those are, and what type of filesystem is used.

    So in summary, LVM doesn't change much in terms of the
affect of a bad disk.  You should still have really solid
backups and probably use RAID.
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 12/03/2009 12:22:11 PM, Vishal Verma -X (vishaver - Embedded  
Resource Group at Cisco) wrote:
> Hello all,
> 
> 
> 
>     I am new to this mailing list. I have few questions regarding  
> Linux
> LVM, would appreciate if LVM gurus could answer.
> 
> 
> 
> 
> 
> 1.       Under scenario where, several hard-drives are part of LVM
> volume group and if one of hard-disk gets corrupted then would whole
> volume group be inaccessible ?
> 
> What would be impact on volume group's filesystem ?
> 
> 
> 
> 2.       From stability perspective, which version of LVM is better on
> Linux kernel 2.6.x, LVM2 or LVM1 ?
> 
> 
> 
> Regards,
> 
> Vishal
> 
> 
> 
> 

------quoted attachment------
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
