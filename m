Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r719JPSK013726
	for <linux-lvm@redhat.com>; Thu, 1 Aug 2013 05:19:25 -0400
Received: from arafel.iwakd.de (arafel.iwakd.de [78.46.72.57])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r719JN8l030857
	for <linux-lvm@redhat.com>; Thu, 1 Aug 2013 05:19:23 -0400
Received: from webmail.iwakd.de (localhost [127.0.0.1])
	by arafel.iwakd.de (Postfix) with ESMTP id 939DC40024
	for <linux-lvm@redhat.com>; Thu,  1 Aug 2013 11:19:21 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Thu, 01 Aug 2013 10:19:21 +0100
From: Christian Seiler <christian@iwakd.de>
In-Reply-To: <51F94911.8080405@iwakd.de>
References: <1375197482-4824-1-git-send-email-christian@iwakd.de>
	<51F8CFDD.5060605@redhat.com>
	<573874159e2a0196c68f44d6b5dc334a@iwakd.de>
	<51F8FEB7.9050004@redhat.com> <51F94911.8080405@iwakd.de>
Message-ID: <3b25d3821598bb4484b1eb9dde67b3e6@iwakd.de>
Subject: Re: [linux-lvm] [PATCH] lvremove: perform retry logic also on -real
 subvolume for snapshots
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

Hi again,

so I tried to use the current git version of LVM to see if I could
reproduce the problem, and I couldn't, even with Debian's udev rules.
Apparently, there is still a difference between the version that comes
with Debian Wheezy and the current git tree with respect to this
problem. (I actually thought the relevant patches were included, but
apparently I was wrong.) On the other hand, I'm too lazy to bisect the
entire commit history to see what exactly was the change that fixed it.

Nevertheless, I think it might be a good idea to still apply my patch
(perhaps with a slightly different commit message) just to provide an
additional layer of robustness, especially since it fixes the problem
in a previous version.

Christian
