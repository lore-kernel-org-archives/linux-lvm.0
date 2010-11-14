Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oAEN68uq026278
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2010 18:06:08 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAEN5sNK000919
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2010 18:05:55 -0500
Received: from melissa.gathman.org (fairfax.gathman.org [72.209.196.211])
	(authenticated bits=0)
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id oAEN5r1W015883
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2010 18:05:54 -0500
Message-ID: <4CE06B51.6080003@bmsi.com>
Date: Sun, 14 Nov 2010 18:05:53 -0500
From: Stuart D Gathman <stuart@bmsi.com>
MIME-Version: 1.0
References: <AANLkTimiX+2WZw5V8P0HjPvEXP6TAerJmFHq63Ktg2fD@mail.gmail.com>	<20101113230310.GH14546@barkeeper1-xen.linbit>
	<AANLkTimpKv5YY9qJwmFTTKNMzOu+3BQ3nDQB-Y-m8oOT@mail.gmail.com>
In-Reply-To: <AANLkTimpKv5YY9qJwmFTTKNMzOu+3BQ3nDQB-Y-m8oOT@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Need help with a particular use-case for pvmove.
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
To: linux-lvm@redhat.com

On 11/13/2010 10:57 PM, Stirling Westrup wrote:
> On Sat, Nov 13, 2010 at 6:03 PM, Lars Ellenberg
> <lars.ellenberg@linbit.com> wrote:
>> You will then have to reduce the bad-old drive from the VG, and
>> shutdown/unplug old/replug new, which of course involves downtime again.
>>
>> You should consider using some sort of RAID in the future.
> My last server lost 80% of its data due to a bug in the raid software,
> so I'm rather leery of going with a raid solution. I was hoping LVM
> would be better.
Use the linux md driver with RAID-1, simple and safe, and you can clone
a partition by just removing it from the RAID.  LVM does RAID-1 only if
you turn on mirroring for a LV.  LVM can't possible be "better" without
the redundancy - at which point you have RAID.
