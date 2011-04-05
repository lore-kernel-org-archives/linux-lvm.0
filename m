Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p354iejZ004979
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2011 00:44:40 -0400
Received: from smtp-out-emea.greenpeace.org (smtp-out-emea.greenpeace.org
	[85.234.235.81])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p354iaU4019313
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2011 00:44:37 -0400
Received: from mta-ams.nli.gl3 ([10.31.1.2])
	by smtp-out-emea.greenpeace.org (8.13.8/8.13.8) with ESMTP id
	p354iTIp011207
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2011 06:44:29 +0200
Received: from mta-ams.nli.gl3 (localhost.localdomain [127.0.0.1])
	by mta-ams.nli.gl3 (Postfix) with ESMTP id 29EC910014E
	for <linux-lvm@redhat.com>; Tue,  5 Apr 2011 06:43:46 +0200 (CEST)
Received: from mail.isu.gl3 (base.isu.gl3 [192.168.210.1])
	by mta-ams.nli.gl3 (Postfix) with ESMTP id 27D161000DE
	for <linux-lvm@redhat.com>; Tue,  5 Apr 2011 06:43:46 +0200 (CEST)
Received: from [10.10.10.10] (unknown [192.168.206.202])
	by mail.isu.gl3 (Postfix) with ESMTP id A76BC3F59
	for <linux-lvm@redhat.com>; Tue,  5 Apr 2011 04:44:28 +0000 (UTC)
Message-ID: <4D9A9E2A.7070106@diala.gl3>
Date: Tue, 05 Apr 2011 16:44:26 +1200
From: Jan Bakuwel <jan.bakuwel@diala.gl3>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM corruption/diagnosis
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
To: linux-lvm@redhat.com

Hi,

OS:         Debian Lenny
Hypervisor: Xen 3.2-1
kernel:     2.6.18-6-xen-amd64
lvm2:       2.02.06-4etch1
lvm-common: 1.5.20
Hardware:   IBM x3650 hardware RAID5 on SAS with battery backup

I've used LVM2 for years without any issue. I recently diagnosed a
problem with a Windows XP virtual machine running on a Debian Lenny Xen
dom0. After getting reports of stability problems and unexpected
crashes, I restored the VM from a image backup that is known to work. To
my surprise, that image also was crashing unexpectingly. After much
trial and error, I decided to create a new LV and restore the image to
the new LV (rather than using the existing LV). My surprise was even
bigger when that turned out to be the solution: the Windows XP VM has
been running fine since.

Now the daunting (?!) task awaits me to diagnose why one LV is suitable
for a Windows XP VM and another no longer is (even though it has been
fine for at least half a year).

Advise on how I can diagnose potential corruption problems with LVs much
appreciated.

cheers,
Jan
