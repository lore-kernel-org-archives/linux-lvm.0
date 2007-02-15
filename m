Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1F9Nobv012162
	for <linux-lvm@redhat.com>; Thu, 15 Feb 2007 04:23:51 -0500
Received: from nz-out-0506.google.com (nz-out-0506.google.com [64.233.162.225])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l1F9NnrA015691
	for <linux-lvm@redhat.com>; Thu, 15 Feb 2007 04:23:49 -0500
Received: by nz-out-0506.google.com with SMTP id s18so511554nze
	for <linux-lvm@redhat.com>; Thu, 15 Feb 2007 01:23:49 -0800 (PST)
Message-ID: <9cf248670702150123n6648abf5u2bbd9eb31645c81a@mail.gmail.com>
Date: Thu, 15 Feb 2007 14:53:47 +0530
From: "Vasan " <vasan.vs@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] LVM2 snapshot contents on a reboot
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

Hi all,

We are using the latest version of LVM2 and creating a snapshot LV
(This is a fresh snapshot LV and we are not attempting to migrate from
LVM1). However, on rebooting the server, we find the snapshot contents
are getting synced up with the original source volume contents
completely. Any changes that has been made in the source volume after
the snapshot volume has been taken is getting reflected in the
snapshot volume as well after the reboot.

The following are the commands that we are using:

For the creation of snapshot:

lvcreate -s -L  <snap size> -n <snapshot Name> -p <R-W permission>
<original volume>

 However, if the server (running Linux  2.6.15.4) is not rebooted, the
snapshot contents are correctly shown even if there has been any
changes on the source volume.

Should we do anything specific at the time of the server shutdown to
ensure that the snapshot contents should not be getting synced with
the source volume on start up?

The following are the versions that we are using from a LVM perspective:

-bash-3.00# lvs --version
LVM version:     2.02.13 (2006-10-27)
Library version: 1.02.10 (2006-09-19)
Driver version:  4.4.0

Please advice.

Thanks

Srini
