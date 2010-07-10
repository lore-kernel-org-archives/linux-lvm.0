Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o6AMjIFC003760
	for <linux-lvm@redhat.com>; Sat, 10 Jul 2010 18:45:18 -0400
Received: from mail-bw0-f46.google.com (mail-bw0-f46.google.com
	[209.85.214.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o6AMj5Y0011250
	for <linux-lvm@redhat.com>; Sat, 10 Jul 2010 18:45:06 -0400
Received: by bwz1 with SMTP id 1so1925413bwz.33
	for <linux-lvm@redhat.com>; Sat, 10 Jul 2010 15:45:04 -0700 (PDT)
MIME-Version: 1.0
Sender: grzegorz.wierzowiecki@gmail.com
In-Reply-To: <20100710215156.GC26290@agk-dp.fab.redhat.com>
References: <AANLkTilHHV9DOCDeeqREaGdYqVVaLcOt5V7i9CQGlX8M@mail.gmail.com>
	<20100710215156.GC26290@agk-dp.fab.redhat.com>
Date: Sun, 11 Jul 2010 00:45:04 +0200
Message-ID: <AANLkTikZoFXRIIqTUnIVcNAUHlgyvbnbkh0I6RK7MpV_@mail.gmail.com>
From: Grzegorz Wierzowiecki <grzegorz.wierzowiecki+lvm2@gmail.com>
Subject: Re: [linux-lvm] LVM2 mirror segment monitoring function failed
Reply-To: grzegorz.wierzowiecki+lvm2@gmail.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: Grzegorz Wierzowiecki <grzegorz.wierzowiecki+lvm2@gmail.com>, linux-lvm@redhat.com

Hi,

thanks Alasdair for fast reply.

May I ask to make sure I got you right ?


> Don't start dmeventd till later.

Do I got it right to "not-hurry" with running dmeventd (and to run it
later with rc init scripts) ?


> Look at a recent version of Fedora to see how to do it.

thx for reference.


> Add the --sysinit option for initial activation.
> After pivotroot and when the filesystems are all up, then use --monitor y.

Big thanks for info, I'll try to cooperate with arch distro guys and
try to patch rc.sysinit .


> dmeventd is there to deal with disk failures.
>
> Until you get a disk failure, you're not missing it.

Do I got it right, that even without dmeventd, mirroring is working
fine, but lvm2 might be not aware of disk failure ?

Am I right that because data will be mirrored, so even in case of disk
failure they will be safe (maybe except of just moment of failure,
what may impact system, but hanging it or sth like that?).
