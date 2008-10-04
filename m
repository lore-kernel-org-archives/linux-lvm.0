Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m94H9CsU012858
	for <linux-lvm@redhat.com>; Sat, 4 Oct 2008 13:09:12 -0400
Received: from qw-out-2122.google.com (qw-out-2122.google.com [74.125.92.27])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m94H8uZm020489
	for <linux-lvm@redhat.com>; Sat, 4 Oct 2008 13:08:56 -0400
Received: by qw-out-2122.google.com with SMTP id 3so430560qwe.39
	for <linux-lvm@redhat.com>; Sat, 04 Oct 2008 10:08:56 -0700 (PDT)
Message-ID: <db00b3d70810041008y6d377faeyb6f7245db7165142@mail.gmail.com>
Date: Sat, 4 Oct 2008 19:08:56 +0200
From: "geert Geurts" <begeert@gmail.com>
Subject: Re: [linux-lvm] lvm over loop device
In-Reply-To: <sbv4e49co2f8nhe2e9rpreo3co90ss7vbs@4ax.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_15651_2576825.1223140136643"
References: <db00b3d70809260504j1754c205v9044f069c37e2c24@mail.gmail.com>
	<48E09B18.6030908@redhat.com> <1222681480.6519.33.camel@geert-laptop>
	<sbv4e49co2f8nhe2e9rpreo3co90ss7vbs@4ax.com>
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

------=_Part_15651_2576825.1223140136643
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

hello steve,
Thanks for your reply, It seems logical not to have a extent larger than the
phisical size...
i don't have time right now but I'll look into it next week.
Thanks,

Greetings,
Geert

2008/9/30 Steve Brueggeman <xioborg@yahoo.com>

> I didn't see any replies to this, so I thought I'd post what I've found.
>
> You have to specify a smaller extent size when creating the volume group.
>  The
> default extent size is 4MB, which is larger than your physical device on
> /dev/loop1 (use the -s option)
>
> For example, try this instead, which would give 4 extents on the 1MB
> physical
> device on /dev/loop1 (I think.  I am not certain about how much metadata
> exists
> on the physical device for LVM2)
>
> >vgcreate SmallDiskGroup -s256k /dev/loop0 # create a new volumegroup using
> the
> >loop0 device as phisical volume.
>
> Steve.
>
>
> On Mon, 29 Sep 2008 11:44:40 +0200, you wrote:
>
> >Hello Bryn,
> >I haven't had the time yet to try Stuart's suggestion... I've re did my
> >attempt to create the lv though, and this time with the -vvv option in
> >the step where I create the lv.
> >my steps:
> >dd if=/dev/sdb1 of=./disk0 # copy a existing LVM-partition to a file
> >losetup -f ./disk0        # link the file to a loop device
> >pvcreate /dev/loop0       # create a pv using the file
> >vgcreate SmallDiskGroup /dev/loop0 # create a new volumegroup using the
> >loop0 device as phisical volume.
> >vgchange -a y SmallDiskGroup #Activate the volumegroup
> >
> >nb. vgdisplay SmallDiskGroup gives 'Act PV 1' but 'MAX LV 0'
> >
> >the output of lvcreate -vvv -L1 -nSmallDiskVolume SmallDiskGroup is
> >downloadable here: http://pastebin.com/pastebin.php?dl=m2b9dcd7f
> >
> >I hope you can find anything.
> >
> >Greetings,
> >Geert
> >
> >On Mon, 2008-09-29 at 10:08 +0100, Bryn M. Reeves wrote:
> >> -----BEGIN PGP SIGNED MESSAGE-----
> >> Hash: SHA1
> >>
> >> geert Geurts wrote:
> >> > So what I did first create a LVM partition of 1MB on a memorystick and
> then
> >> > change the if of dd to point to the LVM partition, I'm now able to
> pvcreate
> >> > /dev/loop0, vgcreate SmallDisk /dev/loop0.
> >> > But I'm unable to create a logical volume in the SmallDisk group...
> >> > what am I doing wrong here? is it even possible if not why?
> >>
> >> Hi Geert,
> >>
> >> What was the error you were getting at this point? If possible, can you
> >> use a service like pastebin.com to post the complete output of
> "lvcreate
> >> - -vvv" with the options you're using for the SmallDisk VG. That should
> >> give enough detail to have some idea where it's failing.
> >>
> >> I think the idea is reasonable enough although you'll probably need to
> >> do some fiddling around to get the size/number of the gmailfs volumes
> >> right to give good performance.
> >>
> >> Snapshots could definitely work here but I think it might be a bit
> >> tricky without some of the patches that are currently outstanding for
> >> device-mapper, esp. Mikulas' snapshot merging patches which you'd need
> >> to "restore" one of the COW areas. See the thread here:
> >>
> >> http://kerneltrap.org/Linux/LVM_Snapshot_Merging
> >>
> >> Regards,
> >> Bryn.
> >>
> >> -----BEGIN PGP SIGNATURE-----
> >> Version: GnuPG v1.4.9 (GNU/Linux)
> >> Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org
> >>
> >> iEYEARECAAYFAkjgmxgACgkQ6YSQoMYUY96LegCcCHPZNLfhTUjIrsLiJcgROTDV
> >> +SwAoLFQDiGpkZl5tpEFW5hjFH+6OuAj
> >> =i+W8
> >> -----END PGP SIGNATURE-----
> >>
> >> _______________________________________________
> >> linux-lvm mailing list
> >> linux-lvm@redhat.com
> >> https://www.redhat.com/mailman/listinfo/linux-lvm
> >> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >
> >_______________________________________________
> >linux-lvm mailing list
> >linux-lvm@redhat.com
> >https://www.redhat.com/mailman/listinfo/linux-lvm
> >read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_Part_15651_2576825.1223140136643
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div dir="ltr">hello steve,<br>Thanks for your reply, It seems logical not to have a extent larger than the phisical size...<br>i don&#39;t have time right now but I&#39;ll look into it next week.<br>Thanks,<br><br>Greetings,<br>
Geert<br><br><div class="gmail_quote">2008/9/30 Steve Brueggeman <span dir="ltr">&lt;<a href="mailto:xioborg@yahoo.com">xioborg@yahoo.com</a>&gt;</span><br><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
I didn&#39;t see any replies to this, so I thought I&#39;d post what I&#39;ve found.<br>
<br>
You have to specify a smaller extent size when creating the volume group. &nbsp;The<br>
default extent size is 4MB, which is larger than your physical device on<br>
/dev/loop1 (use the -s option)<br>
<br>
For example, try this instead, which would give 4 extents on the 1MB physical<br>
device on /dev/loop1 (I think. &nbsp;I am not certain about how much metadata exists<br>
on the physical device for LVM2)<br>
<br>
&gt;vgcreate SmallDiskGroup -s256k /dev/loop0 # create a new volumegroup using the<br>
<div class="Ih2E3d">&gt;loop0 device as phisical volume.<br>
<br>
</div><font color="#888888">Steve.<br>
</font><div><div></div><div class="Wj3C7c"><br>
<br>
On Mon, 29 Sep 2008 11:44:40 +0200, you wrote:<br>
<br>
&gt;Hello Bryn,<br>
&gt;I haven&#39;t had the time yet to try Stuart&#39;s suggestion... I&#39;ve re did my<br>
&gt;attempt to create the lv though, and this time with the -vvv option in<br>
&gt;the step where I create the lv.<br>
&gt;my steps:<br>
&gt;dd if=/dev/sdb1 of=./disk0 # copy a existing LVM-partition to a file<br>
&gt;losetup -f ./disk0 &nbsp; &nbsp; &nbsp; &nbsp;# link the file to a loop device<br>
&gt;pvcreate /dev/loop0 &nbsp; &nbsp; &nbsp; # create a pv using the file<br>
&gt;vgcreate SmallDiskGroup /dev/loop0 # create a new volumegroup using the<br>
&gt;loop0 device as phisical volume.<br>
&gt;vgchange -a y SmallDiskGroup #Activate the volumegroup<br>
&gt;<br>
&gt;nb. vgdisplay SmallDiskGroup gives &#39;Act PV 1&#39; but &#39;MAX LV 0&#39;<br>
&gt;<br>
&gt;the output of lvcreate -vvv -L1 -nSmallDiskVolume SmallDiskGroup is<br>
&gt;downloadable here: <a href="http://pastebin.com/pastebin.php?dl=m2b9dcd7f" target="_blank">http://pastebin.com/pastebin.php?dl=m2b9dcd7f</a><br>
&gt;<br>
&gt;I hope you can find anything.<br>
&gt;<br>
&gt;Greetings,<br>
&gt;Geert<br>
&gt;<br>
&gt;On Mon, 2008-09-29 at 10:08 +0100, Bryn M. Reeves wrote:<br>
&gt;&gt; -----BEGIN PGP SIGNED MESSAGE-----<br>
&gt;&gt; Hash: SHA1<br>
&gt;&gt;<br>
&gt;&gt; geert Geurts wrote:<br>
&gt;&gt; &gt; So what I did first create a LVM partition of 1MB on a memorystick and then<br>
&gt;&gt; &gt; change the if of dd to point to the LVM partition, I&#39;m now able to pvcreate<br>
&gt;&gt; &gt; /dev/loop0, vgcreate SmallDisk /dev/loop0.<br>
&gt;&gt; &gt; But I&#39;m unable to create a logical volume in the SmallDisk group...<br>
&gt;&gt; &gt; what am I doing wrong here? is it even possible if not why?<br>
&gt;&gt;<br>
&gt;&gt; Hi Geert,<br>
&gt;&gt;<br>
&gt;&gt; What was the error you were getting at this point? If possible, can you<br>
&gt;&gt; use a service like <a href="http://pastebin.com" target="_blank">pastebin.com</a> to post the complete output of &quot;lvcreate<br>
&gt;&gt; - -vvv&quot; with the options you&#39;re using for the SmallDisk VG. That should<br>
&gt;&gt; give enough detail to have some idea where it&#39;s failing.<br>
&gt;&gt;<br>
&gt;&gt; I think the idea is reasonable enough although you&#39;ll probably need to<br>
&gt;&gt; do some fiddling around to get the size/number of the gmailfs volumes<br>
&gt;&gt; right to give good performance.<br>
&gt;&gt;<br>
&gt;&gt; Snapshots could definitely work here but I think it might be a bit<br>
&gt;&gt; tricky without some of the patches that are currently outstanding for<br>
&gt;&gt; device-mapper, esp. Mikulas&#39; snapshot merging patches which you&#39;d need<br>
&gt;&gt; to &quot;restore&quot; one of the COW areas. See the thread here:<br>
&gt;&gt;<br>
&gt;&gt; <a href="http://kerneltrap.org/Linux/LVM_Snapshot_Merging" target="_blank">http://kerneltrap.org/Linux/LVM_Snapshot_Merging</a><br>
&gt;&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt; Bryn.<br>
&gt;&gt;<br>
&gt;&gt; -----BEGIN PGP SIGNATURE-----<br>
&gt;&gt; Version: GnuPG v1.4.9 (GNU/Linux)<br>
&gt;&gt; Comment: Using GnuPG with Fedora - <a href="http://enigmail.mozdev.org" target="_blank">http://enigmail.mozdev.org</a><br>
&gt;&gt;<br>
&gt;&gt; iEYEARECAAYFAkjgmxgACgkQ6YSQoMYUY96LegCcCHPZNLfhTUjIrsLiJcgROTDV<br>
&gt;&gt; +SwAoLFQDiGpkZl5tpEFW5hjFH+6OuAj<br>
&gt;&gt; =i+W8<br>
&gt;&gt; -----END PGP SIGNATURE-----<br>
&gt;&gt;<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; linux-lvm mailing list<br>
&gt;&gt; <a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
&gt;&gt; <a href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
&gt;&gt; read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
&gt;<br>
&gt;_______________________________________________<br>
&gt;linux-lvm mailing list<br>
&gt;<a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
&gt;<a href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
&gt;read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</div></div></blockquote></div><br></div>

------=_Part_15651_2576825.1223140136643--
