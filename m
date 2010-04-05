Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o35HYBxF019224
	for <linux-lvm@redhat.com>; Mon, 5 Apr 2010 13:34:11 -0400
Received: from EXHUB016-1.exch016.msoutlookonline.net
	(exhub016-1.exch016.msoutlookonline.net [207.5.72.163])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o35HXw2d011861
	for <linux-lvm@redhat.com>; Mon, 5 Apr 2010 13:33:58 -0400
Message-ID: <4BBA1F01.1060805@cfl.rr.com>
Date: Mon, 5 Apr 2010 13:33:53 -0400
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
References: <4BB9EDDF.8020003@cfl.rr.com>
	<t2oea5cdf451004050951q3abe7897g2a51eee78f323aa1@mail.gmail.com>
In-Reply-To: <t2oea5cdf451004050951q3abe7897g2a51eee78f323aa1@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Strange errors trying to mirror
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 4/5/2010 12:51 PM, Bryan Whitehead wrote:
> What's up with "-i 5"? Doesn't that map to striping? you can't stripe
> across 5 pv's if you only have 2.

No, -i is for update interval to show progress.
