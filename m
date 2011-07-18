Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p6I5qgIA031072
	for <linux-lvm@redhat.com>; Mon, 18 Jul 2011 01:52:42 -0400
Received: from maude.comedia.it (maude.comedia.it [77.93.254.181])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p6I5qXMI031641
	for <linux-lvm@redhat.com>; Mon, 18 Jul 2011 01:52:34 -0400
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id DBF7A86FD1
	for <linux-lvm@redhat.com>; Mon, 18 Jul 2011 07:52:32 +0200 (CEST)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id e2jkmKHwrArf for <linux-lvm@redhat.com>;
	Mon, 18 Jul 2011 07:52:28 +0200 (CEST)
Date: Mon, 18 Jul 2011 07:52:28 +0200
From: Luca Berra <bluca@comedia.it>
Message-ID: <20110718055228.GA9037@maude.comedia.it>
References: <4E1A526F.9090700@tlinx.org>
	<20110711021630.GC7857@agk-dp.fab.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20110711021630.GC7857@agk-dp.fab.redhat.com>
Subject: Re: [linux-lvm] Inconsistent naming...?
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Mon, Jul 11, 2011 at 03:16:31AM +0100, Alasdair G Kergon wrote:
>The canonical name to use is /dev/<vgname>/<lvname>.
>That's been inherited from the original LVM1 code and has never changed.
>That's the only form of the name to use to maintain compatibility.
>
>Other forms - dm-N and /dev/mapper/X-Y are internal and the format of
>those is not guaranteed: indeed there'll probably be some further
>changes soon to workaround some other completely arbitrary udev
>restrictions we don't cope with yet.
>
>Different versions of df and mount haven't always retained this 
>preferred form for their output.
>
note that on a freshly installed rhel 6.1 i have this in fstab

/dev/mapper/vg_candela--lv_root / ext4 ....

L.

-- 
Luca Berra -- bluca@comedia.it
