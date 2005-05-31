Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4V7k6O16424
	for <linux-lvm@redhat.com>; Tue, 31 May 2005 03:46:06 -0400
Received: from debruin.org (meaculpa.demon.nl [82.161.5.152])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id j4V7k58J021917
	for <linux-lvm@redhat.com>; Tue, 31 May 2005 03:46:05 -0400
Message-ID: <429C163B.80303@debruin.org>
Date: Tue, 31 May 2005 09:46:03 +0200
From: "Marc L. de Bruin" <marc@debruin.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Snapshot of /; what's the latest story?
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

Lo,

There are numerous reports about problems with LVM2 combined with a 
snapshot of /. Google provides access to all those reports. ;-)

I'm on Debian, and there is a outstanding bug already reported some 150 
days ago about this. Please take a look, 
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=288354, titled "lvm2: 
Machine freezes on snapshot creation for root LV.".

The package maintainers replied quickly: "Snapshots of the root 
filesystem are not currently supported in LVM2. There have been a number 
of emails about this on the linux-lvm mailing list. I don't see a quick 
resolution to the problem I'm afraid."

I myself also ran into problems, which repeats in a hang of the system. 
[Please see paste below]

What is the current status of this? I'm not on the latest kernel (2.6.8 
versus 2.6.11) and I'm wondering if it has already been fixed somewhere.

If not, what are the alternatives?

Thanks,
-- Marc.

[my problem]

+ /sbin/lvcreate -v -v -v --size 200M --snapshot --name lvm-snapshot 
/dev/vg/root
       Setting global/locking_type to 1
       Setting global/locking_dir to /var/lock/lvm
       File-based locking enabled.
     Setting chunksize to 16 sectors.
       Getting target version for snapshot
         dm version
         dm versions
       Getting target version for snapshot-origin
         dm versions
       Locking /var/lock/lvm/V_vg WB
     Finding volume group "vg"
         Opened /dev/hda
       /dev/hda: No label detected
         Opened /dev/md0
       /dev/md0: lvm2 label detected
         Opened /dev/hdc
       /dev/hdc: No label detected
         Opened /dev/hde
       /dev/hde: No label detected
         Opened /dev/hda1
       /dev/hda1: No label detected
         Opened /dev/md1
       /dev/md1: No label detected
         Opened /dev/hdc1
       /dev/hdc1: No label detected
         Opened /dev/hde1
       /dev/hde1: No label detected
         Opened /dev/hda2
       /dev/hda2: lvm2 label detected
       Ignoring duplicate PV SUjIQw3AwXqDVMKCILlyssQ9a3IBVCDG on 
/dev/hda2 - using md /dev/md0
         Opened /dev/md2
       /dev/md2: No label detected
         Opened /dev/hdc2
       /dev/hdc2: No label detected
         Opened /dev/md3
       /dev/md3: No label detected
         Opened /dev/hdc3
       /dev/hdc3: No label detected
         Opened /dev/md4
       /dev/md4: No label detected
         Opened /dev/hdc4
       /dev/hdc4: No label detected
         Opened /dev/md5
         /dev/md5: Failed to read label area
         Opened /dev/md6
         /dev/md6: Failed to read label area
         Opened /dev/md7
         /dev/md7: Failed to read label area
         Opened /dev/md8
         /dev/md8: Failed to read label area
         Opened /dev/md9
         /dev/md9: Failed to read label area
         Opened /dev/md10
         /dev/md10: Failed to read label area
         Opened /dev/md11
         /dev/md11: Failed to read label area
         Opened /dev/md12
         /dev/md12: Failed to read label area
         Opened /dev/md13
         /dev/md13: Failed to read label area
         Opened /dev/md14
         /dev/md14: Failed to read label area
         Opened /dev/md15
         /dev/md15: Failed to read label area
         Opened /dev/hdb
       /dev/hdb: No label detected
         Opened /dev/hdd
       /dev/hdd: No label detected
         Opened /dev/hdb1
       /dev/hdb1: No label detected
         Opened /dev/hdd1
       /dev/hdd1: No label detected
         Opened /dev/hdb2
       /dev/hdb2: lvm2 label detected
       Ignoring duplicate PV SUjIQw3AwXqDVMKCILlyssQ9a3IBVCDG on 
/dev/hdb2 - using md /dev/md0
         Opened /dev/hdd2
       /dev/hdd2: No label detected
         Opened /dev/hdd3
       /dev/hdd3: No label detected
         Opened /dev/hdd4
       /dev/hdd4: No label detected
       /dev/md0: lvm2 label detected
         Read vg metadata (15) from /dev/md0 at 23040 size 1052
     Creating logical volume lvm-snapshot
         Allowing allocation on /dev/md0 start PE 1452 length 50
     Archiving volume group "vg" metadata.
         Writing vg metadata to /dev/md0 at 24576 len 1292
     Creating volume group backup "/etc/lvm/backup/vg"
         Writing vg metadata to /etc/lvm/backup/.lvm_frodo_6662_999506660
         Committing vg metadata (16)
         Renaming /etc/lvm/backup/vg.tmp to /etc/lvm/backup/vg
         Committing vg metadata (16) to /dev/md0 header at 2048
         Locking LV 
0c61d4SdqxoFe04Nux8Y9tt4yn9QstyezWicpMlX9SqsbuqzVV44Y8u3DtZfi
v1g (R)
       Finding volume group for uuid 
0c61d4SdqxoFe04Nux8Y9tt4yn9QstyezWicpMlX9Sqs
buqzVV44Y8u3DtZfiv1g
       /dev/md0: lvm2 label detected
         Read vg metadata (16) from /dev/md0 at 24576 size 1292
     Found volume group "vg"
       Setting activation/missing_stripe_filler to /dev/ioerror
         Getting device info for vg-lvm--snapshot
         dm info 
0c61d4SdqxoFe04Nux8Y9tt4yn9QstyezWicpMlX9SqsbuqzVV44Y8u3DtZfiv1
g
         dm info vg-lvm--snapshot
       Locking memory
         memlock_count inc to 1
         dm names
         Found existing layer 'vg-root'
         Getting device info for vg-root
         dm info vg-root
         Found existing layer 'vg-home'

   [... and that's it. After this, the system hangs ...]
