Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4QKrH012169
	for <linux-lvm@redhat.com>; Wed, 26 May 2004 16:53:17 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i4QKrGi5006216
	for <linux-lvm@redhat.com>; Wed, 26 May 2004 16:53:17 -0400
Date: Wed, 26 May 2004 22:53:15 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] /boot on lvm?
Message-ID: <20040526205315.GA24516@percy.comedia.it>
References: <40A72846.5050801@mlug.missouri.edu>
	<20040516084236.GB8872@percy.comedia.it> <40A73771.2030604@osp.nl>
	<20040526153118.GA31460@mail1.smilehouse.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040526153118.GA31460@mail1.smilehouse.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, May 26, 2004 at 06:31:18PM +0300, Harri Haataja wrote:
>Doesn't HP-UX have a setup where you have /stand (IIRC) which will
>always reside in the same place and should always boot etc and
>everything else on LVM? I think there was a scheme like that. With
not exactly (i am not going to dive into details since i don't think it
is relevant to the list)
but hp-ux is designed for hp-9000 hardware, while linux is designed to
support a much broader range of hardware (including shitty hardware like
the PC)

>Linux, /boot and initrd's could be arranged like that. That is what root
How is that different from what we already have now using lilo and an
lvm aware initrd? except that we don't have any constraint on placing
the kernel and initrd (except for hardware limitation of said shitty
platform)

L.
-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
