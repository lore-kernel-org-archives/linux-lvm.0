Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0I63rO22392
	for <linux-lvm@redhat.com>; Tue, 18 Jan 2005 01:03:53 -0500
Received: from smtp2.prod2.securaserv.com (203-96-158-55.paradise.net.nz
	[203.96.158.55])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0I63jOM005848
	for <linux-lvm@redhat.com>; Tue, 18 Jan 2005 01:03:46 -0500
Message-ID: <41EC977F.70208@vilain.net>
Date: Tue, 18 Jan 2005 17:58:39 +1300
From: Sam Vilain <sam@vilain.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] couldn't find device with uuid ...
References: <63588.141.156.32.224.1106012124.squirrel@intranet.cs.umd.edu>
In-Reply-To: <63588.141.156.32.224.1106012124.squirrel@intranet.cs.umd.edu>
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
To: george@cs.umd.edu
Cc: LVM general discussion and development <linux-lvm@redhat.com>

george@cs.umd.edu wrote:
> I removed the physical volume that i last added, but i still get:
> For example:
>>pvscan
> Couldn't find device with uuid '.....'
> I might have modified/removed a partition that was part of VolGroup00, but
> I am sure it didn't have any data on it. /dev/hda4 was holding all my
> data. Is there any chance that I can get VolGroup00 to work again?

Try:

   vgreduce --removemissing /dev/VolGroup00

You can also get a long way using the --partial (-P) flag to many of the
utilities.

eg

   vgscan -P
   vgchange -P -ay
   vgdisplay -v -P /dev/VolGroup00

-- 
Sam Vilain, sam /\T vilain |><>T net, PGP key ID: 0x05B52F13
(include my PGP key ID in personal replies to avoid spam filtering)
