Return-Path: <alan@lxorguk.ukuu.org.uk>
Date: Sat, 14 Jul 2001 09:45:44 +0100 (BST)
In-Reply-To: <3B4FBB36.1F692780@uow.edu.au> from "Andrew Morton" at Jul 14, 2001 01:23:34 PM
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <E15LL3Y-0000yJ-00@the-village.bc.nu>
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
To: Andrew Morton <andrewm@uow.edu.au>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, Andreas Dilger <adilger@turbolinux.com>, "Albert D. Cahalan" <acahalan@cs.uml.edu>, Ben LaHaise <bcrl@redhat.com>, Ragnar Kjxrstad <kernel@ragnark.vestdata.no>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, mike@bigstorage.com, kevin@bigstorage.com, linux-lvm@sistina.com

> If, after a power outage, the IDE disk can keep going for long enough
> to write its write cache out to the reserved vendor area (which will
> only take 20-30 milliseconds) then the data may be considered *safe*
> as soon as it hits writecache.

Hohohoho.

> In which case it is perfectly legitimate and sensible for the drive
> to ignore flush commands, and to ack data as soon as it hits cache.

Since the flushing commands are 'optional' it can legitimately ignore them

> If I'm right then the only open question is: which disks do and
> do not do the right thing when the lights go out.

As far as I can tell none of them at least in the IDE world

Alan
