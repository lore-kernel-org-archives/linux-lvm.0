Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i31JcCj19771
	for <linux-lvm@redhat.com>; Thu, 1 Apr 2004 14:38:12 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i31JcAjj007818
	for <linux-lvm@redhat.com>; Thu, 1 Apr 2004 14:38:10 -0500
Message-ID: <406C6F9E.4000400@comedia.it>
Date: Thu, 01 Apr 2004 21:38:06 +0200
From: Luca Berra <bluca@comedia.it>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Migrate to kernel 2.6 and lvm2 with root fs on lvm1
References: <OF12DEDDF3.CC314224-ON00256E65.005D8012-00256E65.00647CD5@svunta.os.is>
In-Reply-To: <OF12DEDDF3.CC314224-ON00256E65.005D8012-00256E65.00647CD5@svunta.os.is>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, krh@os.is

Kjartan Reynir Hauksson wrote:

> I've written earlier on the same subject but never got it resolved so I'm
> going to give it another go since my desktop constantly stalls on me with
> my 2.4 kernel.  I'm now running MDK 10.0 with
> kernel24-tmp-2.4.25-2.tmp.1mdk rpm package from Thomas Backlund.  This
Mdk 10 supports LVM1 and LVM2 seamlessly with kernel 2.4 and LVM2 with 
kernel-2.6.
you don't have to edit initscripts or do any other modifications by hand
you only have to be sure you install the lvm2 package.

Then you either:
- install kernel 2.6 and an initrd that supports lvm2 will be created
- run /sbin/mkinitrd again against your 2.4 kernel telling it to use lvm2

you can remove the lvm1 package afterwards.
(you can even switch between lvm1 and lvm2 if you want)

Let me know if you have problems.

-- 
Luca Berra -- bluca@comedia.it
