Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102081919.f18JJgF17656@webber.adilger.net>
Subject: Re: [linux-lvm] the curious case of the semi-created Logical Volume
In-Reply-To: <m2ae7xchx1.fsf@andy.off.redeye.com> from Andy Cowling at "Feb 8,
 2001 03:29:14 pm"
Date: Thu, 8 Feb 2001 12:19:42 -0700 (MST)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Andy Cowling writes:
> # lvdisplay -?                  
> Logical Volume Manager 0.8 by Heinz Mauelshagen  04/11/1999 (IOP 6)

This is a fairly old LVM code (2 years almost)...

> # uname -a
> Linux h2o 2.2.16-SMP #1 SMP Wed Aug 2 20:01:21 GMT 2000 i686 unknown
> 
> I tried to build 0.9 and got the following error (presumably because
> the 2.2.16 kernel is not supported)
> 
> # ./lvdisplay -v -D /dev/pv01/lv01
> lvdisplay -- invalid i/o protocol version 6

It is not just the user tools that need to be updated.  You always need
to patch the kernel to have the same LVM version.  Get the latest 0.9.1
beta code, run configure, and then "make" in the PATCHES directory, to
build a kernel patch.

> I tried to build 0.8final but am missing
>                /usr/src/linux/include/linux/lvm.h

You could get this from tools/lib/lvm.h.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
