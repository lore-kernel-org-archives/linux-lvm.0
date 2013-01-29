Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r0TJEAUZ022527
	for <linux-lvm@redhat.com>; Tue, 29 Jan 2013 14:14:10 -0500
Received: from furnace.wzff.de (furnace.wzff.de [176.9.216.40])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0TJE8nn020097
	for <linux-lvm@redhat.com>; Tue, 29 Jan 2013 14:14:09 -0500
Received: from xdsl-188-155-204-150.adslplus.ch ([188.155.204.150]
	helo=[10.1.1.4])
	by furnace.wzff.de with esmtpsa (TLSv1:DHE-RSA-CAMELLIA256-SHA:256)
	(Exim 4.80.1 (FreeBSD)) (envelope-from <maillist-lvm@barfooze.de>)
	id 1U0GdC-0005bo-BH
	for linux-lvm@redhat.com; Tue, 29 Jan 2013 20:14:07 +0100
Message-ID: <51081F5D.8040302@barfooze.de>
Date: Tue, 29 Jan 2013 20:13:33 +0100
From: John Spencer <maillist-lvm@barfooze.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] autoconf/install-sh: not found
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
i'm trying to compile lvm .98 on a busybox-1.20.2-based system, and get 
these errors:

autoconf/install-sh -c -d locking/; \
set -e; \
FILE=`echo locking/external_locking.d | sed 's/\\//\\\\\\//g;s/\\.d//g'`; \
DEPS=`echo ../make.tmpl ../VERSION ../Makefile 
../include/.symlinks_created | sed -e 's/\\//\\\\\\//g'`; \
gcc -MM -I. -I../include -DHAVE_CONFIG_H -DDM_IOCTLS -o 
locking/external_locking.d locking/external_locking.c; \
sed -i "s/\(.*\)\.o[ :]*/$FILE.o $FILE.d $FILE.pot: $DEPS /g" 
locking/external_locking.d; \
[ -s locking/external_locking.d ] || rm -f locking/external_locking.d
/bin/sh: autoconf/install-sh: not found

anyone has an idea what's going on here ?

is autoconf/install-sh intended to be symlinked into some subdirs, or is 
there a missing path prefix ?

i suspect there is some portability bug somewhere where gnu-specific 
behaviour is assumed (as opposed to POSIX).

best regards,
--JS
