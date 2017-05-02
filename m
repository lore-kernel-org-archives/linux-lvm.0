Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F06F077D61
	for <linux-lvm@redhat.com>; Tue,  2 May 2017 20:26:32 +0000 (UTC)
Received: from smtp02asnl.sandia.gov (smtp02asnl.sandia.gov [198.102.153.117])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E67F43F2E3
	for <linux-lvm@redhat.com>; Tue,  2 May 2017 20:26:29 +0000 (UTC)
Received: from mailgate2.sandia.gov (mailgate2.sandia.gov [132.175.109.4]) by
	interceptor2.sandia.gov (RSA Interceptor) for
	<linux-lvm@redhat.com>; Tue, 2 May 2017 14:26:22 -0600
Received: from mail.sandia.gov (es06amsnlnt.sandia.gov [134.253.103.166])
	by mailgate2.sandia.gov (8.14.4/8.14.4) with ESMTP id v42KQLVg018857
	for <linux-lvm@redhat.com>; Tue, 2 May 2017 14:26:21 -0600
From: "Mervini, Joseph A" <jamervi@sandia.gov>
Date: Tue, 2 May 2017 20:26:20 +0000
Message-ID: <1E80ECA9-9E1A-464F-BE5C-711630E5BD9C@sandia.gov>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <EC2FC2F3907ADA4AB4662D84C6F3F950@sandia.gov>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Apparent race condition with srp and diskless machine
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

Hello,

I am trying to use LVM2 with externally connected ip_srp storage hardware on a diskless booted node running RHEL 7 and when I attempt to create a logical volume or a snapshot under normal conditions I get the following error:

[root@ss53 ~]# lvcreate --snapshot --size 10G --name testsnap vg_local/lv_local-1 -v
  Using default stripesize 64.00 KiB.
    Setting chunksize to 4.00 KiB.
    Archiving volume group "vg_local" metadata (seqno 194).
    Creating logical volume testsnap
    Creating volume group backup "/etc/lvm/backup/vg_local" (seqno 195).
    activation/volume_list configuration setting not defined: Checking only host tags for vg_local/testsnap.
    Creating vg_local-testsnap
    Loading vg_local-testsnap table (253:57)
    Resuming vg_local-testsnap (253:57)
  /dev/vg_local/testsnap: not found: device not cleared
  Aborting. Failed to wipe snapshot exception store.
    Removing vg_local-testsnap (253:57)
    Creating volume group backup "/etc/lvm/backup/vg_local" (seqno 196).

(When I do the same operation with increased verbosity it shows that there is no device file being created in /dev/vg_local to support the new LV.)

The interesting thing is that when I run the command with -vvv at the console (via conman) it works! 

I don’t know whether there is a problem with lvm, udev or dmsetup that is causing the problem but it definitely seems like a timing issue. (If I do that same thing on a disk full system I don’t have any problems.)

Has anyone encounter this? Is there a work-around?

Thanks in advance.
====

Joe Mervini
Sandia National Laboratories
High Performance Computing
505.844.6770
jamervi@sandia.gov
