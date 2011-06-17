Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p5HGafwF018036
	for <linux-lvm@redhat.com>; Fri, 17 Jun 2011 12:36:41 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p5HGae8m001488
	for <linux-lvm@redhat.com>; Fri, 17 Jun 2011 12:36:40 -0400
Received: from r74-192-17-33.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.17.33] helo=localhost)
	by ps536.phatservers.com with esmtpa (Exim 4.66)
	(envelope-from <support@bettercgi.com>) id 1QXc2B-0005mt-NN
	for linux-lvm@redhat.com; Fri, 17 Jun 2011 09:36:39 -0700
Date: Fri, 17 Jun 2011 11:36:37 -0500
From: Ray Morris <support@bettercgi.com>
Message-ID: <20110617113637.1d13e113@bettercgi.com>
In-Reply-To: <1308326398.9219.1464298109@webmail.messagingengine.com>
References: <1308260745.12257.1464013973@webmail.messagingengine.com>
	<alpine.LRH.2.00.1106170004310.20086@bmsred.bmsi.com>
	<1308326398.9219.1464298109@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Help to mount ext3 boot partiton which reports it's
 LVM2_member when I try to mount it
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

> In my opinion LVM2 should of flagged me when it went about changing my
> config - which it did - the boot partition's location and spec could
> not of changed on it's own


Either LVM wrote fdisk into itself, which has never happened before to
anyone else, or you made a typo.
-- 
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php
