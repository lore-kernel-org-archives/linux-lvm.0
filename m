From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200009011753.LAA06247@lynx.turbolabs.com>
Subject: [linux-lvm] Re: lvm.h kernel/userspace differences
Date: Fri, 1 Sep 2000 11:53:09 -0600 (MDT)
In-Reply-To: <20000901132936.A3526@gondor.com> from "Jan Niehusmann" at Sep 01, 2000 01:29:36 PM
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Jan Niehusmann <jan@gondor.com>
Cc: linux-lvm@msede.com

Jan Niehusmann writes:
> I just compared lvm.h from 0.8final and from linux 2.4.0-test7 (which is 
> running on this computer). You are right, IOP version is different.
> 
> But: Kernel defines LVM_DRIVER_IOP_VERSION to "6" and exports it via 
> ioctl LVM_GET_IOP_VERSION. Userspace requests this in lvm_get_iop_version.
> The only place where lvm_get_iop_version gets called is LVM_CHECK_IOP in
> lvm_user.h, where the result (the kernel IOP version) is compared to
> LVM_LIB_IOP_VERSION (and not to LVM_DRIVER_IOP_VERSION), and 
> LVM_LIB_IOP_VERSION is "6", as defined in liblvm.h. 

This is scary anyways.

> Additionaly, the following things have changed between 0.8final lvm.h and
> the linux-2.4.0-test7 version:

This is even scarier.  I _think_ that I followed the 2.4 kernel format as
much as I could, so that I can use both 2.2+patch and 2.4 with the same
tools.

> - some includes and #ifdef KERNEL have changed, nothing that should cause
>   binary incompatibilities, probably
> 
> - many type changes uint -> uint32_t and stuff like that. It looks like only
>   the names have changed, not the real types, so no problem, again. 

I know that my lvm.h works with both user and kernel (which is these changes).

> - kernel's lv_v2_t has an additional field "uint8_t __unused;" _in the middle_
>   of the struct. Huh. What's that?

I don't know why the __unused field is added to the middle of the struct.
This is really terrible because it has all sorts of packing issues and
may cause problems if a different compiler is used for the kernel and
user tools.

> - in the kernel, there is an lv_disk_v2_t that's missing from 0.8final. 
>   But it's identical to lv_disk_v1_t, so what's the point?

Just getting rid of dead code, I guess.

> - pv_flush_req_t is missing the field "kdev_t pv_dev" in kernel. As it is 
>   shorter in kernel, and the missing field is at the end, and the struct is
>   only copied into the kernel, this shouldn't cause problems. But things like
>   that may become a maintenance nightmare. 
> 
> - similar problem with lv_status_byname_req_t, lv_req_t and 
>   lv_status_byindex_req_t: They are missing "ushort size" in kernel.

I can't say I know why this was done.  However, the 2.4 kernel will be the
de-facto standard, so the 2.2 patch may as well work in the same way.

Cheers, Andreas
