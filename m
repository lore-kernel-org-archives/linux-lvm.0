Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0S8ovvC025995
	for <linux-lvm@redhat.com>; Wed, 28 Jan 2009 03:50:57 -0500
Received: from buexe.b-5.de (buexe.b-5.de [84.19.0.30])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n0S8ofNC031809
	for <linux-lvm@redhat.com>; Wed, 28 Jan 2009 03:50:42 -0500
Received: from alanya.lupe-christoph.de (alanya.lupe-christoph.de
	[172.17.0.19])
	by buexe.b-5.de (8.13.8/8.13.8/b-5/buexe-3.6.3) with ESMTP id
	n0S8odHa004776
	for <linux-lvm@redhat.com>; Wed, 28 Jan 2009 09:50:39 +0100
Received: from localhost (localhost [127.0.0.1])
	by alanya.lupe-christoph.de (Postfix) with ESMTP id A5E422C0B1
	for <linux-lvm@redhat.com>; Wed, 28 Jan 2009 09:50:24 +0100 (CET)
Received: from alanya.lupe-christoph.de ([127.0.0.1])
	by localhost (alanya.lupe-christoph.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id QnNcObwCfbYt for <linux-lvm@redhat.com>;
	Wed, 28 Jan 2009 09:50:24 +0100 (CET)
Date: Wed, 28 Jan 2009 09:50:24 +0100
From: Lupe Christoph <lupe@lupe-christoph.de>
Message-ID: <20090128085024.GA14023@lupe-christoph.de>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Size of the mirror log?
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi!

I'm unable to find any information on how the size of the mirror log is
determined. Right now I only have four volumes of 1GB each to test this,
obviously too little. We will be getting a few 128GB volumes soon, but I
would rather have a formula than some test results...

I presume the size will depend on the number of mirror regions, but how
much log does a region require?

Thanks for help,
Lupe Christoph
-- 
| There is no substitute for bad design except worse design.                   |
| /me                                                                          |
