From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200009272051.e8RKpv201409@webber.adilger.net>
Subject: Re: [linux-lvm] hangs when mounting snapshot
In-Reply-To: <20000926004635.B23678@ultraviolet.org> "from Tracy R Reed at Sep
 26, 2000 00:46:35 am"
Date: Wed, 27 Sep 2000 14:51:56 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tracy R Reed <treed@ultraviolet.org>
Cc: Linux LVM mailing list <linux-lvm@msede.com>

Tracy writes:
> No modules in ksyms, skipping objects
> Warning (read_lsmod): no symbols in lsmod, is /proc/modules a valid lsmod file?
> Sep 25 13:58:57 reiser kernel: CPU:    1 
> Sep 25 13:58:57 reiser kernel: EIP:    0010:[lvm_snapshot_remap_block+17/244] 
                                               ^^^^^^^^^^^^^^^^^^^^^^^^
 [snip]

> Sep 25 13:58:57 reiser kernel: Call Trace: [sysctl_string+204/348]
> [lvm_map+1095/1208] [padzero+28/32] [<e0848000>] [load_elf_binary+3023/3408]
> [load_elf_binary+0/3408] [lvm_make_request_fn+15/24]  
> 
> ... my problem may or may not be the same as the other posters problem.
> He was getting the oops in lvm_snapshot_remap_block but it looks like I
> am getting it in lvm_make_request_fn.

Actually, it looks like you are having the same problem.  From what I can
see, the only thing that is used as a divisor is "chunk_size" (inside
hash_fn in lvm_find_exception, which is inline).

Is it possible that your user tools are not up-to-date with the kernel
LVM headers?  It appears that the lv_chunk_size field is after the
silly __unused field in the lv_v2_t struct (as are all of the other
snapshot fields).  This may be throwing things off, because if you look
at tools/lib/lvm.h, this field isn't there...

I fixed this in my LVM tools RPM by using only the kernel lvm.h file
to ensure they always match.  Try adding the "uint8_t __unused" field to
lv_v2_t in tools/lib/lvm.h, recompile, and see if this fixes your problem...

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
