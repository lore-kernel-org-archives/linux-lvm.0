Date: Sat, 4 Nov 2000 12:09:25 -0500
From: Peter Green <pcg@gospelcom.net>
Subject: Re: [linux-lvm] New 2.2 patches/sources released
Message-ID: <20001104120925.C1656@gospelcom.net>
References: <200010311627.JAA02534@lynx.turbolabs.com> <Pine.LNX.4.21.0011040849350.25705-100000@freak.distro.conectiva>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0011040849350.25705-100000@freak.distro.conectiva>; from marcelo@conectiva.com.br on Sat, Nov 04, 2000 at 08:49:52AM -0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM mailing list <linux-lvm@msede.com>

also sprach marcelo:
> On Tue, 31 Oct 2000, Andreas Dilger wrote:
> > Hello all,
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

ftp://ftp.stelias.com/pub/adilger/

/pg
-- 
Peter Green : Gospel Communications Network, SysAdmin : pcg@gospelcom.net
---
For mad scientists who keep brains in jars, here's a tip: why not add a slice 
of lemon to each jar, for freshness?
 (Jack Handey)
