Received: from file.rdu.redhat.com (file.rdu.redhat.com [10.11.255.147])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m5MGamvX032250
	for <linux-lvm@redhat.com>; Sun, 22 Jun 2008 12:36:48 -0400
Received: from devserv.devel.redhat.com (devserv.devel.redhat.com
	[10.10.36.72])
	by file.rdu.redhat.com (8.13.1/8.13.1) with ESMTP id m5MGamtl030742
	for <linux-lvm@redhat.com>; Sun, 22 Jun 2008 12:36:48 -0400
Received: from mx.meyering.net (sebastian-int.corp.redhat.com [172.16.52.221])
	by devserv.devel.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	m5MGalxR030152
	for <linux-lvm@redhat.com>; Sun, 22 Jun 2008 12:36:48 -0400
From: Jim Meyering <jim@meyering.net>
Date: Sun, 22 Jun 2008 18:36:47 +0200
Message-ID: <87ej6pifz4.fsf@rho.meyering.net>
MIME-Version: 1.0
Subject: [linux-lvm] lvm2_run: don't return uninitialized for _memlock_inc
	or _memlock_dec
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

I noticed a valid warning:

  lvmcmdlib.c:45: warning: 'ret' may be used uninitialized in this function

Sure, it's in nominally "Temporary" code (and code we'd rather
be rid of), but it's been over 6 months.
Any objection?
