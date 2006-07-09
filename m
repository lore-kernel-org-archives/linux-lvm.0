Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k69FLHUM023358
	for <linux-lvm@redhat.com>; Sun, 9 Jul 2006 11:21:17 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k69FL8tr005170
	for <linux-lvm@redhat.com>; Sun, 9 Jul 2006 11:21:09 -0400
Date: Sun, 9 Jul 2006 17:21:07 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Fwd: why can create the volumn group by vgcreate ?
Message-ID: <20060709152107.GA22460@percy.comedia.it>
References: <212696550607090024x3733187fx8b3a2f26b692e020@mail.gmail.com>
	<212696550607090633w568b6056u779486d65b422339@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <212696550607090633w568b6056u779486d65b422339@mail.gmail.com>
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

On Sun, Jul 09, 2006 at 09:33:14PM +0800, zhihang wang wrote:
>sudo pvdisplay /dev/hda2
>  --- NEW Physical volume ---
>  PV Name               /dev/evms/hda2
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

>
>Why can't find physical volume label from /dev/hda2?

Because you are using evms.
try using /dev/evms/hda2 as a device name instead.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
