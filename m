Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3SIpTnN030097
	for <linux-lvm@redhat.com>; Fri, 28 Apr 2006 14:51:29 -0400
Received: from palrel12.hp.com (palrel12.hp.com [156.153.255.237])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k3SIpL9q018636
	for <linux-lvm@redhat.com>; Fri, 28 Apr 2006 14:51:21 -0400
Received: from cacexg13.americas.cpqcorp.net (cacexg13.americas.cpqcorp.net
	[16.92.1.76]) by palrel12.hp.com (Postfix) with ESMTP id D19D3354CC
	for <linux-lvm@redhat.com>; Fri, 28 Apr 2006 11:51:10 -0700 (PDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Fri, 28 Apr 2006 11:51:09 -0700
Message-ID: <1C4766A743ADF74FAEDF2AAD0679BAA207EF5D59@cacexc03.americas.cpqcorp.net>
From: "Stern, Rick (Serviceguard Linux)" <rick.stern@hp.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Running LVM commands in parallel
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

Will the following work?  This is to test a function that uses LVM
command.

I have multiple scripts that are running in parallel.
Each script is associated with one volume group.
In the script are vgchange commands to activate the VG, 
file system mounts, file writes, and unmounts and then a 
deactivate of the VG.

So it is possible to have a 2 instances of vgchange running at the same
time (on different VGs).

The reason I'm asking is that I am getting a failure where a deactivate
does not work on
a VG after running these scripts for about 12 hours.

Thanks,
Rick



Rick Stern
Serviceguard for Linux Program Manager and Architect
Hewlett-Packard
Availability Clusters Solutions Lab
408-873-5252 
