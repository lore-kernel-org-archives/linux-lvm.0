Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4SFopuF032047
	for <linux-lvm@redhat.com>; Sun, 28 May 2006 11:50:51 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k4SFoi6I019286
	for <linux-lvm@redhat.com>; Sun, 28 May 2006 11:50:44 -0400
Date: Sun, 28 May 2006 17:50:43 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Re: alternate link / multi-pathing
Message-ID: <20060528155043.GG8203@percy.comedia.it>
References: <5485940d0605271711g6d372400s3ab56c79e0488338@mail.gmail.com>
	<5485940d0605271850n30ac0eeg6be49037f12d26cf@mail.gmail.com>
	<20060528091024.GY8203@percy.comedia.it>
	<5485940d0605280735j4aba6709qb601484cd457452e@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5485940d0605280735j4aba6709qb601484cd457452e@mail.gmail.com>
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

On Sun, May 28, 2006 at 03:35:38PM +0100, C'est Pierre wrote:
>Hello Luca,
>
>Thanks for pointing me that out, too bad it's a bit late, since the
>server is now crashed and only tomorrow I will be able to reset it.
>Meanwhile, I've got a few questions for you:
>
>1. How do I disable raid autodetect ?
/usr/src/linux/Documentation/md.txt

>2. Where can I read about device-mapper-multipath ?
http://christophe.varoqui.free.fr/
Redhat has a device-mapper-multipath rpm ensure you are running RHEL4-U3

>3. To deactivate the vg, I suppose I should use vgchange -a n, correct
>me if I am wrong
yes, but i do not get the connection with your first question.

>Thank you for your reply!
you are welcome,
but please do not top post

L.


-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
