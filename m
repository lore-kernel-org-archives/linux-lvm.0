Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6LGZ2a05852
	for <linux-lvm@redhat.com>; Wed, 21 Jul 2004 12:35:02 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i6LGYtXn025408
	for <linux-lvm@redhat.com>; Wed, 21 Jul 2004 12:34:56 -0400
Date: Wed, 21 Jul 2004 18:34:53 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] How to rename a VG that contains the root?
Message-ID: <20040721163453.GA10046@percy.comedia.it>
References: <Pine.LNX.4.44.0407211150390.12142-100000@gpu.utcc>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0407211150390.12142-100000@gpu.utcc>
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
To: linux-lvm@redhat.com

On Wed, Jul 21, 2004 at 12:08:59PM -0400, d3yuen@artsmail.uwaterloo.ca wrote:
>What should i keep in mind if i needed to change the name of a volume
>group that contains root?

you will probably need to recreate an initrd
which distro are you using?
most have a mkinitrd command.....

L.
-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
