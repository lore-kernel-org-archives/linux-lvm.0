Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iATFGxr09079
	for <linux-lvm@redhat.com>; Mon, 29 Nov 2004 10:16:59 -0500
Received: from mail.software.plasmon.com (mail@mail.software.plasmon.co.uk
	[194.130.136.212])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iATFGvai027495
	for <linux-lvm@redhat.com>; Mon, 29 Nov 2004 10:16:58 -0500
Received: from leo.devel.pcs ([10.4.2.17] ident=mail)
	by mail.software.plasmon.com with esmtp (Exim 3.35 #1 (Debian))
	id 1CYnGk-0006ZY-00
	for <linux-lvm@redhat.com>; Mon, 29 Nov 2004 15:16:50 +0000
Received: from steve by leo.devel.pcs with local (Exim 3.36 #1 (Debian))
	id 1CYnGj-0006gz-00
	for <linux-lvm@redhat.com>; Mon, 29 Nov 2004 15:16:49 +0000
Date: Mon, 29 Nov 2004 15:16:49 +0000
From: Steve McIntyre <smcintyre@software.plasmon.com>
Subject: Re: [linux-lvm] Snapshots (overheads and 2.6 kernel status)
Message-ID: <20041129151630.GD1506@software.plasmon.com>
References: <37E80E80B681A24B8F768D607373CA80010A5454@largo.campus.ncl.ac.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <37E80E80B681A24B8F768D607373CA80010A5454@largo.campus.ncl.ac.uk>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Nov 29, 2004 at 03:08:50PM -0000, C R Ritson wrote:
>Does anybody know how much overhead is involved in keeping a snapshot of
>an active volume (for 24 hours)? I am currently running LVM1 (waiting
>for snapshots in LVM2/device mapper) and am making a snapshot of my user
>volumes overnight. These are left available for 24 hours in the hope
>that users who damage a file will be able to get "yesterday's copy" from
>the snapshot without us needing to restore from tape. There is obviously
>some overhead involved, but does anyone know how much?

It can be quite significant, depending on your workload. I'm using
snapshots in a similar way, and I saw performance drop by a factor of
2 (or more) on our main NFS server. It's very useful to have the
snapshot, so we live with it.

-- 
Steve McIntyre, Plasmon                       smcintyre@software.plasmon.com
 
"C++ ate my sanity" -- Jon Rabone
