Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q6BCS6rp000946
	for <linux-lvm@redhat.com>; Wed, 11 Jul 2012 08:28:06 -0400
Received: from mail-yx0-f174.google.com (mail-yx0-f174.google.com
	[209.85.213.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q6BCS5mb012449
	for <linux-lvm@redhat.com>; Wed, 11 Jul 2012 08:28:05 -0400
Received: by yenl2 with SMTP id l2so1215407yen.33
	for <linux-lvm@redhat.com>; Wed, 11 Jul 2012 05:28:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAGfHYAQg54kB4rRdCX1ubdi=K+LTBefw=AHELZeYb74XfNoXMg@mail.gmail.com>
References: <CAGfHYAQg54kB4rRdCX1ubdi=K+LTBefw=AHELZeYb74XfNoXMg@mail.gmail.com>
Date: Thu, 12 Jul 2012 00:28:05 +1200
Message-ID: <CAEHxbC1bVGRvpkaB6V5XTsaEXTMbeufMx5exYqG6BBo6J_6J9Q@mail.gmail.com>
From: Greg Zapp <greg.zapp@gmail.com>
Subject: Re: [linux-lvm] (simple question) Is it possible to specify a size
 to extend an LVM partition to ? rather than the amount to increase by?
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

lvresize -L10g

On Wed, Jul 11, 2012 at 10:44 PM, Morgan Cox <morgancoxuk@gmail.com> wrote:
> is it possible to specify a size to extend an LVM partition to ? rather than
> the amount to increase by?
> i.e say I have a 2GB partition and what to extend it to 10GB, I  know I
> could use  lvextend --size +8G /dev/vgpool/whatever
> but is there a command to increase to a specific amount ?
>
> Cheers
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
