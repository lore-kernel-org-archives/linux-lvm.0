Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6QBpXa10384
	for <linux-lvm@redhat.com>; Mon, 26 Jul 2004 07:51:33 -0400
Message-ID: <4104F037.1090709@stadt.wuppertal.de>
Date: Mon, 26 Jul 2004 13:51:19 +0200
From: Ronald Laszlob <ronald.laszlob@stadt.wuppertal.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] vgexports-Parameters.
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Dear Mr. Mauelshagen,

In the book "Oracle - Real Application Clusters" from Murali Vallath 
(ELSEVIER Digital Press, Feb. 2004) on S.292, the Author want to install 
a RAC on LINUX.
He begin with the first steps:
(Begin in the Book)

Configuring raw devices into volume groups and logical volumes.

1. Create all necessary volume groups (VG) and logical volumes on the 
first node.
2. Deactive all VGs and export the structure of all the VGs to map files 
by issuing the following command. Remember only one map file per VG is 
created.

vgexport -v -s -p -m /tmp/vg_system.map /dev/vg/system

(End.)

I want to make the same steps, but now I have a problem, because the 
parameters -s, -p and -m are not available on SLES8 (also SuSE9.0). In 
your man-page are only the parameter:
-a -d -h and -v are include.

Now I have a question:
If there exits another vgexport-command with these other parameters (-s, 
-p and -m)?
or
If there exits another solution of the way from Mr. Vallath.

Many thanks forward for your help.

Your sincerely,
Ronald Laszlob
