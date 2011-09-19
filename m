Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p8JHf2uw030588
	for <linux-lvm@redhat.com>; Mon, 19 Sep 2011 13:41:02 -0400
Received: from mail-ew0-f47.google.com (mail-ew0-f47.google.com
	[209.85.215.47])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8JHev3L026703
	for <linux-lvm@redhat.com>; Mon, 19 Sep 2011 13:40:57 -0400
Received: by ewy7 with SMTP id 7so15768524ewy.6
	for <linux-lvm@redhat.com>; Mon, 19 Sep 2011 10:40:56 -0700 (PDT)
Sender: Gijs Boer <blizzeye@gmail.com>
Message-ID: <4E777EA4.7000801@bsnw.nl>
Date: Mon, 19 Sep 2011 19:40:52 +0200
From: Gijs <info@bsnw.nl>
MIME-Version: 1.0
References: <4E75F91D.4000601@bsnw.nl>
	<alpine.LRH.2.00.1109182015050.13864@bmsred.bmsi.com>
In-Reply-To: <alpine.LRH.2.00.1109182015050.13864@bmsred.bmsi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM pretends it has more space than it actually has
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Thanks for the reply, however I don't think the size of the blockdev 
command is incorrect. At least not on my machine. I had already checked 
that earlier and it looked fine.

On 19-9-2011 2:21, Stuart D. Gathman wrote:
> This may not be related, but I had a problem with blockdev --getsize 
> in Fedora
> 14 returning the wrong size for an IDE drive on a USB-IDE/SATA 
> adapter.  It
> returned the correct size for SATA drives on the USB adapter, and for IDE
> drives connected to the internal IDE port.  So I chalked this up to 
> wierdness
> on the (nearly obsolete) USB/IDE interface.  But your problem suddenly 
> made me
> not so sure.
>
> On Sun, 18 Sep 2011, Gijs wrote:
>
>> Now I wonder why LVM wants to pretend it has more space than it 
>> actually has. Because when I subtract those sectors from each other, 
>> and I calculate how much bytes are in those "pretended sectors", it 
>> turns out that that's the exact amount that is missing (1MB).
