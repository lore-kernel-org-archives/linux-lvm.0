Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q1GDP562023525
	for <linux-lvm@redhat.com>; Thu, 16 Feb 2012 08:25:05 -0500
Received: from qmta06.westchester.pa.mail.comcast.net
	(qmta06.westchester.pa.mail.comcast.net [76.96.62.56])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q1GDP4Nd017985
	for <linux-lvm@redhat.com>; Thu, 16 Feb 2012 08:25:04 -0500
Message-ID: <4F3D03AE.2050502@mohawksoft.com>
Date: Thu, 16 Feb 2012 08:25:02 -0500
From: Mark Woodward <markw@mohawksoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Snapshots
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

I have been looking into LVM2 for a while now and while I think it is 
useful for a range of applications, its seems pretty limited in overall 
scope.

Is there any active development happening? Most of the code seems like 
bug-fixes or minor tweaks. Is the snapshot system being improved? 
Specifically, snapshots of snapshots? thin provisioned snapshots or 
auto-expand (i.e. snapshots don't run out of space).  If you look at 
technologies like ZFS snapshots are far better supported, but ZFS will 
probably never be real under Linux, and it really is far more than is 
really needed.

So, I guess my questions are these: Is LVM in maintenance mode or is 
there active development? If it is being actively developed, is there a 
road map and is there a group or site specifically dedicated to the 
development?
