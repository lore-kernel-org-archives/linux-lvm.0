Date: Tue, 29 Aug 2000 20:32:39 +0200
From: Jan Niehusmann <jan@gondor.com>
Subject: [linux-lvm] rpm
Message-ID: <20000829203239.A1030@gondor.com>
References: <39AB63C5.C58D15F8@twc.de> <200008291622.KAA02929@lynx.turbolabs.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200008291622.KAA02929@lynx.turbolabs.com>; from adilger@turbolinux.com on Tue, Aug 29, 2000 at 10:22:06AM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolinux.com>
Cc: linux-lvm@msede.com

On Tue, Aug 29, 2000 at 10:22:06AM -0600, Andreas Dilger wrote:
> See ftp.lustre.org:/pub/adilger for an SRPM which has a patch to fix
> all known LVM user-tools bugs, as well as a kernel patch for 0.8final
> on 2.2.16.  I was told by Les Hazelton that my LVM kernel patch will
> apply cleanly to kernel-source-2.2.17-0.16mdk.i586.rpm, from the
> mandrake cooker section on rpmfind.net.

I compared your .srpm with the one I created for mandrake. There where only
minor differences(*), but I noticed you removed dependence on the local lvm.h,
while I don't use linux/lvm.h any more.

I think it's better not to use linux/lvm.h because kernel headers may belong
to an older kernel version without lvm support. (Linus said on linux-kernel
that he prefers that /usr/include/linux and /usr/src/linux are of the kernel
version used when glibc was compiled)

On mandrake, the standard kernel doesn't support lvm, but on 7.2 it will 
probably be possible to install a 2.4 kernel optionally. linux/lvm.h will
not be available at build time.

What do you think?


Jan


(*) I did miss some minor bugfixes, and I'll upload an updated SRPM, soon.
