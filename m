Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iANCcQr20900
	for <linux-lvm@redhat.com>; Tue, 23 Nov 2004 07:38:26 -0500
Received: from erc-server.ercwc.org (mail.ercwc.org [198.85.167.1])
	by mx3.redhat.com (8.12.11/8.12.11) with SMTP id iANCcAi8014613
	for <linux-lvm@redhat.com>; Tue, 23 Nov 2004 07:38:20 -0500
Message-ID: <41A32F01.2050609@ercwc.org>
Date: Tue, 23 Nov 2004 07:37:21 -0500
From: "Frank J. Buchholz" <frankb@ercwc.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: lvextend error on XFS
References: <1100857645.13422.99.camel@grma-lap>	<1100888487.4379.9.camel@tesuji.nac.uci.edu>	<20041119192447.GB10969@nile.gs.washington.edu>	<1100909625.4379.51.camel@tesuji.nac.uci.edu>	<20041120002207.GK3139@polop.usc.edu>	<1100914586.4379.75.camel@tesuji.nac.uci.edu>	<20041120020807.GP3139@polop.usc.edu>	<1100917096.4379.92.camel@tesuji.nac.uci.edu>	<1101137773.3399.4.camel@dhcp174.msp.redhat.com>	<1101170556.24828.11.camel@soot.ess.uci.edu>	<41A29C06.90900@ercwc.org>
	<41A2F701.50404@dgreaves.com>
In-Reply-To: <41A2F701.50404@dgreaves.com>
Content-Transfer-Encoding: quoted-printable
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

David Greaves wrote:

> Frank J. Buchholz wrote:
>
>>>> I then noticed that the filesystem on LogVol00 was no longer available
>>>> and when I ran xfs_repair it stated the following:
>>>> # xfs_repair /dev/Volume00/LogVol00 Phase 1 - find and verify=20
>>>> superblock...
>>>> superblock read failed, offset 0, size 524288, ag 0, rval 0
>>>>
>>>> fatal error -- Invalid argument
>>>
>>>
>> Hello M=EF=BF=BDns
>> I now realize how I created this problem, I just don't know how to=20
>> fix it.
>>
>> I mistakingly added /dev/sba as the physical volume to a volume group=20
>> that contained /dev/sba1, the one partition on sba.  These are=20
>> essentially one in the same.  So when I executed the lvextend command=20
>> device-mapper had an error.  I'm honestly surprised it did anything,=20
>> especially write over the superblock on the filesystem.
>>
>> Any direction on how I can recover from within LVM?  I never was able=20
>> to execute the xfs_grow so I'm hoping the data in the filesystem=20
>> still exists.
>
>
> try
> xfs_repair -n -o /dev/Volume00/LogVol00
> Then remove the -n
>
> (man xfs_repair)
>
> David
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

Unfortunately I've already tried this.  Here are the results.
# xfs_repair -n -o assume_xfs /dev/Volume00/LogVol00
Phase 1 - find and verify superblock...
superblock read failed, offset 0, size 524288, ag 0, rval 0

fatal error -- Invalid argument

I've discussed on the XFS list and they recommended I try to repair this=20
via LVM.

Given that I never ran xfs_growfs, is it possible to reduce the logical=20
volume back to the original size and then remove the physical volume=20
that caused the problem?  Is there someway to recover back using a=20
previous .vg file in /etc/lvm/archive?

Thanks,
Frank
