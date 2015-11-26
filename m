Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAQGZKsO007158
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 26 Nov 2015 11:35:20 -0500
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mx1.redhat.com (Postfix) with ESMTPS id 513CF68E0F
	for <linux-lvm@redhat.com>; Thu, 26 Nov 2015 16:35:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAQGZHjh022334
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <linux-lvm@redhat.com>; Thu, 26 Nov 2015 08:35:17 -0800
Message-ID: <565734C4.5020402@windriver.com>
Date: Thu, 26 Nov 2015 10:35:16 -0600
From: Chris Friesen <chris.friesen@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] thin_check called with wrong path during "vgchange -ay"
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

Hi,

I'm hoping this is a known issue.  I'm trying to use thin provisioning with 
openstack cinder.

If I run "vgchange -ay cinder-volumes" manually, it complains:

controller-0:/home/wrsroot# vgchange -ay cinder-volumes
   Check of thin pool cinder-volumes/cinder-volumes-pool failed (status:1). 
Manual repair required (thin_dump --repair 
/dev/mapper/cinder-volumes-cinder-volumes-pool_tmeta)!

If I run thin_check on /dev/mapper/cinder-volumes-cinder-volumes-pool_tmeta it 
complains that the file doesn't exist:


controller-0:/home/wrsroot# thin_check 
/dev/mapper/cinder-volumes-cinder-volumes-pool_tmeta
Couldn't stat dev path


The actual file name is /dev/mapper/cinder--volumes-cinder--volumes--pool_tmeta 
(note the double-hyphens) and if I run thin_check on that then it seems happy:

controller-0:/home/wrsroot# thin_check 
/dev/mapper/cinder--volumes-cinder--volumes--pool_tmeta
examining superblock
examining devices tree
examining mapping tree
checking space map counts


Does anyone know why thin_check is being called with the wrong filename?

For what it's worth, here's my lvm version:
controller-0:/home/wrsroot# lvm version
   LVM version:     2.02.95(2) (2012-03-06)
   Library version: 1.02.74 (2012-03-06)
   Driver version:  4.24.0


Thanks,
Chris
