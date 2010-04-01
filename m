Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o31Aeidu023645
	for <linux-lvm@redhat.com>; Thu, 1 Apr 2010 06:40:44 -0400
Received: from mx2.netapp.com (mx2.netapp.com [216.240.18.37])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o31AeVCW016580
	for <linux-lvm@redhat.com>; Thu, 1 Apr 2010 06:40:31 -0400
Received: from sacrsexc1-prd.hq.netapp.com (sacrsexc1-prd.hq.netapp.com
	[10.99.115.27])
	by smtp2.corp.netapp.com (8.13.1/8.13.1/NTAP-1.6) with ESMTP id
	o31AeGpU012549
	for <linux-lvm@redhat.com>; Thu, 1 Apr 2010 03:40:16 -0700 (PDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Thu, 1 Apr 2010 16:10:13 +0530
Message-ID: <4A2CF3C24E05B348A46BAF5A7C4593D406F87546@BTCMVEXC1-PRD.hq.netapp.com>
In-Reply-To: <mailman.3140.1269024912.9812.linux-lvm@redhat.com>
References: <mailman.3140.1269024912.9812.linux-lvm@redhat.com>
From: "Sarkar, Kaushik" <Kaushik.Sarkar@netapp.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Can not use vgimportclone multiple times for the
	attached disk
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi,

I successfully mounted the associated logical volume from the backup of
the same machine.
Before SCSI scan I have only /dev/sda2
After SCSI bus scan (rescan-scsi-bus.sh) I can see the new disk attached
to my RHEL machine.

# vgimportclone -n NEWVG /dev/sdc2

It successfully rename the VG.
#vgchange -ay NEWVG

I am able to mount the logical volumes associated with this VG to verify
the backup.

After verifying I un-mounted logical volume and remove the volume group.
Vgremove -f NEWVG 

But the new disk /dev/sdc2 still attached
I tried to do vgimportclone again it fails
# vgimportclone -n NEWVG /dev/sdc2
Fatal: /dev/sdc2 is not a PV., error: 5

I tried to remove the physical volume labeling then tried from the fresh
but still no luck.
#Pvremove -f /dev/sdc2
# rescan-scsi-bus.sh
# vgimportclone -n NEWVG /dev/sdc2
Fatal: /dev/sdc2 is not a PV., error: 5

What went wrong? What is the correct step to achieve it.

Thnx&Rgds,
KauShik SarKar
