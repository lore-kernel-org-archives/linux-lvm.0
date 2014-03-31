Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s2VDJOvD008458
	for <linux-lvm@redhat.com>; Mon, 31 Mar 2014 09:19:24 -0400
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2VDJMSn017840
	for <linux-lvm@redhat.com>; Mon, 31 Mar 2014 09:19:22 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id 3F823200432
	for <linux-lvm@redhat.com>; Mon, 31 Mar 2014 15:19:20 +0200 (CEST)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id bZgBPblagz8U for <linux-lvm@redhat.com>;
	Mon, 31 Mar 2014 15:19:20 +0200 (CEST)
Received: from [192.168.7.100] (p5089454A.dip0.t-ipconnect.de [80.137.69.74])
	(using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id A5554200431
	for <linux-lvm@redhat.com>; Mon, 31 Mar 2014 15:19:19 +0200 (CEST)
Message-ID: <53396B56.3050602@mglug.de>
Date: Mon, 31 Mar 2014 15:19:18 +0200
From: Oliver Rath <rath@mglug.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] compile error: 'DMEVENTD_PATH' undeclared
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi list,

if i compile lvm2 (from today) with this configure:


./configure --with-thin=internal --with-cache=internal
--with-replicators=internal --enable-udev_sync --enable-udev_rules


then the following occures:
.
.
.
make -C lib
make[1]: Entering directory `/root/lvm2/lib'
gcc -c -I. -I../include -DHAVE_CONFIG_H -DDM_IOCTLS -Wall -Wundef
-Wshadow -Wcast-align -Wwrite-strings -Wmissing-prototypes
-Wmissing-declarations -Wnested-externs -Winline -Wmissing-noreturn
-Wformat-security -Wredundant-decls -Wpointer-arith -Wuninitialized
-Wmissing-include-dirs -Wfloat-equal -Wstrict-prototypes
-Wold-style-definition -Wmissing-format-attribute -Wjump-misses-init
-Wclobbered -Wempty-body -Wignored-qualifiers -Wmissing-parameter-type
-Wold-style-declaration -Woverride-init -Wtype-limits -Wsync-nand
-Wlogical-op  -fPIC  -O2    config/config.c -o config/config.o
In file included from config/config.c:70:0:
config/config_settings.h:257:1: error: 'DMEVENTD_PATH' undeclared here
(not in a function)
make[1]: *** [config/config.o] Error 1
make[1]: Leaving directory `/root/lvm2/lib'
make: *** [lib] Error 2
.
.


if i take
./configure --with-thin=internal --with-cache=internal
--with-replicators=internal --enable-udev_sync --enable-udev_rules
--enable-cmdlib --enable-dmeventd


all compiles fine. But I dont know, what dmevetd-flag is good for. Do i
run into problems on a Ubuntu 12.04, if i enable additionally
--enable-cmdlib --enable-dmeventd
  before installing?

Tfh!

Regards
Oliver
