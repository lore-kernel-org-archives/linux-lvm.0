Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4VL6M007439
	for <linux-lvm@redhat.com>; Mon, 31 May 2004 17:06:22 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i4VL6FXn017041
	for <linux-lvm@redhat.com>; Mon, 31 May 2004 17:06:15 -0400
Date: Mon, 31 May 2004 23:06:14 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] /boot on lvm?
Message-ID: <20040531210613.GI14185@percy.comedia.it>
References: <40A72846.5050801@mlug.missouri.edu>
	<20040516084236.GB8872@percy.comedia.it> <40A73771.2030604@osp.nl>
	<20040526153118.GA31460@mail1.smilehouse.com>
	<20040526205315.GA24516@percy.comedia.it>
	<20040531110327.GB14599@mail1.smilehouse.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040531110327.GB14599@mail1.smilehouse.com>
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

On Mon, May 31, 2004 at 02:03:27PM +0300, Harri Haataja wrote:
>If there was something I set out to say in that message, maybe it was:
>Would there be a way to arrange kernel and initrd into a position where
>the bootloader (including especially grub) can find it without using a
>specific partition for it? Then, for example, you could raid1 two whole
>disks, mark the md device as a pv and install a system on volumes there.
i don't grub much, my personal belief is that linux has too many
hw/filesystem combinations for it to work perfectly.
what you say could be done if not for a minor glitch, i don't remember
if this has been changed with lvm2.
'there is no room inside the VGDA to store a boot sector'

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
