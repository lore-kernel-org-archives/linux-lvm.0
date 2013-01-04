Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r042uq9m032713
	for <linux-lvm@redhat.com>; Thu, 3 Jan 2013 21:56:53 -0500
Received: from hoptical.rarforge.com (hoptical.rarforge.com [207.115.88.84])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r042uonr029093
	for <linux-lvm@redhat.com>; Thu, 3 Jan 2013 21:56:51 -0500
Received: from localhost (localhost [127.0.0.1])
	by hoptical.rarforge.com (Postfix) with ESMTP id 284A7AA244
	for <linux-lvm@redhat.com>; Thu,  3 Jan 2013 18:56:50 -0800 (PST)
Received: from hoptical.rarforge.com ([127.0.0.1])
	by localhost (hoptical.rarforge.com [127.0.0.1]) (amavisd-new,
	port 10026) with ESMTP id JAXVVGJkk4IF for <linux-lvm@redhat.com>;
	Thu,  3 Jan 2013 18:56:49 -0800 (PST)
Received: from [10.0.0.111] (salish.linuxjunkie.com [207.115.66.170])
	by hoptical.rarforge.com (Postfix) with ESMTPSA id 48EBFA096F
	for <linux-lvm@redhat.com>; Thu,  3 Jan 2013 18:56:49 -0800 (PST)
Message-ID: <50E644EF.6060209@rarforge.com>
Date: Thu, 03 Jan 2013 18:56:47 -0800
From: Rob <lists@rarforge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM snapshot with Clustered VG
Reply-To: lists@rarforge.com,
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Is there a way to convert an active LV on a clustered VG to an exclusive 
lock without deactivating it first? Or some way of taking a snapshot of 
a clustered LVM? I know I have read snapshots are not possible on CLVM, 
but the information seems outdated.

ha node1: /dev/vg_clus/logvol_clus
ha node2: /dev/vg_clus/logvol_clus

1) I can deactivate the the entire vg on node1 and node2 with 'vgchange 
-an vg_clus' and activate with -ay. Just stating cluster vg is working.

2) I can deactivate locally on node2 with 'vgchange -aln vg_clus' , it 
shows inactive on node2 and active still on node1
     - After deactivating, I cannot get exclusive lock on node1 with 
'vgchange -aey vg_clus'
       I get an error locking on node1

3) I can get exclusive an lock if I deactivate the VG on both nodes and 
then run 'vgchange -aey vg_clus' on either node. The lvcreate snapshop 
works, but again, it requires deactivating the vg, which isn't an option 
in production.


Setup:
  Centos 6.3 (current)
  cman+pacemaker dual primary drbd for HA KVM w/ live migration
  disk: lvm -> drbd -> clvm -> kvm virt

Currently I am taking a lvm snapshot of the drbd lvm backing device, but 
it's not ideal ( as there are other issues )

Thanks for the time!

-Rob
