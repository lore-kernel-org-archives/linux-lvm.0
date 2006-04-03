Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k33Dq5uw030610
	for <linux-lvm@redhat.com>; Mon, 3 Apr 2006 09:52:05 -0400
Date: Mon, 3 Apr 2006 14:52:04 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] dmsetup works, but LVM2 fails
Message-ID: <20060403135204.GB4197@agk.surrey.redhat.com>
References: <m2psk0i1vs.fsf@janus.isnogud.escape.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <m2psk0i1vs.fsf@janus.isnogud.escape.de>
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
To: Urs Thuermann <urs@isnogud.escape.de>
Cc: linux-lvm@sistina.com

On Sun, Apr 02, 2006 at 02:43:35PM +0200, Urs Thuermann wrote:
> I installed dmsetup from device-mapper.1.02.03 from source and patched
> the linux-2.4.32 with linux-2.4.28-pre4-devmapper-ioctl.patch which
> worked also with the 2.4.32 sources.  I renamed all LVM1 tools by
> appending .lvm1 and installed LVM2.2.02.02, also from source.
 
Some of the patches that the latest lvm2 tools now rely upon have not
been backported to 2.4 kernels, and we didn't put workarounds into
libdevmapper.

For now, you're limited to using older versions of the the tools 
(device-mapper 1.01 and lvm2 2.01).

Alasdair
-- 
agk@redhat.com
