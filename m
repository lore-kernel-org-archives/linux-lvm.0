Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q72JJk1o019221
	for <linux-lvm@redhat.com>; Thu, 2 Aug 2012 15:19:46 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q72JJh0F002662
	for <linux-lvm@redhat.com>; Thu, 2 Aug 2012 15:19:43 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id q72JJVNZ027537
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 2 Aug 2012 15:19:41 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by bmsred.bmsi.com (8.14.4/8.14.4) with ESMTP id q72JIhwA017640
	for <linux-lvm@redhat.com>; Thu, 2 Aug 2012 15:18:43 -0400
Date: Thu, 2 Aug 2012 15:18:43 -0400 (EDT)
From: Stuart D Gathman <stuart@bmsi.com>
In-Reply-To: <CAAJy1LfB4-6pEsfUO+4qe5Vh9OfuMKWbb+wg2rMo2+wMZqjLdA@mail.gmail.com>
Message-ID: <alpine.LRH.2.02.1208021516330.17505@bmsred.bmsi.com>
References: <CAAJy1LfB4-6pEsfUO+4qe5Vh9OfuMKWbb+wg2rMo2+wMZqjLdA@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm/filesystem overhaed
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Aug 1, Tim Busch transmitted in part:

> What would be a good practice to identify the filesystem overhead for a LVM.
> This comes in handy when lvreducing filesystems. For example if i want to
> create a 100G fully usable FS what should be the size of my LV?

That is a question for the filesystem, and has nothing to do with LVM.

One method to find out: create a 100G LV, create the filesystem (you
don't mention what filesystem you want) on it, mount it, and see how
much space is free.
