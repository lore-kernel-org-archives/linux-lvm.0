Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8NHMlr00728
	for <linux-lvm@redhat.com>; Thu, 23 Sep 2004 13:22:47 -0400
Received: from pd3mo2so.prod.shaw.ca (shawidc-mo1.cg.shawcable.net
	[24.71.223.10])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i8NHMktE011325
	for <linux-lvm@redhat.com>; Thu, 23 Sep 2004 13:22:46 -0400
Received: from pd5mr6so.prod.shaw.ca
	(pd5mr6so-qfe3.prod.shaw.ca [10.0.141.182]) by l-daemon
	(Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15 2004))
	with ESMTP id <0I4I000MN891QK80@l-daemon> for linux-lvm@redhat.com; Thu,
	23 Sep 2004 11:22:13 -0600 (MDT)
Received: from pn2ml3so.prod.shaw.ca ([10.0.121.147])
	by pd5mr6so.prod.shaw.ca (Sun ONE Messaging Server 6.0 HotFix 1.01
	(built Mar
	15 2004)) with ESMTP id <0I4I0063G891AZ30@pd5mr6so.prod.shaw.ca> for
	linux-lvm@redhat.com; Thu, 23 Sep 2004 11:22:13 -0600 (MDT)
Received: from indygecko.com (S0106002078d58a8c.ok.shawcable.net [24.71.79.27])
	by l-daemon (iPlanet Messaging Server 5.2 HotFix 1.18 (built Jul 28
	2003))
	with ESMTP id <0I4I00BDS8905W@l-daemon> for linux-lvm@redhat.com; Thu,
	23 Sep 2004 11:22:13 -0600 (MDT)
Date: Thu, 23 Sep 2004 10:22:10 -0700
From: Jord Tanner <jord@indygecko.com>
Message-id: <1095960130.8466.38.camel@gecko>
MIME-version: 1.0
Content-transfer-encoding: 7bit
Subject: [linux-lvm] re: Hello. About a bug in lvm2
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com
Cc: zibbe@cisko.org


I had many problems with LVM2 on gentoo with the 2.6 kernel as well. My
solution was to first install the 2.6 kernel headers (linux26-headers),
recompile gcc, glibc, and glib, then install the latest unstable
versions of dev mapper and lvm tools (at that time it was
device-mapper-1.00.17 and lvm2-2.00.15). After that it worked
beautifully. As always YMMV.

(I should note that this was on a dual Opteron box, compiled in 64bit)

Jord Tanner

> Message: 5
> Date: Tue, 21 Sep 2004 17:46:55 +0200
> From: Sebastian Hyrwall <zibbe@cisko.org>
> Subject: [linux-lvm] Hello. About a bug in lvm2
> To: linux-lvm@redhat.com
> Message-ID: <41504CEF.8090508@cisko.org>
> Content-Type: text/plain; charset=ISO-8859-1; format=flowed
> 
> Hey.
> 
> Im not sure but i may have found a bug in the lvm2 userspace-tools. Im
> using gentoo right now and right now
> lvm2 cant "see" some harddrives.
> 
> I first discovered the problem when i changed from 2.4 -> 2.6. In 2.6
> it 
> didnt find all my discs. Later on i saw that when i did
> "pvcreate /dev/hdd1" (tried the devfs-link also /dev/ide/....) it 
> reported that the device couldnt be found.
> There isnt anything wrong with the hd or anything. It shows up in 
> cfdisk/fdisk and i can use it as a normal hd (not in an lvm).
> 
> This occurs for 2 of my disks. hde and hdd. I cant find any difference
> between them and the other drives. They are all the same size.
> 
> 
> Unfortunently i cant provide any more information because i didnt
> think 
> about mailing this to you until after i went back to 2.4.
> 
> 
> Sincerely, Sebastian Hyrwall

-- 
Jord Tanner <jord@indygecko.com>
