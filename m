Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kADCJAHH025966
	for <linux-lvm@redhat.com>; Mon, 13 Nov 2006 07:19:10 -0500
Received: from enterprise.homenet (cust.12.220.adsl.cistron.nl [62.216.12.220])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kADCJ7EP009723
	for <linux-lvm@redhat.com>; Mon, 13 Nov 2006 07:19:07 -0500
Received: from ferengi.homenet (unknown [172.16.16.11])
	by enterprise.homenet (Postfix) with ESMTP id 7C0686D2
	for <linux-lvm@redhat.com>; Mon, 13 Nov 2006 13:14:08 +0100 (CET)
Date: Mon, 13 Nov 2006 13:19:00 +0100
From: Fred Donck <fred@donck.com>
Message-ID: <20061113121900.GK276@dogbert>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM upgrade
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


*,

I am in the process of upgrading my Gentoo system and all that is stgill
to be done is LVM2

My current install is the following

host ~ # lvm version
  LVM version:     2.01.09 (2005-04-04)
  Library version: 1.01.00-ioctl (2005-01-17)
  Driver version:  4.4.0
host ~ # df -k
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/md2               1003932     64952    938980   7% /
/dev/vg/usr           10485436   3729092   6756344  36% /usr
/dev/vg/var           10485436    636380   9849056   7% /var
/dev/vg/tmp            4194172    494092   3700080  12% /tmp
/dev/vg/opt            4194172     35928   4158244   1% /opt
/dev/vg/home           4194172   3041392   1152780  73% /home
none                    248632         0    248632   0% /dev/shm
host ~ # 


The latest Gentoo version for LVM2 is

host ~ # emerge -p lvm2

These are the packages that would be merged, in order:

Calculating dependencies... done!
[ebuild     U ] sys-fs/device-mapper-1.02.10-r1 [1.01.00] USE="(-selinux)" 
[ebuild     U ] sys-fs/lvm2-2.02.06 [2.01.09] USE="-clvm% -cman% -gulm% -nolvm1% -nomirrors% -nosnapshots% (-selinux)" 
host ~ # 

Are there any problems i could expect when upgrading? 
Especially in the volume names or in the mapping of volume name to device
name for /etc/fstab.

Thanks in advance
-- 
Fred

Doubt is an uncomfortable situation, but certainty is an absurd one
	-- Voltaire
