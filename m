Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F18860851
	for <linux-lvm@redhat.com>; Fri, 19 Oct 2018 09:05:37 +0000 (UTC)
Received: from prv1-mh.provo.novell.com (prv1-mh.provo.novell.com
	[137.65.248.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3BDE63091D63
	for <linux-lvm@redhat.com>; Fri, 19 Oct 2018 09:05:36 +0000 (UTC)
Message-Id: <5BC99E56020000F90003B9C7@prv1-mh.provo.novell.com>
Date: Fri, 19 Oct 2018 03:05:26 -0600
From: "Gang He" <ghe@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] The node was fenced in the cluster when cmirrord was
 enabled on LVM2.2.02.120
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

Hello List,

I got a bug report from the customer, which said the node was fenced in the cluster when they enabled cmirrord.
Before the node was fenced, we can see some log printed as below,

2018-09-25T12:55:26.555018+02:00 qu1ci11 cmirrord[6253]: cpg_mcast_joined error: 2
2018-09-25T12:55:31.604832+02:00 qu1ci11 sbd[2865]:  warning: inquisitor_child: /dev/disk/by-id/scsi-0QEMU_QEMU_HARDDISK_drive-scsi2-0-0-2 requested a reset
2018-09-25T12:55:31.608112+02:00 qu1ci11 sbd[2865]:    emerg: do_exit: Rebooting system: reboot
2018-09-25T12:55:33.202189+02:00 qu1ci11 kernel: [ 4750.932328] device-mapper: dm-log-userspace: [LYuPIux2] Request timed out: [15/93273] - retrying
2018-09-25T12:55:35.186091+02:00 qu1ci11 kernel: [ 4752.916268] device-mapper: dm-log-userspace: [LYuPIux2] Request timed out: [9/93274] - retrying
2018-09-25T12:55:41.382129+02:00 qu1ci11 kernel: [ 4759.112231] device-mapper: dm-log-userspace: [LYuPIux2] Request timed out: [15/93275] - retrying
2018-09-25T12:55:41.382157+02:00 qu1ci11 kernel: [ 4759.116237] device-mapper: dm-log-userspace: [LYuPIux2] Request timed out: [15/93276] - retrying
2018-09-25T12:55:41.534092+02:00 qu1ci11 kernel: [ 4759.264201] device-mapper: dm-log-userspace: [LYuPIux2] Request timed out: [15/93278] - retrying
2018-09-25T12:55:41.534117+02:00 qu1ci11 kernel: [ 4759.264274] device-mapper: dm-log-userspace: [LYuPIux2] Request timed out: [15/93279] - retrying
2018-09-25T12:55:41.534119+02:00 qu1ci11 kernel: [ 4759.264278] device-mapper: dm-log-userspace: [LYuPIux2] Request timed out: [15/93277] - retrying
 ...

2018-09-25T12:56:26.439557+02:00 qu1ci11 lrmd[3795]:  warning: rsc_VG_ASCS_monitor_60000 process (PID 4467) timed out
2018-09-25T12:56:26.439974+02:00 qu1ci11 lrmd[3795]:  warning: rsc_VG_ASCS_monitor_60000:4467 - timed out after 60000ms
2018-09-25T12:56:26.534104+02:00 qu1ci11 kernel: [ 4804.264240] device-mapper: dm-log-userspace: [LYuPIux2] Request timed out: [15/93321] - retrying
2018-09-25T12:56:26.534122+02:00 qu1ci11 kernel: [ 4804.264287] device-mapper: dm-log-userspace: [LYuPIux2] Request timed out: [15/93320] - retrying
2018-09-25T12:56:26.534124+02:00 qu1ci11 kernel: [ 4804.264311] device-mapper: dm-log-userspace: [LYuPIux2] Request timed out: [15/93322] - retrying

Did you guys encounter the similar issue before? I can find the similar bug report at http://lists.linux-ha.org/pipermail/linux-ha/2014-December/048427.html 
If you know the root cause, please let me know. 


Thanks
Gang
                                                                                                                                                                                  
