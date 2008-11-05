Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mA59rnXU008332
	for <linux-lvm@redhat.com>; Wed, 5 Nov 2008 04:53:49 -0500
Received: from breeves.fab.redhat.com (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id mA59rn41001069
	for <linux-lvm@redhat.com>; Wed, 5 Nov 2008 04:53:49 -0500
Message-ID: <49116C9A.6040203@redhat.com>
Date: Wed, 05 Nov 2008 09:51:22 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] reading lun snapshots with identical lvm information
	on	them on one machine
References: <8D07631D47C3CB4F867AD7BCF07D5C232C87@excs01.bucoks>
In-Reply-To: <8D07631D47C3CB4F867AD7BCF07D5C232C87@excs01.bucoks>
Content-Transfer-Encoding: 7bit
Reply-To: bmr@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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

James A. Dinkel wrote:
> I have 4 san luns attached to a RedHat EL 5.2 server. Each partitioned with a single lvm partition, making up a single volume group. I've created a snapshot of these luns on the san and reattached the 4 snapshot luns back to the same server.
> 
> As you may guess, this does not work well since the partitions have identical volume group information on them. To begin with the drives just show up as 4 drives with lvm partitions on them. I had hoped that I could create a new volume group out of those 4 physical volumes and access the data, but I get this when I try (sdb,c,d,e are the original luns, sdf,g,h,i are the snapshot luns):
> 
> -------------------------
> [brazen@server2 ~]$ sudo /usr/sbin/vgcreate vg-test-snap /dev/sdf1 /dev/sdg1 /dev/sdh1 /dev/sdi1

If you're going to create a new VG on them then why bother snapshotting 
at all? This will initialise a new volume group with no logical volumes 
(i.e. it erases all the metadata in the snapshots and renders the 
snapshotted data inaccessible). Are you sure that's what you wanted?

> Found duplicate PV cJoNn4uwBjse586l3ZMxKMRo938bK1xp: using /dev/sdf1 not /dev/sdb1
> Found duplicate PV eWQLAqej1AgEk0WDLPE0trVqlIreRbyU: using /dev/sdg1 not /dev/sdc1
> Found duplicate PV qYx9aIoUEUjB78OAhBuXWmsjv3VCXjUr: using /dev/sdh1 not /dev/sdd1
> Found duplicate PV DrgbFGRJ6ziMJqoj2HlTFk9LtQhZx0Fp: using /dev/sdi1 not /dev/sde1
> Found duplicate PV cJoNn4uwBjse586l3ZMxKMRo938bK1xp: using /dev/sdb1 not /dev/sdf1
> Found duplicate PV eWQLAqej1AgEk0WDLPE0trVqlIreRbyU: using /dev/sdc1 not /dev/sdg1
> Found duplicate PV qYx9aIoUEUjB78OAhBuXWmsjv3VCXjUr: using /dev/sdd1 not /dev/sdh1
> Found duplicate PV DrgbFGRJ6ziMJqoj2HlTFk9LtQhZx0Fp: using /dev/sde1 not /dev/sdi1
> Found duplicate PV cJoNn4uwBjse586l3ZMxKMRo938bK1xp: using /dev/sdf1 not /dev/sdb1
> Found duplicate PV eWQLAqej1AgEk0WDLPE0trVqlIreRbyU: using /dev/sdg1 not /dev/sdc1
> Found duplicate PV qYx9aIoUEUjB78OAhBuXWmsjv3VCXjUr: using /dev/sdh1 not /dev/sdd1
> Found duplicate PV DrgbFGRJ6ziMJqoj2HlTFk9LtQhZx0Fp: using /dev/sdi1 not /dev/sde1
> Physical volume '/dev/sdf1' is already in volume group 'vg-test-data1'
> Unable to add physical volume '/dev/sdf1' to volume group 'vg-test-snap'.
> -----------------------
> 
> If anybody has any ideas for getting around this, I would love to hear it. Resorting to using lvm snapshots is going to be problematic.  I know it sounds convoluted, but I really need this to work with SAN snapshots.

Use LVM's filtering options to exclude one or the other set of PVs. You 
can then either access one VG at a time (possibly using the 
LVM_SYSTEM_DIR environment variable to switch between the two filtering 
configurations), or you can re-name and re-ID one of the VGs to allow 
them to co-exist on the system. Since you appear to have wanted the 
snapshot VG to be named "vg-test-snap", this may be your best option.

See the steps I posted here for cloning an existing volume group:

https://www.redhat.com/archives/linux-lvm/2007-November/msg00039.html

There are also some notes in the LVM2 wiki on dealing with hardware 
snapshots:

http://sources.redhat.com/lvm2/wiki/HardwareSnapshotRestore

Regards,
Bryn.
