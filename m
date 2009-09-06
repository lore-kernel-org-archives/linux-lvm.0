Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n86ItXKj011942
	for <linux-lvm@redhat.com>; Sun, 6 Sep 2009 14:55:33 -0400
Received: from thb-mta-18.emailfiltering.com (thb-mta-18-tx.emailfiltering.com
	[194.116.199.213])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n86ItKvQ001474
	for <linux-lvm@redhat.com>; Sun, 6 Sep 2009 14:55:21 -0400
Received: from smtp.media-brokers.com ([70.43.81.99])
	by thb-mta-18.emailfiltering.com with emfmta (version
	4.0.0.434.1.rd-3.2.3-libc2.3.2) vanilla id 1320037358
	for linux-lvm@redhat.com; Sun, 06 Sep 2009 19:55:20 +0100
Received: from [192.168.1.110] (sjester.atl.media-brokers.com [192.168.1.110])
	by smtp.media-brokers.com (Postfix) with ESMTPSA id B2C9657E52C
	for <linux-lvm@redhat.com>; Sun,  6 Sep 2009 14:55:19 -0400 (EDT)
Message-ID: <4AA40597.7010700@Media-Brokers.com>
Date: Sun, 06 Sep 2009 14:55:19 -0400
From: Charles Marcus <CMarcus@Media-Brokers.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Inode usage on lvm volumes?
References: <4AA3EB65.40909@Media-Brokers.com> <20090906184614.GB9722@johann>
In-Reply-To: <20090906184614.GB9722@johann>
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

On 9/6/2009, Lars Ellenberg (lars.ellenberg@linbit.com) wrote:
> do a "df -T -i"
> and I bet it will show that you are using ext3 for / and /backups,
> tmpfs for /dev, and reiserfs for those "zero inode" volumes.

Ahh... yep, and especially yep (reiserfs for the zero inode volumes)...

<whew> was a little concerned that this might be indicating a serious
problem...

> Reiserfs simply puts its inodes anywhere, until there is no more space.
> It does not have any notion of "total" inodes, thus there are no
> "free" inodes, either.  It probably knows the number of used inodes.
> But because statfs() does only provide for "total" and "free",
> and leaves "used" to be calculated, there is no way to return that info.

Many thanks for the explanation... :)

-- 

Best regards,

Charles
