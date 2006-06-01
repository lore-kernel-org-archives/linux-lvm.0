Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k51BJFWr014214
	for <linux-lvm@redhat.com>; Thu, 1 Jun 2006 07:19:15 -0400
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k51BJDJf006416
	for <linux-lvm@redhat.com>; Thu, 1 Jun 2006 07:19:14 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1FllCh-0004eB-4L
	for linux-lvm@redhat.com; Thu, 01 Jun 2006 13:19:03 +0200
Received: from 221.125.22.76 ([221.125.22.76])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 01 Jun 2006 13:19:03 +0200
Received: from thomas by 221.125.22.76 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 01 Jun 2006 13:19:03 +0200
From: "Thomas" <thomas@meiwing.com>
Date: Thu, 1 Jun 2006 19:18:31 +0800
Message-ID: <e5mieb$bvr$1@sea.gmane.org>
References: <06F5C23A-EF8A-4DB1-898C-BCAF9AD9A9E3@mit.edu>
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Re: Restore LVM without UIDs
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-lvm@redhat.com

Last month I had same problem.
I used hexdump to get back the metadata file and use cfgrestore to cover.
Then mount back the lost LogVol00.

Just my two cents.
"Sabin Dang" <sdang@MIT.EDU> �b�l��
news:06F5C23A-EF8A-4DB1-898C-BCAF9AD9A9E3@mit.edu �����g...
> Hi Everyone,
>
> I assisted in restoring a server today that was connected to an
> external raid that used LVM. Unfortunately there was no backup of the
> LVM config files prior to reinstalling the operating system.
>
> Is there any way to retrieve the data stored on the LVM without the
> old config files?
>
> Thanks,
> Sabin
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
