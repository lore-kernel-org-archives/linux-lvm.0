Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBM1vlr14190
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2004 20:57:47 -0500
Received: from smtp2.prod2.securaserv.com (203-96-158-55.paradise.net.nz
	[203.96.158.55])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iBM1veZM010020
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2004 20:57:41 -0500
Message-ID: <41C8D48C.6090908@vilain.net>
Date: Wed, 22 Dec 2004 14:57:32 +1300
From: Sam Vilain <sam@vilain.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] PVs that are reused / reformatted as filesystems
References: <41C650A3.2090302@vilain.net>
	<20041221181601.GJ26670@agk.surrey.redhat.com>
In-Reply-To: <20041221181601.GJ26670@agk.surrey.redhat.com>
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

Alasdair G Kergon wrote:
>>Could someone please give me a fish (tell me how to un-jam my LVM) and
>>maybe even teach the LVM drivers/utilities to fish as well?
> Use pvscan / pvs -v to work out which devices you want to see and which you don't
> then change the filter in /etc/lvm/lvm.conf so you only see the right ones.

Thanks Alasdair.

It looks like my problem is actually deeper than I originally thought;

# vgdisplay -v foobar
[snip]
   --- Physical volumes ---
   PV Name               /dev/hda2
   PV UUID               weM5FG-L0Li-Ir7y-0B2z-MJoq-tvAg-C2Q19E
   PV Status             allocatable
   Total PE / Free PE    16672 / 0

   PV Name               /dev/hda1
   PV UUID               85M9M7-QsLh-dVKf-xfU3-ua4h-Ks4h-QGrMhu
   PV Status             allocatable
   Total PE / Free PE    3578 / 26

   PV Name               unknown device
   PV UUID               PtbIxo-EmRo-ML7J-yhqx-gglD-ZayH-X6tuWE
   PV Status             allocatable
   Total PE / Free PE    4535 / 4535

Hmm, now how can I use vgreduce on an read-only VG to remove an unknown
PV?

# vgreduce --removemissing foobar

Gone.

-- 
Sam Vilain, sam /\T vilain |><>T net, PGP key ID: 0x05B52F13
(include my PGP key ID in personal replies to avoid spam filtering)
