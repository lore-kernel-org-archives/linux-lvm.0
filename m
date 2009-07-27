Date: Mon, 27 Jul 2009 11:46:16 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] lvm2 confused about double UUID
Message-ID: <20090727104616.GC29466@agk-dp.fab.redhat.com>
References: <alpine.DEB.2.01.0907261703270.6426@bogon.housecafe.de>
	<4A6CF9C0.6020902@cox.net>
	<alpine.DEB.2.01.0907261808300.6426@bogon.housecafe.de>
	<4A6D1739.2040708@cox.net>
	<alpine.DEB.2.01.0907262020090.6426@bogon.housecafe.de>
	<4A6D46E5.2000100@cox.net>
	<alpine.DEB.2.01.0907270021420.6426@bogon.housecafe.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.01.0907270021420.6426@bogon.housecafe.de>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Kujau <lists@nerdbynature.de>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

See vgimportclone.sh in 2.02.46 (should work fine with plenty of
earlier versions too).


NAME
       vgimportclone  -  import  and  rename  duplicated volume group (e.g. a
       hardware snapshot)

SYNOPSIS
       vgimportclone [-n|--basevgname VolumeGroupName]  [-i|--import]  Physi-
       calVolume [PhysicalVolume...]

DESCRIPTION
       vgimportclone  is  used to import a duplicated VG (e.g. hardware snap-
       shot).  Duplicate VG(s) and PV(s) are not able to be used  until  they
       are  made  to  coexist with the origin VG(s) and PV(s).  vgimportclone
       renames the VG associated with the specified  PV(s)  and  changes  the
       associated VG and PV UUIDs.

...

Alasdair
