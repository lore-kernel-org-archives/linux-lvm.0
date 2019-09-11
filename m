Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AEE91001948
	for <linux-lvm@redhat.com>; Wed, 11 Sep 2019 09:32:52 +0000 (UTC)
Received: from m9a0002g.houston.softwaregrp.com
	(m9a0002g.houston.softwaregrp.com [15.124.64.67])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A59A546671
	for <linux-lvm@redhat.com>; Wed, 11 Sep 2019 09:32:47 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0002g.houston.softwaregrp.com WITH ESMTP FOR linux-lvm@redhat.com;
	Wed, 11 Sep 2019 09:31:59 +0000
From: Gang He <GHe@suse.com>
Date: Wed, 11 Sep 2019 09:17:21 +0000
Message-ID: <CH2PR18MB32067A650CBE520D9A0DC547CFB10@CH2PR18MB3206.namprd18.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] pvresize will cause a meta-data corruption with error
 message "Error writing device at 4096 length 512"
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello List,

Our user encountered a meta-data corruption problem, when run pvresize command after upgrading to LVM2 v2.02.180 from v2.02.120.

The details are as below,
we have following environment:
- Storage: HP XP7 (SAN) - LUN's are presented to ESX via RDM
- VMWare ESXi 6.5
- SLES 12 SP 4 Guest

Resize happened this way (is our standard way since years) - however - this is our first resize after upgrading SLES 12 SP3 to SLES 12 SP4 - until this upgrade, we
never had a problem like this:
- split continous access on storage box, resize lun on XP7
- recreate ca on XP7
- scan on ESX
- rescan-scsi-bus.sh -s on SLES VM
- pvresize  ( at this step the error happened)

huns1vdb01:~ # pvresize /dev/disk/by-id/scsi-360060e80072a660000302a6600003274
 Error writing device /dev/sdaf at 4096 length 512.
 Failed to write mda header to /dev/sdaf fd -1
 Failed to update old PV extension headers in VG vghundbhulv_ar.
 Error writing device /dev/disk/by-id/scsi-360060e80072a660000302a66000031ec at 4096 length 512.
 Failed to write mda header to /dev/disk/by-id/scsi-360060e80072a660000302a66000031ec fd -1
 Failed to update old PV extension headers in VG vghundbhulk_ar.
 VG info not found after rescan of vghundbhulv_r2
 VG info not found after rescan of vghundbhula_r1
 VG info not found after rescan of vghundbhuco_ar
 Error writing device /dev/disk/by-id/scsi-360060e80072a660000302a66000031e8 at 4096 length 512.
 Failed to write mda header to /dev/disk/by-id/scsi-360060e80072a660000302a66000031e8 fd -1
 Failed to update old PV extension headers in VG vghundbhula_ar.
 VG info not found after rescan of vghundbhuco_r2
 Error writing device /dev/disk/by-id/scsi-360060e80072a660000302a660000300b at 4096 length 512.
 Failed to write mda header to /dev/disk/by-id/scsi-360060e80072a660000302a660000300b fd -1
 Failed to update old PV extension headers in VG vghundbhunrm02_r2.

Any idea for this bug?

Thanks a lot.
Gang
