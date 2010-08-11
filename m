Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o7BHIKAJ021007
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2010 13:18:20 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o7BHIBOr002352
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2010 13:18:12 -0400
Received: from r74-192-76-102.vctrcmta01.vctatx.tl.dh.suddenlink.net
	([74.192.76.102] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1OjEwJ-0000j1-RI
	for linux-lvm@redhat.com; Wed, 11 Aug 2010 10:18:08 -0700
Date: Wed, 11 Aug 2010 12:19:50 -0500
From: Ray Morris <support@bettercgi.com>
References: <1281507031.21952.1@raydesk1.bettercgi.com>
	<AANLkTimUB-xWqJEteT6mvpLQ2Y4y1qGdGYK1LTz-bh=F@mail.gmail.com>
In-Reply-To: <AANLkTimUB-xWqJEteT6mvpLQ2Y4y1qGdGYK1LTz-bh=F@mail.gmail.com>
	(from rpnabar@gmail.com on Wed Aug 11 12:03:39 2010)
Message-Id: <1281547190.5708.0@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] calculating free capacity from pvdisplay and
 lvdisplay
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
Content-Type: text/plain; charset="utf-8"; delsp="Yes"; format="Flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

> Makes sense! The only reason that I was confused was why 3 of my PV's
> say "yes (but full)" and the other three not. How does one explain
> that?
> 
> 1.63x3=4.89 still less than 8.6.
> 
> Has the VG spanned across the first 3 PVs fully and then utilized the
> remaining 3 partially?

   Pretty much.  See man (8) lvm,  --alloc option
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 08/11/2010 12:03:39 PM, Rahul Nabar wrote:
> On Wed, Aug 11, 2010 at 1:10 AM, Ray Morris <support@bettercgi.com>  
> wrote:
> 
> Thanks Giorgio and Ray! That helps!
> >
> > df shows that your LVs take up 8.6TB: 6TB + 600 GB + 2 TB.
> > Therefore, you are using 8.6TB of disk space for those LVs.
> > Some of the space WITHIN each LV might not be used for files,
> > but it has been dedicated to that LV.
> 
> Makes sense! The only reason that I was confused was why 3 of my PV's
> say "yes (but full)" and the other three not. How does one explain
> that?
> 
> 1.63x3=4.89 still less than 8.6.
> 
> Has the VG spanned across the first 3 PVs fully and then utilized the
> remaining 3 partially?
> 
> 
> > I'm not good at explaining things, so sometimes I try explaining  
> three
> > different ways. �I have six cereal boxes, each half empty. �I put  
> the
> > boxes in a bag. �The bag is now full. �The cereal boxes may not be  
> full,
> > but they fill up the bag. �The cereal boxes are your half empty LVs  
> and
> > the bag is your drives.
> 
> Food based analogies are always good! :)
> 
> Giorgio:
> 
> The vgs output is exactly as you say:
> 
> [root@eustorage ~]# vgs
>   VG                      #PV #LV #SN Attr   VSize VFree
>   euclid_highperf_storage   6   3   0 wz--n- 9.80T 1.22T
> 
> --
> Rahul
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
