Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AA762026D67
	for <linux-lvm@redhat.com>; Wed, 22 Jan 2020 10:58:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D517101D23B
	for <linux-lvm@redhat.com>; Wed, 22 Jan 2020 10:58:34 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id r27so5846455otc.8
	for <linux-lvm@redhat.com>; Wed, 22 Jan 2020 02:58:31 -0800 (PST)
MIME-Version: 1.0
From: Mauricio Tavares <raubvogel@gmail.com>
Date: Wed, 22 Jan 2020 05:58:21 -0500
Message-ID: <CAHEKYV7Uvqm2knzb4QsTxtdec2Wi+mnFi2Q6MbP95gseS5V7Ow@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Failed merge, still running?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

So after a botched package update I decided to revert to the snapshot
I took just before doing the update. After shutting guest down, I
started

lvconvert --merge vmhost_vg0/desktop_snap_20200121

and instead of seeing the usual percentage of how far it has
completed, I got nothing. lvs -a -o +devices shows

  LV                      VG         Attr       LSize  Pool Origin
Data%  Meta%  Move Log Cpy%Sync Convert Devices
  desktop                 vmhost_vg0 Owi-a-s--- 20.00g
                                     /dev/sdb3(14848)
  [desktop_snap_20200121] vmhost_vg0 Swi-a-s--- 10.00g      desktop 100.00

I see nothing when I do lsof against both the lv (lsof
/dev/vmhost_vg0/desktop) and its snapshot. dmsetup tells me:

[root@vmhost ~]# dmsetup info /dev/vmhost_vg0/desktop
Name:              vmhost_vg0-desktop
State:             ACTIVE
Read Ahead:        256
Tables present:    LIVE
Open count:        0
Event number:      0
Major, minor:      253, 5
Number of targets: 1
UUID: LVM-qa4WnlE7w8V7pasHwdNH6bnpz2ajYY1F2ZXwTWzpUE2r6eE2DftMGLHdeATE8XAq

[root@vmhost ~]# dmsetup info /dev/vmhost_vg0/desktop_snap_20200121
Name:              vmhost_vg0-desktop_snap_20200121
State:             ACTIVE
Read Ahead:        256
Tables present:    LIVE
Open count:        0
Event number:      0
Major, minor:      253, 15
Number of targets: 1
UUID: LVM-qa4WnlE7w8V7pasHwdNH6bnpz2ajYY1FkyXcvv8ai1Sc0q5zlsXeenYOqCPUXs3M

[root@vmhost ~]#

Before I blow that lv up, what else should I be checking?
