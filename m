Received: from file.rdu.redhat.com (file.rdu.redhat.com [10.11.255.147])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m5C9LdYV030465
	for <linux-lvm@redhat.com>; Thu, 12 Jun 2008 05:21:39 -0400
Received: from devserv.devel.redhat.com (devserv.devel.redhat.com
	[10.10.36.72])
	by file.rdu.redhat.com (8.13.1/8.13.1) with ESMTP id m5C9LcGt016225
	for <linux-lvm@redhat.com>; Thu, 12 Jun 2008 05:21:38 -0400
Received: from mx.meyering.net (sebastian-int.corp.redhat.com [172.16.52.221])
	by devserv.devel.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	m5C9LcAk016158
	for <linux-lvm@redhat.com>; Thu, 12 Jun 2008 05:21:38 -0400
From: Jim Meyering <jim@meyering.net>
Date: Thu, 12 Jun 2008 11:21:37 +0200
Message-ID: <87abhrnh3y.fsf@rho.meyering.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] [PATCH] Makefile.in: correct distclean rule
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Currently, "make distclean" gets lots of errors,
because none of the directories test/mm, test/device, ...
exist any more (they've been moved to old-tests/).
And even those latter never have a Makefile, so the only
sensible thing to do is remove those old subdirs from the
list in Makefile.in.

The change below does that as well as adding "test"
so that "make distclean" traverses into that subdirectory.
Before, "make check" would create test/bin,
but a top-level "make distclean" would not remove it.

FYI, initially I thought it was an oversight that
"make clean" did not remove artifacts from subdirectories,
so I made this additional change:

  diff --git a/Makefile.in b/Makefile.in
  ...
  -ifeq ($(MAKECMDGOALS),distclean)
  +ifneq ($(strip $(filter %clean,$(MAKECMDGOALS))),)

However, it could also be a policy decision, so I left it.

I'll commit the following shortly.
