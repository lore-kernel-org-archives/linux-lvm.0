Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 773247B145
	for <linux-lvm@redhat.com>; Sun, 16 Sep 2018 23:36:11 +0000 (UTC)
Received: from server1.tudorejo.org (server1.tudorejo.org [172.104.8.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D2D6037E79
	for <linux-lvm@redhat.com>; Sun, 16 Sep 2018 23:36:09 +0000 (UTC)
Received: from [::1] (port=48016 helo=server1.tudorejo.org)
	by server1.tudorejo.org with esmtpa (Exim 4.91)
	(envelope-from <tudor@tudorholton.com>) id 1g1gaG-0007KQ-TH
	for linux-lvm@redhat.com; Sun, 16 Sep 2018 23:36:08 +0000
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Mon, 17 Sep 2018 09:36:08 +1000
From: tudor@tudorholton.com
Message-ID: <c0a0c50159e74ffc44bf813b82673f1b@tudorholton.com>
Subject: [linux-lvm] (Why) Does lvmcreate --raid6 need 5 drives?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

This question was originally put on ServerFault here: 
https://serverfault.com/questions/931150/why-does-lvmraid6-need-5-drives

I'm investigating using LVMRAID instead of MD+LVM. In my case, I'm 
looking at a RAID6. As expected, the docs say you need N+1 devices for 
RAID5, and a minimum of 3 drives. The docs say for RAID 6 you need N+2.

However, it then says that the minimum drives required is 5, which means 
that N is different.

In an MD RAID6, only 4 drives are required; 2 for striping, 2 for 
parity. So if I built RAID6+LVM I'd only need 4 drives whereas, 
according to the docs, I'd need 5 drives for LVMRAID6.  It was my 
understanding that LVMRAID is really just LVM on MD, so I don't 
understand the difference.

Thomas on ServerFault pointed out that a minimum of 3 stripes is 
hardcoded into the source code[1].

But the commit message[2] doesn't seem to indicate a reasoning behind 
requiring a higher number of striped for RAID6 than RAID5.

Why does LVMRAID need 3 stripes for RAID6 where MD only needs 2?

Cheers,
Tudor.

[1] 
https://sourceware.org/git/?p=lvm2.git;a=blob;f=tools/lvcreate.c;h=3c22794b6f1c3cbd155df65421de21dac0bfa9fc;hb=HEAD#l528
[2] 
https://sourceware.org/git/?p=lvm2.git;a=commit;f=tools/lvcreate.c;h=ea0f604e704dc8418d962e20529fd1bcddf06bb7
