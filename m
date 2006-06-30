Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5UD0ro3016074
	for <linux-lvm@redhat.com>; Fri, 30 Jun 2006 09:00:53 -0400
Received: from ug-out-1314.google.com (ug-out-1314.google.com [66.249.92.173])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k5UD0ee0009252
	for <linux-lvm@redhat.com>; Fri, 30 Jun 2006 09:00:45 -0400
Received: by ug-out-1314.google.com with SMTP id o2so56039uge
	for <linux-lvm@redhat.com>; Fri, 30 Jun 2006 06:00:40 -0700 (PDT)
Message-ID: <f29fd8170606300600q1454849em4bd8b80cd7107a98@mail.gmail.com>
Date: Fri, 30 Jun 2006 15:00:38 +0200
From: "Ugo PARSI" <ugo.parsi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] Making LVM cluster-safe
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
To: linux-lvm@redhat.com

Hello,

I am dealing with LVM issues/thoughts with clustering for some time
now... I'm detailing my architecture (which is not in production at
the moment):

I've got a few SAN (iSCSI-based) nodes and I've got more nodes running
Xen (para-virtualization / virtual machine solution), each Xen node is
connected to the SANs and can access their devices, all of them are
LVM based so that I can easily manage the volumes and logical volumes.

On top of each virtual machine that's running, I have a LV associated
with it (the virtual machine doesn't know anything about LVM, only the
physical host does, it's totally transparent for it).
Also, a logical volume is never mounted twice... since 1 virtual
machine = 1 lv, so I am safe on that side.

All my first tests worked really fine that way....until I discovered
that when I update LVM data on the SAN, the information is not
refreshed on the nodes....

That's how I discovered LVM was not cluster compliant and that it was
unsafe to run it that way, etc..etc...

So after some researches, I found the CLVM software which is part of
the whole RedHat Cluster Suite.
After a few days of configuration / trial, the solution was up & ready.
But this solution is not stable at all after too many nodes have
joined the cluster, I have got random kernel panics, crashes, freezes,
etc... which is not good for me.... and it doesn't stand my
pre-production tests.

Plus I have to install a lot of software, which makes sense for people
that are using GFS and all the tools.... but actually I am only really
using clvm....

I am looking for a MUCH MUCH simpler solution, that I could even
script and write myself....

Here's my idea :

-> Make LVM updates, only and simply on a master node (I am certain
that no other nodes will use it) for example the SAN itself.
-> The master orders all the nodes to restart the LVM software on all
nodes (is there some kind of command to refresh the metadata ?
vgchange ?).
For more complex operations like resizing, moving, etc...kill andu
umount the virtual machine first, so that it won't trash data (in case
of a shrink for example) until LVM is refreshed.

With my current infrastructure, issuing thoses commands would be much
simpler for me than maintaining kernel-based-unstable software...

But of course, I'd like the advice from experts like you please, to
know, if I am not missing a big point in my idea ? or if it is not
safe ?

Thanks in advance,

Greetings,

Ugo PARSI

-- 
An apple a day, keeps the doctor away
