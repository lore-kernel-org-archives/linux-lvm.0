Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4NB1GGX016009
	for <linux-lvm@redhat.com>; Fri, 23 May 2008 07:01:16 -0400
Received: from mailgw11.wm.net (mailgw10.wm.net [85.119.129.3])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m4NB0vdS002077
	for <linux-lvm@redhat.com>; Fri, 23 May 2008 07:00:57 -0400
Received: from WMSI001556.corp.wmdata.net (wmsi001556.wmdata.se [164.9.238.12])
	by mailgw11.wm.net  with ESMTP id m4NB0u2b017952
	for <linux-lvm@redhat.com>; Fri, 23 May 2008 13:00:56 +0200
From: "Henry, Andrew" <andrew.henry@logica.com>
Date: Fri, 23 May 2008 13:00:53 +0200
Subject: RE: [linux-lvm] Can I implement RAID1 through LVM2 instead of using
	mdadm?
Message-ID: <3ECBDC05781B3D48ABD520A01ABF2F9B12C56CC19D@SE-EX008.groupinfra.com>
References: <3ECBDC05781B3D48ABD520A01ABF2F9B12C56CC13B@SE-EX008.groupinfra.com>
In-Reply-To: <3ECBDC05781B3D48ABD520A01ABF2F9B12C56CC13B@SE-EX008.groupinfra.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

I have seen in the man page that there is an --mirrors option, but how do I do this?  Do I:

Pvcreate my 2 identical eSATA drives
Vgcreate and assign both drives to the vg
Lvcreate --mirrors

Will this mirror one of the discs in the vg to the other disc in the vg automatically or do I have so explicitely define this somehow?

How do I check that it works??

I have a problem with mdadm where it cannot handle my eSATA discs spinning down into standby mode.  I do not really want to disable standby mode.  Can LVM handle this?  Does it wait until the discs spin up again or does it error if it cannot access one of the pvs in the vg?

--andrew
