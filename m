Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0QHpUHR011764
	for <linux-lvm@redhat.com>; Mon, 26 Jan 2009 12:51:30 -0500
Received: from wf-out-1314.google.com (wf-out-1314.google.com [209.85.200.170])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n0QHpCCP022785
	for <linux-lvm@redhat.com>; Mon, 26 Jan 2009 12:51:12 -0500
Received: by wf-out-1314.google.com with SMTP id 25so6304516wfc.6
	for <linux-lvm@redhat.com>; Mon, 26 Jan 2009 09:51:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20090120181112.5523a424@winsoft.fr>
References: <20090120181112.5523a424@winsoft.fr>
Date: Mon, 26 Jan 2009 09:51:11 -0800
Message-ID: <f9d530070901260951t131a7291n17d57c62e14edf45@mail.gmail.com>
Subject: Re: [linux-lvm] starting LVs on RAID stripe boundaries
From: unlisted <unlisted@gmail.com>
Content-Type: multipart/alternative; boundary=0016364c6da35f40f704616662f7
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

--0016364c6da35f40f704616662f7
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

that sounds right... as long as your lvm PVs are entire disks and not insid=
e
of another partition.  I spend months trying to understand all this.

Also, isn't your LVM metadata 192k ?

Sam


On Tue, Jan 20, 2009 at 9:11 AM, F-D. Cami <fcami@winsoft.fr> wrote:

>
> Hi Linux-LVM,
>
> I'm searching for some definitive information about how to make sure that
> logical
> volumes start exactly at the beginning of a RAID stripe.
>
> My hardware is an EMC Clariion CX3-40F array with a RHEL5 host.
> The default stripe element size is 64 KB (128 blocks) on the CX3.
>
> Both EMC and Red Hat recommend using fdisk or parted  to align the first
> partition
> to the start of a stripe boundary (128th block, 128x512=3D64KB) :
> Red Hat : http://kbase.redhat.com/faq/docs/DOC-2893
> EMC : "EMC CLARiiON Best Practices", PDF available on emc.com
>
> After doing that. the first partition is now aligned, next I need to make
> sure my logical
> volumes are similarly aligned. However, after reading the LVM Howto on
> tldp.org,
> the LVM wiki at redhat.com, and Alasdair Kergon's LinuxTag presentation a=
t
> :
> http://people.redhat.com/agk/talks/LVM2-LinuxTag2006/
> I found no information on how to do that.
>
> I'll now use some reasonable (?) assumptions :
> * the physical extent size is a multiple of 64K (vgcreate's default is 4M=
B)
> ;
> * if physical extents are aligned, logical volumes are themselves aligned
>  (lvcreate -l, --extents LogicalExtentsNumber) ;
> * since PV, VG and LV infos are stored in PV metadata, the only possible =
PE
>   misalignment culprit is PV metadata ;
> * PV metadata size is a multiple of 64KB
>  (
> http://orezpraw.com/orezpraw.php/blogosphere/your-filesystem-starts-where=
)
>
> Since 64KB is my stripe size, and metadata size is a multiple of 64KB,
> pvcreate should do the RightThing(tm) with default options, i.e. start th=
e
> first PE at a multiple of the stripe size.
>
> In other words, aligning the partition the PV uses to the stripe boundary
> and
> using a PE size multiple of the stripe size insure that LVs get themselve=
s
> created
> on stripe boundaries.
>
> Comments, please ?
>
> Thanks,
>
> Fran=E7ois Cami
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--0016364c6da35f40f704616662f7
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>that sounds right... as long as your lvm PVs are&nbsp;entire disks and=
 not inside of another partition.&nbsp; I spend months trying to understand=
 all this.</div>
<div>&nbsp;</div>
<div>Also, isn&#39;t your LVM metadata 192k ?</div>
<div>&nbsp;</div>
<div>Sam</div>
<div><br>&nbsp;</div>
<div class=3D"gmail_quote">On Tue, Jan 20, 2009 at 9:11 AM, F-D. Cami <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:fcami@winsoft.fr">fcami@winsoft.fr</a>&g=
t;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid"><br>Hi Linux-LVM,<br><br>I&#39;m=
 searching for some definitive information about how to make sure that logi=
cal<br>
volumes start exactly at the beginning of a RAID stripe.<br><br>My hardware=
 is an EMC Clariion CX3-40F array with a RHEL5 host.<br>The default stripe =
element size is 64 KB (128 blocks) on the CX3.<br><br>Both EMC and Red Hat =
recommend using fdisk or parted &nbsp;to align the first partition<br>
to the start of a stripe boundary (128th block, 128x512=3D64KB) :<br>Red Ha=
t : <a href=3D"http://kbase.redhat.com/faq/docs/DOC-2893" target=3D"_blank"=
>http://kbase.redhat.com/faq/docs/DOC-2893</a><br>EMC : &quot;EMC CLARiiON =
Best Practices&quot;, PDF available on <a href=3D"http://emc.com/" target=
=3D"_blank">emc.com</a><br>
<br>After doing that. the first partition is now aligned, next I need to ma=
ke sure my logical<br>volumes are similarly aligned. However, after reading=
 the LVM Howto on <a href=3D"http://tldp.org/" target=3D"_blank">tldp.org</=
a>,<br>
the LVM wiki at <a href=3D"http://redhat.com/" target=3D"_blank">redhat.com=
</a>, and Alasdair Kergon&#39;s LinuxTag presentation at :<br><a href=3D"ht=
tp://people.redhat.com/agk/talks/LVM2-LinuxTag2006/" target=3D"_blank">http=
://people.redhat.com/agk/talks/LVM2-LinuxTag2006/</a><br>
I found no information on how to do that.<br><br>I&#39;ll now use some reas=
onable (?) assumptions :<br>* the physical extent size is a multiple of 64K=
 (vgcreate&#39;s default is 4MB) ;<br>* if physical extents are aligned, lo=
gical volumes are themselves aligned<br>
&nbsp;(lvcreate -l, --extents LogicalExtentsNumber) ;<br>* since PV, VG and=
 LV infos are stored in PV metadata, the only possible PE<br>&nbsp; misalig=
nment culprit is PV metadata ;<br>* PV metadata size is a multiple of 64KB<=
br>&nbsp;( <a href=3D"http://orezpraw.com/orezpraw.php/blogosphere/your-fil=
esystem-starts-where" target=3D"_blank">http://orezpraw.com/orezpraw.php/bl=
ogosphere/your-filesystem-starts-where</a> )<br>
<br>Since 64KB is my stripe size, and metadata size is a multiple of 64KB,<=
br>pvcreate should do the RightThing(tm) with default options, i.e. start t=
he<br>first PE at a multiple of the stripe size.<br><br>In other words, ali=
gning the partition the PV uses to the stripe boundary and<br>
using a PE size multiple of the stripe size insure that LVs get themselves =
created<br>on stripe boundaries.<br><br>Comments, please ?<br><br>Thanks,<b=
r><br>Fran=E7ois Cami<br><br>______________________________________________=
_<br>
linux-lvm mailing list<br><a href=3D"mailto:linux-lvm@redhat.com">linux-lvm=
@redhat.com</a><br><a href=3D"https://www.redhat.com/mailman/listinfo/linux=
-lvm" target=3D"_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</=
a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div><br>

--0016364c6da35f40f704616662f7--
