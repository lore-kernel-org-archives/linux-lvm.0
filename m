Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1H8BRi24345
	for <linux-lvm@redhat.com>; Tue, 17 Feb 2004 03:11:27 -0500
Received: from einhorn.in-berlin.de (root@einhorn.in-berlin.de [192.109.42.8])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1H8BQb01173
	for <linux-lvm@redhat.com>; Tue, 17 Feb 2004 03:11:26 -0500
Received: from einhorn.in-berlin.de (localhost [127.0.0.1])
	by einhorn.in-berlin.de (8.12.10/8.12.10/Debian-4) with ESMTP id i1H8BPdZ012362
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Tue, 17 Feb 2004 09:11:25 +0100
Received: (from www-data@localhost)
	by einhorn.in-berlin.de (8.12.10/8.12.10/Debian-4) id i1H8BPpv012357
	for linux-lvm@redhat.com; Tue, 17 Feb 2004 09:11:25 +0100
Message-ID: <1077005485.4031ccad750ed@webmail.in-berlin.de>
From: Stefan Lucke <stefan@lucke.in-berlin.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Fwd: Error with "vg_read_with_pv_and_lv .. current PV" during boot
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Tue Feb 17 03:10:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Resent as list member. Is list for members only ?
My prio 1 problem is now cv'ed by not having root on lvm.

Stefan Lucke
----- Forwarded message from Stefan Lucke <stefan@lucke.in-berlin.de> -----
    Date: Mon, 16 Feb 2004 16:08:55 +0100
    From: Stefan Lucke <stefan@lucke.in-berlin.de>
Reply-To: Stefan Lucke <stefan@lucke.in-berlin.de>
 Subject: Error with "vg_read_with_pv_and_lv .. current PV" during boot
      To: linux-lvm@redhat.com


Hi,

I'm in trouble during boot due to vgscan reports above error.

Doing vgscan with Knoppix or from suse 9.0 rescue system, works without
errors and my LVs are accessable.

hda (hda1 160MB unused, hda2 32MB /boot, hda3 9.8GB lvm)
hdb (120 GB lvm )

root filesystem is on /dev/vg00/lv04

Would be nice if someone can give a hint how to dig further.

Stefan Lucke

----- End forwarded message -----
