Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAN8cmr06442
	for <linux-lvm@redhat.com>; Tue, 23 Nov 2004 03:38:48 -0500
Received: from mail.ukfsn.org (s2.ukfsn.org [217.158.120.143])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iAN8cgI1002983
	for <linux-lvm@redhat.com>; Tue, 23 Nov 2004 03:38:43 -0500
Received: from localhost (lucy.ukfsn.org [127.0.0.1])
	by mail.ukfsn.org (Postfix) with ESMTP id 19F8BE6D37
	for <linux-lvm@redhat.com>; Tue, 23 Nov 2004 08:35:50 +0000 (GMT)
Received: from mail.ukfsn.org ([127.0.0.1])
	by localhost (lucy.ukfsn.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13264-10 for <linux-lvm@redhat.com>;
	Tue, 23 Nov 2004 08:35:50 +0000 (GMT)
Received: from oak.dgreaves.com (modem-1863.kawau.dialup.pol.co.uk
	[81.78.151.71]) by mail.ukfsn.org (Postfix) with ESMTP id 65A86E6D3F
	for <linux-lvm@redhat.com>; Tue, 23 Nov 2004 08:35:49 +0000 (GMT)
Received: from ash.dgreaves.com ([10.0.0.97])
	by oak.dgreaves.com with esmtp (Exim 4.20) id 1CWWGN-0006D5-Dp
	for linux-lvm@redhat.com; Tue, 23 Nov 2004 08:43:03 +0000
Message-ID: <41A2F701.50404@dgreaves.com>
Date: Tue, 23 Nov 2004 08:38:25 +0000
From: David Greaves <david@dgreaves.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: lvextend error on XFS
References: <1100857645.13422.99.camel@grma-lap>	<1100888487.4379.9.camel@tesuji.nac.uci.edu>	<20041119192447.GB10969@nile.gs.washington.edu>	<1100909625.4379.51.camel@tesuji.nac.uci.edu>	<20041120002207.GK3139@polop.usc.edu>	<1100914586.4379.75.camel@tesuji.nac.uci.edu>	<20041120020807.GP3139@polop.usc.edu>	<1100917096.4379.92.camel@tesuji.nac.uci.edu>	<1101137773.3399.4.camel@dhcp174.msp.redhat.com>	<1101170556.24828.11.camel@soot.ess.uci.edu>
	<41A29C06.90900@ercwc.org>
In-Reply-To: <41A29C06.90900@ercwc.org>
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

Frank J. Buchholz wrote:

>>> I then noticed that the filesystem on LogVol00 was no longer available
>>> and when I ran xfs_repair it stated the following:
>>> # xfs_repair /dev/Volume00/LogVol00 Phase 1 - find and verify=20
>>> superblock...
>>> superblock read failed, offset 0, size 524288, ag 0, rval 0
>>>
>>> fatal error -- Invalid argument
>>
> Hello M=EF=BF=BDns
> I now realize how I created this problem, I just don't know how to fix=20
> it.
>
> I mistakingly added /dev/sba as the physical volume to a volume group=20
> that contained /dev/sba1, the one partition on sba.  These are=20
> essentially one in the same.  So when I executed the lvextend command=20
> device-mapper had an error.  I'm honestly surprised it did anything,=20
> especially write over the superblock on the filesystem.
>
> Any direction on how I can recover from within LVM?  I never was able=20
> to execute the xfs_grow so I'm hoping the data in the filesystem still=20
> exists.

try
 xfs_repair -n -o /dev/Volume00/LogVol00
Then remove the -n

(man xfs_repair)

David
