Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C82325C54A
	for <linux-lvm@redhat.com>; Fri, 22 Sep 2017 06:03:21 +0000 (UTC)
Received: from mail-ua0-f172.google.com (mail-ua0-f172.google.com
	[209.85.217.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 946AF806D4
	for <linux-lvm@redhat.com>; Fri, 22 Sep 2017 06:03:20 +0000 (UTC)
Received: by mail-ua0-f172.google.com with SMTP id l94so77561ual.11
	for <linux-lvm@redhat.com>; Thu, 21 Sep 2017 23:03:20 -0700 (PDT)
MIME-Version: 1.0
From: Mauricio Tavares <raubvogel@gmail.com>
Date: Fri, 22 Sep 2017 02:03:18 -0400
Message-ID: <CAHEKYV68yfVGbTCeC4=4J6mde=WBkgwtuQX+GY8otPm6fW9Sfw@mail.gmail.com>
Subject: [linux-lvm] Restoring snapshot gone bad
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

I have a lv, vmzone/desktop that I use as drive for a kvm guest;
nothing special here. I wanted to restore its snapshot so like I have
done many times before I shut guest down and then

lvconvert --merge vmzone/desktop_snap_20170921
  Logical volume vmzone/desktop is used by another device.
  Can't merge over open origin volume.
  Merging of snapshot vmzone/desktop_snap_20170921 will occur on next activation
 of vmzone/desktop.

What is it really trying to tell me? How to find out which other
device is using it?

lvdisplay tells me that

lvdisplay /dev/vmzone/desktop
  --- Logical volume ---
  LV Path                /dev/vmzone/desktop
  LV Name                desktop
  VG Name                vmzone
  LV UUID                3hcB1L-rIRf-PHZQ-I55F-ZXhT-SnSZ-vThO8U
  LV Write Access        read/write
  LV Creation host, time duocismj01e9se, 2017-06-29 15:07:12 -0400
  LV snapshot status     source of
                         desktop_snap_20170921 [active]
  LV Status              available
  # open                 2
  LV Size                100.00 GiB
  Current LE             25600
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           252:6

When I do plain old lvs (or lvs -a -o +devices), the attribute entry
for the desktop looks like

  desktop    vmzone    Owi-aos--- 100.00g

According to https://linux.die.net/man/8/lvs the "O" in Owi-aos--- means it
is merging a snapshot. But, what is its status? Based on how long it
has been that way, I think it is hung but I do not know what is
causing this hangup.

Suggestions?
