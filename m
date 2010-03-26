Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o2QEGpLK029122
	for <linux-lvm@redhat.com>; Fri, 26 Mar 2010 10:16:51 -0400
Received: from mail-pz0-f188.google.com (mail-pz0-f188.google.com
	[209.85.222.188])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o2QEGoYt011918
	for <linux-lvm@redhat.com>; Fri, 26 Mar 2010 10:16:51 -0400
Received: by pzk26 with SMTP id 26so4972835pzk.6
	for <linux-lvm@redhat.com>; Fri, 26 Mar 2010 07:16:50 -0700 (PDT)
Message-ID: <4BACC1D0.9090402@davidcoulson.net>
Date: Fri, 26 Mar 2010 10:16:48 -0400
From: David Coulson <david@davidcoulson.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Auto PV scan w/ LVM
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
To: LVM general discussion and development <linux-lvm@redhat.com>

I've got a couple of Clariion disk frames on which we performing cloning 
of LUNs for backups using HP-UX systems. Basically box A has a LUN or 
two, we clone it, and present it to box B - It mounts it, backs it up, 
then umounts it and we restart the cloning process... Nothing magical.

I'm working towards replicating this process for Linux systems, and keep 
hitting a road block. The clone LUN is always presented to the backup 
server, however while it is syncing with the source LUN it is not 
available for IO directly. In this state multipathd marks both paths as 
failed, which I'm okay with:

[root@rhtsutility02 ~]# multipath -ll 3600601608d211a00f4e21b978136df11
3600601608d211a00f4e21b978136df11
[size=20 GB][features="1 queue_if_no_path"][hwhandler="1 emc"]
\_ round-robin 0 [prio=1][enabled]
  \_ 15:0:0:12 sdad 65:208 [failed][ready]
\_ round-robin 0 [enabled]
  \_ 17:0:0:12 sdac 65:192 [failed][ready]

Unfortunately, LVM seems to automatically pick up on PVs within the 
cloned LUN as soon as multipathd grabs it, so as soon as I do a 'vgscan' 
it hangs until I break the clone and present the cloned LUN to my backup 
box.

So far I've basically excluded these cloned LUNs from lvm with a filter, 
however I do need to enable the VGs on them and mount LVs for backups. 
I'm not sure if switching out the filter all the time is the best way to 
go, but it doesn't look like LVM2's version of vgimport allows you to 
specify a PV device.

Anyone had to deal with this before, or have an idea of a good way to 
deal with it? I agree it's a messy situation, but EMC is good at that :-)
