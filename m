Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B23F2A31C
	for <linux-lvm@redhat.com>; Tue, 18 Sep 2018 11:56:49 +0000 (UTC)
Received: from prv1-mh.provo.novell.com (prv1-mh.provo.novell.com
	[137.65.248.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4374C308FF2F
	for <linux-lvm@redhat.com>; Tue, 18 Sep 2018 11:56:48 +0000 (UTC)
Message-Id: <5BA0E80D020000F900034E56@prv1-mh.provo.novell.com>
Date: Tue, 18 Sep 2018 05:57:01 -0600
From: "Gang He" <ghe@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] lvm2: state is not persisted to disk if a snapshot
 becomes invalid immediately before reboot
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hello List,

I use a old version LVM2 2.02.98 on kernel 3.0.101, I encountered such a problem.
The detailed steps are as below,
I am doing an update with the following strategy for updates

make LVM Snapshot of root ("/")  file system partition

Run zypper updates ->

Run a script to check certain stuff is OK ->

On failure of that script (if any of the check fail, e.g one rpm update failed), merge LVM -> 

Reboot (because you have to for an LVM merge if it's the root volume)

And then, sometimes as the system comes back up, Reiserfs sometimes goes read-only / corrupt.

which shows in the dmesg as

[   29.794593] BIOS EDD facility v0.16 2004-Jun-25, 1 devices found
[   30.412919] MCE: In-kernel MCE decoding enabled.
[   35.729081] eth0: no IPv6 routers present
[   35.805434] REISERFS error (device dm-1): PAP-5660 reiserfs_do_truncate: wrong result -1 of search for [99955 99957 0xfffffffffffffff DIRECT]
[   35.805445] REISERFS (device dm-1): Remounting filesystem read-only
[397338.410475] show_signal_msg: 21 callbacks suppressed
[397338.410484] esmd[1687]: segfault at 46 ip 00000000f7582f15 sp 00000000ff9b7c70 error 4 in libc-2.11.3.so[f7543000+16c000]


Did you meet this problem? this problem was fixed in the latest version?

Thanks a lot.
Gang
