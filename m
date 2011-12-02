Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pB2HOx6U013338
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2011 12:24:59 -0500
Received: from mx.binnacle.cx (mx.binnacle.cx [74.95.187.105])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pB2HOwkr020363
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2011 12:24:59 -0500
Received: from CIANNAIT.binnacle.cx (ciannait [172.29.87.10])
	by mx.binnacle.cx (envelope-from <starlight@binnacle.cx>)
	(8.14.4/8.14.4) with ESMTP id pB2HOvnk032065
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2011 12:24:58 -0500
Message-Id: <6.2.5.6.2.20111202121427.03b28738@flumedata.com>
Date: Fri, 02 Dec 2011 12:20:11 -0500
From: starlight@binnacle.cx
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Subject: [linux-lvm] cmp of inactive mirrored LV fails
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hello,

Had a drive report via 'smartd' and 'smartctl'
that it was having trouble reading a sector.
For about two days "197 Current_Pending_Sector"
indicated one.  Then the drive appears to
have recovered itself and the count went
to zero.  Strangely a 'dd iflag=direct'
of the drive to /dev/null was successful
during the period where the unreadable sector
count was  non-zero.  'smartctl -l error'
reports no errors.

Concerned, I ran a 'cmp' of the two mirror
image LVs (_mimage_0 vs _mimage_1) for each
of the LVs on the drive.  Two compare
differently; in particular one that is
presently not "open" according to the 'lvs'
command failed to compare.

Does anyone know how to deal with this?
A concern is that the _mimage_0 LV is
on the drive experiencing the problem.

Versions are

lvm2-2.02.84-6.el5_7.1 
kernel-2.6.18-274.el5

Thanks
