Date: Fri, 1 Sep 2000 13:29:36 +0200
From: Jan Niehusmann <jan@gondor.com>
Subject: [linux-lvm] lvm.h kernel/userspace differences
Message-ID: <20000901132936.A3526@gondor.com>
References: <20000829203239.A1030@gondor.com> <200009010540.XAA04818@lynx.turbolabs.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200009010540.XAA04818@lynx.turbolabs.com>; from adilger@turbolinux.com on Thu, Aug 31, 2000 at 11:40:10PM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolinux.com>
Cc: linux-lvm@msede.com

On Thu, Aug 31, 2000 at 11:40:10PM -0600, Andreas Dilger wrote:
> Jan Niehusmann, you write:
> > I think it's better not to use linux/lvm.h because kernel headers may belong
> > to an older kernel version without lvm support. (Linus said on linux-kernel
> > that he prefers that /usr/include/linux and /usr/src/linux are of the kernel
> > version used when glibc was compiled)
> There was always something that confused me, and I never got a response
> back from Heinz - in the 0.8final user tools/lib/lvm.h it says the IOP
> version is 7, but the 2.4 kernel lvm.h has IOP version 6 right now,
> so it shouldn't work, but I think the wrong header is being used...

I just compared lvm.h from 0.8final and from linux 2.4.0-test7 (which is 
running on this computer). You are right, IOP version is different.

But: Kernel defines LVM_DRIVER_IOP_VERSION to "6" and exports it via 
ioctl LVM_GET_IOP_VERSION. Userspace requests this in lvm_get_iop_version.
The only place where lvm_get_iop_version gets called is LVM_CHECK_IOP in
lvm_user.h, where the result (the kernel IOP version) is compared to
LVM_LIB_IOP_VERSION (and not to LVM_DRIVER_IOP_VERSION), and 
LVM_LIB_IOP_VERSION is "6", as defined in liblvm.h. 


Additionaly, the following things have changed between 0.8final lvm.h and
the linux-2.4.0-test7 version:

- some includes and #ifdef KERNEL have changed, nothing that should cause
  binary incompatibilities, probably

- many type changes uint -> uint32_t and stuff like that. It looks like only
  the names have changed, not the real types, so no problem, again. 

- kernel's lv_v2_t has an additional field "uint8_t __unused;" _in the middle_
  of the struct. Huh. What's that?
  
- in the kernel, there is an lv_disk_v2_t that's missing from 0.8final. 
  But it's identical to lv_disk_v1_t, so what's the point?

- pv_flush_req_t is missing the field "kdev_t pv_dev" in kernel. As it is 
  shorter in kernel, and the missing field is at the end, and the struct is
  only copied into the kernel, this shouldn't cause problems. But things like
  that may become a maintenance nightmare. 

- similar problem with lv_status_byname_req_t, lv_req_t and 
  lv_status_byindex_req_t: They are missing "ushort size" in kernel.



Jan
