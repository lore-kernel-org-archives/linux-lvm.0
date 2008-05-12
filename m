Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4CK5n5Z001043
	for <linux-lvm@redhat.com>; Mon, 12 May 2008 16:05:49 -0400
Received: from ik-out-1112.google.com (ik-out-1112.google.com [66.249.90.181])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m4CK5cqS014989
	for <linux-lvm@redhat.com>; Mon, 12 May 2008 16:05:38 -0400
Received: by ik-out-1112.google.com with SMTP id c30so791989ika.3
	for <linux-lvm@redhat.com>; Mon, 12 May 2008 13:05:37 -0700 (PDT)
Message-ID: <1c748a490805121305h242bd495u321b728756229d56@mail.gmail.com>
Date: Mon, 12 May 2008 13:05:37 -0700
From: "Larry Dickson" <ldickson@cuttedge.com>
In-Reply-To: <1c748a490805120823w1673e2f4u91b8cc43c0f818df@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_3728_3337205.1210622737388"
References: <1c748a490805120823w1673e2f4u91b8cc43c0f818df@mail.gmail.com>
Subject: [linux-lvm] Re: lvm partition on ramdisk
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

------=_Part_3728_3337205.1210622737388
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Continuing this frustration: I read in the pvcreate doc that you could tell
it to use a whole disk (instead of a partition). So I tried "pvcreate
/dev/ram0". With or without zeroing the disk, and with or without "--force",
and with any blocksize (1024, 2048, or 4096), the result is always the same:

  Device /dev/ram0 not found (or ignored by filtering).

I know /dev/ram0 is there; fdisk sees it. Is there any way to turn off the
filtering?

Larry Dickson

On 5/12/08, Larry Dickson <ldickson@cuttedge.com> wrote:
>
> Hi all,
>
> I'm trying to set up a logical volume over a 256MB ramdisk and a 1TB raid
> array partition. My ramdisk (set up in grub.conf with ramdisk_size=262144
> ramdisk_blocksize=4096) fails to make a type 8e partition either in fdisk or
> sfdisk. The error in fdisk is
> WARNING: Re-reading the partition table failed with error 22: Invalid
> argument.
> The kernel still uses the old table.
> The new table will be used at the next reboot.
>
> And, of course, after the next reboot, my ramdisk data will be gone.
>
> Can anyone give me some guidance here? Is it choking on the 4K blocksize?
> I wanted that for efficiency, as suggested by MrMichaelWill on his blog,
> but his base case seems to be a file system mounted directly on the
> unpartitioned device, and I need LVM.
>
> TIA,
>
> Larry Dickson
> Cutting Edge Networked Storage
>

------=_Part_3728_3337205.1210622737388
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div>Continuing this frustration: I read in the pvcreate doc that you could tell it to use a whole disk (instead of a partition). So I tried &quot;pvcreate /dev/ram0&quot;. With or without zeroing the disk, and with or without &quot;--force&quot;, and with any blocksize (1024, 2048, or 4096), the result is always the same:</div>

<div>&nbsp;</div>
<div>&nbsp; Device /dev/ram0 not found (or ignored by filtering).</div>
<div>&nbsp;</div>
<div>I know /dev/ram0 is there; fdisk sees it. Is there any way to turn off the filtering?<br><br>Larry Dickson</div>
<div>&nbsp;</div>
<div><span class="gmail_quote">On 5/12/08, <b class="gmail_sendername">Larry Dickson</b> &lt;<a href="mailto:ldickson@cuttedge.com">ldickson@cuttedge.com</a>&gt; wrote:</span>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">
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
<div>&nbsp;</div><span class="sg">
<div>Larry Dickson</div>
<div>Cutting Edge Networked Storage</div></span></blockquote></div><br>

------=_Part_3728_3337205.1210622737388--
