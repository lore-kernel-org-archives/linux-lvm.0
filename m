Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4GFrCIo017708
	for <linux-lvm@redhat.com>; Tue, 16 May 2006 11:53:12 -0400
Received: from smtp.andrew.cmu.edu (smtp.andrew.cmu.edu [128.2.10.81])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k4GFr6DD011156
	for <linux-lvm@redhat.com>; Tue, 16 May 2006 11:53:06 -0400
Received: from [192.168.1.100] (CMU-179222.WV.CC.cmu.edu [128.237.227.255])
	(user=gnychis mech=PLAIN (0 bits))
	by smtp.andrew.cmu.edu (8.13.5/8.13.6) with ESMTP id k4GFr6ee015104
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NOT)
	for <linux-lvm@redhat.com>; Tue, 16 May 2006 11:53:07 -0400
Message-ID: <4469F5C1.7030603@cmu.edu>
Date: Tue, 16 May 2006 11:54:41 -0400
From: George Nychis <gnychis@cmu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] errors using mkinitrd: cannot stat lvm2/vgwrapper
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
To: linux-lvm@redhat.com

Hi,

I am having trouble booting a 2.4.32 kernel with fedora core 3, I can
successfully boot the partition with 2.6.9

I built the 2.4.32 kernel with lvm support built in, and as a module,
and get the following errors when trying to mkinitrd:

cannot stat lvm2: No such file or directory
cannot stat /sbin/vgwrapper: No such file or directory

The initrd still gets created though, but I think these errors are the
sources of my problems.  /sbin/vgwrapper, as it says, does not exist

Any ideas how to fix these errors?

Thanks!
George
