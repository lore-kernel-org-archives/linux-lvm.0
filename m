Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8DKeSr29385
	for <linux-lvm@redhat.com>; Mon, 13 Sep 2004 16:40:28 -0400
Received: from mproxy.gmail.com (rproxy.gmail.com [64.233.170.192])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i8DKeC4l015653
	for <linux-lvm@redhat.com>; Mon, 13 Sep 2004 16:40:12 -0400
Received: by mproxy.gmail.com with SMTP id 74so286855rnl
	for <linux-lvm@redhat.com>; Mon, 13 Sep 2004 13:40:02 -0700 (PDT)
Message-ID: <ce9f1f9e0409131339319648a3@mail.gmail.com>
Date: Mon, 13 Sep 2004 13:39:58 -0700
From: Stanley Yue <stanley.yue@gmail.com>
Subject: Re: [linux-lvm] Unable to create lvm1 configurations
In-Reply-To: <20040913104134.GO1094@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <ce9f1f9e040911233347ca7ec8@mail.gmail.com>
	<20040912115653.GK1094@agk.surrey.redhat.com>
	<ce9f1f9e04091301587ea0256b@mail.gmail.com>
	<20040913104134.GO1094@agk.surrey.redhat.com>
Reply-To: Stanley Yue <stanley.yue@gmail.com>,
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
To: Stanley Yue <stanley.yue@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>

Thanks Alasdair, your suggestion work.

However, I'm encountering yet another problem....;p
Looks like device-mapper always return an error on "cmd 13" when I
tried to create a lv:

[root@DAP-RHLNX1 2.4.21]# lvcreate -v -L 32 -n syueVol vg00-lvm1
  device-mapper ioctl cmd 13 failed: Invalid argument
  device-mapper ioctl cmd 13 failed: Invalid argument
    Finding volume group "vg00-lvm1"
    Creating logical volume syueVol
    Archiving volume group "vg00-lvm1" metadata.
    Creating volume group backup "/etc/lvm/backup/vg00-lvm1"
    Found volume group "vg00-lvm1"
    Loading vg00--lvm1-syueVol
    Zeroing start of logical volume "syueVol"
    Creating volume group backup "/etc/lvm/backup/vg00-lvm1"
  Logical volume "syueVol" created
[root@DAP-RHLNX1 2.4.21]# 

Here are the version information:
=========================
LVM version 2.2.00.22
Device Mapper version 1.00.18

Does anyone know what the problem is?

Thanks,

Stanley


On Mon, 13 Sep 2004 11:41:34 +0100, Alasdair G Kergon <agk@redhat.com> wrote:
> On Mon, Sep 13, 2004 at 01:58:14AM -0700, Stanley Yue wrote:
> > with the lvm-mod and device-mapper from lvm2. I want to test out
> > whether lvm2 utilities can detect configurations created from lvm1
> > utilities.
> 
> > pvcreate -- ERROR: VGDA in kernel and lvmtab are NOT consistent;
> > please run vgscan
> 
> Never run LVM2 utilities while you have LVs active under LVM1.
> Never run LVM1 tools while you have LVs active under LVM2.
> 
> i.e. Never mix use of the two, and always vgchange -an before switching
> between LVM1 and LVM2.
> Also, if switching back from LVM2 to LVM1 you must first reset the
> LVM1 driver with lvmchange -R followed by vgscan -f.
> 
> Alasdair
> --
> agk@redhat.com
>
