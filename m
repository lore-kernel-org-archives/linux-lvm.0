Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2GBIXcn008553
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 07:18:33 -0400
Received: from thb-mta-18.emailfiltering.com (thb-mta-18-tx.emailfiltering.com
	[194.116.199.213])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n2GBIH5b013243
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 07:18:18 -0400
Received: from smtp.media-brokers.com ([70.43.81.99])
	by thb-mta-18.emailfiltering.com with emfmta (version
	3.7.1.44.1.r-3.2.3-libc2.3.2) vanilla id 1110860250
	for linux-lvm@redhat.com; Mon, 16 Mar 2009 11:18:17 +0000
Received: from [192.168.1.110] (sjester.atl.media-brokers.com [192.168.1.110])
	by smtp.media-brokers.com (Postfix) with ESMTPSA id 7BDBE2D7F6D
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 07:18:16 -0400 (EDT)
Message-ID: <49BE3577.6080503@Media-Brokers.com>
Date: Mon, 16 Mar 2009 07:18:15 -0400
From: Charles Marcus <CMarcus@Media-Brokers.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] fsync() and LVM
References: <49BA9BF9.3070507@esiway.net>	<Pine.LNX.4.64.0903131552560.2685@bmsred.bmsi.com>	<20090313203812.GK7445@agk.fab.redhat.com>	<7B7881568CF40E4388B615CD06F87B98098BDA@clara.maurer-it.com>	<Pine.LNX.4.64.0903141028190.6115@bmsred.bmsi.com>	<49BC511E.5040402@esiway.net>
	<49BE31CC.7050905@Media-Brokers.com>
	<68c491a60903160405x763c22ep8012002fef4f0a73@mail.gmail.com>
In-Reply-To: <68c491a60903160405x763c22ep8012002fef4f0a73@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 3/16/2009, Martin Schr=EF=BF=BDder (martin@oneiros.de) wrote:
> And how often has the computer crashed needing an fsck in those years?
> It's most likely no problem if the fs is always unmounted cleanly.

There have been probably 4 unclean shutdowns (due to extended power
outages) in these 4 years, 2 of which required an extended fsck...

Running reiserfs too...

Zero problems to date (knock on wood)...

--=20

Best regards,

Charles
