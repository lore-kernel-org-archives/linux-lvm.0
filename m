Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i7PL5Y310551
	for <linux-lvm@redhat.com>; Wed, 25 Aug 2004 17:05:34 -0400
Received: from mallaury.noc.nerim.net (smtp-103-wednesday.noc.nerim.net
	[62.4.17.103])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i7PL5S9L000669
	for <linux-lvm@redhat.com>; Wed, 25 Aug 2004 17:05:28 -0400
Received: from bandit.lilotux.net (lilotux.net [62.212.107.33])
	by mallaury.noc.nerim.net (Postfix) with ESMTP id 01CA262DBC
	for <linux-lvm@redhat.com>; Wed, 25 Aug 2004 23:05:25 +0200 (CEST)
Received: from mikael by bandit.lilotux.net with local (Exim 3.35 #1 (Debian))
	id 1C04xT-00001t-00
	for <linux-lvm@redhat.com>; Wed, 25 Aug 2004 23:05:27 +0200
Date: Wed, 25 Aug 2004 23:05:27 +0200
From: Mikael Berthe <bmikael@lists.lilotux.net>
Message-ID: <20040825210527.GK21691@lilotux.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Kernel crash (2.4.27 + DeviceMapper + grsecurity)
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi,

I am wondering if some people are running a 2.4.27 kernel with both
device-mapper and grsecurity.

I've been using these patches with the 2.4.25 and 2.4.26 kernel without
trouble.

Since I have upgraded to 2.4.27, I have experienced two system crashes.
I have no oops, but using a serial cable and Magic sys keys, I can see
that these two crashes happened at 06:25 during logs rotation:
savelog       S 00000000  3948 18480  24071 22315               (NOTLB)
mv            R current      8 22315  18480                     (NOTLB)

Each time the last process is "mv" (stuck in a system call).

The EIP seems to show that the system is stuck in gr_handle_rename
(which is in gracl.c).
(I don't know if it is relevant, but as it was the same for both crashes
I guess there is perhaps something weird here...).

The DM patch I'm using is linux-2.4.26-rc1-devmapper-ioctl.patch.gz.

Regards,
  --MiKael

P.-S.: please CC me as I'm not on this list...
