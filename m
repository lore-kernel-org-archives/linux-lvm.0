Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4I5TXvW030713
	for <linux-lvm@redhat.com>; Tue, 18 May 2010 01:29:33 -0400
Received: from mail-ww0-f46.google.com (mail-ww0-f46.google.com [74.125.82.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4I5TK3i007174
	for <linux-lvm@redhat.com>; Tue, 18 May 2010 01:29:21 -0400
Received: by wwi17 with SMTP id 17so216635wwi.33
	for <linux-lvm@redhat.com>; Mon, 17 May 2010 22:29:20 -0700 (PDT)
Message-ID: <4BF225AE.3080303@gmail.com>
Date: Tue, 18 May 2010 07:29:18 +0200
From: kanonmatswe <kanonmatswe@gmail.com>
MIME-Version: 1.0
References: <AANLkTina1csDn1EAcwXOYM41r7G3TOZBSAo1lVk0tU5N@mail.gmail.com>	<20100517211459.GA7269@us.ibm.com>
	<Pine.LNX.4.64.1005171721260.2347@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.64.1005171721260.2347@bmsred.bmsi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] shrink VG and PV
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
To: linux-lvm@redhat.com

On 05/17/2010 11:30 PM, Stuart D. Gathman wrote:

>Conclusion: always use only one metadata area per PV (but on multiple PVs
>when available).

I don't know how that second metadata area got there :)  I don't think I'm using it or will have any use for it.
So there is no way of erasing it? If I do "backup VG, redo pvcreate with uuid&  restorefile, restore VG"
as Alasdair said as quoted by malahal@us.ibm.com, I will erase all data, right? The solution seems to be
roughly equivalent to backing up all data and then repartition before copying back?
