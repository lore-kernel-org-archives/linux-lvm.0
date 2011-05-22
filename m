Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p4M6gS7B016383
	for <linux-lvm@redhat.com>; Sun, 22 May 2011 02:42:28 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p4M6gRWS008159
	for <linux-lvm@redhat.com>; Sun, 22 May 2011 02:42:27 -0400
Received: from r74-192-17-33.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.17.33] helo=localhost)
	by ps536.phatservers.com with esmtpa (Exim 4.66)
	(envelope-from <support@bettercgi.com>) id 1QO2Mr-0001E9-AH
	for linux-lvm@redhat.com; Sat, 21 May 2011 23:42:25 -0700
Date: Sun, 22 May 2011 01:42:23 -0500
From: Ray Morris <support@bettercgi.com>
Message-ID: <20110522014223.335d5da6@bettercgi.com>
In-Reply-To: <1306017503.3487.1454529429@webmail.messagingengine.com>
References: <1306017503.3487.1454529429@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM - Combining different hard drives with
 different specs ?
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

Not a problem. If the drives have different performance, 
some files may have different performance, but that's 
actually nothing new because the outside of a disk platter
is faster than the inner tracks. So whether you have one 
disk, two matched disks, or two mismatched disks you'll 
always have different areas with different performance.
-- 
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php




On Sat, 21 May 2011 15:38:23 -0700
"Lee Gold" <leegold@operamail.com> wrote:

> 
> Hi,
> 
> I have a 100GB IDE HD that will fill up soon. I have a 1TB SATA drive
> I want to add. I am using Ubuntu Server 10.04, I installed the
> existing 100GB drive using LVM, only a single initial HD. I aim to
> increase my storage capacity under the server's document
> root /var/www... Before I get started hopefully asking intelligent
> questions and giving the needed information to help you help me, I
> wanted to ask this initial question:
> 
> These two drives are different, they surely have different
> performance. Will this be a problem? If it was RAID I think matching
> drives are needed. I just want to add storage capacity with
> acceptable performance for a local in-house server.
> 
> Thanks,
> 
> Lee G.
> 
> 
> 
