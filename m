Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6R4Zwa13218
	for <linux-lvm@redhat.com>; Tue, 27 Jul 2004 00:35:58 -0400
Received: from mproxy.gmail.com (rproxy.gmail.com [64.233.170.200])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i6R4Zve1004693
	for <linux-lvm@redhat.com>; Tue, 27 Jul 2004 00:35:57 -0400
Received: by mproxy.gmail.com with SMTP id 80so36318rnk
	for <linux-lvm@redhat.com>; Mon, 26 Jul 2004 21:35:54 -0700 (PDT)
Message-ID: <f7cb724604072621351067b070@mail.gmail.com>
Date: Tue, 27 Jul 2004 00:35:54 -0400
From: Nathan Richardson <nathan.richardson@gmail.com>
In-Reply-To: <f7cb724604072615406248f765@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <f7cb724604072615406248f765@mail.gmail.com>
Subject: [linux-lvm] Device mapper error ioctl cmd 9. What is this?
Reply-To: richarnd@georgetown.edu,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Newbie-be gentle.

I'm trying to set up a very simple LVM logical volume and get the
following (verbose) output from lvcreate:

    Creating logical volume video_lg
    Archiving volume group "video_vg" metadata.
    Creating volume group backup "/etc/lvm/backup/video_vg"
    Found volume group "video_vg"
    Loading video_vg-video_lg
  device-mapper ioctl cmd 9 failed: Invalid argument
  Couldn't load device 'video_vg-video_lg'.
  Failed to activate new LV.

All LVM utils also seem to scan all my drives, even if I don't have
them (for example, /dev/hda6 gets listed even though I only have 5
partitions).

Anyway, this seems like a device-mapper issue rather than an LVM one,
but I can't tell for sure.

I'm running Fedora core 1 with a standard 2.6.7 kernel. I have LVM2
and version 1.00.19 of the DM userspace tools.

I have no problems creating the volume group, and even after the
lvcreate seems to fail, I have an entry for the LV/VG in /dev/mapper/.
I never get the entry in /dev that I apparently need for the lvcreate
to complete and to be able to actually mount the LV.

Sorry if this is unclear - if more info is needed, let me know. Any
help is appreciated. 

Thanks,
Nathan Richardson
