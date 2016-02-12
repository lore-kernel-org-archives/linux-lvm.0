Received: from [10.34.131.226] (dhcp131-226.brq.redhat.com [10.34.131.226])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1CChEbL007503
	for <linux-lvm@redhat.com>; Fri, 12 Feb 2016 07:43:14 -0500
References: <CAAYit8TQRuUZjjRgMUsaQWNmTGmG824KEZZ8vyNDTG=OiDbObQ@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <56BDD362.8020404@redhat.com>
Date: Fri, 12 Feb 2016 13:43:14 +0100
MIME-Version: 1.0
In-Reply-To: <CAAYit8TQRuUZjjRgMUsaQWNmTGmG824KEZZ8vyNDTG=OiDbObQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM generates wrong low_water_mark value in
	thin-pool's table
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

Dne 1.2.2016 v 10:17 M.H. Tsai napsal(a):
> Hi,
>
> I found that the <low_water_mark> parameter of thin-pool's table might be
> wrong. In kernel, the this parameter is the number of free blocks. However,
> LVM commit 99237f0908d87592815f4bdf3c239e8a108e835c sets this value as the
> number of USED blocks, according
> to activation_thin_pool_autoextend_threshold_CFG. Is that a bug?
>


Hi again


Yep bug on lvm2 size - fix has been upstreamed by this commit:

https://www.redhat.com/archives/lvm-devel/2016-February/msg00005.html


There is also some ongoing work on better lvresize support for more then 1 
single LV. This will also implement better approach to resize of lvmetad which 
is using different mechanism in kernel.

Lvm2 will try to follow the users wish but also be complaint with kernel 
policy for free space in metadata device.

Regards

Zdenek
