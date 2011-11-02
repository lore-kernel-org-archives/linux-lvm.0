Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id pA2EueqZ021959
	for <linux-lvm@redhat.com>; Wed, 2 Nov 2011 10:56:40 -0400
Received: from mailhost.ankh.org (ammut.ankh.org [93.97.41.159])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pA2EudC3018289
	for <linux-lvm@redhat.com>; Wed, 2 Nov 2011 10:56:39 -0400
Message-ID: <4EB15A20.9000109@ankh.org>
Date: Wed, 02 Nov 2011 14:56:32 +0000
From: James Hawtin <oolon@ankh.org>
MIME-Version: 1.0
References: <604704853.1651560.1320172792894.JavaMail.root@sz0126a.westchester.pa.mail.comcast.net>	<4EB1190A.30501@ankh.org>	<581100587.20111102124129@marki-online.net>	<20111102141842.GC17976@IUPUI.Edu>
	<610510063.20111102155031@marki-online.net>
In-Reply-To: <610510063.20111102155031@marki-online.net>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] N00b Question: Logical Volume without a
 Logical	Volume Group ?
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
To: Marek Podmaka <marki@marki-online.net>, LVM general discussion and development <linux-lvm@redhat.com>

Marek Podmaka wrote:
>
> My question was about if it is possible to change the partition table
> (extend partition or add new partition) while using the PV in
> activated VG.
>
>   

Yes it is possible however like with all things some times it does not 
work and the kernel fails to re-read it, this can also happen with 
resizing disks, and sometimes online lun presentation does not work either.

James
