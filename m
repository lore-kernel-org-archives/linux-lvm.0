Received: from file.rdu.redhat.com (file.rdu.redhat.com [10.11.255.147])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m5DAjAM6028568
	for <linux-lvm@redhat.com>; Fri, 13 Jun 2008 06:45:10 -0400
Received: from devserv.devel.redhat.com (devserv.devel.redhat.com
	[10.10.36.72])
	by file.rdu.redhat.com (8.13.1/8.13.1) with ESMTP id m5DAjAMv017924
	for <linux-lvm@redhat.com>; Fri, 13 Jun 2008 06:45:10 -0400
Received: from mx.meyering.net (sebastian-int.corp.redhat.com [172.16.52.221])
	by devserv.devel.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	m5DAj9tH013284
	for <linux-lvm@redhat.com>; Fri, 13 Jun 2008 06:45:09 -0400
From: Jim Meyering <jim@meyering.net>
Date: Fri, 13 Jun 2008 12:45:09 +0200
Message-ID: <878wx9ipfu.fsf@rho.meyering.net>
MIME-Version: 1.0
Subject: [linux-lvm] uninitialized pointer deref upon failed mirror addition
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

While preparing an unrelated patch, I saw this warning go by,
so went and looked:

  metadata/mirror.c: In function 'add_mirror_images':
  metadata/mirror.c:1347: warning: 'log_lv' may be used uninitialized in this function

It turns out that it is a legitimate warning, indeed,
and an uninitialized log_lv will be dereferenced if any
of the "goto out_remove_log;" statements is reached with
log_count == 0 (aka log_lv uninitialized).

If someone can tell me precisely how to exercise one of the offending
code paths, I'll try to make time to write a test script that'd be run
via "make check".

Here's a proposed (but untested) fix.
