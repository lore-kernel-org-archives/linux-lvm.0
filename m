Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oB2EF5nY032443
	for <linux-lvm@redhat.com>; Thu, 2 Dec 2010 09:15:05 -0500
Received: from BLADE4.ISTI.CNR.IT (blade4.isti.cnr.it [194.119.192.20])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oB2EErKN014641
	for <linux-lvm@redhat.com>; Thu, 2 Dec 2010 09:14:54 -0500
Received: from SCRIPT-SPFWL-DAEMON.mx.isti.cnr.it by mx.isti.cnr.it
	(PMDF V6.5 #31825) id <01NUY70AZZGGLS7BA7@mx.isti.cnr.it> for
	linux-lvm@redhat.com; Thu, 02 Dec 2010 15:14:35 +0100 (MET)
Received: from conversionlocal.isti.cnr.it by mx.isti.cnr.it (PMDF V6.5 #31825)
	id <01NUY706M72OLS71Q6@mx.isti.cnr.it> for linux-lvm@redhat.com; Thu,
	02 Dec 2010 15:14:33 +0100 (MET)
Date: Thu, 02 Dec 2010 15:14:28 +0100
From: Spelic <spelic@shiftmail.org>
In-reply-to: <20101202141134.GA22012@infradead.org>
Message-id: <4CF7A9C4.2040607@shiftmail.org>
MIME-version: 1.0
Content-transfer-encoding: 7bit
References: <4CF7A539.1050206@shiftmail.org>
	<20101202141134.GA22012@infradead.org>
Subject: Re: [linux-lvm] Bugs in mkfs.xfs, device mapper, xfs, and /dev/ram
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: Christoph Hellwig <hch@infradead.org>
Cc: linux-lvm@redhat.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, xfs@oss.sgi.com

On 12/02/2010 03:11 PM, Christoph Hellwig wrote:
> I'm pretty sure you have CONFIG_DEBUG_BLOCK_EXT_DEVT enabled.  This
> option must never be enabled, as it causes block devices to be
> randomly renumered.  Together with the ramdisk driver overloading
> the BLKFLSBUF ioctl to discard all data it guarantees you to get
> data loss like yours.
>    

Nope...

# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
