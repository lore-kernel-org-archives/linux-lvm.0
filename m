Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4CFOAHY002929
	for <linux-lvm@redhat.com>; Mon, 12 May 2008 11:24:10 -0400
Received: from fg-out-1718.google.com (fg-out-1718.google.com [72.14.220.158])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m4CFNplt001378
	for <linux-lvm@redhat.com>; Mon, 12 May 2008 11:23:57 -0400
Received: by fg-out-1718.google.com with SMTP id e21so2288499fga.7
	for <linux-lvm@redhat.com>; Mon, 12 May 2008 08:23:50 -0700 (PDT)
Message-ID: <1c748a490805120823w1673e2f4u91b8cc43c0f818df@mail.gmail.com>
Date: Mon, 12 May 2008 08:23:50 -0700
From: "Larry Dickson" <ldickson@cuttedge.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_2818_14078090.1210605830389"
Subject: [linux-lvm] lvm partition on ramdisk
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
To: LVM general discussion and development <linux-lvm@redhat.com>

------=_Part_2818_14078090.1210605830389
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,

I'm trying to set up a logical volume over a 256MB ramdisk and a 1TB raid
array partition. My ramdisk (set up in grub.conf with ramdisk_size=262144
ramdisk_blocksize=4096) fails to make a type 8e partition either in fdisk or
sfdisk. The error in fdisk is
WARNING: Re-reading the partition table failed with error 22: Invalid
argument.
The kernel still uses the old table.
The new table will be used at the next reboot.

And, of course, after the next reboot, my ramdisk data will be gone.

Can anyone give me some guidance here? Is it choking on the 4K blocksize? I
wanted that for efficiency, as suggested by MrMichaelWill on his blog,
but his base case seems to be a file system mounted directly on the
unpartitioned device, and I need LVM.

TIA,

Larry Dickson
Cutting Edge Networked Storage

------=_Part_2818_14078090.1210605830389
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div>Hi all,</div>
<div>&nbsp;</div>
<div>I&#39;m trying to set up a logical volume over a 256MB ramdisk and a 1TB raid array partition. My ramdisk (set up in grub.conf with ramdisk_size=262144 ramdisk_blocksize=4096) fails to make a type 8e partition either in fdisk or sfdisk. The error in fdisk is</div>

<div>WARNING: Re-reading the partition table failed with error 22: Invalid argument.</div>
<div>The kernel still uses the old table.</div>
<div>The new table will be used at the next reboot.</div>
<div>&nbsp;</div>
<div>And, of course, after the next reboot, my ramdisk data will be gone.</div>
<div>&nbsp;</div>
<div>Can anyone give me some guidance here? Is it choking on the 4K blocksize? I wanted that for efficiency, as suggested by MrMichaelWill on his blog, but&nbsp;his base case seems to be a file system mounted directly on the unpartitioned device, and I need LVM.</div>

<div>&nbsp;</div>
<div>TIA,</div>
<div>&nbsp;</div>
<div>Larry Dickson</div>
<div>Cutting Edge Networked Storage</div>

------=_Part_2818_14078090.1210605830389--
