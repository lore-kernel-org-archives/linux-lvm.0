Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oAFNLhUi028084
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 18:21:43 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAFNLUZY016141
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 18:21:30 -0500
Date: Mon, 15 Nov 2010 18:21:28 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <AANLkTikuW27+C17HwxRa6WGm1Dtq3QiTWGUi6M7zLLj3@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1011151819330.4470@bmsred.bmsi.com>
References: <AANLkTi=ZPUWoFk9Xj2b_-9qggGreV9-Z7xv04bGYYjPF@mail.gmail.com>
	<20101115214735.GF20084@barkeeper1-xen.linbit>
	<AANLkTikuW27+C17HwxRa6WGm1Dtq3QiTWGUi6M7zLLj3@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Move pvmove questions Was: Need help with a
 particular use-case for pvmove.
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: swestrup@gmail.com, LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 15 Nov 2010, Stirling Westrup wrote:

> Okay. What if I don't care where the PE's end up? Can I just say:
> 
> pvmove /dev/sda:1000-1500 /dev/sdb
> 
> and assume it will do something reasonable? I currently don't have any
> fragmentation anywhere, so I would hope this would just work.

Use the test option to see what it would do without actually doing it.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
