Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l56JcVVK007005
	for <linux-lvm@redhat.com>; Wed, 6 Jun 2007 15:38:31 -0400
Received: from mailbox.simutronics.com (mailbox.simutronics.com
	[209.16.217.35])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l56JcR5n023918
	for <linux-lvm@redhat.com>; Wed, 6 Jun 2007 15:38:27 -0400
Received: from e3demo (jim.simutronics.com [209.16.216.93])
	(authenticated bits=0)
	by mailbox.simutronics.com (8.13.7/8.13.7) with ESMTP id l56JcLX3012607
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 6 Jun 2007 14:38:21 -0500
From: "James Miller" <jimm@simutronics.com>
Date: Wed, 6 Jun 2007 14:38:21 -0500
Message-ID: <082001c7a872$3d662170$5dd810d1@e3demo>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Unlocking a locked lv
Reply-To: jimm@simutronics.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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

Hello everyone,

Hopefully this time I might get a response ;)

I REALLY just want to get rid of all volume groups, but I can't.  I was
doing a pvmove (and I'm using clmvd so locking it set to 2) and the process
hung.  Now I can't delete the lv (called) test nor the hung pvmove0.

vgremove -v hari-vg01
    Loaded external locking library liblvm2clusterlock.so
    Using volume group(s) on command line
    Finding volume group "hari-vg01"
  Volume group "hari-vg01" still contains 2 logical volume(s)


lvremove -v -f hari-vg01 test
   Loaded external locking library liblvm2clusterlock.so
   Using logical volume(s) on command line
 Can't remove locked LV test
 Can't remove locked LV pvmove0
   Wiping cache of LVM-capable devices
 Volume group "test" not found

When I try to activate hari-vg01 it just hangs. I've tried to set locking to
0 but no lock.


--Jim
