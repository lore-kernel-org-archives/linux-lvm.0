Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nA5FBGMx025381
	for <linux-lvm@redhat.com>; Thu, 5 Nov 2009 10:11:16 -0500
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nA5FAvmc016998
	for <linux-lvm@redhat.com>; Thu, 5 Nov 2009 10:10:58 -0500
Received: from r74-192-24-94.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.24.94] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1N63ym-0000qC-8o
	for linux-lvm@redhat.com; Thu, 05 Nov 2009 07:10:28 -0800
Date: Thu, 05 Nov 2009 09:10:18 -0600
From: Ray Morris <support@bettercgi.com>
Subject: Re: [linux-lvm] PFree is 0 on a drive with nothing on it
References: <C613C4C4-17B6-48A0-A5CD-36A89F815198@gmail.com>
In-Reply-To: <C613C4C4-17B6-48A0-A5CD-36A89F815198@gmail.com> (from
	adam.mooz@gmail.com on Thu Nov  5 01:57:53 2009)
Message-Id: <1257433818.17792.30@raydesk1.bettercgi.com>
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

What is the output of?:

pvdisplay -m /dev/mapper/cryptsda


--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 11/05/2009 01:57:53 AM, Adam Mooz wrote:
> Hello List,
> 
> I have a fileserver that is driving me nuts at the moment.  Setup:
> 4x 1TB HDD's
> 1x 320GB HDD
> They all have the same partition layout:
> 512MB Swap, rest is LVM data.
> The LVM only contains ~400GB of data, but 2 of the TB drives report  
> having 0 free PFree's:
>   PV                   VG        Fmt  Attr PSize   PFree
>   /dev/mapper/cryptsda fileshare lvm2 a-   931.03G      0
>   /dev/mapper/cryptsdb fileshare lvm2 a-   931.03G      0
>   /dev/mapper/cryptsdc fileshare lvm2 a-   297.61G 297.61G
>   /dev/mapper/cryptsdd fileshare lvm2 a-   931.03G 633.42G
>   /dev/mapper/cryptsde           lvm2 --   931.04G 931.04G
> 
> I've successfully managed to remove SDE from the LVM, but I need to  
> move the data off SDD onto either SDA or SDB.  When the whole system  
> is mounted it properly reports having 2.1TB of free space (931 * 2 +  
> 297). Is there an easy way to fix this issue?
> 

------quoted attachment------
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
