Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8OK86V22317
	for <linux-lvm@redhat.com>; Sat, 24 Sep 2005 16:08:06 -0400
Received: from pc18.dolda2000.com (1-1-3-7a.rny.sth.bostream.se
	[82.182.133.20])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j8OK809u018329
	for <linux-lvm@redhat.com>; Sat, 24 Sep 2005 16:08:05 -0400
Received: from pc7.dolda2000.com (pc7.dolda2000.com
	[IPv6:2002:52b6:8514:200:20c:76ff:fe3b:a3f4] (may be forged))
	(authenticated bits=0)
	by pc18.dolda2000.com (8.13.4/8.13.3) with ESMTP id j8OK7qdH010508
	for <linux-lvm@redhat.com>; Sat, 24 Sep 2005 22:07:53 +0200
From: Fredrik Tolf <fredrik@dolda2000.com>
Date: Sat, 24 Sep 2005 22:07:53 +0200
Message-Id: <1127592473.14915.2.camel@pc7.dolda2000.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Mirror docs?
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

Hi!

I've been seeing the "mirror" target in the kernel setup menu for the
device mapper for quite some time, but now that I want to use it, I
cannot seem to find any documentation on how to use the LVM tools to
actually set up mirroring.

I've been googling for quite some time, and none of the ordinary tools
that I'm used to (pvcreate, vgextend or lv{create,extend}) seem to fit
into the purpose of mirroring.

Does someone know where I can find some docs on this? Is there, by any
chance, some manpage that I've missed somewhere?

Thanks for your attention!
Fredrik Tolf
