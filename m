Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k383GMLe029128
	for <linux-lvm@redhat.com>; Fri, 7 Apr 2006 23:16:22 -0400
Received: from ender.volumehost.net (adsl-69-154-123-202.dsl.fyvlar.swbell.net
	[69.154.123.202])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k383GLx0025879
	for <linux-lvm@redhat.com>; Fri, 7 Apr 2006 23:16:21 -0400
Received: from localhost (localhost [127.0.0.1])
	by ender.volumehost.net (Postfix) with ESMTP id D7270B65E
	for <linux-lvm@redhat.com>; Sat,  8 Apr 2006 03:16:20 +0000 (UTC)
Received: from ender.volumehost.net ([127.0.0.1])
	by localhost (ender.volumehost.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 14271-05 for <linux-lvm@redhat.com>;
	Sat,  8 Apr 2006 03:16:17 +0000 (UTC)
Received: from ath600 (ip70-178-219-238.ks.ks.cox.net [70.178.219.238])
	(using SSLv3 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by ender.volumehost.net (Postfix) with ESMTP id 7991DB60F
	for <linux-lvm@redhat.com>; Sat,  8 Apr 2006 03:16:17 +0000 (UTC)
From: Zac Slade <krakrjak@volumehost.net>
Subject: Re: [linux-lvm] LVM over IP network
Date: Fri, 7 Apr 2006 22:16:14 -0500
References: <1144412972.44365b2c36361@mail.sify.com>
In-Reply-To: <1144412972.44365b2c36361@mail.sify.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200604072216.14803.krakrjak@volumehost.net>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Friday 07 April 2006 07:59, rarulselvan@sify.com wrote:
> I do understand that LVM and EVMS are quite useful for managing the disk
> space in given work station. So I am wondering if there is such thing as
> LVM over IP network ? so that I can maximize my disk usage. If not, what is
> my other choice ?
Why not?  Using iSCSI or ATAoE you can export the extra space from each of the 
system as devices that will appear to be block devices.  From there you can 
add them to a vg anytime you want.  Just be careful how you do it because if 
one of the systems goes off the network you will not have access to the data 
from that drive.  Also I'm not so sure how well LVM deals with having a drive 
dissappear out from underneath it.

-- 
Zac Slade
krakrjak@volumehost.net
ICQ:1415282 YM:krakrjak AIM:ttyp99
