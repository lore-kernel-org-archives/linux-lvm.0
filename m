Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4PHkG015955
	for <linux-lvm@redhat.com>; Tue, 25 May 2004 13:46:16 -0400
Received: from mailgate5.web.de (mailgate5.web.de [217.72.192.165])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i4PHk9HA013303
	for <linux-lvm@redhat.com>; Tue, 25 May 2004 13:46:09 -0400
Received: by mailgate5.web.de (8.11.6p2/8.11.2/SuSE Linux 8.11.0-0.4) with
	SMTP id i4PHk4418398
	for linux-lvm@redhat.com; Tue, 25 May 2004 19:46:04 +0200
Date: Tue, 25 May 2004 19:46:01 +0200
Message-Id: <920886211@web.de>
MIME-Version: 1.0
From: <fra.nospam.nk@gmx.de>
Sender: <frank.fegert@web.de>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: ERROR "vg_read_with_pv_and_lv(): allocated LE of
	LV" can't get data of volume group "vg00" from physical volume(s)
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
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

Hello all,

regarding my earlier post with the above subject i'm still trying to restore
the vg00 from those disks. Recently i put another disk in the system with
the failed vg00 and ran a recent debian with lvm2 and kernel 2.6.3. I tried
a partial vgscan/vgchange unfortunately with no avail. It drops out with
the Error:
"Logical volume (home) contains an incomplete mapping table.
Volume group "vg00" not found"
A "vgscan -P -vvv" gives the output cited below. It seems to be that lvm
finds the vg00, but complains about something. Could someone please
explain to me what the error message means and/or how i can fix it?

Thanks in advance,

Frank


Output of "vgscan -P -vvv":

      Locking /var/lock/lvm/V_vg00 RB
    Finding volume group "vg00"
        Opened /dev/hdc1
      Found /dev/hdc1 in VG vg00
        Opened /dev/hdc2
      Found /dev/hdc2 in VG vg00
        Opened /dev/hdc3
      Found /dev/hdc3 in VG vg00
        Opened /dev/hdc4
      Found /dev/hdc4 in VG vg00
        Opened /dev/hdd1
      Found /dev/hdd1 in VG vg00
        Opened /dev/hdb2
      Found /dev/hdb2 in VG vg00
        Opened /dev/hdd2
      Found /dev/hdd2 in VG vg00
        Opened /dev/hdb3
      Found /dev/hdb3 in VG vg00
        Opened /dev/hdd3
      Found /dev/hdd3 in VG vg00
        Opened /dev/hdd4
      Found /dev/hdd4 in VG vg00
        Opened /dev/hdb5
      Found /dev/hdb5 in VG vg00
        Opened /dev/hdb6
      Found /dev/hdb6 in VG vg00
        Opened /dev/hdb7
      Found /dev/hdb7 in VG vg00
        Opened /dev/hdb8
      Found /dev/hdb8 in VG vg00
        Opened /dev/hdb9
      Found /dev/hdb9 in VG vg00
      System ID ID-584581050615881 on /dev/hdc2 differs from ID-584581050615878 for volume group
      System ID ID-584581050615882 on /dev/hdc3 differs from ID-584581050615878 for volume group
      System ID ID-584581050615883 on /dev/hdc4 differs from ID-584581050615878 for volume group
      System ID (none)1061298947 on /dev/hdd1 differs from ID-584581050615878 for volume group
      System ID (none)1002881862 on /dev/hdb2 differs from ID-584581050615878 for volume group
      System ID (none)1061298816 on /dev/hdd2 differs from ID-584581050615878 for volume group
      System ID (none)1002881863 on /dev/hdb3 differs from ID-584581050615878 for volume group
      System ID (none)1061298819 on /dev/hdd3 differs from ID-584581050615878 for volume group
      System ID (none)1061298820 on /dev/hdd4 differs from ID-584581050615878 for volume group
      System ID (none)1002881867 on /dev/hdb5 differs from ID-584581050615878 for volume group
      System ID (none)1002881869 on /dev/hdb6 differs from ID-584581050615878 for volume group
      System ID (none)1002881870 on /dev/hdb7 differs from ID-584581050615878 for volume group
      System ID (none)1002881871 on /dev/hdb8 differs from ID-584581050615878 for volume group
      System ID (none)1002881875 on /dev/hdb9 differs from ID-584581050615878 for volume group
      Unlocking /var/lock/lvm/V_vg00
        Closed /dev/hdc1
        Closed /dev/hdc2
        Closed /dev/hdc3
        Closed /dev/hdc4
        Closed /dev/hdd1
        Closed /dev/hdb2
        Closed /dev/hdd2
        Closed /dev/hdb3
        Closed /dev/hdd3
        Closed /dev/hdd4
        Closed /dev/hdb5
        Closed /dev/hdb6
        Closed /dev/hdb7
        Closed /dev/hdb8
        Closed /dev/hdb9

________________________________________________________________
Verschicken Sie romantische, coole und witzige Bilder per SMS!
Jetzt neu bei WEB.DE FreeMail: http://freemail.web.de/?mc=021193
