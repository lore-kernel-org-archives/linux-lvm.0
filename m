Return-Path: <alan@lxorguk.ukuu.org.uk>
Date: Sun, 15 Jul 2001 16:32:59 +0100 (BST)
In-Reply-To: <20010716023911.A10576@weta.f00f.org> from "Chris Wedgwood" at Jul 16, 2001 02:39:11 AM
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <E15LntD-000489-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: [linux-lvm] Re: [PATCH] 64 bit scsi read/write
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Chris Wedgwood <cw@f00f.org>
Cc: Daniel Phillips <phillips@bonn-fries.net>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Andrew Morton <andrewm@uow.edu.au>, Andreas Dilger <adilger@turbolinux.com>, "Albert D. Cahalan" <acahalan@cs.uml.edu>, Ben LaHaise <bcrl@redhat.com>, Ragnar Kjxrstad <kernel@ragnark.vestdata.no>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, mike@bigstorage.com, kevin@bigstorage.com, linux-lvm@sistina.com

> I only have SCSI disks to test with, but they are hot-plug, so I guess
> I can write a whole bunch of blocks with different numbers on them,
> all over the disk, if I can figure out how to place SCSI barriers and
> then pull the drive and see what gives?

Another way is to time

	write block
	write barrier
	write same block
	write barrier
	repeat

If the write barrier is working you should be able to measure the drive rpm 8)
