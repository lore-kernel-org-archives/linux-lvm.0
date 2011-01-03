Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p0400SLg028251
	for <linux-lvm@redhat.com>; Mon, 3 Jan 2011 19:00:28 -0500
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id p0400Klm031452
	for <linux-lvm@redhat.com>; Mon, 3 Jan 2011 19:00:20 -0500
Received: from r74-192-2-154.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.2.154] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1PZuIy-0004GD-TL
	for linux-lvm@redhat.com; Mon, 03 Jan 2011 15:59:14 -0800
Date: Mon, 03 Jan 2011 17:59:06 -0600
From: Ray Morris <support@bettercgi.com>
References: <AANLkTinFmtODu_zJws8=yDBKqkyO1WRseXbMwQRp3qkG@mail.gmail.com>
In-Reply-To: <AANLkTinFmtODu_zJws8=yDBKqkyO1WRseXbMwQRp3qkG@mail.gmail.com>
	(from miriyalar@gmail.com on Mon Jan  3 16:32:03 2011)
Message-Id: <1294099146.2185.8@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] lvm to work with tmpfs file system.
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

tmpfs is usually (always?) mounted on RAM, so it wouldn't
be on an LVM volume, and therefore LVM snapshots wouldn't
directly apply.
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 01/03/2011 04:32:03 PM, Prasad Miriyala wrote:
> I am using tmpfs file system, would like to take snapshot using lvm  
> and
> periodically sync to another mounted external filesystem. Is it  
> doable ? or
> I am not doing it right ?
> 
> Thanks,
> Prasad.
> 

------quoted attachment------
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
