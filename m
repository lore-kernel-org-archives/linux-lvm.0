Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u59KpgDd029817
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Thu, 9 Jun 2016 16:51:42 -0400
Received: from inet.itmo.dyndns.org (nblzone-210-178.nblnetworks.fi
	[83.145.210.178])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 671133299
	for <linux-lvm@redhat.com>; Thu,  9 Jun 2016 20:51:40 +0000 (UTC)
Date: Thu, 9 Jun 2016 23:24:33 +0300 (EEST)
From: Markus Mikkolainen <itm@kabuto.fi>
Message-ID: <alpine.LRH.2.02.1606092320290.5953@inet.itmo.dyndns.org>
MIME-Version: 1.0
Sender: <itm@itmo.dyndns.org>
Subject: [linux-lvm] corruption on reattaching cache
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
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com
Cc: mark@xwax.org

I seem to have hit the same snag as Mark describes in his post.

https://www.redhat.com/archives/linux-lvm/2015-April/msg00025.html

with kernel 4.4.6 I detached (--splitcache) a writeback cache from a 
mounted lv which was then synchronized and detached. Then I reattached it 
and shortly detached it again. What was interesting is that after the 
second detach it synchronized AGAIN starting from 100% , and then I 
started getting filesystem errors. I immediately shutdown, and forced an 
fsck , and didnt lose that much data, but still had some stuff to correct.

It looked to me like a detached cache, being reattached will retain all 
cached data on it, even though it was supposed to be written to the 
backing disk, and then instead of marking it clean on attaching, it will 
continue serving old data from the cache.
