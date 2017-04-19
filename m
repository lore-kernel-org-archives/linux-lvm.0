Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2009A7C76F
	for <linux-lvm@redhat.com>; Wed, 19 Apr 2017 07:22:58 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6461CC054C5E
	for <linux-lvm@redhat.com>; Wed, 19 Apr 2017 07:22:55 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp2.signet.nl (Postfix) with ESMTP id B926F40597ED
	for <linux-lvm@redhat.com>; Wed, 19 Apr 2017 09:22:53 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 19 Apr 2017 09:22:53 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <e88f9168-7426-f0d8-1e97-77ce36b3ffd2@redhat.com>
References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<CALm7yL2N1Gs+ry+vkJucuYxXeGua3LpWCR+CEy_Zdgq-w-A3ag@mail.gmail.com>
	<fe625ba1be451139dd871982a24fb9ba@assyoma.it>
	<58E7992A.4030000@tlinx.org>
	<dc7ab70743a92705e6be6fefab2d29d0@assyoma.it>
	<ece5d455-87e7-5d7c-18a4-a51355f28307@gathman.org>
	<062fccc39afe128ef5950634309a01ea@assyoma.it>
	<783965ccb392bea2faded10436cdaf39@xenhideout.nl>
	<0658b33a7d4e5494de71231b7343a514@assyoma.it>
	<88a2badd9b77546407bba31778c00699@xenhideout.nl>
	<341979ccda1b2ee7cb5242006f1b03c8@assyoma.it>
	<9b5cd79f258fbb79b7d7e213970b1ae2@xenhideout.nl>
	<e88f9168-7426-f0d8-1e97-77ce36b3ffd2@redhat.com>
Message-ID: <896280225aec8c814445e3f20277b54e@xenhideout.nl>
Subject: Re: [linux-lvm] Snapshot behavior on classic LVM vs ThinLVM
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

Zdenek Kabelac schreef op 18-04-2017 12:17:

> Already got lost in lots of posts.
> 
> But  there is tool  'thin_ls'  which can be used for detailed info
> about used space by every single  thin volume.
> 
> It's not support directly by 'lvm2' command (so not yet presented in
> shiny cool way via 'lvs -a') - but user can relatively easily run this
> command
> on his own on life pool.
> 
> 
> See for usage of
> 
> 
> dmsetup message /dev/mapper/pool 0
>     [ reserve_metadata_snap | release_metadata_snap ]
> 
> and 'man thin_ls'
> 
> 
> Just don't forget to release snapshot of thin-pool kernel metadata
> once it's not needed...
> 
>> There are two ways: polling a number through some block device command 
>> or telling the filesystem through a daemon.
>> 
>> Remounting the filesystem read-only is one such "through a daemon" 
>> command.
>> 
> 
> Unmount of thin-pool has been dropped from upstream version >169.
> It's now delegated to user script executed on % checkpoints
> (see 'man dmeventd')

So I write something useless again ;-).

Always this issue with versions...

So Let's see, Debian Unstable (Sid) still has version 168 as does 
Testing (Stretch).
Ubuntu Zesty Zapus (17.04) has 167.

So for the foreseeable future both those distributions won't have that 
feature at least.

I heard you speak of those scripts yes but I did not know when or what 
yet, thanks.

I guess my script could be run directly from the script execution in the 
future then.

Thanks for responding though, much obliged.
