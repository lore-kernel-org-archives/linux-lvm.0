Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200012020529.WAA00876@lynx.turbolabs.com>
Subject: Re: [linux-lvm] Using Oracle with lvm AND rawio: read(512) from
Date: Fri, 1 Dec 2000 22:29:56 -0700 (MST)
In-Reply-To: <3A2843C6.D277A3F7@tls.msk.ru> from "Michael Ju. Tokarev" at Dec 02, 2000 03:35:18 AM
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: linux-lvm@sistina.com

Michael Tokarev writes:
> What's *still* unknown to me is a difference between character and
> block specials.  In principle, block device should only allow
> block access (i.e. multiple of 512 or 1024 or whatether size),
> while character devs should allow read of 1 byte.

Actually, it is just the opposite for devices like hard drives:
the block interface will read a whole block no matter what size of
I/O you do, and it will cache the block for any smaller read/write
actions (i.e. read whole block-modify part of block-write whole block).
The character interface do NOT buffer the data, so the application
is forced to do correct block-sized and aligned reads/writes themselves.
The benefit of the character device is that it doesn't do cacheing.

> but for shure this isn't a solution, since we'll not be able
> to extend that datafile from oracle (like extending filesystem
> on top of lv), since this again will require writing/reading
> like at initial creation time, -- so almost all lvm work will
> go away.

You don't have to extend the datafiles for Oracle, just add a new
datafile to the tablespace.

Cheers, Andreas
-- 
Andreas Dilger                               TurboLabs filesystem development
