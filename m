Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8MCGRIE018002
	for <linux-lvm@redhat.com>; Tue, 22 Sep 2009 08:16:27 -0400
Received: from mail-fx0-f205.google.com (mail-fx0-f205.google.com
	[209.85.220.205])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8MCGHBS030530
	for <linux-lvm@redhat.com>; Tue, 22 Sep 2009 08:16:17 -0400
Received: by fxm1 with SMTP id 1so2923281fxm.7
	for <linux-lvm@redhat.com>; Tue, 22 Sep 2009 05:16:16 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 22 Sep 2009 14:16:16 +0200
Message-ID: <c9048c0a0909220516o23075a6h88111b4f42df3039@mail.gmail.com>
From: John Taylor <pi00100100@gmail.com>
Subject: [linux-lvm] Problems at cross-compiling LVM2-2.02.52
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hello,

I have some problems at cross-compiling LVM2-2.02.52 (latest release).
The configure argument list is: --prefix=/usr
--build=i486-unknown-linux-gnu --host=x86_64-unknown-linux-gnu
--target=x86_64-unknown-linux-gnu --disable-nls. First of all, I
noticed I can't build LVM2 from a directory different than that where
I extracted the source tarball, because I get the following error when
running make:

make -C doc device-mapper
make[1]: Entering directory `/mnt/clfs/sources/lvm2-build/doc'
Makefile:21: ../../LVM2-2.02.52/make.tmpl: No such file or directory
make[1]: *** No rule to make target `../../LVM2-2.02.52/make.tmpl'.  Stop.
make[1]: Leaving directory `/mnt/clfs/sources/lvm2-build/doc'
make: *** [doc.device-mapper] Error 2

Even when building from the source directory, I get the following error message:

x86_64-unknown-linux-gnu-gcc -o dmsetup dmsetup.o  -fPIC -Wall -Wundef
-Wshadow -Wcast-align -Wwrite-strings -Wmissing-prototypes
-Wmissing-declarations -Wnested-externs -Winline -Wmissing-noreturn
-Wformat-security -O2 -Wl,--export-dynamic -L../libdm -L../lib \
	      -L../libdm -ldevmapper -lrt -ldl -lncurses
../libdm/libdevmapper.so: undefined reference to `rpl_malloc'
collect2: ld returned 1 exit status
make[1]: *** [dmsetup] Error 1
make[1]: Leaving directory `/mnt/clfs/sources/LVM2-2.02.52/tools'
make: *** [tools.device-mapper] Error 2

Don't know if it the right way to proceed, but I managed to fix this
by adding ac_cv_func_malloc_0_nonnull=yes to the configure argument
list. Despite of this make install now fails with:

Installing example.conf as /mnt/clfs/etc/lvm/lvm.conf
/usr/bin/install: cannot change ownership of
`/mnt/clfs/etc/lvm/lvm.conf': Operation not permitted
make[1]: *** [install_lvm2] Error 1
make[1]: Leaving directory `/mnt/clfs/sources/LVM2-2.02.52/doc'
make: *** [doc.install] Error 2

Of course I can fix this error by running make install as root, but
since I'm not installing in the host system (DESTDIR=/mnt/clfs), I'd
like to run this command as a user. I suggest to add a
--disable-makeinstall-chown configure option, as util-linux-ng package
do.

What do you think?

Thanks.
