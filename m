Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oA51QcJ8016019
	for <linux-lvm@redhat.com>; Thu, 4 Nov 2010 21:26:38 -0400
Received: from cdptpa-omtalb.mail.rr.com (cdptpa-omtalb.mail.rr.com
	[75.180.132.120])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oA51QN31019811
	for <linux-lvm@redhat.com>; Thu, 4 Nov 2010 21:26:23 -0400
Message-ID: <4CD35D3E.5030200@cfl.rr.com>
Date: Thu, 04 Nov 2010 21:26:22 -0400
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM + raid + san
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

I was wondering about using LVM to manage disks on a SAS SAN with one or 
more multi disk enclosures and multiple host servers.  It looks like LVM 
has the capability to manage all of the disks as PVs and coordinate 
between the hosts to allow any given host to mount any given lv at any 
time, but I could not figure out how raid would fit into the picture.

Ideally you want to group the disks into a few raid5 or raid6 arrays, 
and then slice them up into logical volumes.  As far as I know the 
device mapper raid5/6 support is still highly experimental so most 
people just use mdadm to create a raid array and use that as an lvm pv, 
but in a san environment, you wouldn't be able to activate the raid pv 
on more than one host would you?

Can this be done with mdadm, and/or how is the dm raid5/6 support coming 
so that lvm can directly manage the individual disks as pvs while still 
having fault tolerance?
