Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kBSNOx5E010543
	for <linux-lvm@redhat.com>; Thu, 28 Dec 2006 18:24:59 -0500
Received: from wx-out-0506.google.com (wx-out-0506.google.com [66.249.82.239])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kBSNOw0H018013
	for <linux-lvm@redhat.com>; Thu, 28 Dec 2006 18:24:58 -0500
Received: by wx-out-0506.google.com with SMTP id s11so5830082wxc
	for <linux-lvm@redhat.com>; Thu, 28 Dec 2006 15:24:58 -0800 (PST)
Message-ID: <859a78260612281524u56385ab6x71a29e45edf4dfbe@mail.gmail.com>
Date: Thu, 28 Dec 2006 17:24:57 -0600
From: "Matt P" <slarty.tj@gmail.com>
Subject: Re: [linux-lvm] Mirror between different SAN fabrics
In-Reply-To: <45943EDA.5080209@nrel.colostate.edu>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_73706_20085825.1167348297830"
References: <2421805.1167306770765.JavaMail.mailer@post.ch>
	<45940A96.5040006@nrel.colostate.edu>
	<859a78260612281130m761fce9rf32240b523471608@mail.gmail.com>
	<45943EDA.5080209@nrel.colostate.edu>
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

------=_Part_73706_20085825.1167348297830
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

That's exactly the steps I used to test it out. The failure I encountered
was at the point of adding the StripeLVs to the MirrorVG. I don't recall the
error I got but I seem to recall it being the same error as if the PV hadn't
been pvcreated. Although when I went through the process again just now,
without any errors... It's quite likely I mistyped or skipped a step during
my first attempt...

I've gone through the whole process 4 times now from raw disk to a mirrored
LV without getting the error again.

It looks as though this could work and isn't nearly as crazy as my initial
configuration. I wonder now if anything wonky will happen if we were to lose
a disk or in the original post if we lost one of the fabrics...

On 12/28/06, Ty! Boyack <ty@nrel.colostate.edu> wrote:
>
> Actually, I'm quite surprised that this approach mangles the lvm data.
> It seems that when you do a pvcreate on a block device, LVM should (and
> I think, does) write the lvm metadata in a region of that device, and
> then never let anything touch that metadata.  This way, if you do a 'dd
> if=/dev/zeros of=<PV-DEVICE>' it blanks out the device, but the metadata
> is intact.
>
> So, if you do a 'pvcreate' on an LV, it should contain a second copy of
> the metadata, unique and independent from the first copy on the original
> block device.  My tests on this has worked fine (although my tests have
> been for building two VGs that have striped volumes across the member
> disks, and then a VG that creates a mirrored LV of the striped volumes,
> so no multipathing is involved).  I'm wondering if we can compare notes
> to see if I'm doing something that makes it look like it's working -- I
> don't want to be quietly destroying my lvm data and not knowing it!!!
>
> I'm doing (roughly, block devices are a bit made-up):
>
> # prepare the physical volumes
> pvcreate /dev/sda
> pvcreate /dev/sdb
> pvcreate /dev/sdc
> pvcreate /dev/sdd
> pvcreate /dev/sde
>
> # Create volume groups to contain uniquely striped volumes
> vgcreate Stripe1VG /dev/sda /dev/sdb
> vgcreate Stripe2VG /dev/sdc /dev/sdd
>
> # Create the striped volumes
> lvcreate -i 2 -n Stripe1LV -L 1G Stripe1VG
> lvcreate -i 2 -n Stripe2LV -L 1G Stripe2VG
>
> # Make the striped volumes into PVs
> pvcreate /dev/Stripe1VG/Stripe1LV
> pvcreate /dev/Stripe2VG/Stripe2LV
>
> # Create the volume group for mirrored volumes
> vgcreate MirrorVG /dev/Stripe1VG/Stripe1LV /dev/Stripe2VG/Stripe2LV
> /dev/sde
> # (Had to use three PVs to have the mirror log in place)
>
> # Create the mirrored volume
> lvcreate -m 1 -n Mirror1LV -L 500M MirrorVG
>
> # Filesystem, test, etc.  this will be GFS eventually, but testing with
> ext3 for now.
> mke2fs -j -i16384 -v /dev/MirrorVG/Mirror1LV
> mkdir /mnt/mirror1lv
> mount /dev/MirrorVG/Mirror1LV /mnt/mirror1
>
>
>
> Is that about your procedure as well?  When does the lvm data get mangled?
>
> (Sorry if this is going off topic - but if this is solvable it might
> actually answer the original question...)
>
> -Ty!
>
>
>
>
> Matt P wrote:
> > This is basically the "messy" way I mentioned in my reply above. I
> > found if you pvcreate the  LV device, you end up mangling the lvm data
> > (this probably comes as little surprise) and it breaks down after
> > that. So, I ended up using losetup and an "image file", one for/on
> > each fabric. Then did pvcreate on each loop device, and made a new VG
> > containing both PVs and created the LV with mirroring.... It
> > worked.... I did no performance, stability, or failure testing...
>
>
> --
> -===========================-
>   Ty! Boyack
>   NREL Unix Network Manager
>   ty@nrel.colostate.edu
>   (970) 491-1186
> -===========================-
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_Part_73706_20085825.1167348297830
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

That&#39;s exactly the steps I used to test it out. The failure I encountered was at the point of adding the StripeLVs to the MirrorVG. I don&#39;t recall the error I got but I seem to recall it being the same error as if the PV hadn&#39;t been pvcreated. Although when I went through the process again just now, without any errors... It&#39;s quite likely I mistyped or skipped a step during my first attempt...
<br><br>I&#39;ve gone through the whole process 4 times now from raw disk to a mirrored LV without getting the error again.<br><br>It looks as though this could work and isn&#39;t nearly as crazy as my initial configuration. I wonder now if anything wonky will happen if we were to lose a disk or in the original post if we lost one of the fabrics...
<br><br><div><span class="gmail_quote">On 12/28/06, <b class="gmail_sendername">Ty! Boyack</b> &lt;<a href="mailto:ty@nrel.colostate.edu">ty@nrel.colostate.edu</a>&gt; wrote:</span><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
Actually, I&#39;m quite surprised that this approach mangles the lvm data.<br>It seems that when you do a pvcreate on a block device, LVM should (and<br>I think, does) write the lvm metadata in a region of that device, and
<br>then never let anything touch that metadata.&nbsp;&nbsp;This way, if you do a &#39;dd<br>if=/dev/zeros of=&lt;PV-DEVICE&gt;&#39; it blanks out the device, but the metadata<br>is intact.<br><br>So, if you do a &#39;pvcreate&#39; on an LV, it should contain a second copy of
<br>the metadata, unique and independent from the first copy on the original<br>block device.&nbsp;&nbsp;My tests on this has worked fine (although my tests have<br>been for building two VGs that have striped volumes across the member
<br>disks, and then a VG that creates a mirrored LV of the striped volumes,<br>so no multipathing is involved).&nbsp;&nbsp;I&#39;m wondering if we can compare notes<br>to see if I&#39;m doing something that makes it look like it&#39;s working -- I
<br>don&#39;t want to be quietly destroying my lvm data and not knowing it!!!<br><br>I&#39;m doing (roughly, block devices are a bit made-up):<br><br># prepare the physical volumes<br>pvcreate /dev/sda<br>pvcreate /dev/sdb
<br>pvcreate /dev/sdc<br>pvcreate /dev/sdd<br>pvcreate /dev/sde<br><br># Create volume groups to contain uniquely striped volumes<br>vgcreate Stripe1VG /dev/sda /dev/sdb<br>vgcreate Stripe2VG /dev/sdc /dev/sdd<br><br># Create the striped volumes
<br>lvcreate -i 2 -n Stripe1LV -L 1G Stripe1VG<br>lvcreate -i 2 -n Stripe2LV -L 1G Stripe2VG<br><br># Make the striped volumes into PVs<br>pvcreate /dev/Stripe1VG/Stripe1LV<br>pvcreate /dev/Stripe2VG/Stripe2LV<br><br># Create the volume group for mirrored volumes
<br>vgcreate MirrorVG /dev/Stripe1VG/Stripe1LV /dev/Stripe2VG/Stripe2LV /dev/sde<br># (Had to use three PVs to have the mirror log in place)<br><br># Create the mirrored volume<br>lvcreate -m 1 -n Mirror1LV -L 500M MirrorVG
<br><br># Filesystem, test, etc.&nbsp;&nbsp;this will be GFS eventually, but testing with<br>ext3 for now.<br>mke2fs -j -i16384 -v /dev/MirrorVG/Mirror1LV<br>mkdir /mnt/mirror1lv<br>mount /dev/MirrorVG/Mirror1LV /mnt/mirror1<br><br>
<br><br>Is that about your procedure as well?&nbsp;&nbsp;When does the lvm data get mangled?<br><br>(Sorry if this is going off topic - but if this is solvable it might<br>actually answer the original question...)<br><br>-Ty!<br><br>
<br><br><br>Matt P wrote:<br>&gt; This is basically the &quot;messy&quot; way I mentioned in my reply above. I<br>&gt; found if you pvcreate the&nbsp;&nbsp;LV device, you end up mangling the lvm data<br>&gt; (this probably comes as little surprise) and it breaks down after
<br>&gt; that. So, I ended up using losetup and an &quot;image file&quot;, one for/on<br>&gt; each fabric. Then did pvcreate on each loop device, and made a new VG<br>&gt; containing both PVs and created the LV with mirroring.... It
<br>&gt; worked.... I did no performance, stability, or failure testing...<br><br><br>--<br>-===========================-<br>&nbsp;&nbsp;Ty! Boyack<br>&nbsp;&nbsp;NREL Unix Network Manager<br>&nbsp;&nbsp;<a href="mailto:ty@nrel.colostate.edu">ty@nrel.colostate.edu
</a><br>&nbsp;&nbsp;(970) 491-1186<br>-===========================-<br><br>_______________________________________________<br>linux-lvm mailing list<br><a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br><a href="https://www.redhat.com/mailman/listinfo/linux-lvm">
https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div><br>

------=_Part_73706_20085825.1167348297830--
