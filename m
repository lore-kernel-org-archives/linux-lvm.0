From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200011042047.eA4KlPv22945@webber.adilger.net>
Subject: Re: [linux-lvm] New 2.2 patches/sources released
In-Reply-To: <Pine.LNX.4.21.0011040849350.25705-100000@freak.distro.conectiva>
 "from Marcelo Tosatti at Nov 4, 2000 08:49:52 am"
Date: Sat, 4 Nov 2000 13:47:25 -0700 (MST)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcelo Tosatti <marcelo@conectiva.com.br>
Cc: Andreas Dilger <adilger@turbolinux.com>, Linux LVM mailing list <linux-lvm@msede.com>

Marcelo Tosatti writes:
> > I've updated my 2.2 patch set.  It is now available as an i386 binary, SRPM,
> > patched .tgz, and standalone patch.  I have also made a 2.4 kernel patch
> > available to allow include/linux/lvm.h be used from user and kernel sources.
> > 
> > Changes include
> > - fix for lvmcreate_initrd to allow passing modules/kernel version
> > - add unpartitioned devices to the disk cache (from SuSE LVM)
> > - unlink /etc/lvmtab before re-creating it (from SuSE LVM)
> > 
> > Attached is the patch for the 2.4 kernel lvm.h, which also fixes a long
> > known bug with using lv_t instead of lv_disk_t.  It is also required
> > for compiling my LVM user tools, since I include <linux/lvm.h> and not
> > <lib/lvm.h> in order to ensure the kernel and tools have same structs.
> 
> URL? :)


Sorry.  It's the same as my previous postings, and I forgot to add it:

ftp://ftp.stelias.com/pub/adilger/

There is a README which describes the various files in that directory.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
