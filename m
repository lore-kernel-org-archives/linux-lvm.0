Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i28JGq823720
	for <linux-lvm@redhat.com>; Mon, 8 Mar 2004 14:16:52 -0500
Received: from mail.osdl.org (fw.osdl.org [65.172.181.6])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i28JGpST013750
	for <linux-lvm@redhat.com>; Mon, 8 Mar 2004 14:16:52 -0500
Message-Id: <200403081916.i28JGgE25794@mail.osdl.org>
From: markw@osdl.org
MIME-Version: 1.0
Subject: [linux-lvm] lvm2 performance data with linux-2.6
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Mon Mar  8 14:15:00 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com
Cc: linux-kernel@vger.kernel.org

I've started collecting various data (including oprofile) using our
DBT-2 (OLTP) workload with lvm2 on linux 2.6.2 and 2.6.3 on ia32 and
ia64 platforms:
	http://developer.osdl.org/markw/lvm2/

So far I've only varied the stripe width with lvm, from 8 KB to 512 KB,
for PostgreSQL that is using 8 KB sized blocks with ext2.  It appears
that a stripe width of 16 KB through 128KB on the ia64 system gives the
best throughput for the DBT-2 workload on a volume that should be doing
mostly sequential writes.

I'm going to run through more tests varying the block size that
PostgreSQL uses, but I wanted to share what I had so far in case there
were other suggestions or recommendations.

-- 
Mark Wong - - markw@osdl.org
Open Source Development Lab Inc - A non-profit corporation
12725 SW Millikan Way - Suite 400 - Beaverton, OR 97005
(503) 626-2455 x 32 (office)
(503) 626-2436      (fax)
http://developer.osdl.org/markw/
