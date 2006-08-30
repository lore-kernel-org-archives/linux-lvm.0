Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7U35e2v005335
	for <linux-lvm@redhat.com>; Tue, 29 Aug 2006 23:05:40 -0400
Received: from web30312.mail.mud.yahoo.com (web30312.mail.mud.yahoo.com
	[209.191.69.74])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id k7U35U27016288
	for <linux-lvm@redhat.com>; Tue, 29 Aug 2006 23:05:30 -0400
Message-ID: <20060830030524.555.qmail@web30312.mail.mud.yahoo.com>
Date: Tue, 29 Aug 2006 20:05:24 -0700 (PDT)
From: Tom+Dale <tdmyth@yahoo.com>
Subject: Re: [linux-lvm] Lost logical volume?
In-Reply-To: <44F4F32B.2070806@utsouthwestern.edu>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-92434573-1156907124=:99077"
Content-Transfer-Encoding: 8bit
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

--0-92434573-1156907124=:99077
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Peter Smith <peter.smith@utsouthwestern.edu> wrote:  Tom+Dale wrote:

> Greetings.
> I am hoping that some LVM experts can help me out. I have a partial=20
> volume group that spans two drives and I would like to recover the=20
> logical volume that was on it so that the data is accessible. The=20
> group (VolGroup00) was originally set up spanning part of one drive=20
> and all of the other drive (both IDE). The group was entirely applied=20
> to a single logical volume (LogVol00) to be mounted as /video. This=20
> was working until I tried to make some changes and I fear that I may=20
> have lost the data. I cannot seem to resolve this problem anywhere=20
> else. I have spent almost two weeks searching for clues and asking for=20
> help in other forums, but I do not yet have a solution. I hope to=20
> provide all of the useful information below.
> *History*
> I am relatively new to linux, having built my own PVR using Fedora and=20
> MythTV during the last year. I have relied heavily upon HowTos and=20
> guides written by other users. One of the guides that I followed=20
> instructed me to set up XFS using LVM which would allow me to span=20
> multiple hard disks. Recently, I added a new SATA drive to my MythTV=20
> system. The new drive was designated as /dev/sda. It appeared to add=20
> into the existing volume group without any problem, though I did not=20
> get it to the point where the space was accessible. I planned to=20
> further research that problem; however, the new hard drive failed=20
> before I got that far. Here=EF=BF=BDs what things looked like after remov=
ing=20
> the drive:
> [root[at]mythserver ~]# pvdisplay
> Couldn't find device with uuid 'fxlccO-4li0-nmyD-9avZ-Vc60-GGWX-jUhqOv'.
> Couldn't find device with uuid 'fxlccO-4li0-nmyD-9avZ-Vc60-GGWX-jUhqOv'.
> --- Physical volume ---
> PV Name /dev/hda5
> VG Name VolGroup00
> PV Size 66.12 GB / not usable 0
> Allocatable yes (but full)
> PE Size (KByte) 4096
> Total PE 16926
> Free PE 0
> Allocated PE 16926
> PV UUID 317l2C-oay1-TWFG-5NTX-XJS3-vLal-Xh5bBL
>
> --- Physical volume ---
> PV Name /dev/hdb
> VG Name VolGroup00
> PV Size 298.09 GB / not usable 0
> Allocatable yes (but full)
> PE Size (KByte) 4096
> Total PE 76311
> Free PE 0
> Allocated PE 76311
> PV UUID nfLxS1-0u3t-5Zr9-57iu-1oZe-Bkkd-75SERQ
>
> --- Physical volume ---
> PV Name unknown device
> VG Name VolGroup00
> PV Size 232.88 GB / not usable 0
> Allocatable yes
> PE Size (KByte) 4096
> Total PE 59617
> Free PE 225
> Allocated PE 59392
> PV UUID fxlccO-4li0-nmyD-9avZ-Vc60-GGWX-jUhqOv
>
>
Tom. I'm sorry that not too many people have looked into this with you.

First, what were the results of the "vgreduce --removemissing=20
VolGroup00" command? I'm generating a theory here. That VolGroup00 had a=20
single LV, LogVol00, and the disks /dev/hda5 and /dev/hdb. Then--I'm=20
guessing here--you did a "pvcreate /dev/sda" .. And followed that with a=20
"vgextend VolGroup00 /dev/sda" .. Then perhaps did you do a "lvextend -l=20
/dev/VolGroup00 /dev/sda"? After that, at some point,=20
/dev/sda went dead. Am I close? Could you recount to us what steps you=20
took to "expand" the VG? I realize you may have been asleep, but this=20
data is crucial. When I do any LVM work I typically record all my input=20
and output in a text editor and save it or print it out for safety..

So, the questions are:
1) Was that LV the ONLY LV in the VG?
2) You did try to expand the LV to include /dev/sda?
3) Did you use any GUI to do this? Or did you rely on the command line?

Peter =20
Peter,
  =20
  Thank you for your reply...I wish I'd seen it _before_ complaining about =
no responses.  My apologies to you and the other list members! =20
  =20
  In retrospect, I agree that documenting our LVM intrepid adventure would =
have been smart.  I confess that I cannot tell you precisely what commands =
we gave to add the new (later failed) hard drive.  However, your effort at =
retracing our steps sounds remarkably familiar.  I would say that it is ess=
entially correct if not exactly.
  =20
  I'm not sure what the results of the "vgreduce --removemissing VolGroup00=
" command were other than that it appeared to me as though it was successfu=
l.  Would that be logged somewhere?
  =20
  1. Yes, initially VolGroup00 spanned /dev/hda5 and /dev/hdb.  LogVol00 wa=
s the only logical volume in VolGroup00, and it was using the entire space =
of VolGroup00.
  =20
  2. Yes, we tried to expand the LV to include /dev/sda but I think we were=
 doing something wrong because we couldn't seem to get the MythTV app to se=
e more space available (see below).
  =20
  3. No, no GUI tools.  We were strictly using the command line in an xterm=
 session.  This is FC4 with xfce desktop (in case that matters).
  =20
  I think you are right:  we added the drive using "pvcreate /dev/sda" and =
then we did "vgextend VolGroup00 /dev/sda" (those look right from what I re=
member...coming up on three weeks ago, now).  So expanding the VG would hav=
e been accomplished at this point, right?  I believe we got to that point s=
uccessfully.  Now I'm not sure how we tried to expand the LV, but I'm prett=
y sure that it did not work because we couldn't see the new space available=
 from the MythTV app (it still reported the original volume size for total =
disk space as if we'd made no addition).
  =20
  So we may have tried "lvextend -l" with parameters or perhaps we never fi=
gured that part out.  You know, we were drinking lots of Diet Coke while se=
arching the net and reading man pages, re-reading the LVM HowTo, and trying=
 different things...timidly.  I'm certain that we could see from pvdisplay =
& vgdisplay that we were close but not done yet.  We quit for the night and=
 I discovered the physical disk problem the next afternoon.
  =20
  Two final comments:
  =20
  A) I can't get to the box right now, as I am travelling this week.  But I=
 sincerely appreciate your assistance and I'll be able to access it after S=
aturday 02Sep06.
  =20
  B) I remember seeing some archives and backups in an LVM directory not on=
 the logical volume.  Are these key to recovering the LV?  It looks like pe=
ople have posted the contents of these files in the past (they look like pr=
ogramming code to me).  I wasn't sure what to post or if they would be help=
ful.
  =20
  Sorry about being lengthy, but I want to provide a complete picture.
  =20
  -Tom-

 	=09
---------------------------------
Do you Yahoo!?
 Everyone is raving about the  all-new Yahoo! Mail.
--0-92434573-1156907124=:99077
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<B><I>Peter Smith &lt;peter.smith@utsouthwestern.edu&gt;</I></B> wrote:  <B=
LOCKQUOTE class=3Dreplbq style=3D"PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORD=
ER-LEFT: #1010ff 2px solid">Tom+Dale wrote:<BR><BR>&gt; Greetings.<BR>&gt; =
I am hoping that some LVM experts can help me out. I have a partial <BR>&gt=
; volume group that spans two drives and I would like to recover the <BR>&g=
t; logical volume that was on it so that the data is accessible. The <BR>&g=
t; group (VolGroup00) was originally set up spanning part of one drive <BR>=
&gt; and all of the other drive (both IDE). The group was entirely applied =
<BR>&gt; to a single logical volume (LogVol00) to be mounted as /video. Thi=
s <BR>&gt; was working until I tried to make some changes and I fear that I=
 may <BR>&gt; have lost the data. I cannot seem to resolve this problem any=
where <BR>&gt; else. I have spent almost two weeks searching for clues and =
asking for <BR>&gt; help in other forums, but I do not yet have a solution.=
 I hope to
 <BR>&gt; provide all of the useful information below.<BR>&gt; *History*<BR=
>&gt; I am relatively new to linux, having built my own PVR using Fedora an=
d <BR>&gt; MythTV during the last year. I have relied heavily upon HowTos a=
nd <BR>&gt; guides written by other users. One of the guides that I followe=
d <BR>&gt; instructed me to set up XFS using LVM which would allow me to sp=
an <BR>&gt; multiple hard disks. Recently, I added a new SATA drive to my M=
ythTV <BR>&gt; system. The new drive was designated as /dev/sda. It appeare=
d to add <BR>&gt; into the existing volume group without any problem, thoug=
h I did not <BR>&gt; get it to the point where the space was accessible. I =
planned to <BR>&gt; further research that problem; however, the new hard dr=
ive failed <BR>&gt; before I got that far. Here=EF=BF=BDs what things looke=
d like after removing <BR>&gt; the drive:<BR>&gt; [root[at]mythserver ~]# p=
vdisplay<BR>&gt; Couldn't find device with uuid
 'fxlccO-4li0-nmyD-9avZ-Vc60-GGWX-jUhqOv'.<BR>&gt; Couldn't find device wit=
h uuid 'fxlccO-4li0-nmyD-9avZ-Vc60-GGWX-jUhqOv'.<BR>&gt; --- Physical volum=
e ---<BR>&gt; PV Name /dev/hda5<BR>&gt; VG Name VolGroup00<BR>&gt; PV Size =
66.12 GB / not usable 0<BR>&gt; Allocatable yes (but full)<BR>&gt; PE Size =
(KByte) 4096<BR>&gt; Total PE 16926<BR>&gt; Free PE 0<BR>&gt; Allocated PE =
16926<BR>&gt; PV UUID 317l2C-oay1-TWFG-5NTX-XJS3-vLal-Xh5bBL<BR>&gt;<BR>&gt=
; --- Physical volume ---<BR>&gt; PV Name /dev/hdb<BR>&gt; VG Name VolGroup=
00<BR>&gt; PV Size 298.09 GB / not usable 0<BR>&gt; Allocatable yes (but fu=
ll)<BR>&gt; PE Size (KByte) 4096<BR>&gt; Total PE 76311<BR>&gt; Free PE 0<B=
R>&gt; Allocated PE 76311<BR>&gt; PV UUID nfLxS1-0u3t-5Zr9-57iu-1oZe-Bkkd-7=
5SERQ<BR>&gt;<BR>&gt; --- Physical volume ---<BR>&gt; PV Name unknown devic=
e<BR>&gt; VG Name VolGroup00<BR>&gt; PV Size 232.88 GB / not usable 0<BR>&g=
t; Allocatable yes<BR>&gt; PE Size (KByte) 4096<BR>&gt; Total PE 59617<BR>&=
gt; Free PE
 225<BR>&gt; Allocated PE 59392<BR>&gt; PV UUID fxlccO-4li0-nmyD-9avZ-Vc60-=
GGWX-jUhqOv<BR>&gt;<BR>&gt;<BR>Tom. I'm sorry that not too many people have=
 looked into this with you.<BR><BR>First, what were the results of the "vgr=
educe --removemissing <BR>VolGroup00" command? I'm generating a theory here=
. That VolGroup00 had a <BR>single LV, LogVol00, and the disks /dev/hda5 an=
d /dev/hdb. Then--I'm <BR>guessing here--you did a "pvcreate /dev/sda" .. A=
nd followed that with a <BR>"vgextend VolGroup00 /dev/sda" .. Then perhaps =
did you do a "lvextend -l <BR><SOME number>/dev/VolGroup00 /dev/sda"? After=
 that, at some point, <BR>/dev/sda went dead. Am I close? Could you recount=
 to us what steps you <BR>took to "expand" the VG? I realize you may have b=
een asleep, but this <BR>data is crucial. When I do any LVM work I typicall=
y record all my input <BR>and output in a text editor and save it or print =
it out for safety..<BR><BR>So, the questions are:<BR>1) Was that LV the ONL=
Y LV in the
 VG?<BR>2) You did try to expand the LV to include /dev/sda?<BR>3) Did you =
use any GUI to do this? Or did you rely on the command line?<BR><BR>Peter</=
BLOCKQUOTE>  <div><BR>Peter,</div>  <div>&nbsp;</div>  <div>Thank you for y=
our reply...I wish I'd seen it _before_ complaining about no responses.&nbs=
p; My apologies to you and the other list members!&nbsp; </div>  <div>&nbsp=
;</div>  <div>In retrospect, I agree that documenting our LVM intrepid adve=
nture would have been smart.&nbsp; I confess that I cannot tell you precise=
ly what commands we gave to add the new (later failed) hard drive.&nbsp; Ho=
wever, your effort at retracing our steps sounds remarkably familiar.&nbsp;=
 I would say that it is essentially correct if not exactly.</div>  <div>&nb=
sp;</div>  <div>I'm not sure what the results of the "vgreduce --removemiss=
ing VolGroup00" command were other than that it appeared to me as though it=
 was successful.&nbsp; Would that be logged somewhere?</div>  <div>&nbsp;</=
div>  <div>1.
 Yes, initially VolGroup00 spanned /dev/hda5 and /dev/hdb.&nbsp; LogVol00 w=
as the only logical volume in VolGroup00, and it was using the entire space=
 of VolGroup00.</div>  <div>&nbsp;</div>  <div>2. Yes, we tried to expand t=
he LV to include /dev/sda but I think we were doing something wrong because=
 we couldn't seem to get the MythTV app to see more space available (see be=
low).</div>  <div>&nbsp;</div>  <div>3.&nbsp;No, no GUI tools.&nbsp; We wer=
e strictly using the command line in an xterm session.&nbsp; This is FC4 wi=
th xfce desktop (in case&nbsp;that matters).</div>  <div>&nbsp;</div>  <div=
>I think you are right:&nbsp; we added the drive using "pvcreate /dev/sda" =
and then we did "vgextend VolGroup00 /dev/sda" (those look&nbsp;right from&=
nbsp;what I remember...coming up on three weeks ago, now).&nbsp; So expandi=
ng the VG would have been accomplished at this point, right?&nbsp; I believ=
e we got to that point successfully.&nbsp; Now I'm not sure how we tried to=
 expand the
 LV, but I'm pretty sure that it did not work because we couldn't see the n=
ew space available from the MythTV app (it still reported the original volu=
me size for total disk space as if we'd made no addition).</div>  <div>&nbs=
p;</div>  <div>So we may have tried "lvextend -l" with parameters or perhap=
s we never figured that part out.&nbsp; You know, we were drinking lots of =
Diet Coke while searching the net and reading man pages, re-reading the LVM=
 HowTo, and trying different things...timidly.&nbsp; I'm certain that we co=
uld see from pvdisplay &amp; vgdisplay that we were close but not done yet.=
&nbsp; We quit for the night and I discovered the physical disk problem the=
 next afternoon.</div>  <div>&nbsp;</div>  <div>Two final comments:</div>  =
<div>&nbsp;</div>  <div>A) I can't get to the box right now, as I am travel=
ling this week.&nbsp; But I sincerely appreciate&nbsp;your assistance and I=
'll be able to&nbsp;access it&nbsp;after Saturday 02Sep06.</div>  <div>&nbs=
p;</div>=20
 <div>B) I remember seeing some archives and backups&nbsp;in an LVM&nbsp;di=
rectory not on the logical volume.&nbsp; Are these key to recovering the LV=
?&nbsp; It looks like people have posted the contents of these files in the=
 past (they look like programming code to me).&nbsp; I wasn't sure what to =
post or if they would be helpful.</div>  <div>&nbsp;</div>  <div>Sorry abou=
t being lengthy, but I want to provide a complete picture.</div>  <div>&nbs=
p;</div>  <div>-Tom-</div><p>&#32;
		<hr size=3D1>Do you Yahoo!?<br> Everyone is raving about the <a href=3D"h=
ttp://us.rd.yahoo.com/evt=3D42297/*http://advision.webevents.yahoo.com/mail=
beta"> all-new Yahoo! Mail.</a>
--0-92434573-1156907124=:99077--
