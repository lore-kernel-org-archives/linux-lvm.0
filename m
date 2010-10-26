Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o9QIfuTX027610
	for <linux-lvm@redhat.com>; Tue, 26 Oct 2010 14:41:56 -0400
Received: from e8.ny.us.ibm.com (e8.ny.us.ibm.com [32.97.182.138])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o9QIffmZ006555
	for <linux-lvm@redhat.com>; Tue, 26 Oct 2010 14:41:41 -0400
Received: from d01relay01.pok.ibm.com (d01relay01.pok.ibm.com [9.56.227.233])
	by e8.ny.us.ibm.com (8.14.4/8.13.1) with ESMTP id o9QIQFOd010557
	for <linux-lvm@redhat.com>; Tue, 26 Oct 2010 14:26:15 -0400
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by d01relay01.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	o9QIffZH408416
	for <linux-lvm@redhat.com>; Tue, 26 Oct 2010 14:41:41 -0400
Received: from d01av02.pok.ibm.com (loopback [127.0.0.1])
	by d01av02.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	o9QIfeaY026763
	for <linux-lvm@redhat.com>; Tue, 26 Oct 2010 16:41:40 -0200
Received: from malahal (malahal-009047025235.beaverton.ibm.com [9.47.25.235])
	by d01av02.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	o9QIfe8S026749
	for <linux-lvm@redhat.com>; Tue, 26 Oct 2010 16:41:40 -0200
Date: Tue, 26 Oct 2010 11:41:39 -0700
From: Malahal Naineni <malahal@us.ibm.com>
Message-ID: <20101026184139.GA32464@us.ibm.com>
References: <AANLkTikX3+Dr5b-QQLZUquTvZ_YYuv8rB_nh=8ocmHvW@mail.gmail.com>
	<20101025181108.GA1019@us.ibm.com>
	<AANLkTinWs=_Z7bzKdq4SNKKBd_BhWGQ_2D7ni00PKyxB@mail.gmail.com>
	<20101025212848.GA6297@us.ibm.com>
	<AANLkTikp-8mrhoPSaZYT=m7CwCMfPrvBUK9tiQBeZFmB@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AANLkTikp-8mrhoPSaZYT=m7CwCMfPrvBUK9tiQBeZFmB@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Determine boot disk device name...
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Alexander Skwar [alexanders.mailinglists+nospam@gmail.com] wrote:
>    Hi!
>    2010/10/25 Malahal Naineni <[1]malahal@us.ibm.com>
> 
>      Alexander Skwar [[2]alexanders.mailinglists+nospam@gmail.com] wrote:
>      >    I also wanted to suggest this, but…
>      >
>      >    benutzer@horst:~$ cat /proc/cmdline
>      >    root=/dev/xvda1 ro
> 
>      I got confused with boot and root! Thanks for correction. Usually boot
>      disk is mounted at /boot. Your boot disk could be same as root disk (in
>      this case there would not be anything mounted at /boot but just a
>      directory).
> 
>    Well, but even the location of the /boot directory/partition doesn't
>    necessarily tell, from where someone booted - suppose, you've got
>    a boot disk /dev/sda. On /dev/sda, there's grub. Grub's setup so,
>    that it boots a system/kernel, which is on /dev/sdb. The system
>    is "self contained" on /dev/sdb.
> 
>    In such a case, the system would've been booted from /dev/sda,
>    but there's no way to tell that, once the "/dev/sdb system" has
>    been started - or is there?

Once loader's job is done, it is not needed and I don't think there is a
way to find out your boot disk in all __situations__ as I said before.
In fact, you can use a USB disk as your boot disk and remove it after
boot.

Thanks, Malahal.
