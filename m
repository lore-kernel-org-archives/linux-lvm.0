Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r17FrTAa031716
	for <linux-lvm@redhat.com>; Thu, 7 Feb 2013 10:53:29 -0500
Received: from mx1.l-d-s.de (tx1.dahme-spreewald.de [193.159.184.4])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r17FrQpo023628
	for <linux-lvm@redhat.com>; Thu, 7 Feb 2013 10:53:27 -0500
Received: from ugw.dahme-spreewald.de (unknown [10.226.26.213])
	by mx1.l-d-s.de (Postfix) with ESMTP id B7D264351
	for <linux-lvm@redhat.com>; Thu,  7 Feb 2013 16:53:25 +0100 (CET)
Received: from ugw.dahme-spreewald.de (localhost [127.0.0.1])
	by ugw.dahme-spreewald.de (Postfix) with ESMTP id 867277DE3
	for <linux-lvm@redhat.com>; Thu,  7 Feb 2013 16:53:20 +0100 (CET)
Message-Id: <5113DBFF020000420000C628@gwi.dahme-spreewald.de>
Date: Thu, 07 Feb 2013 16:53:19 +0100
From: "Mario Linick" <Mario.Linick@dahme-spreewald.de>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] cman+pacemaker dual primary drbd for HA KVM w/ live
	migration
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
Content-Type: text/plain; charset="us-ascii"
To: lists@rarforge.com
Cc: linux-lvm@redhat.com

Hello rob and everyone,

i'm searching  a solution for:

cman+pacemaker dual primary drbd for HA KVM w/ live migration

disk: lvm -> drbd -> clvm -> kvm_vm's

i have seen, do you have a setup on centos.
operates the setup without problems?

can you tell me your configuration for pacemaker?

Many thanks in advance.

Mario
