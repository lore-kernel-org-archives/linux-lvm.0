Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102232123.f1NLNwh04775@webber.adilger.net>
Subject: Re: [linux-lvm] oops on 2.4.2 with lvm-0.9beta5 and Reiserfs 3.6.25
In-Reply-To: <14998.53544.642864.34288@eagle.mh.lucent.com> from "lvm@winux.com"
 at "Feb 23, 2001 04:07:52 pm"
Date: Fri, 23 Feb 2001 14:23:57 -0700 (MST)
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

Larry writes:
> I just built a new system based on Linux 2.4.2 with LVM 0.9 beta 5.
> I applied the patches, turned on the #define LVM_VFS_ENHANCEMENT,
> rebuilt/booted the kernel and the user level tools.
> 
> I found a reproducible "kernel oops" as shown in the trace attached below.
> 
> The oops always happens if I use 
> 
>   # lvcreate -L 10g ...
>   # lvextend -L +2g ...
> 
> but I've never seen it happen if I use
> 
>   # lvcreate -L 12g ...
> 
> # mkreiserfs /dev/vg0/lv0
> # mount /dev/vg0/lv0 /lv
> # echo hello world > /lv/foo
> # lvcreate -L1g -s -n s0 /dev/vg0/lv0
> lvcreate -- WARNING: the snapshot must be disabled if it gets full
> lvcreate -- INFO: using default snapshot chunk size of 64 KB for "/dev/vg0/s0"
> Segmentation fault
> # dmesg | tail 
> ReiserFS version 3.6.25
> journal-1777: buffer 16 bad state !PREPARED !LOCKED !DIRTY !JDIRTY_WAIT
> Unable to handle kernel NULL pointer dereference at virtual address 00000000
>  printing eip:

You need to run the dmesg output through ksymoops for this to be useful.
The journal-1777 message is definitely a reiserfs error, but there is no
way to tell where the oops happened.  Also running "lvcreate -v -d" may
be useful, if overly verbose.

I wouldn't think that how you create an LV would affect reiserfs, but who
knows?  There could be something in how lvextend updates the in-kernel
information, the beta5 snapshot changes, or it may also be something in
the reiserfs snapshot code.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
