Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBB7iQ117437
	for <linux-lvm@redhat.com>; Sun, 11 Dec 2005 02:44:26 -0500
Received: from shell.wgops.com (postfix@free.wgops.com [69.51.116.66])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jBB7iINr007858
	for <linux-lvm@redhat.com>; Sun, 11 Dec 2005 02:44:22 -0500
Date: Sun, 11 Dec 2005 00:43:59 -0700
From: Michael Loftis <mloftis@wgops.com>
Subject: Re: [linux-lvm] LVM onFly features
Message-ID: <2E0135B63A1277989C93A2C6@dhcp-2-206.wgops.com>
In-Reply-To: <1cbd6f830512101938g4ec7d36dq4fd9a081658edf47@mail.gmail.com>
References: <1cbd6f830512101138t10ec4f77j217ee8830a60a97b@mail.gmail.com>
	<CB9E5AC681BF4CD0966C6872@dhcp-2-206.wgops.com>
	<20051210200646.GF3103@mjk.myfqdn.de>
	<A8AB02E392149E55AC45BF7A@dhcp-2-206.wgops.com>
	<20051210202232.GG3103@mjk.myfqdn.de>
	<64AE95D76D81F71989D42E79@dhcp-2-206.wgops.com>
	<20051210223139.GI3103@mjk.myfqdn.de>
	<B3E2561C8D66866DCF5FD2D8@dhcp-2-206.wgops.com>
	<208D3DC6840704A034151D63@dhcp-2-206.wgops.com>
	<20051210230341.GJ3103@mjk.myfqdn.de>
	<1cbd6f830512101938g4ec7d36dq4fd9a081658edf47@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Marc-Jano Knopp <pub_ml_lvm@marc-jano.de>



--On December 10, 2005 10:38:46 PM -0500 Mag Gam <magawake@gmail.com> wrote:

> thanks everyone for their kind replies.
>
> So, will LVM and FS (ext2/3 in particular )ever be considered as 1?
> This would be nice for ease of devt.

I sure hope not.  They're different beasts in my mind, not to mention there 
are things other than filesystems that can go on block devices (oracle 
databases for one, though that's becoming depricated).
