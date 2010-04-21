Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3LEH0Js013035
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2010 10:17:00 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3LEGpxt028577
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2010 10:16:51 -0400
Received: from r74-192-24-94.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.24.94] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1O4ajO-0003uH-UC
	for linux-lvm@redhat.com; Wed, 21 Apr 2010 07:16:47 -0700
Date: Wed, 21 Apr 2010 09:21:31 -0500
From: Ray Morris <support@bettercgi.com>
References: <4BCE910C.5020108@tlinx.org>
In-Reply-To: <4BCE910C.5020108@tlinx.org> (from lvm@tlinx.org on Wed Apr 21
	00:45:48 2010)
Message-Id: <1271859691.23509.4@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] volume developing problems even though should be
 static...
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

> so I disabled my  snapshoting cron job and deleted any
> logical jobs for now

dm-1 may be a volume (snapshot?) you deleted.  Check with:
cat /sys/block/dm-1/dm/name

    Why it's trying to read something that has been deleted
I don't know, but I know I get the same problem.
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 04/21/2010 12:45:48 AM, Linda A. Walsh wrote:
> I needed extra space on my home partition, and speed, so I disabled my
>  snapshoting cron job and deleted any logical jobs for now.
> 
> But during this transition time, I've started getting some were  
> symptoms.
> Now when I do a "pvs", I see:
> 
> # pvs
>   /dev/dm-1: read failed after 0 of 4096 at 0: Input/output error
>   PV         VG   Fmt  Attr PSize   PFree
>   /dev/sdb1  Home lvm2 a-   888.48G      0
>   /dev/sdb2  Home lvm2 a-   888.48G 640.96G
>   /dev/sdb3  Home lvm2 a-   584.87G 584.87G
> # vgs
>   /dev/dm-1: read failed after 0 of 4096 at 0: Input/output error
>   VG   #PV #LV #SN Attr   VSize VFree
>   Home   3   7   6 wz--n- 2.31T 1.20T
> # lvs
>   /dev/dm-1: read failed after 0 of 4096 at 0: Input/output error
>   lvol0               Home -wi-ao  1.00T
> 
> -----------------------------------------------
> So, the "output of the commands looks mostly 'right', as near as I  
> can tell: 3 physical volumes,
> -> 1 volume group with the 3 volumes, and
> 1 logical volume taking up space in that pv (only using part of the  
> space).
> 
> What I don't get and what worries me a fair amount are the I/O errors  
> --
> any idea what's going on and how I shoudl fix this?
> 
> Thanks much!
> linda
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
