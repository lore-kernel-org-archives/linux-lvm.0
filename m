Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n88NYEIL003737
	for <linux-lvm@redhat.com>; Tue, 8 Sep 2009 19:34:15 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n88NY1qX009088
	for <linux-lvm@redhat.com>; Tue, 8 Sep 2009 19:34:02 -0400
Received: from r74-192-24-94.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.24.94] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1MlACG-0002a8-Hb
	for linux-lvm@redhat.com; Tue, 08 Sep 2009 16:34:00 -0700
Date: Tue, 08 Sep 2009 18:33:59 -0500
From: Ray Morris <support@bettercgi.com>
Message-Id: <1252452839.16247.8@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] VirtualSize performance improvements expected?
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

   Reading the lvm-devel archives, I don't see any discussion 
of virtualsize volumes in the last couple of months, since they've
been basically working.  It's a wonderful feature, but informal 
testing shows a performance reduction of about 70% compared to 
normal volumes.  Is that expected to improve in the near future?
Perhaps one of the developers has noticed how it could be improved 
and has it on their TODO list?
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php
