Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9ALuMV22929
	for <linux-lvm@redhat.com>; Mon, 10 Oct 2005 17:56:22 -0400
Received: from psmtp.com (exprod6og2.obsmtp.com [64.18.1.122])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id j9ALuFuK021221
	for <linux-lvm@redhat.com>; Mon, 10 Oct 2005 17:56:20 -0400
Received: from uswm.myoverland.net (unverified) by 
	SD-MIS-S36.overland.myoverland.net (Content Technologies SMTPRS 4.3.14)
	with ESMTP id
	<T73e770e6820a010829f54@SD-MIS-S36.overland.myoverland.net> 
	for <linux-lvm@redhat.com>; Mon, 10 Oct 2005 14:56:14 -0700
Message-ID: <OFC904CF97.B5BABED0-ON88257096.00702BFC-88257096.007880B4@overlandstorage.com>
From: KShaikh@overlandstorage.com
Date: Mon, 10 Oct 2005 14:56:12 -0700
MIME-Version: 1.0
Content-type: text/plain; charset="us-ascii"
Subject: [linux-lvm] PEs not aligned on extent boundary
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com


Hi all,

I have discovered a bug with LVM 1.0.8 on the 2.4.31 kernel, where the PEs
are not aligned on the extent boundary, which results in the last PE in a
PV to be less than the configured extent size.  But the kernel LVM code
assumes all extents are the _same_ length, so when it tries to map a
logical sector to a physical sector for a 'partial PE', the physical sector
calculated will be wrong and can corrupt data.

Kashif



----------------------------------------------------------------------------------------------
See our award-winning line of tape and disk-based
backup & recovery solutions at http://www.overlandstorage.com
----------------------------------------------------------------------------------------------
