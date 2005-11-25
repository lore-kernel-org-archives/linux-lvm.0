Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jAPCtCV19129
	for <linux-lvm@redhat.com>; Fri, 25 Nov 2005 07:55:12 -0500
Received: from smtp.kliff.de (smtp.kliff.de [80.239.136.89])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jAPCt2BN000835
	for <linux-lvm@redhat.com>; Fri, 25 Nov 2005 07:55:06 -0500
Received: from DC-EX-001.evendi.local ([85.183.128.34])
	by smtp.kliff.de (8.11.6/8.11.6) with ESMTP id jAPCnZL06373
	for <linux-lvm@redhat.com>; Fri, 25 Nov 2005 13:49:35 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Fri, 25 Nov 2005 13:49:36 +0100
Message-ID: <AE41C3C123D61B45B457F3037275842F1E03E2@DC-EX-001.evendi.local>
From: "Marcus Franke" <MFranke@evendi.de>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Activation problem with vgremove
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

Hello all,

I am doing a reconfiguration of one of my servers and am facing
the following problem:

I have one disk using the lvm.

On this disk there is one volumegroup which had two logical
volumes.

I unmounted those volumes and tried to lvremove them. The
first one went down the river without a problem. The second
one I was not able to lvremove it, after a reboot of the
machine, I could remove the logical volume.

Now, I have the problem I want to delete the volume group
too, but vgremove fails like the logical volume. Somewhere
it is marked as active.

[root@master]/mnt# vgremove -v Volume01
vgremove -- locking logical volume manager
vgremove -- checking volume group name "Volume01"
vgremove -- checking volume group "Volume01" activity
vgremove -- ERROR: can't remove active volume group "Volume01"

System is RHEL3 with kernel:
2.4.21-37.ELsmp #1 SMP Wed Sep 7 13:28:55 EDT 2005 i686 i686 i386
GNU/Linux

Where can I remove the active flag for the volume group? As I do not
want to reboot the machine again as the next timeframe for reboot will
be
not before tomorrow morning.


Regards,
Marcus
