Return-Path: <alan@lxorguk.ukuu.org.uk>
Date: Fri, 13 Jul 2001 22:14:19 +0100 (BST)
In-Reply-To: <200107132041.f6DKfqM8013404@webber.adilger.int> from "Andreas Dilger" at Jul 13, 2001 02:41:52 PM
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <E15LAGR-0000HX-00@the-village.bc.nu>
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
To: Andreas Dilger <adilger@turbolinux.com>
Cc: "Albert D. Cahalan" <acahalan@cs.uml.edu>, Ben LaHaise <bcrl@redhat.com>, Ragnar Kjxrstad <kernel@ragnark.vestdata.no>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, mike@bigstorage.com, kevin@bigstorage.com, linux-lvm@sistina.com

> RAID 5 throws a wrench into this by not guaranteeing that all of the
> blocks in a stripe are consistent (you don't know which blocks and/or
> parity were written and which not).  Ideally, you want a multi-stage
> commit for RAID as well, so that you write the data first, and the
> parity afterwards (so on reboot you trust the data first, and not the
> parity).  You have a problem if there is a bad disk and you crash.

Well to be honest so does most disk firmware. IDE especially. For one thing
the logical sector size the drives writes need not match the illusions
provided upstream, and the write flush commands are frequently not implemented
because they damage benchmarketing numbers from folks like Zdnet..
