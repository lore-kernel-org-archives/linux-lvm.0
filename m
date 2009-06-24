Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n5OKE551018568
	for <linux-lvm@redhat.com>; Wed, 24 Jun 2009 16:14:05 -0400
Received: from mail.ilcampo.com (mail.ilcampo.com [193.172.126.47])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n5OKDoFY016766
	for <linux-lvm@redhat.com>; Wed, 24 Jun 2009 16:13:51 -0400
Received: from unknown (HELO [172.16.2.132])
	(mark.ruijter_siennax@[193.172.126.230])
	(envelope-sender <mruijter@gmail.com>)
	by mail.ilcampo.com (qmail-ldap-1.03) with SMTP
	for <linux-lvm@redhat.com>; 24 Jun 2009 20:13:50 -0000
Message-ID: <4A4288B6.6060904@gmail.com>
Date: Wed, 24 Jun 2009 22:12:38 +0200
From: Mark Ruijter <mruijter@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Data deduplication for Linux : lessfs
References: <4A42424B.1080208@gmail.com>	<BE6893A3-3CF3-4B26-B23D-3951C1BF5034@karlsbakk.net>
	<4A4286E1.9080004@gmail.com>
In-Reply-To: <4A4286E1.9080004@gmail.com>
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


> Block level deduplication isn't going to know/care about the
> difference between file contents and metadata.  It is either stored in
> blocks that match other blocks or not and the difference should not be
> visible to the filesystem living on top of the block device.
>
Exactly. And this is why lessfs can easily write files with speeds up to
200MB~300MB/sec on modern hardware.

Mark.
