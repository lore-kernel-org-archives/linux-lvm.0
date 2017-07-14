Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24F4067CD2
	for <linux-lvm@redhat.com>; Fri, 14 Jul 2017 03:41:15 +0000 (UTC)
Received: from mail.gathman.org (mail.gathman.org [70.184.247.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D7825C0587D4
	for <linux-lvm@redhat.com>; Fri, 14 Jul 2017 03:41:13 +0000 (UTC)
Received: from elissa.gathman.org (h.elissa.gathman.org
	[IPv6:fc37:2c50:7583:e01a:8c69:8f50:8dcf:a076])
	(authenticated bits=0)
	by mail.gathman.org (8.14.4/8.14.4) with ESMTP id v6E3T0SG026188
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2017 23:29:01 -0400
References: <55f9c8eb-41df-8b3b-c790-e81fbcef0a73@meduniwien.ac.at>
From: Stuart Gathman <stuart@gathman.org>
Message-ID: <b5832376-fc6b-d24c-56fc-cac0bf8f00fa@gathman.org>
Date: Thu, 13 Jul 2017 23:41:12 -0400
MIME-Version: 1.0
In-Reply-To: <55f9c8eb-41df-8b3b-c790-e81fbcef0a73@meduniwien.ac.at>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] convert LV to physical device _in_place_?
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

On 07/13/2017 09:25 AM, Matthias Leopold wrote:
> i'm fiddling around with LVM backed KVM raw disks, that i want to use
> _directly_ in oVirt virtualization (as "Direct LUN"). i would like to
> avoid "importing", dd, etc. if possible. in the KVM origin system
> exists a mapping of one iSCSI whole device (no partitions) to one PV
> to one VG to one LV per KVM disk. i can now present these iSCSI
> devices to the oVirt hosts, where i can only use them as "Direct LUN"
> without the LVM layer (i guess). so all i would need is to remove the
> LVM metadata from the iSCSI device preserving the "content" of the LV.
> pvremove seems to be too "intrusive" for this... i know this sounds
> rather naive and i didn't find any recipes for it. everybody talks
> about dd to a new device, which of course works (i tried it), but is
> exactly what i want to avoid when migrating very large disks (TB). i
> hope someone understands my concern and maybe has a solution
I use iSCSI at home, and I just export the LV as an iSCSI target.  Now
you have direct LUN for use with VM hosts on the network (I just have a
gigabit LAN at home).  The iSCSI server still uses LVM, and you can
snapshot the volume for backup on the server.

Maybe that's too obvious, and I misunderstood your problem?

There is no LVM metatdata on the exported iSCSI devices - that is on the
underlying disk.  As the export LUN looks like a disk, you can even add
an optional partition table, PVs, VGs, etc for use by the virtual machine.
