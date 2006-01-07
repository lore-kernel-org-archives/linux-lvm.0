Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k07HHB115549
	for <linux-lvm@redhat.com>; Sat, 7 Jan 2006 12:17:12 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k07HH29N029964
	for <linux-lvm@redhat.com>; Sat, 7 Jan 2006 12:17:08 -0500
Date: Sat, 7 Jan 2006 18:16:51 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Resizing a physical partition used in LVM
Message-ID: <20060107171651.GC22663@percy.comedia.it>
References: <aa4c40ff0601061728p57d83f29ndbcd40af0b27802@mail.gmail.com>
	<aa4c40ff0601061743u4fcc16apa4fd801916973a35@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aa4c40ff0601061743u4fcc16apa4fd801916973a35@mail.gmail.com>
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

On Fri, Jan 06, 2006 at 05:43:03PM -0800, James Lamanna wrote:
>1) Stop LVM.
>2) Extend /dev/sda4 to the end of the RAID with fdisk
....
vgcfgbackup, edit the backup file by hand, vgcfgrestore
....
>3) Start LVM
>4) lvextend a logical partition to the end of the physical volume.
>
>Or do I have to create a new partition on the disk for this extra space?
The latter is easier to achieve.
L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
