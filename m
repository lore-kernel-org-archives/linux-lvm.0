Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4HMYs023689
	for <linux-lvm@redhat.com>; Mon, 17 May 2004 18:34:54 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i4HMYmHA023811
	for <linux-lvm@redhat.com>; Mon, 17 May 2004 18:34:48 -0400
Date: Tue, 18 May 2004 00:34:47 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] /boot on lvm?
Message-ID: <20040517223447.GD30313@percy.comedia.it>
References: <40A72846.5050801@mlug.missouri.edu>
	<20040516084236.GB8872@percy.comedia.it> <40A73771.2030604@osp.nl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40A73771.2030604@osp.nl>
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

On Sun, May 16, 2004 at 11:42:09AM +0200, Martijn Schoemaker wrote:
>Well, I just don't have the guts to put /boot in LVM so I just
>put it on a 'md' device. Do boot managers like Lilo and Grub
>cope with LVM ? I know Lilo does cope with md since it will
there is a patch for lilo at http://www.saout.de/misc/
grub, someone mentioned a gentoo patch, but i have not looked at it yet

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
