Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r0TJpumK025559
	for <linux-lvm@redhat.com>; Tue, 29 Jan 2013 14:51:56 -0500
Received: from furnace.wzff.de (furnace.wzff.de [176.9.216.40])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0TJpt3B017577
	for <linux-lvm@redhat.com>; Tue, 29 Jan 2013 14:51:55 -0500
Received: from xdsl-188-155-204-150.adslplus.ch ([188.155.204.150]
	helo=[10.1.1.4])
	by furnace.wzff.de with esmtpsa (TLSv1:DHE-RSA-CAMELLIA256-SHA:256)
	(Exim 4.80.1 (FreeBSD)) (envelope-from <maillist-lvm@barfooze.de>)
	id 1U0HDl-000631-Io
	for linux-lvm@redhat.com; Tue, 29 Jan 2013 20:51:55 +0100
Message-ID: <51082839.5080400@barfooze.de>
Date: Tue, 29 Jan 2013 20:51:21 +0100
From: John Spencer <maillist-lvm@barfooze.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm2 portability issues (GNU sed is assumed)
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

hi list,

during lvm2.2.02.98 compilation,
a linker script gets generated which exposes only symbols matching the 
gnu sed regex. this fails using a posix compliant sed program, leading 
to an almost empty linker script and subsequently missing symbols:

set -e; \
( cat ./.exported_symbols; \
   if test x./libdevmapper.h != x; then \
         gcc -E -P -I./ioctl -I. -I. -I../include -DHAVE_CONFIG_H 
-DDM_IOCTLS -DDM_DEVICE_UID=0 -DDM_DEVICE_GID=0 -DDM_DEVICE_MODE=0600 
./libdevmapper.h | \
         sed -ne "/^typedef|}/!s/.*[ \*]\(\dm_[a-z0-9_]*\)(.*/\1/p"; \
   fi \
) > .exported_symbols_generated
set -e; (echo "Base {"; echo "  global:"; \
          sed "s/^/              /;s/$/;/" < .exported_symbols_generated; \
          echo " local:"; echo "         *;"; echo "};") > .export.sym
gcc -shared -Wl,-soname,libdevmapper.so.1.02 \
         -D_GNU_SOURCE -fPIC  -O2 -Wl,--version-script,.export.sym 
-L../libdm -L../lib -L../libdaemon/client datastruct/bitset.o 
datastruct/hash.o datastruct/list.o libdm-common.o libdm-file.o 
libdm-deptree.o libdm-string.o libdm-report.o libdm-config.o 
mm/dbg_malloc.o mm/pool.o regex/matcher.o regex/parse_rx.o regex/ttree.o 
ioctl/libdm-iface.o    -o ioctl/libdevmapper.so.1.02


here is the statement that generates the symbollist:

gcc -E -P -I./ioctl -I. -I. -I../include -DHAVE_CONFIG_H -DDM_IOCTLS 
-DDM_DEVICE_UID=0 -DDM_DEVICE_GID=0 -DDM_DEVICE_MODE=0600 
./libdevmapper.h | sed -ne "/^typedef|}/!s/.*[ 
\*]\(\dm_[a-z0-9_]*\)(.*/\1/p";


may i ask kindly to reformulate that statement so that it works with 
posix sed (as used in busybox 1.20.2) ?

afaict, both the usage of | and \d are non-posix. the latter can 
probably be fixed by using [:digit:], the former by using 2 separate 
statements.

thanks,
--JS
