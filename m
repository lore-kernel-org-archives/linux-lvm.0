Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5UIxD023048
	for <linux-lvm@redhat.com>; Wed, 30 Jun 2004 14:59:13 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i5UIx7Xn023919
	for <linux-lvm@redhat.com>; Wed, 30 Jun 2004 14:59:08 -0400
Date: Wed, 30 Jun 2004 20:59:06 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Resize VG
Message-ID: <20040630185905.GC1099@percy.comedia.it>
References: <000501c45eb2$a4e75470$cf42e3c1@pitagora.it>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000501c45eb2$a4e75470$cf42e3c1@pitagora.it>
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

On Wed, Jun 30, 2004 at 04:57:58PM +0200, Mimmus wrote:
>Does LVM support extending LUN size?
LVM1 does not support extending lun size.

>I extended size of an existing LUN from my disk-array manager but vgdisplay
>shows me always the original size (with no free physical extents). No change
>if I reboot, I need to destroy and re-create volume group.

did you partition the lun or are you using a whole device?
in the former case you can add a second partition, in the latter your
only chance is to reduce the lun again and assign the space as a new
lun, iirc you should be able to allocate more than one lun from the same disk group. i
am not that sure about reducing.
Watch out for the maximum number of sd devices in the kernel which is probably limited to 
40 (CONFIG_SD_EXTRA_DEVS)

L.


-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
