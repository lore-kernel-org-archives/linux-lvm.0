Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k27J6n103827
	for <linux-lvm@redhat.com>; Tue, 7 Mar 2006 14:06:49 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k27J6gSZ011502
	for <linux-lvm@redhat.com>; Tue, 7 Mar 2006 14:06:42 -0500
Date: Tue, 7 Mar 2006 20:06:36 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Boot Mgr support for '/boot' on LVM2 volumes ?
Message-ID: <20060307190636.GA12504@percy.comedia.it>
References: <6dcf0dbc0603050846k2b8bb546r1a3b6f30f541e473@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6dcf0dbc0603050846k2b8bb546r1a3b6f30f541e473@mail.gmail.com>
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

On Sun, Mar 05, 2006 at 05:46:45PM +0100, John Smith wrote:
>still considered 'unsupported', or at least considered to be "not a
Christophe Saout made some patches to lilo to be able to boot from a
lvm2 /boot (http://www.saout.de/misc/), this patch has been adopted into
major distributions.
>very good idea". If I recall correctly, this had something to do with
>the fact that "/boot" had to be located on a linear, contiguous volume
>for bootloaders like lilo and grub to be able to read it.  And that
this is correct, the lv for /boot is to be linear and contiguus, it is
user responsability to ensure this.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
