Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4CKQIfs015791
	for <linux-lvm@redhat.com>; Mon, 12 May 2008 16:26:18 -0400
Received: from mu-out-0910.google.com (mu-out-0910.google.com [209.85.134.190])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m4CKQ3SH026654
	for <linux-lvm@redhat.com>; Mon, 12 May 2008 16:26:04 -0400
Received: by mu-out-0910.google.com with SMTP id w8so1303702mue.1
	for <linux-lvm@redhat.com>; Mon, 12 May 2008 13:26:03 -0700 (PDT)
Message-ID: <1c748a490805121326v2e4aea0am3cfbe572a909a0b1@mail.gmail.com>
Date: Mon, 12 May 2008 13:26:03 -0700
From: "Larry Dickson" <ldickson@cuttedge.com>
Subject: Re: [linux-lvm] lvm partition on ramdisk
In-Reply-To: <Pine.LNX.4.44.0805121557010.22122-100000@bmsred.bmsi.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_3758_3464166.1210623963050"
References: <1c748a490805120823w1673e2f4u91b8cc43c0f818df@mail.gmail.com>
	<Pine.LNX.4.44.0805121557010.22122-100000@bmsred.bmsi.com>
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

------=_Part_3758_3464166.1210623963050
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

The purpose of the ramdisk is to emulate a battery-backed solid-state drive
which is intended to do high speed, seek-free metadata IO in a file system
(for instance FAT32) in which all the metadata is at the beginning. We can't
afford the SSD unless we know it is going to work.

We don't care if the test data survives a shutdown, only that the mapping be
right.

I did try making the whole ramdisk a PV, and it choked on that too, because
of "filtering". A way around all this overprotectiveness would be highly
appreciated.

TIA,

Larry

On 5/12/08, Stuart D. Gathman <stuart@bmsi.com> wrote:
>
> On Mon, 12 May 2008, Larry Dickson wrote:
>
> > I'm trying to set up a logical volume over a 256MB ramdisk and a 1TB
> raid
> > array partition. My ramdisk (set up in grub.conf with
> ramdisk_size=262144
> > ramdisk_blocksize=4096) fails to make a type 8e partition either in
> fdisk or
> > sfdisk. The error in fdisk is
>
> You can't and don't need to set a partition type for a ramdisk.  It
> already is a partition.
>
> > Can anyone give me some guidance here? Is it choking on the 4K
> blocksize? I
> > wanted that for efficiency, as suggested by MrMichaelWill on his blog,
> > but his base case seems to be a file system mounted directly on the
> > unpartitioned device, and I need LVM.
>
> No, just as you can make a disk device like /dev/sda a PV without any
> partition table, you don't need a partition table for a ramdisk.
>
> HOWEVER: you REALLY REALLY don't want to mix volatile and non-volatile
> PVs in the same volume group.  When you reboot, and the ramdisk PV is
> missing, the volume group won't activate automatically.  Furthermore,
> you could accidentally end up with real data on the ramdisk - and it goes
> bye bye on reboot.
>
> Let me guess - you wanted to use the ramdisk for a snapshot?  Yes, some
> other people have tried that (see the thread here a week or so ago).  You
> will
> be very unhappy when the system reboots and the ramdisk is missing.
>
> The real way to put snapshots on a ramdisk is a "temporary snapshot" -
> a feature which could in theory be done via device-mapper, but needs
> utility support.
>
> If your root fs is not on the VG you are adding the ramdisk to, you
> could probably get away with it.  Add the ramdisk, snapshot, make your
> backup, delete snapshot, reduce ramdisk from VG.  If the system crashes
> while the ramdisk is still in the VG metadata, then you'll need to
> manually
> recover the VG to activate - but hopefully that will be rare.
>
> There is also an option you could add to initrd to activate a VG even
> with missing PVs.  But that makes all LVs read-only until the VG is
> repaired.
>
> --
>              Stuart D. Gathman <stuart@bmsi.com>
>    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
> "Confutatis maledictis, flammis acribus addictis" - background song for
> a Microsoft sponsored "Where do you want to go from here?" commercial.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_Part_3758_3464166.1210623963050
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div>The purpose of the ramdisk is to emulate a battery-backed solid-state&nbsp;drive which is intended to do high speed, seek-free metadata IO in a file system (for instance FAT32) in which all the metadata is at the beginning. We can&#39;t afford the&nbsp;SSD unless we know it is going to work.</div>

<div>&nbsp;</div>
<div>We don&#39;t care if the test&nbsp;data survives a shutdown, only that the mapping be right.<br>&nbsp;</div>
<div>I did try making the whole ramdisk a PV, and it choked on that too, because of &quot;filtering&quot;. A way around all this overprotectiveness would be highly appreciated.</div>
<div>&nbsp;</div>
<div>TIA,</div>
<div>&nbsp;</div>
<div>Larry<br>&nbsp;</div>
<div><span class="gmail_quote">On 5/12/08, <b class="gmail_sendername">Stuart D. Gathman</b> &lt;<a href="mailto:stuart@bmsi.com">stuart@bmsi.com</a>&gt; wrote:</span>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">On Mon, 12 May 2008, Larry Dickson wrote:<br><br>&gt; I&#39;m trying to set up a logical volume over a 256MB ramdisk and a 1TB raid<br>
&gt; array partition. My ramdisk (set up in grub.conf with ramdisk_size=262144<br>&gt; ramdisk_blocksize=4096) fails to make a type 8e partition either in fdisk or<br>&gt; sfdisk. The error in fdisk is<br><br>You can&#39;t and don&#39;t need to set a partition type for a ramdisk.&nbsp;&nbsp;It<br>
already is a partition.<br><br>&gt; Can anyone give me some guidance here? Is it choking on the 4K blocksize? I<br>&gt; wanted that for efficiency, as suggested by MrMichaelWill on his blog,<br>&gt; but his base case seems to be a file system mounted directly on the<br>
&gt; unpartitioned device, and I need LVM.<br><br>No, just as you can make a disk device like /dev/sda a PV without any<br>partition table, you don&#39;t need a partition table for a ramdisk.<br><br>HOWEVER: you REALLY REALLY don&#39;t want to mix volatile and non-volatile<br>
PVs in the same volume group.&nbsp;&nbsp;When you reboot, and the ramdisk PV is<br>missing, the volume group won&#39;t activate automatically.&nbsp;&nbsp;Furthermore,<br>you could accidentally end up with real data on the ramdisk - and it goes<br>
bye bye on reboot.<br><br>Let me guess - you wanted to use the ramdisk for a snapshot?&nbsp;&nbsp;Yes, some<br>other people have tried that (see the thread here a week or so ago).&nbsp;&nbsp;You will<br>be very unhappy when the system reboots and the ramdisk is missing.<br>
<br>The real way to put snapshots on a ramdisk is a &quot;temporary snapshot&quot; -<br>a feature which could in theory be done via device-mapper, but needs<br>utility support.<br><br>If your root fs is not on the VG you are adding the ramdisk to, you<br>
could probably get away with it.&nbsp;&nbsp;Add the ramdisk, snapshot, make your<br>backup, delete snapshot, reduce ramdisk from VG.&nbsp;&nbsp;If the system crashes<br>while the ramdisk is still in the VG metadata, then you&#39;ll need to manually<br>
recover the VG to activate - but hopefully that will be rare.<br><br>There is also an option you could add to initrd to activate a VG even<br>with missing PVs.&nbsp;&nbsp;But that makes all LVs read-only until the VG is repaired.<br>
<br>--<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Stuart D. Gathman &lt;<a href="mailto:stuart@bmsi.com">stuart@bmsi.com</a>&gt;<br>&nbsp;&nbsp; Business Management Systems Inc.&nbsp;&nbsp;Phone: 703 591-0911 Fax: 703 591-6154<br>&quot;Confutatis maledictis, flammis acribus addictis&quot; - background song for<br>
a Microsoft sponsored &quot;Where do you want to go from here?&quot; commercial.<br><br>_______________________________________________<br>linux-lvm mailing list<br><a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div><br>

------=_Part_3758_3464166.1210623963050--
