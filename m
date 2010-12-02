Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oB2EBniT016553
	for <linux-lvm@redhat.com>; Thu, 2 Dec 2010 09:11:49 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [18.85.46.34])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oB2EBa8q017504
	for <linux-lvm@redhat.com>; Thu, 2 Dec 2010 09:11:37 -0500
Date: Thu, 2 Dec 2010 09:11:34 -0500
From: Christoph Hellwig <hch@infradead.org>
Message-ID: <20101202141134.GA22012@infradead.org>
References: <4CF7A539.1050206@shiftmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4CF7A539.1050206@shiftmail.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Spelic <spelic@shiftmail.org>
Cc: linux-lvm@redhat.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, xfs@oss.sgi.com

I'm pretty sure you have CONFIG_DEBUG_BLOCK_EXT_DEVT enabled.  This
option must never be enabled, as it causes block devices to be
randomly renumered.  Together with the ramdisk driver overloading
the BLKFLSBUF ioctl to discard all data it guarantees you to get
data loss like yours.
