Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1GF8xi04010
	for <linux-lvm@redhat.com>; Mon, 16 Feb 2004 10:08:59 -0500
Received: from einhorn.in-berlin.de (root@einhorn.in-berlin.de [192.109.42.8])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1GF8wb03005
	for <linux-lvm@redhat.com>; Mon, 16 Feb 2004 10:08:58 -0500
Message-ID: <1076944135.4030dd07ec870@webmail.in-berlin.de>
From: Stefan Lucke <stefan@lucke.in-berlin.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Error with "vg_read_with_pv_and_lv .. current PV" during boot
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
Date: Wed Feb 18 09:33:13 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com
Cc: stefan@lucke.in-berlin.de

Hi,

I'm in trouble during boot due to vgscan reports above error.

Doing vgscan with Knoppix or from suse 9.0 rescue system, works without
errors and my LVs are accessable.

hda (hda1 160MB unused, hda2 32MB /boot, hda3 9.8GB lvm)
hdb (120 GB lvm )

root filesystem is on /dev/vg00/lv04

Would be nice if someone can give a hint how to dig further.

Stefan Lucke
