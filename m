Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m048Kp1t019599
	for <linux-lvm@redhat.com>; Fri, 4 Jan 2008 03:20:51 -0500
Received: from sandbox.cz (sandbox.cz [87.236.197.188])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m048KKuu014681
	for <linux-lvm@redhat.com>; Fri, 4 Jan 2008 03:20:21 -0500
Received: from localhost (localhost [127.0.0.1])
	by sandbox.cz (Postfix) with ESMTP id A6CCD29F39
	for <linux-lvm@redhat.com>; Fri,  4 Jan 2008 09:20:14 +0100 (CET)
Received: from sandbox.cz ([127.0.0.1])
	by localhost (sandbox.cz [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id UvpN-5w95Xf0 for <linux-lvm@redhat.com>;
	Fri,  4 Jan 2008 09:20:11 +0100 (CET)
Received: from boudicka.no-ip.org (linux.mfservis.cz [212.71.131.91])
	by sandbox.cz (Postfix) with ESMTP id BEA3F29F21
	for <linux-lvm@redhat.com>; Fri,  4 Jan 2008 09:20:11 +0100 (CET)
Message-ID: <477DEC64.6050108@sandbox.cz>
Date: Fri, 04 Jan 2008 09:20:52 +0100
From: PeS <pes@sandbox.cz>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Crashed disk with LVM
References: <a9b19e850712270618p16d62ae9w7200be49ebe74386@mail.gmail.com>
In-Reply-To: <a9b19e850712270618p16d62ae9w7200be49ebe74386@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hiamal wrote:
> Hi,
> 
> I have tow disks(hda and hdb) where tow partitions(hda2 and hdb1) a
> part of one LVM group VG01.
> Now disk hdb has crashed and I'am trying to save the data on hdb1 to
> another disk.
> I tried with knoppix dumping(dd) hda2(works) and hdb1(don't work) and
> I also tried activating the lvm group and dd the lvm volume but when
> dd comes to hdb1 the disk just hacks and sounds noisy :-P

Instead of dd try dd_rescue. It's able to skip errors on failed disc and 
read the rest.

> What should I do?

During dumping, prepare you regular backup plan ;-)

> /h
