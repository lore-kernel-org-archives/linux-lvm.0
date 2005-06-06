Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j561p0O20917
	for <linux-lvm@redhat.com>; Sun, 5 Jun 2005 21:51:00 -0400
Received: from mail.cybermesa.com (mail.cybermesa.com [198.59.109.2])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j561ow6h011182
	for <linux-lvm@redhat.com>; Sun, 5 Jun 2005 21:50:58 -0400
Received: from esp-dsl114.cybermesa.com (esp-dsl114.cybermesa.com
	[65.19.30.114])
	by mail.cybermesa.com (8.12.11/8.12.10) with ESMTP id j561ouXq005749
	for <linux-lvm@redhat.com>; Sun, 5 Jun 2005 19:50:57 -0600
Subject: Re: [linux-lvm] LVM help needed: conflicting names
From: Neil <nnc@newmexico.com>
In-Reply-To: <20050605205556.GO15809@agk.surrey.redhat.com>
References: <Pine.LNX.4.44.0506051558560.14259-100000@algiers.clic.cs.columbia.edu>
	<1118002227.5764.3.camel@erdelyi>
	<20050605205556.GO15809@agk.surrey.redhat.com>
Date: Sun, 05 Jun 2005 19:53:13 -0600
Message-Id: <1118022793.4568.8.camel@erdelyi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, 2005-06-05 at 21:55 +0100, Alasdair G Kergon wrote:
> > > $ man vgrename
>  
> With two VGs with the same name, you may have to use a
> temporary lvm.conf filter to "hide" one of them before 
> renaming the other.

My problem turns out to be more insidious than I thought,
and I can't get even this far.  Both disks have the root
filesystem (not /boot) under LVM as /dev/vg0/root (fedora
core 3 systems), and it is initrd that is bailing when
it finds multiple /dev/vg0/root logical volumes.  The
lvm.conf file isn't even available at that stage.
Anybody know if there is a boot option to initrd that
filters which devices are examined for VG's?

-Neil
