Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3M86PsG031785
	for <linux-lvm@redhat.com>; Sat, 22 Apr 2006 04:06:25 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k3M86NQm008697
	for <linux-lvm@redhat.com>; Sat, 22 Apr 2006 04:06:23 -0400
Date: Sat, 22 Apr 2006 10:06:22 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] restoring my lvm
Message-ID: <20060422080622.GB15564@percy.comedia.it>
References: <2996.192.168.0.15.1145660815.squirrel@192.168.0.15>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2996.192.168.0.15.1145660815.squirrel@192.168.0.15>
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

On Sat, Apr 22, 2006 at 12:06:55AM +0100, Jannetta S Steyn wrote:
>My problem was that the new system (also FC4 and also a vanilla install)
>already had VolGroup00. I then did a 'vgcreate VolGroup01 /dev/hdb2'. I
vgcreate = msdos format
you just wiped your disk

>PV /dev/hdb2 VG VolGroup01 lvm2 [2.93 GB / 2.93 GB free]
>PV /dev/hda2 VG VolGroup02 lvm2 [3.91 GB / 32.00 MB free]
>Total: 2 [6.83 GB] / in use: 2 [6.83 GB] / in no VG: 0 [0 ]
if you are certain that the previous logical volume spanned the whole
disk, you can:
# vgdisplay /dev/VolGroup01
and look at the "Total PE" value, then
# lvcreate -Z n -l TOTAL_PE -n LogVol01 /dev/VolGroup01

but i'd rater first try with http://www.cgsecurity.org/wiki/TestDisk
which might be able to recover the damage you did.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
