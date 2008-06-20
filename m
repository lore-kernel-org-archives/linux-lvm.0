Received: from file.rdu.redhat.com (file.rdu.redhat.com [10.11.255.147])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m5KKivW7010886
	for <linux-lvm@redhat.com>; Fri, 20 Jun 2008 16:44:57 -0400
Received: from devserv.devel.redhat.com (devserv.devel.redhat.com
	[10.10.36.72])
	by file.rdu.redhat.com (8.13.1/8.13.1) with ESMTP id m5KKivN8005765
	for <linux-lvm@redhat.com>; Fri, 20 Jun 2008 16:44:57 -0400
Received: from mx.meyering.net (sebastian-int.corp.redhat.com [172.16.52.221])
	by devserv.devel.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	m5KKiuMl025487
	for <linux-lvm@redhat.com>; Fri, 20 Jun 2008 16:44:57 -0400
From: Jim Meyering <jim@meyering.net>
Date: Fri, 20 Jun 2008 22:44:56 +0200
Message-ID: <87k5gjn8dz.fsf@rho.meyering.net>
MIME-Version: 1.0
Subject: [linux-lvm] avoid configure-dependent link failures
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
To: LVM general discussion and development <linux-lvm@redhat.com>

I noticed that when configuring without --enable-readline,
or without --enable-cmdlib, building would fail with link errors,
at least on rawhide.

The two patches below fix those problems so that builds
succeed regardless of which settings you choose for those
configure-time options.  i.e., these four builds all succeed:

for enable in enable disable; do
  for f in readline cmdlib; do
    echo --$enable-$f
    { make clean && ./configure --$enable-$f --enable-dmeventd \
      --disable-nls --with-dmdir=$PWD/../device-mapper CFLAGS=-g \
      --enable-readline && make } > log-$enable-$f 2>&1
  done
done

Barring objections, I'll commit these (along with WHATS_NEW
and configure updates) on Monday.
