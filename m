Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j02CI7r05827
	for <linux-lvm@redhat.com>; Sun, 2 Jan 2005 07:18:07 -0500
Received: from ratbert.donck.com (ratbert.donck.com [212.204.192.81])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j02CI6bO029950
	for <linux-lvm@redhat.com>; Sun, 2 Jan 2005 07:18:07 -0500
Date: Sun, 2 Jan 2005 13:18:05 +0100
From: Fred Donck <fred@donck.com>
Message-ID: <20050102121805.GT326@dogbert>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM2 strange behaviour
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
To: linux-lvm@redhat.com


Happy new year all,

I am new to the mailing list and a new user of Linux LVM although i have
been using similar technologies for years on Solaris and AIX.

I have some strange behaviour i am encountering on a newly installed
machine.

$> lvm version  
  LVM version:     2.00.08 (2003-11-14)
  Library version: 1.00.17-ioctl (2004-04-19)
  Driver version:  4.3.0
$> 

The machine is newly installed with Gentoo linux 2004.3, latest version.
I installed according to
http://gentoo-wiki.com/index.php?title=HOWTO_Gentoo_Install_on_Software_RAID_mirror_and_LVM2_on_top_of_RAID

and seems to work fine. The RAID-1 partitions work perfectly but the LVM
volumes behave weird.

When i reboot the machine using `shutdown -r' the volumes do not come
online because during boot the vgscan fails with a segfault. I have to
manually do a vgscan and reboot again, then things work ok. Same things
happen when i reboot now: vgscan segfaults, manual vgscan, reboot --> all
ok.

What could be the problem?

Thanks,
Fred
