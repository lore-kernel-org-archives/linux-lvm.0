Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p6E46KXR025152
	for <linux-lvm@redhat.com>; Thu, 14 Jul 2011 00:06:20 -0400
Received: from Ishtar.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p6E46Isd029395
	for <linux-lvm@redhat.com>; Thu, 14 Jul 2011 00:06:19 -0400
Message-ID: <4E1E6B26.9070508@tlinx.org>
Date: Wed, 13 Jul 2011 21:05:58 -0700
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
References: <4E1A526F.9090700@tlinx.org>	<20110711025811.GF7857@agk-dp.fab.redhat.com>	<4E1D77A7.4030801@tlinx.org>	<alpine.LRH.2.00.1107131137130.28748@bmsred.bmsi.com>	<20110713161141.GX7857@agk-dp.fab.redhat.com>	<0A03EDA0F33C5C428BFFF019C40D609E9D3AE24268@SCMBXC01.bcbad.state.sc.us>
	<20110713184731.GY7857@agk-dp.fab.redhat.com>
In-Reply-To: <20110713184731.GY7857@agk-dp.fab.redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Inconsistent naming...?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Males, Jess" <jmales@cio.sc.gov>, LVM general discussion and development <linux-lvm@redhat.com>





Alasdair G Kergon wrote:
> On Wed, Jul 13, 2011 at 01:34:15PM -0400, Males, Jess wrote:
>   
>> That works, but it's not exactly convenient.
>> [root@system ~]# dmsetup splitname /dev/mapper/tempvg-lvspare1
>>     
>
> It's not expecting the /dev/mapper prefix there.
>
> It's used here:
>   11-dm-lvm.rules:IMPORT{program}="$env{DM_SBIN_PATH}/dmsetup splitname --nameprefixes --noheadings --rows $env{DM_NAME}"
>
> Obviously we can patch it to understand the '/dev/mapper' prefix and other
> things.
>
> Alasdair
>   
The problem is NOT what lsm puts out or what I see in /dev,
it's only in the output of 'mount' and 'fstab'... and being able to map
what devs are mounted on what mount points.
