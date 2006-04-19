Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3JFjuKC012491
	for <linux-lvm@redhat.com>; Wed, 19 Apr 2006 11:45:56 -0400
Received: from mail.nmr.mgh.harvard.edu (mail.nmr.mgh.harvard.edu
	[132.183.202.9])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k3JFifuB004436
	for <linux-lvm@redhat.com>; Wed, 19 Apr 2006 11:44:47 -0400
Received: from gate.nmr.mgh.harvard.edu (gate.nmr.mgh.harvard.edu
	[132.183.203.69]) (authenticated bits=0)
	by mail.nmr.mgh.harvard.edu (8.13.1/8.13.1) with ESMTP id
	k3JFiZj8024691
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Wed, 19 Apr 2006 11:44:35 -0400
Date: Wed, 19 Apr 2006 11:44:35 -0400 (EDT)
From: Paul Raines <raines@nmr.mgh.harvard.edu>
In-Reply-To: <Pine.LNX.4.62.0604131143270.21727@gate.nmr.mgh.harvard.edu>
Message-ID: <Pine.LNX.4.62.0604191117450.2778@gate.nmr.mgh.harvard.edu>
References: <Pine.LNX.4.62.0604131143270.21727@gate.nmr.mgh.harvard.edu>
MIME-Version: 1.0
Subject: [linux-lvm] Re: LVM2, NFS and random device (major:minor) numbers
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com


Well, I just tried out the fsid option in /etc/exports and it does not 
work.  Seems to be totally ignored.

I am CentOS 4.2 with the 2.6.9-22.ELsmp kernel and nfs-utils-1.0.6-65.EL4

I have an export now defined as such:

/local_mount/space/sake/6 \
   @all(rw,fsid=64780,async,insecure)

64780 was its device id before reboot.  After reboot, the device
id became 64781 and all the current NFS mounts on clients became
stale despite the fsid setting above.   Other exports which did
not change their underlying device id did not become stale.



-- 
---------------------------------------------------------------
Paul Raines                email: raines at nmr.mgh.harvard.edu
MGH/MIT/HMS Athinoula A. Martinos Center for Biomedical Imaging
149 (2301) 13th Street     Charlestown, MA 02129	    USA
