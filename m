Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r9NHiPDT029674
	for <linux-lvm@redhat.com>; Wed, 23 Oct 2013 13:44:25 -0400
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r9NGo4eB008764
	for <linux-lvm@redhat.com>; Wed, 23 Oct 2013 12:50:12 -0400
Received: by mail-ee0-f43.google.com with SMTP id e52so659819eek.2
	for <linux-lvm@redhat.com>; Wed, 23 Oct 2013 09:50:04 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 23 Oct 2013 10:50:04 -0600
Message-ID: <CAFp1kvMoWy8okmvqXOg5uPCUcnRWbr9y_de4JDcCmLRk=6vLnQ@mail.gmail.com>
From: Shi Jin <jinzishuai@gmail.com>
Subject: [linux-lvm] Unable to convert a broken LVM2 RAID1 to Linear volume
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
To: linux-lvm@redhat.com

Hi there,

I have setup a LVM2 raid1 mirror with
   lvconvert  -m 1 --type raid1 /dev/vg_data/lv_test /dev/sdd
and then after I remove one of its legs, the remaining leg keeps on
working just fine. However, I then want to convert this to a simple
Linux volume.

it would fail:

[root@shi-rhel63 ~]# lvconvert -m 0 /dev/vg_data/lv_test
  Couldn't find device with uuid QpjTRd-Cc0o-RC0y-7Gz8-GQ4u-25FM-0vO4xt.
  Cannot change VG vg_data while PVs are missing.
  Consider vgreduce --removemissing.

removemissing not working either

[root@shi-rhel63 ~]# vgreduce  --removemissing vg_data
  Couldn't find device with uuid QpjTRd-Cc0o-RC0y-7Gz8-GQ4u-25FM-0vO4xt.
  WARNING: Partial LV lv_test needs to be repaired or removed.
  WARNING: Partial LV lv_test_rmeta_1 needs to be repaired or removed.
  WARNING: Partial LV lv_test_rimage_1 needs to be repaired or removed.
  There are still partial LVs in VG vg_data.
  To remove them unconditionally use: vgreduce --removemissing --force.
  Proceeding to remove empty missing PVs.

What should I do in my case to convert the LV to linear?

My OS information:

[root@shi-rhel63 ~]#  cat /etc/redhat-release
Red Hat Enterprise Linux Server release 6.3 (Santiago)
[root@shi-rhel63 ~]# uname -a
Linux shi-rhel63 2.6.32-279.el6.x86_64 #1 SMP Wed Jun 13 18:24:36 EDT
2012 x86_64 x86_64 x86_64 GNU/Linux
[root@shi-rhel63 ~]# lvm version
  LVM version:     2.02.95(2)-RHEL6 (2012-05-16)
  Library version: 1.02.74-RHEL6 (2012-05-16)
  Driver version:  4.22.6


Thanks a lot.

Shi
