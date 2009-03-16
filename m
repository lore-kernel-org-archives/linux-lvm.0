Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2GB63od001091
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 07:06:03 -0400
Received: from mail-bw0-f160.google.com (mail-bw0-f160.google.com
	[209.85.218.160])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n2GB5dUS008690
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 07:05:40 -0400
Received: by bwz4 with SMTP id 4so3490599bwz.3
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 04:05:39 -0700 (PDT)
MIME-Version: 1.0
Sender: pdftex@gmail.com
In-Reply-To: <49BE31CC.7050905@Media-Brokers.com>
References: <49BA9BF9.3070507@esiway.net>
	<Pine.LNX.4.64.0903131552560.2685@bmsred.bmsi.com>
	<20090313203812.GK7445@agk.fab.redhat.com>
	<7B7881568CF40E4388B615CD06F87B98098BDA@clara.maurer-it.com>
	<Pine.LNX.4.64.0903141028190.6115@bmsred.bmsi.com>
	<49BC511E.5040402@esiway.net> <49BE31CC.7050905@Media-Brokers.com>
Date: Mon, 16 Mar 2009 12:05:39 +0100
Message-ID: <68c491a60903160405x763c22ep8012002fef4f0a73@mail.gmail.com>
Subject: Re: [linux-lvm] fsync() and LVM
From: =?ISO-8859-1?Q?Martin_Schr=F6der?= <martin@oneiros.de>
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

2009/3/16, Charles Marcus <CMarcus@media-brokers.com>:
> Seeing as my /var (with both postfix & courier-imap using it for mail
>  storage) has been on lvm for almost 4 years, that would be news to me...

And how often has the computer crashed needing an fsck in those years?
It's most likely no problem if the fs is always unmounted cleanly.

Best
   Martin
