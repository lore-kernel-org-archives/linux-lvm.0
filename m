Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l81JBIA5020984
	for <linux-lvm@redhat.com>; Sat, 1 Sep 2007 15:11:18 -0400
Received: from mailout1.imos.net (mailout1.imos.net [212.87.132.33])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l81JB9oO022484
	for <linux-lvm@redhat.com>; Sat, 1 Sep 2007 15:11:09 -0400
Received: from homer.imos.net (homer.imos.net [212.87.132.35])
	by mailout1.imos.net (8.14.1/8.14.1) with ESMTP id l81JB7MZ006805
	for <linux-lvm@redhat.com>; Sat, 1 Sep 2007 21:11:08 +0200
Received: from lstyd.imos.net (lstyd.imos.net [212.87.130.122])
	by homer.imos.net (8.14.1/8.14.1) with ESMTP id l81JB7oX028248
	for <linux-lvm@redhat.com>; Sat, 1 Sep 2007 21:11:07 +0200
Received: from [5.34.46.207] ([5.34.46.207])
	by lstyd.imos.net (8.14.0/8.13.7) with ESMTP id l81LrJRa015536
	for <linux-lvm@redhat.com>; Sat, 1 Sep 2007 23:53:19 +0200
Message-ID: <46D9B8B2.3070104@theendofthetunnel.de>
Date: Sat, 01 Sep 2007 21:08:34 +0200
From: Hannes Dorbath <light@theendofthetunnel.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvmove hung on 2.6.22 (ubuntu gutsy)
References: <d00698fb0709011019x688e5363q931f16444685ea97@mail.gmail.com>
In-Reply-To: <d00698fb0709011019x688e5363q931f16444685ea97@mail.gmail.com>
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

noah wrote:
> Pvmove hung and now all commands that access the filesystem hang too,
> possibly in uninterruptible sleep.
> Is this a bug or did I do something forbidden, somehow? ;)

To my knowledge pvmove is broken on 2.6.22. I'd go back to 2.6.21 until
there is a fix. Maybe there is already a fix, I haven't followed it.


-- 
Best regards,
Hannes Dorbath
