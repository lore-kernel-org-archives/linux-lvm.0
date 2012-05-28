Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q4SEXtWG026152
	for <linux-lvm@redhat.com>; Mon, 28 May 2012 10:33:56 -0400
Received: from moltke.seatribe.se (moltke.seatribe.se [178.63.100.209])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q4SEXrWB005405
	for <linux-lvm@redhat.com>; Mon, 28 May 2012 10:33:54 -0400
Received: from [2002:5c20:f66a::1] (helo=nerv.dolda2000.com)
	by moltke.seatribe.se with esmtp (Exim 4.69)
	(envelope-from <fredrik@dolda2000.com>) id 1SZ113-0003e4-BJ
	for linux-lvm@redhat.com; Mon, 28 May 2012 16:33:51 +0200
Received: from [2002:5c20:f66a:200:ca60:ff:fe16:97ac]
	([IPv6:2002:5c20:f66a:200:ca60:ff:fe16:97ac]) (authenticated bits=0)
	by nerv.dolda2000.com (8.14.3/8.14.3/Debian-9.4) with ESMTP id
	q4SEXmB8028691
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 28 May 2012 16:33:48 +0200
Date: Mon, 28 May 2012 16:33:48 +0200 (CEST)
From: Fredrik Tolf <fredrik@dolda2000.com>
Message-ID: <alpine.DEB.2.02.1205281619370.2644@shack.dolda2000.com>
MIME-Version: 1.0
Subject: [linux-lvm] Isolation of volume groups
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
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Dear list,

I have a device-mapper configuration with two volume groups named, for 
reference, "ravol" and "datvol". The ravol VG has two LVs with XFS 
filesystems on them, and the datvol VG has two LVs, one with an XFS 
filesystem, and one with ReiserFS.

Last night, one of the PVs in datvol had a transient SATA link failure and 
popped in and out of existence for a little while, which caused datvol and 
the LVs on it to fail. No permanent damage seems to have occurred, though, 
so I'm not too worried about that. I could bring datvol down and up again 
to make it work, so I guess everything worked as should be expected.

What concerns me a little, however, is that ravol also seems to have been 
oddly affected by the failure of datvol. At times, the filesystems on it 
could hang for seconds, not responding; and while it was responding, XFS 
was intermittently outputting messages like

May 28 14:58:58 nerv kernel: [30350.996032] xfs_force_shutdown(dm-33,0x1) called from line 335 of file /build/buildd-linux-2.6_2.6.32-38-amd64-bk66e4/linux-2.6-2.6.32/debian/build/source_amd64_none/fs/xfs/xfs_rw.c.  Return address = 0xffffffffa01df02c

or

May 28 14:51:38 nerv kernel: [29911.468028] Filesystem "dm-33": xfs_log_force: error 5 returned.

Once I brought datvol down and back up again, it stopped misbehaving, but 
I don't really understand why this would happen. Why would ravol be 
affected, at all, by what happens on datvol? Shouldn't they be isolated 
from each other?

--

Fredrik Tolf
