Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i61EnX020890
	for <linux-lvm@redhat.com>; Thu, 1 Jul 2004 10:49:33 -0400
Received: from smtp.itanets.com (smtp.itanets.com [216.12.200.84])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i61EnRXn028555
	for <linux-lvm@redhat.com>; Thu, 1 Jul 2004 10:49:27 -0400
From: Delian Krustev <krustev@krustev.net>
Subject: Re: [linux-lvm] Snapshots with Debian 2.4.26
Date: Thu, 1 Jul 2004 17:49:19 +0300
References: <40E2FFB1.6060301@hms.harvard.edu> <40E4104B.70809@hms.harvard.edu>
In-Reply-To: <40E4104B.70809@hms.harvard.edu>
MIME-Version: 1.0
Message-Id: <200407011749.19275.krustev@krustev.net>
Content-Transfer-Encoding: 8bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: mkomarinski@hms.harvard.edu, LVM general discussion and development <linux-lvm@redhat.com>

On Thursday 01 July 2004 16:23, Mark Komarinski wrote:
> I'll follow up to myself, as I found the problem.
>
> I was able to find the 2.4.22 VFS patch which applied pretty cleanly
> (there was a DM patch, but since I'm not using it, there was nothing to
> apply).  Rebooted and it's working fine.

Take a look at this message:

Re: [linux-lvm] Snapshot support for LVM2?
From: Alasdair G Kergon <agk@redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Date: Mon, 17 May 2004 13:33:51 -0500
