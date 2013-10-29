Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r9TA7vpG007219
	for <linux-lvm@redhat.com>; Tue, 29 Oct 2013 06:07:57 -0400
Received: from mail-oa0-f49.google.com (mail-oa0-f49.google.com
	[209.85.219.49])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r9TA7tXX019993
	for <linux-lvm@redhat.com>; Tue, 29 Oct 2013 06:07:55 -0400
Received: by mail-oa0-f49.google.com with SMTP id j10so4876232oah.22
	for <linux-lvm@redhat.com>; Tue, 29 Oct 2013 03:07:55 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 29 Oct 2013 18:00:23 +0800
Message-ID: <CAHuLeS=VJCz__i9ZUxnE280B1cwGnzAo7zm6htzpgmn0NwPa6w@mail.gmail.com>
From: Justin Lee <justinlee5455@gmail.com>
Subject: [linux-lvm] Does LVM spontaneously run commands in the background?
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

When I run the command "vgcfgrestore -l <volume group name> " it will
show a history of backed up metadata files along with LVM commands
executed right after the file backups, like this:

########
[root@localhost ~]# vgcfgrestore -l vg_vctst

...(ignored)...

  File: /etc/lvm/archive/vg_vctst_00010-1903466144.vg
  VG name:     vg_vctst
  Description: Created *before* executing 'lvcreate -L 102400 -n
lv_g1h9 vg_vctst -R 1 -m1 /dev/md0:0-3199 /dev/mapper/mpathbp1:0-3199
/dev/sda14:0'
  Backup Time: Tue Oct 15 16:29:19 2013


  File: /etc/lvm/archive/vg_vctst_00011-623451285.vg
  VG name:     vg_vctst
  Description: Created *before* executing 'lvconvert --config
devices{ignore_suspended_devices=1} --repair --use-policies
vg_vctst/lv_g1h9'
  Backup Time: Tue Oct 15 16:35:54 2013


  File: /etc/lvm/archive/vg_vctst_00012-1423052792.vg
  VG name:     vg_vctst
  Description: Created *before* executing 'vgs --noheadings'
  Backup Time: Tue Oct 15 16:36:19 2013

...(ignored)...
########

But I didn't manually run the command "lvconvert --config
devices{ignore_suspended_devices=1} --repair ..." neither put the
command in some shell script files IIUC, so how the command gets run?
Is the command "lvconvert --config devices{ignore_suspended_devices=1}
--repair ..." run by LVM itself? If so, what is the condition that
drives LVM to run that command? (in fact, I don't want the command to
be run, because it seems destroy the mirror log and metadata in my
system and I can't find a doc explaining about "--config")

... any idea?

Justin
