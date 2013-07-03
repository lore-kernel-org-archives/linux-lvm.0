Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r63IsFbC030384
	for <linux-lvm@redhat.com>; Wed, 3 Jul 2013 14:54:15 -0400
Received: from nm24-vm3.access.bullet.mail.gq1.yahoo.com
	(nm24-vm3.access.bullet.mail.gq1.yahoo.com [216.39.63.82])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r63IsEvr031678
	for <linux-lvm@redhat.com>; Wed, 3 Jul 2013 14:54:14 -0400
References: <694672986.201875226.1372861755810.JavaMail.root@zimbra39-e7.priv.proxad.net>
Message-ID: <1372877653.37850.YahooMailNeo@web181502.mail.ne1.yahoo.com>
Date: Wed, 3 Jul 2013 11:54:13 -0700 (PDT)
From: matthew patton <pattonme@yahoo.com>
In-Reply-To: <694672986.201875226.1372861755810.JavaMail.root@zimbra39-e7.priv.proxad.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Resising underlying array
Reply-To: matthew patton <pattonme@yahoo.com>,
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>



> 200 MB for /boot was sensible years ago but now is a joke.

since when? All you need is 2 kernels. Have Linux 3.x kernels gotten out of hand? I only use RHEL/Centos5 and 6 and I've never even come close to running out.

> reduce the PV size without harm. But I'm unable to decide on a workflow and�

> loosing data or downtime are not acceptable options...�

then don't bother.

> So I'm begging your help on a suitable workflow to make this happen.


A. tell the customer "too bad" buy newer/bigger hard drives already and build new layout on new disks and DD/RSYNC data to new layout

Or if you like to play with fire:
* reduce filesystem size
* lvresize down to match
* resize MD member device (eg.�http://webapp5.rrz.uni-hamburg.de/SuSe-Dokumentation/manual/sles-manuals_en/manual/raidresize.html)
* create partition out of newly available slack space (use kpartx and you should avoid a reboot)
* pvcreate on new partition, add to VG and grow LV into new space
* resize filesystem
