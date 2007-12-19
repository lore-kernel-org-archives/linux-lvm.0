Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lBJ9Nrfi024562
	for <linux-lvm@redhat.com>; Wed, 19 Dec 2007 04:23:53 -0500
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lBJ9NEWf026630
	for <linux-lvm@redhat.com>; Wed, 19 Dec 2007 04:23:15 -0500
Received: from postfix1.syneticon.net (postfix1.syneticon.net [192.168.112.6])
	by mail2.syneticon.net (Postfix) with ESMTP id A2C1B4A77A
	for <linux-lvm@redhat.com>; Wed, 19 Dec 2007 10:23:08 +0100 (CET)
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by postfix1.syneticon.net (Postfix) with ESMTP id 79F6B9483
	for <linux-lvm@redhat.com>; Wed, 19 Dec 2007 10:23:07 +0100 (CET)
Received: from postfix1.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id ISSPbwYTURVf for <linux-lvm@redhat.com>;
	Wed, 19 Dec 2007 10:23:05 +0100 (CET)
Received: from [192.168.10.145] (xdsl-87-78-227-49.netcologne.de
	[87.78.227.49]) by postfix1.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Wed, 19 Dec 2007 10:23:05 +0100 (CET)
Message-ID: <4768E2F7.6000308@wpkg.org>
Date: Wed, 19 Dec 2007 10:23:03 +0100
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] dynamic allocation
References: <476644EF.4030103@gmx.de>
In-Reply-To: <476644EF.4030103@gmx.de>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Corin Langosch schrieb:
> Hi!
> 
> I'm using lvm2. Currently I have on big VG (100GB) and several LV for
> VServers each 20GB. So my system is limited to having 5 Vservers.
> 
> Is it possible to tell lvm2 to start with only little allocation and
> dynamically grow the LV? I know I can grow it using the command line
> tools but I want it to happen fully automatically.
> 
> So in terms of comands something like:
> lvcreate --size-max 20GB --size-grow 100MB --size-start 1GB vserver06 data
> 
> So the LV would intitially allocate only 1GB of the VG and allocate new
> space in 100MB as it needs, stopping at a maximum size of 20GB. Of
> course I would then have to make sure the VG has enough free blocks for
> the LVs to grow, but that shouldn't be a problem.
> 
> I think this should technically be possible as software like VirtualBox
> can grow it's image file the same way to. If lvm can't to that, could
> that be done with some kind of loopback device? Which is the best way
> (also in terms of performance) to handle such a setup?

Right now it's not possible (kernel-side).

The best you can do is to use a user-space tool which will monitor a 
given volume, and grow it when needed. Saying that, I'm thinking 
primarily of snapshots. You may see a similar discussion last month - 
"balooning/dynamic snapshots?".


With dynamic non-snapshot volumes there is one significant problem 
added: not only must you grow the volume; you also have to (live-)grow 
the filesystem (ext3, xfs, ntfs, raw volumes serving as partitioned 
disks for virtualised guests etc.) that sits on top of that volume.


Perhaps if some skilled developer considers dynamic volumes for LVM in 
the future (be it snapshots, or normal volumes) a good idea would be to 
allow to create a "sparse volume" (similar to a sparse file, where space 
was allocated, but not actually filled with data yet) which could grow, 
if there is still place on the physical volume (with no space, make the 
device read only).



-- 
Tomasz Chmielewski
http://wpkg.org
