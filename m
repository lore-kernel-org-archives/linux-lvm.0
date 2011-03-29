Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p2THmKDT023965
	for <linux-lvm@redhat.com>; Tue, 29 Mar 2011 13:48:20 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2THmHtp010635
	for <linux-lvm@redhat.com>; Tue, 29 Mar 2011 13:48:17 -0400
Received: from r74-192-17-33.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.17.33] helo=localhost)
	by ps536.phatservers.com with esmtpa (Exim 4.66)
	(envelope-from <support@bettercgi.com>) id 1Q4d1c-0006D5-FK
	for linux-lvm@redhat.com; Tue, 29 Mar 2011 10:48:16 -0700
Date: Tue, 29 Mar 2011 12:48:14 -0500
From: Ray Morris <support@bettercgi.com>
Message-ID: <20110329124814.7fd059c7@bettercgi.com>
In-Reply-To: <784dab.9d29.12f01ad2e6f.Coremail.ooolinux@163.com>
References: <784dab.9d29.12f01ad2e6f.Coremail.ooolinux@163.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] copy lv from  lv?
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

> if lvm do not support lv copy? it is better copy on write.
> dd takes long time.

For a complete copy the only thing faster than "dd" is two 
copies of "dd" piped together. dd is basically limited by
the speed of the physical disks, assuming proper arguments 
to dd.  For a copy on write, that's called a snapshot. LVM 
COULD beused to copy, by making and splitting a mirror, but 
that's going to be a lot slower than dd. (Though a mirror and
split can be used on a live filesystem, wth it unmounted only 
for an instant during the split).
-- 
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php




On Tue, 29 Mar 2011 20:53:37 +0800 (CST)
yue <ooolinux@163.com> wrote:

> if lvm do not support lv copy? it is better copy on write.
> dd takes long time.
>  
> thanks
