Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8BMgl3D031277
	for <linux-lvm@redhat.com>; Tue, 11 Sep 2007 18:42:47 -0400
Received: from portal.bppiac.hu (portal.bppiac.hu [213.253.216.130])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l8BMgjFW009518
	for <linux-lvm@redhat.com>; Tue, 11 Sep 2007 18:42:46 -0400
Received: from sas.dynamic.lfarkas.org (sas-182-3.lfarkas.bppiac.hu
	[192.168.182.3])
	by portal.bppiac.hu (Postfix) with ESMTP id C4C2D376647
	for <linux-lvm@redhat.com>; Wed, 12 Sep 2007 00:42:43 +0200 (CEST)
Message-ID: <46E719BE.5000202@bppiac.hu>
Date: Wed, 12 Sep 2007 00:42:06 +0200
From: Farkas Levente <lfarkas@bppiac.hu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] is it possible to move lvm2 logvols?
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

hi,
hi we've got a server with a lvm2 pv with a dozen of logvol in it. under
the lvm we'd like to create a raid1 array on 2 disk. unfortunately we
create raid0 under it. but the logvols contains a lots of important
data. we'd like to
- put 2 new disks into the system,
- create the raid1 array on it,
- put a new volgroup over the raid1,
- create the same size logvols in the new volgroup,
- and move the old logvols to the new logvols, but how can i do that?
everything is ok, except the last step. is there any easy way to do the
last step? can i use vgexport and vgimport for this? or can i use a
simple dd for it? or?
thank you for your help in advance.

-- 
  Levente                               "Si vis pacem para bellum!"
