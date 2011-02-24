Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p1OD59Tg018048
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2011 08:05:09 -0500
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p1OD50Em032141
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2011 08:05:01 -0500
Date: Thu, 24 Feb 2011 07:04:35 -0600
From: Ray Morris <support@bettercgi.com>
Message-ID: <20110224070435.5b057008@bettercgi.com>
In-Reply-To: <4D66382E.4090906@ixcore.com>
References: <4D66382E.4090906@ixcore.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Different PV on the same raid array
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com
Cc: cedric.lemarchand@ixblue.com

> To bypass the DOS MBR 2TB limits, i plan to use LVM to create on the
> same raid array some "small" PV (< 2TB)  that will be in the same big
> VG (> 2TB).
> 
> First, am i planning ugly thing ? is the GPT alternative a better
> way ?

   If you're not booting from the array, just make the array 
the PV.  Once you're past the BIOS boot, there's little reason
to have partitions at all since you're using LVM to divide the 
storage into appropriate volumes.  If you are booting from it
and therefore need partitions, GPT is the new standard for 
partitions.

> i would like that LVM use 1 PV first and then
> the second when the first come full  (not both at the same time).
> Maybe LVM do that by default, or do i need some option ? (i saw
> "--contiguous" in the lvcreate man pages, but dont know exactly what
> this option does ... )

  I think it does that by default, subject to certain other contraints
such as not putting both halves of a mirrored LV on the same PV.
-- 
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php




On Thu, 24 Feb 2011 11:51:26 +0100
Cédric Lemarchand <cedric.lemarchand@ixcore.com> wrote:

> Hello,
> 
> To bypass the DOS MBR 2TB limits, i plan to use LVM to create on the
> same raid array some "small" PV (< 2TB)  that will be in the same big
> VG (> 2TB).
> 
> First, am i planning ugly thing ? is the GPT alternative a better
> way ?
> 
> Secondly, I dont know how LVM use PVs within a VG, but for
> performances issues, i would like that LVM use 1 PV first and then
> the second when the first come full  (not both at the same time).
> Maybe LVM do that by default, or do i need some option ? (i saw
> "--contiguous" in the lvcreate man pages, but dont know exactly what
> this option does ... )
> 
> 
> Thx
> 
> Cédric
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
