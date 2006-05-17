Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4HIkIU7021685
	for <linux-lvm@redhat.com>; Wed, 17 May 2006 14:46:18 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k4HIkA0K025300
	for <linux-lvm@redhat.com>; Wed, 17 May 2006 14:46:10 -0400
Date: Wed, 17 May 2006 20:46:10 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] what is vgwrapper and where did it go?
Message-ID: <20060517184609.GE16774@percy.comedia.it>
References: <446B3233.6070104@cmu.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <446B3233.6070104@cmu.edu>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Wed, May 17, 2006 at 10:24:51AM -0400, George Nychis wrote:
>Hi,
>
>In my mkinitrd for FC3, it tries copying /sbin/vgwrapper to the initrd
>and linking vgscan and vgchange to it.  But... it doesn't exist it any
>version of LVM i've ever seen.
>
>So i'm not sure why it does this, but I can't boot LVM's so i think i
>need to fix this up.
>
the redhat (fedora) lvm-1.xxxx package provides /sbin/vgwrapper

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
