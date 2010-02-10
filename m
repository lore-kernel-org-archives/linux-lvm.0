Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o1A6cWZN008349
	for <linux-lvm@redhat.com>; Wed, 10 Feb 2010 01:38:32 -0500
Received: from Ishtar.sc.tlinx.org (ishtar.tlinx.org [64.81.245.74])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o1A6cFHj004614
	for <linux-lvm@redhat.com>; Wed, 10 Feb 2010 01:38:15 -0500
Received: from [192.168.3.12] (Athenae [192.168.3.12])
	by Ishtar.sc.tlinx.org (8.14.3/8.14.3/SuSE Linux 0.8) with ESMTP id
	o1A6cDtg022515
	for <linux-lvm@redhat.com>; Tue, 9 Feb 2010 22:38:15 -0800
Message-ID: <4B725455.1010109@tlinx.org>
Date: Tue, 09 Feb 2010 22:38:13 -0800
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvextend docmentation vs. implementation (lvm2-2.02.39),
	Suse-11.1
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

I have been trying to use the lvextend command using the documented
size format:  of +[number][%{LV|PV|VG|FREE}] --
specifically
+50%LV.

tried multiple variations on LV -- no luck.  Is this broken or
is this just not working in my setup, or am I doing something
wrong?  It fails with:
Invalid argument +5%LV
Error during parsing of command line.

Advice?
thanks,
-linda
