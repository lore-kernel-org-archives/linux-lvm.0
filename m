Subject: Re: [linux-lvm] LVM 1.0.7, kernel 2.4.21 and snapshots over ext3 filesystem
Message-ID: <15079-39127@sneakemail.com>
References: <000101c33ff3$65beed00$1a01a8c0@carpetana07>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000101c33ff3$65beed00$1a01a8c0@carpetana07>
From: "Wolfgang Weisselberg" <uzx87lvfmukwc001@sneakemail.com>
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
Date: Tue Jul  1 16:17:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Alberto Picon Couselo wrote 57 lines:

> Hello everybody. I'm having a lot problems trying to enable snapshots on an
> EXT3 Logical Volume. I was using LVM 1.0.4 and I decided to upgrade to LVM
> 1.0.7 and Linux kernel 2.4.21 on a Debian 3.0 to fix it.

It works here in exactly the same configuration.
 
> What's happenning?. I have upgraded LVM to 1.0.7, compiled VFS-lock kernel
> patch for LVM using LVM native utility, compiled the kernel, and everything
> seems to work fine. However, snapshots do not mount correctly.   

My bet is that you first patched the kernel for VFS-lock and
*then* patched the kernel for LVM.  This undoes (parts of)
the VFS-lock.  The reason is as follows:

- AFAICS the LVM kernel patch generator has functions as they
  should be in the kernel
- this means the 'patch' is dynamically build by comparing
  the current kernel with the functions LVM wants there.
- so if the VFS-lock patch is in the kernel, LVM will
  'correct' it, undoing it's efforts.

So I do the following dance to generate my kernel:
(NOTE: I store my semi-current kernel sources at
 /usr/src/$VERSION/. YMMV.
 I also rename my kernels to ...-lvm in the makefile)

| OLD_VERSION=2.4.20
| NEW_VERSION=2.4.21
| LVM_VERSION=1.0.7
| VFS_LOCK_PATCH=linux-2.4.21-VFS-lock.patch
| LVM_PATCH=lvm-$LVM_VERSION-$NEW_VERSION.patch
| 
| 
| # make a dir for the version, i.e.
| mkdir -p /usr/src/$NEW_VERSION
| cd /usr/src/$NEW_VERSION
| 
| tar -xjf /usr/src/linux-$OLD_VERSION.tar.bz2 			&&
| mv linux-$OLD_VERSION linux-$NEW_VERSION-lvm			&&
| cd linux-$NEW_VERSION-lvm					&&
| bzcat /usr/src/KERNELPATCHES/patch-$NEW_VERSION.bz2 | patch -p1 && echo OK 
| #  add more patches?
| 
| cd /usr/src/LVM/LVM/$LVM_VERSION
| make distclean
| ./configure --with-kernel_dir=/usr/src/$NEW_VERSION/linux-$NEW_VERSION-lvm
| cd PATCHES
| make
| cp $LVM_PATCH /usr/src/KERNELPATCHES
| cd /usr/src/$NEW_VERSION/linux-$NEW_VERSION-lvm
| 
| cat /usr/src/KERNELPATCHES/$LVM_PATCH | patch -p1 && echo OK
| 
| cat /usr/src/KERNELPATCHES/$VFS_LOCK_PATCH | patch -p1 && echo OK
| 
| vim Makefile +/EXTRAVERSION	# add -lvm
| 
| cp /boot/config-2.4.21-lvm .config		# or your base config!
| make oldconfig					# for new questions
| # make menuconfig 	# if needed
| 
| ### NOTE: IO-APIC seems to make these dma 30 timeout errors!
| 
| export PATCH_THE_KERNEL=YES
| make-kpkg --initrd --uc --us buildpackage &&
|     make-kpkg modules_clean modules_config modules_image --uc --us 
| 
| cd ..
| mv ../nvidia-kernel-*_i386.deb .
| ls *.deb
| 
| # if nvidia fails, check /usr/src/modules.  And unpack the new nvidia
| # modules (see their README.Debian).
| 
| # beware!  no bad nvidia allowed!
| 
| dpkg --install *.deb
| 
| #update /etc/lilo.conf && /sbin/lilo if you want.

Mayhaps that does help you.

-Wolfgang
