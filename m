Received: from pobox.stuttgart.redhat.com (pobox.stuttgart.redhat.com
	[172.16.2.10])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3ULJqKx012036
	for <linux-lvm@redhat.com>; Wed, 30 Apr 2008 17:19:53 -0400
Received: from [10.32.4.47] (vpn-4-47.str.redhat.com [10.32.4.47])
	by pobox.stuttgart.redhat.com (8.13.1/8.13.1) with ESMTP id
	m3ULJpex004171
	for <linux-lvm@redhat.com>; Wed, 30 Apr 2008 17:19:51 -0400
Message-ID: <4818E262.4070105@redhat.com>
Date: Wed, 30 Apr 2008 23:19:30 +0200
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] F7 will not boot after running backup w/snapshot
References: <4817C2FD.1010909@verizon.net>	<4817D97D.8060805@verizon.net>	<4817ECAF.4020806@verizon.net>	<48187B91.4060901@verizon.net>	<1c748a490804300809s304f7fdfx55aeb0fd9c6cc7ab@mail.gmail.com>	<4818AB1C.9030809@verizon.net>
	<4818BA5D.6070501@Media-Brokers.com> <4818D59A.8020906@verizon.net>
In-Reply-To: <4818D59A.8020906@verizon.net>
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

Gerry Reno wrote:
> Charles,
>   Here's a snapshot ramdisk reference:
>     
> http://linuxsoftware.co.nz/blog/2008/03/11/lvm-snapshot-with-no-free-diskspace
>    
>   The ramdisk has been working without problem.  I tested it quite a bit 
> before putting it into production.  But I don't know LVM internals so I 
> cannot say whether it could have had anything to do with the hang that 
> occurred.

Please, do *not* use this configuration, it is very dangerous!

Note that you extend Volume Group on you physical disk with another PV
in volatile memory.

Now imagine that your system crash (oh, wait, it happened already!)
After reboot you have no ramdisk, and the Volume Group is incomplete
(because you didn't removed PV on ramdisk).

If there is only snapshot, you can recover it, if some operation placed
here part of another volume, you will lose data.

If there is root volume, system will not boot. Period.

Milan
--
mbroz@redhat.com
