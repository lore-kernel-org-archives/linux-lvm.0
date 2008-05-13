Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4DEGdg3030816
	for <linux-lvm@redhat.com>; Tue, 13 May 2008 10:16:39 -0400
Received: from fg-out-1718.google.com (fg-out-1718.google.com [72.14.220.158])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m4DEGLcY009788
	for <linux-lvm@redhat.com>; Tue, 13 May 2008 10:16:21 -0400
Received: by fg-out-1718.google.com with SMTP id e21so2670175fga.7
	for <linux-lvm@redhat.com>; Tue, 13 May 2008 07:16:20 -0700 (PDT)
Message-ID: <1c748a490805130716y558520d7i7b2781816bd743e1@mail.gmail.com>
Date: Tue, 13 May 2008 07:16:20 -0700
From: "Larry Dickson" <ldickson@cuttedge.com>
Subject: Re: [linux-lvm] lvm partition on ramdisk
In-Reply-To: <A374F37068535C46BFCF8D48CF29AA7F013666D8@zen.zetex.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_1182_12392247.1210688180301"
References: <A374F37068535C46BFCF8D48CF29AA7F013666D8@zen.zetex.com>
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

------=_Part_1182_12392247.1210688180301
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,

I appreciate and will take note of all your suggestions. Thank you for
taking the time! Here is how I achieved victory on this, in case anyone else
has a similar need. (And it was victory - 98.8% of the speed of a raw
device.)

I did pvcreate on the full (256MB) ramdisk and the full RAID array, without
partitioning. Then I did vgcreate and lvcreate on the ramdisk only (it
allowed me only 252MB, which was enough). Then vgextend to add the RAID
array, and lvresize to extend the logical volume to the full terabyte. This,
as I checked, put the ramdisk at the front of the lv.

Because I had created the ramdisk, for efficiency, with
ramdisk_blocksize=4096, I had trouble getting my file system to mount. The
magic was to make it with

mkfs.vfat -S 4096 -I -F 32

on the full, unpartitioned lv. Then it mounted, with the entire FAT on
ramdisk, and wrote very fast because FAT32 (like DOS) lays down data in
order from the start of a disk and does not skip around (I'd be interested
if anyone knows any other file systems with that property).

Larry

On 5/13/08, Karl Wagner <kwagner@zetex.com> wrote:
>
> If this is what you are looking to do, there are two more approaches you
> could consider. I have used both to varying degrees of success.
>
> The first is to just keep the first part of the disk in cache. Ie. Set
> up the device as you want, then run the following either as a cron job
> or inside a 'while true' loop in the background:
>        cat /dev/yourdevice | dd bs=1048576 count=$N of=/dev/null
> (replacing $N with the number of MB you want from the beginning of the
> drive to remain in the block device cache)
> This will simply periodicaly read $N MB from the beginning of your
> device, which keeps it in the buffer. I did this on a drive exported
> over ATA-over-ethernet to my windows machine as it's boot drive, and had
> sub-millisecond access times, very fast boot and app loading times...
> Although I was keeping the entire C: drive (6GB) in the buffer on my
> home server with 8GB ram :)
>
> The second way I have used (and replaced with the above for simplicity)
> is to set up an mdraid1 between the ramdisk and an equally sized
> partition, using the write-mostly and write-behind options, then use
> dmsetup (or LVM, I went for the direct approach) to concatenate it with
> the rest of the disk.
>
> My first way works brilliantly for me, as it is so simple yet so safe. I
> have even had a power cut in the past and no data was lost (although of
> course it forced windows to do checkdisk on boot, but it would have
> anyway).
>
> Hope this is helpful
> Mouse
>
> -----Original Message-----
> From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
> On Behalf Of Stuart D. Gathman
> Sent: 13 May 2008 02:29
> To: LVM general discussion and development
> Subject: Re: [linux-lvm] lvm partition on ramdisk
>
> On Mon, 12 May 2008, Larry Dickson wrote:
>
> > However, let me follow up your (and Stuart's) point. Are you saying
> that an
> > unmounted LVM volume will mess up the boot, even if the volume in
> question
> > is not mapped to boot or /? I was proceeding under the assumption that
> LVM
> > would be happy to sew the pieces together again later, even if the
> data in
> > them is trashed.
>
> As long as the VG is not needed in initrd (e.g. a test VG), you should
> be ok.  You will simply have to go through the procedure of removing the
> "failed" PV and adding it back after a reboot.  As long as your root fs
> (and /usr and other stuff needed at startup) are not on the test VG, you
> should be fine.  The problem is that the VG will not activate
> automatically
> with a missing PV.  Even with --partial, it will activate the VG
> as readonly metadata.  Yes, AIX handles this better, IMO.  But Linux LVM
> is
> getting there.
>
> For your application, you should make a separate "testvg" VG for your
> test
> that does not have your system.  At boot, activate the VG with
> --partial,
> then use "pvcreate -u " to set the UUID on the ramdisk to match the UUID
> originally on the ramdisk, followed by vgcfgrestore.
>
> --
>              Stuart D. Gathman <stuart@bmsi.com>
>    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703
> 591-6154
> "Confutatis maledictis, flammis acribus addictis" - background song for
> a Microsoft sponsored "Where do you want to go from here?" commercial.
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
> This has been checked by www.blackspider.com
>
>
> _________________________________________________________
>
> Zetex Semiconductors - Solutions for an analog world.
>
> http://www.zetex.com
> http://www.zetex.cn
>
> E-MAILS are susceptible to interference.  You should not assume that
> the contents originated from the sender or the Zetex Group or that they
> have been accurately reproduced from their original form.
> Zetex accepts no responsibility for information, errors or omissions in
> this e-mail nor for its use or misuse nor for any act committed or
> omitted in connection with this communication.
> If in doubt, please verify the authenticity with the sender.
> _________________________________________________________
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_Part_1182_12392247.1210688180301
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div>Hi all,</div>
<div>&nbsp;</div>
<div>I appreciate and will take note of all your suggestions. Thank you for taking the time! Here is how I achieved victory on this, in case anyone else has a similar need. (And it was victory - 98.8% of the speed of a raw device.)</div>

<div>&nbsp;</div>
<div>I did pvcreate on the full (256MB)&nbsp;ramdisk and the full RAID array, without partitioning. Then I did vgcreate and lvcreate on the ramdisk only (it allowed me only 252MB, which was enough). Then vgextend to add the RAID array, and lvresize to extend the logical volume to the full terabyte. This, as I checked, put the ramdisk at the front of the lv.</div>

<div>&nbsp;</div>
<div>Because I had created the ramdisk, for efficiency, with ramdisk_blocksize=4096, I had trouble getting my file system to mount. The magic was to make it with</div>
<div>&nbsp;</div>
<div>mkfs.vfat -S 4096 -I -F 32</div>
<div>&nbsp;</div>
<div>on the full, unpartitioned lv. Then it mounted, with the entire FAT on ramdisk, and wrote very fast because FAT32 (like DOS) lays down data in order from the start of a disk and does not skip around (I&#39;d be interested if anyone knows any other file systems with that property).<br>
&nbsp;</div>
<div>Larry<br>&nbsp;</div>
<div><span class="gmail_quote">On 5/13/08, <b class="gmail_sendername">Karl Wagner</b> &lt;<a href="mailto:kwagner@zetex.com">kwagner@zetex.com</a>&gt; wrote:</span>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">If this is what you are looking to do, there are two more approaches you<br>could consider. I have used both to varying degrees of success.<br>
<br>The first is to just keep the first part of the disk in cache. Ie. Set<br>up the device as you want, then run the following either as a cron job<br>or inside a &#39;while true&#39; loop in the background:<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cat /dev/yourdevice | dd bs=1048576 count=$N of=/dev/null<br>
(replacing $N with the number of MB you want from the beginning of the<br>drive to remain in the block device cache)<br>This will simply periodicaly read $N MB from the beginning of your<br>device, which keeps it in the buffer. I did this on a drive exported<br>
over ATA-over-ethernet to my windows machine as it&#39;s boot drive, and had<br>sub-millisecond access times, very fast boot and app loading times...<br>Although I was keeping the entire C: drive (6GB) in the buffer on my<br>
home server with 8GB ram :)<br><br>The second way I have used (and replaced with the above for simplicity)<br>is to set up an mdraid1 between the ramdisk and an equally sized<br>partition, using the write-mostly and write-behind options, then use<br>
dmsetup (or LVM, I went for the direct approach) to concatenate it with<br>the rest of the disk.<br><br>My first way works brilliantly for me, as it is so simple yet so safe. I<br>have even had a power cut in the past and no data was lost (although of<br>
course it forced windows to do checkdisk on boot, but it would have<br>anyway).<br><br>Hope this is helpful<br>Mouse<br><br>-----Original Message-----<br>From: <a href="mailto:linux-lvm-bounces@redhat.com">linux-lvm-bounces@redhat.com</a> [mailto:<a href="mailto:linux-lvm-bounces@redhat.com">linux-lvm-bounces@redhat.com</a>]<br>
On Behalf Of Stuart D. Gathman<br>Sent: 13 May 2008 02:29<br>To: LVM general discussion and development<br>Subject: Re: [linux-lvm] lvm partition on ramdisk<br><br>On Mon, 12 May 2008, Larry Dickson wrote:<br><br>&gt; However, let me follow up your (and Stuart&#39;s) point. Are you saying<br>
that an<br>&gt; unmounted LVM volume will mess up the boot, even if the volume in<br>question<br>&gt; is not mapped to boot or /? I was proceeding under the assumption that<br>LVM<br>&gt; would be happy to sew the pieces together again later, even if the<br>
data in<br>&gt; them is trashed.<br><br>As long as the VG is not needed in initrd (e.g. a test VG), you should<br>be ok.&nbsp;&nbsp;You will simply have to go through the procedure of removing the<br>&quot;failed&quot; PV and adding it back after a reboot.&nbsp;&nbsp;As long as your root fs<br>
(and /usr and other stuff needed at startup) are not on the test VG, you<br>should be fine.&nbsp;&nbsp;The problem is that the VG will not activate<br>automatically<br>with a missing PV.&nbsp;&nbsp;Even with --partial, it will activate the VG<br>
as readonly metadata.&nbsp;&nbsp;Yes, AIX handles this better, IMO.&nbsp;&nbsp;But Linux LVM<br>is<br>getting there.<br><br>For your application, you should make a separate &quot;testvg&quot; VG for your<br>test<br>that does not have your system.&nbsp;&nbsp;At boot, activate the VG with<br>
--partial,<br>then use &quot;pvcreate -u &quot; to set the UUID on the ramdisk to match the UUID<br>originally on the ramdisk, followed by vgcfgrestore.<br><br>--<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Stuart D. Gathman &lt;<a href="mailto:stuart@bmsi.com">stuart@bmsi.com</a>&gt;<br>
&nbsp;&nbsp; Business Management Systems Inc.&nbsp;&nbsp;Phone: 703 591-0911 Fax: 703<br>591-6154<br>&quot;Confutatis maledictis, flammis acribus addictis&quot; - background song for<br>a Microsoft sponsored &quot;Where do you want to go from here?&quot; commercial.<br>
<br><br>_______________________________________________<br>linux-lvm mailing list<br><a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br><a href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a><br><br><br>This has been checked by <a href="http://www.blackspider.com">www.blackspider.com</a><br><br><br>_________________________________________________________<br>
<br>Zetex Semiconductors - Solutions for an analog world.<br><br><a href="http://www.zetex.com">http://www.zetex.com</a><br><a href="http://www.zetex.cn">http://www.zetex.cn</a><br><br>E-MAILS are susceptible to interference.&nbsp;&nbsp;You should not assume that<br>
the contents originated from the sender or the Zetex Group or that they<br>have been accurately reproduced from their original form.<br>Zetex accepts no responsibility for information, errors or omissions in<br>this e-mail nor for its use or misuse nor for any act committed or<br>
omitted in connection with this communication.<br>If in doubt, please verify the authenticity with the sender.<br>_________________________________________________________<br><br><br><br>_______________________________________________<br>
linux-lvm mailing list<br><a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br><a href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div><br>

------=_Part_1182_12392247.1210688180301--
