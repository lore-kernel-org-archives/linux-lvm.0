Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i68Eh6005528
	for <linux-lvm@redhat.com>; Thu, 8 Jul 2004 10:43:06 -0400
Received: from delos.mps.ohio-state.edu (delos.mps.ohio-state.edu
	[128.146.37.15])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i68Eh5e1022707
	for <linux-lvm@redhat.com>; Thu, 8 Jul 2004 10:43:05 -0400
Received: from [128.146.37.193] (case.mps.ohio-state.edu [128.146.37.193])
	(authenticated bits=0)
	by delos.mps.ohio-state.edu (8.12.11/8.12.11) with ESMTP id
	i68EgxsN029649
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 8 Jul 2004 10:42:59 -0400
From: Tim Randles <tcr@pacific.mps.ohio-state.edu>
Message-Id: <1089297779.9242.19.camel@case.mps.ohio-state.edu>
Mime-Version: 1.0
Date: Thu, 08 Jul 2004 10:42:59 -0400
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm and renaming of drives
Reply-To: tcr@pacific.mps.ohio-state.edu,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

very brief characteristics:
  large fileserver
  RHEL v3 AS (2.4.21-based kernel)

I have a large RAID device on an external SCSI chain.  Currently the 2
drives I've carved out of this device are /dev/sdj and /dev/sdk. 
Whenever I add a new drive to the internal SCSI chain on the machine the
external devices drive letters increment (1 new internal -> /dev/sdk and
/dev/sdl).  My question is, if I make /dev/sdk a physical volume what
happens when I add a new internal drive?  Will LVM recognize that
/dev/sdk is now /dev/sdl and activate the volume group/logical volumes
without any problem?  I assume this isn't a problem with DM and 2.6, but
I'm not there yet.

Thanks,
Tim


-- 
Tim Randles
Unix Administrator and Webmaster
The Ohio State University
Department of Physics Computing Facility
Phone: 292-2630
Email: tcr@pacific.mps.ohio-state.edu
PGP key: http://www.physics.ohio-state.edu/~tcr/pgp.txt
