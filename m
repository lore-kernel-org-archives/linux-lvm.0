Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BC496F431
	for <linux-lvm@redhat.com>; Tue, 12 Sep 2017 17:09:33 +0000 (UTC)
Received: from mr001msb.fastweb.it (mr001msb.fastweb.it [85.18.95.85])
	by mx1.redhat.com (Postfix) with ESMTP id C443D5F73C
	for <linux-lvm@redhat.com>; Tue, 12 Sep 2017 17:09:31 +0000 (UTC)
References: <1806055156.426333.1505228581063.ref@mail.yahoo.com>
	<1806055156.426333.1505228581063@mail.yahoo.com>
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <f7d5f3b9-20fc-8043-2599-49946a598e5a@assyoma.it>
Date: Tue, 12 Sep 2017 19:09:25 +0200
MIME-Version: 1.0
In-Reply-To: <1806055156.426333.1505228581063@mail.yahoo.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Reserve space for specific thin logical volumes
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
To: matthew patton <pattonme@yahoo.com>, LVM general discussion and development <linux-lvm@redhat.com>

Hi,

On 12/09/2017 17:03, matthew patton wrote:
>> I need to take a step back: my main use for thinp is virtual machine
>> backing store
> ...
>> Rather, I had to use a single, big thin volumes with XFS on top.
> ...
>> I used  ZFS as volume manager, with the intent to place an XFS filesystem on top
> 
> Good grief, you had integration (ZFS) and then you broke it. The ZFS as block or as filesystem is just symantics. 

I did for a compelling reason - to use DRBD for realtime replication. 
Moreover, this is the *expected* use for ZVOLs.

While you're at it dig into libvirt and see if you can fix it's silliness.

This simply can not be done by a single person in reasonable time, so I 
had to find other solution for now...

> Say you allowed a snapshot to be created when it was 31%. And 100 milliseconds later you had 2 more all ask for a snapshot and they succeeded. But 2 seconds later just one of your snapshot writers decided to write till it ran off the end of available space. What have you gained?

With the refreservation property we can *avoid* such a situation. Please 
re-read my bash examples in the previous email.

> FSync'd where? Inside your client VM? The hell they're safe. Your hypervisor is under no obligation to honor a write request issued to XFS as if it's synchronous.

Wrong: Qemu/KVM *does* honors write barrier, unless you use 
"cache=unsafe". Other behaviors should be threat as bugs.

> Is XFS at the hypervisor being mounted 'sync'? That's not nearly enough though. You can also prove that there is a direct 1:1 map between the client VM's aggregate of FSync inspired blocks and general writes being de-staged at the same time it gets handed off to the hypervisor's XFS with the same atomicity? And furthermore when your client VM's kernel ACK's the FSYNC it is saying so without having any idea that the write actually made it. It *thought* it had done all it was supposed to do. Now the user software as well as the VM kernel are being actively misled!
> 
> You're going about this completely wrong.
> 
> You have to push the "did my write actually succeed or not and how do I recover" to inside the client VM. Your client VM either gets issued a block device that is iSCSI (can be same host) or 'bare metal' LVM on the hypervisor. That's the ONLY way to make sure the I/O's don't get jumbled and errors map exactly. Otherwise for application scribble, the client VM mounts an NFS share that can be thinLV+XFS at the fileserver. Or buy a proper enterprise storage array (they are dirt-cheap used, off maint) where people far smarter than you have solved this problem decades ago.

Again: this is not how Qemu/KVM threats write barriers on the guest 
side. Really. You can check the qemu/libvirt mailing list for that. 
Bottom line: guest fsynced writes *are absolutely safe.* I even tested 
this on my lab by pulling of the plug *tens of times* during heavy IO.

> And yet you have demonstrated no ability to do so. Or at least have a very naive notion of what happens when multiple, simultaneous actors are involved. It sounds like some of your preferred toolset is letting you down. Roll up your sleeves and fix it. Why you give a damn about what filesystem is 'default' in any particular distribution is beyond me. Use the combination that actually works - not "if only this or that were changed it could/might work."

The default combination is automatically the most tested one. This will 
really pay off when you face some unexptected bug/behavior

> And yet you persist on using the dumbest combo available: thin + xfs. No offense to LVM Thin, it works great WHEN used correctly. To channel Apple, "you're holding it wrong".

This is what RedHat is heavily supporting. I see nothing wrong with thin 
+ XFS, and both thinp and XFS developers confirm that.

Again: maybe I am missing something?
Thanks.

-- 
-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
