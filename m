Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r3PIvc3R011002
	for <linux-lvm@redhat.com>; Thu, 25 Apr 2013 14:57:38 -0400
Received: from homiemail-a82.g.dreamhost.com (caibbdcaaaaf.dreamhost.com
	[208.113.200.5])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r3PIvcQV018158
	for <linux-lvm@redhat.com>; Thu, 25 Apr 2013 14:57:38 -0400
Received: from homiemail-a82.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a82.g.dreamhost.com (Postfix) with ESMTP id CD14028207A
	for <linux-lvm@redhat.com>; Thu, 25 Apr 2013 11:57:37 -0700 (PDT)
Received: from [127.0.0.1] (unknown [159.63.145.2])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: tanstaafl@libertytrek.org)
	by homiemail-a82.g.dreamhost.com (Postfix) with ESMTPSA id A20F8282074
	for <linux-lvm@redhat.com>; Thu, 25 Apr 2013 11:57:37 -0700 (PDT)
Message-ID: <51797C8D.6000500@libertytrek.org>
Date: Thu, 25 Apr 2013 14:57:17 -0400
From: Tanstaafl <tanstaafl@libertytrek.org>
MIME-Version: 1.0
References: <51791E1A.8020903@libertytrek.org>
	<1366914916.11473.1153.camel@localhost.localdomain>
In-Reply-To: <1366914916.11473.1153.camel@localhost.localdomain>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM snapshots and filesystem quiescence
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

On 2013-04-25 2:35 PM, Tom Coughlan <coughlan@redhat.com> wrote:
> The LVM management tools will automatically suspend the file system
> before taking the snapshot. Refer to the following, from the RHEL 6.4
> Storage Administration Guide:
>
> ----------
>
> To suspend or resume write activity to a file system, use xfs_freeze.
> Suspending write activity allows hardware-based device snapshots to be
> used to capture the file system in a consistent state.
> Note
> The xfs_freeze utility is provided by the xfsprogs package, which is
> only available on x86_64.

Hmmm... thanks Tom, but googling seems to reveal that xfs_freeze has 
been replaced with fsfreeze (the code for which is based on xfs_freeze) 
on modern linux systems?

http://linux.die.net/man/8/fsfreeze

And the full answer to my question from the man page:

"fsfreeze is unncessary for device-mapper devices. The device-mapper 
(and LVM) automatically freezes filesystem on the device when a snapshot 
creation is requested. For more details see the dmsetup(8) man page."

and

"This option requests the specified a filesystem to be frozen from new 
modifications. When this is selected, all ongoing transactions in the 
filesystem are allowed to complete, new write system calls are halted, 
other calls which modify the filesystem are halted, and all dirty data, 
metadata, and log information are written to disk. Any process 
attempting to write to the frozen filesystem will block waiting for the 
filesystem to be unfrozen."

But thanks for the pointer... :)
