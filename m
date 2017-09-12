Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0218707C6
	for <linux-lvm@redhat.com>; Tue, 12 Sep 2017 15:03:04 +0000 (UTC)
Received: from sonic311-22.consmr.mail.gq1.yahoo.com
	(sonic311-22.consmr.mail.gq1.yahoo.com [98.137.65.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 375EA81DF5
	for <linux-lvm@redhat.com>; Tue, 12 Sep 2017 15:03:03 +0000 (UTC)
Date: Tue, 12 Sep 2017 15:03:01 +0000 (UTC)
From: matthew patton <pattonme@yahoo.com>
Message-ID: <1806055156.426333.1505228581063@mail.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <1806055156.426333.1505228581063.ref@mail.yahoo.com>
Subject: Re: [linux-lvm] Reserve space for specific thin logical volumes
Reply-To: matthew patton <pattonme@yahoo.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

> I need to take a step back: my main use for thinp is virtual machine 
> backing store
...
> Rather, I had to use a single, big thin volumes with XFS on top.
...
>I used  ZFS as volume manager, with the intent to place an XFS filesystem on top

Good grief, you had integration (ZFS) and then you broke it. The ZFS as block or as filesystem is just symantics. While you're at it dig into libvirt and see if you can fix it's silliness.
 
> provisioned blocks. Rather, I all for something as "if free space  is lower than 30%, disable new snapshot *creation*"

Say you allowed a snapshot to be created when it was 31%. And 100 milliseconds later you had 2 more all ask for a snapshot and they succeeded. But 2 seconds later just one of your snapshot writers decided to write till it ran off the end of available space. What have you gained?

> is that, by cleaver using of the refreservation property, I can engineer 

You're not being nearly clever enough. You're using the wrong set of tools and making unsupported assumptions about future writes.

> Committed (fsynced) writes are safe

FSync'd where? Inside your client VM? The hell they're safe. Your hypervisor is under no obligation to honor a write request issued to XFS as if it's synchronous. 
Is XFS at the hypervisor being mounted 'sync'? That's not nearly enough though. You can also prove that there is a direct 1:1 map between the client VM's aggregate of FSync inspired blocks and general writes being de-staged at the same time it gets handed off to the hypervisor's XFS with the same atomicity? And furthermore when your client VM's kernel ACK's the FSYNC it is saying so without having any idea that the write actually made it. It *thought* it had done all it was supposed to do. Now the user software as well as the VM kernel are being actively misled!

You're going about this completely wrong.

You have to push the "did my write actually succeed or not and how do I recover" to inside the client VM. Your client VM either gets issued a block device that is iSCSI (can be same host) or 'bare metal' LVM on the hypervisor. That's the ONLY way to make sure the I/O's don't get jumbled and errors map exactly. Otherwise for application scribble, the client VM mounts an NFS share that can be thinLV+XFS at the fileserver. Or buy a proper enterprise storage array (they are dirt-cheap used, off maint) where people far smarter than you have solved this problem decades ago.

> really want to prevent full thin pools even in the face of failed

And yet you have demonstrated no ability to do so. Or at least have a very naive notion of what happens when multiple, simultaneous actors are involved. It sounds like some of your preferred toolset is letting you down. Roll up your sleeves and fix it. Why you give a damn about what filesystem is 'default' in any particular distribution is beyond me. Use the combination that actually works - not "if only this or that were changed it could/might work."

> to design system where some types of problems can not  simply happen.

And yet you persist on using the dumbest combo available: thin + xfs. No offense to LVM Thin, it works great WHEN used correctly. To channel Apple, "you're holding it wrong".
