Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7AIlWtV018376
	for <linux-lvm@redhat.com>; Thu, 10 Aug 2006 14:47:32 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k7AIlQ6x027344
	for <linux-lvm@redhat.com>; Thu, 10 Aug 2006 14:47:27 -0400
Date: Thu, 10 Aug 2006 20:47:26 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] converting PV from md to non-md
Message-ID: <20060810184726.GB27407@percy.comedia.it>
References: <700E4C1906A0F34DB4C6ABC47B3E8FA5125E77@spcrokexcbe01.AD.SPIRENTCOM.COM>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <700E4C1906A0F34DB4C6ABC47B3E8FA5125E77@spcrokexcbe01.AD.SPIRENTCOM.COM>
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

On Thu, Aug 10, 2006 at 02:13:57PM -0400, Musard, Kris wrote:
>I am trying to "undo" the software raid setup on a system.  I have been
>able to simply change the partition type from "linux raid auto detect"
>to "linux" and mount the filesystems which were previously formatted on
>top of the md device directly to the underlying /dev/hda[0-9] device.
>The PV was originally added as /dev/md1 to the VG.  I tried setting the
>partition type from "linux raid autodetect" to "linux LVM" but vgscan
>and vgimport both give an error about the PV is part of a multiple
>device.  Does anyone have a procedure for going from LVM on top of linux
>md software raid to LVM without md?  Any help would be much appreciated.

mdadm --zero-superblock /dev/hdaX

L.


-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
