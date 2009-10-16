Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9G5hV99025633
	for <linux-lvm@redhat.com>; Fri, 16 Oct 2009 01:43:31 -0400
Received: from mail-fx0-f209.google.com (mail-fx0-f209.google.com
	[209.85.220.209])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9G5hKQB001606
	for <linux-lvm@redhat.com>; Fri, 16 Oct 2009 01:43:20 -0400
Received: by fxm5 with SMTP id 5so214555fxm.3
	for <linux-lvm@redhat.com>; Thu, 15 Oct 2009 22:43:19 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 16 Oct 2009 11:13:19 +0530
Message-ID: <d711080c0910152243n78b7c17dycf1f0f7ee8067fb9@mail.gmail.com>
From: Gopala Krishna <gopalakrishna.n.m@gmail.com>
Content-Type: multipart/alternative; boundary=00032555488e918373047606df59
Subject: [linux-lvm] Few doubts related to LVM 2 striping
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
To: linux-lvm@redhat.com

--00032555488e918373047606df59
Content-Type: text/plain; charset=ISO-8859-1

Hi,
I would like to know little more details on how LV stripe is spreadout on
available devices in a VG.

I have created a logical volume and the lvdisplay -v -m output is shown
below. From this out put no information about the stripes spread out. it is
giving column information but it is not giving where each stripe lies.

Look at the lvdisplay output  below. I have created VG with default PE size
of 4 MB and then created striped LV of stripe width 4 KB.

root:~ # lvdisplay -v -m /dev/vg1/lv1
    Using logical volume(s) on command line
  --- Logical volume ---
  LV Name                /dev/vg1/lv1
  VG Name                vg1
  LV UUID                wIwIAU-Lq8J-Cva9-0eyb-fECN-h5TS-nrMUMu
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                1008.00 MB
  Current LE             252
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:7
  --- Segments ---
  Logical extent 0 to 251:
    Type                striped
    Stripes             3
    Stripe size         4 KB
    Stripe 0:
      Physical volume   /dev/sdm
      Physical extents  0 to 83
    Stripe 1:
      Physical volume   /dev/sdl
      Physical extents  0 to 83
    Stripe 2:
      Physical volume   /dev/sdk
      Physical extents  0 to 83


Here the stripe stripe width is 4 KB and there are 3 stripe columns. I would
like to know how each stripe width is distributed. does it distributed round
robin fashion among the devices or anything else? Above output gives only
column information. Is there any command or an option I can use to get to
know more on stripes spreadout?

For example, in above case, LE/PE size is 4 MB(look at the vgdisplay output
shown below)

So my question is:
 does the stripe spreads out as follow?
first 4 KB (stripe width) sits on /dev/sdm, PE 0 and next 4 KB on /dev/sdl
andPE 0 and 3 rd stripe gets in to 0 th PE of /dev/sdk and then again this
process repeates and start occypying 0 th PE of /dev/sdm and so on. When it
finishes with 0 th PE (4 MB)  of each device, then corresponding stripe
occupies .

Following is a representation of above statement:

stripe-1           PE: 0    /dev/sdm
stripe-2           PE:0    /dev/sdl
stripe-3           PE:0    /dev/sdk
stripe-4           PE:0    /dev/sdm
stripe-5           PE:0    /dev/sdl
;
;
stripe-xx         PE:1   /dev/sdm
stripe-xx+1     PE:1   /dev/sdl
stripe-XX+2     PE:1   /dev/sdk
stripe-xx+3     PE:1   /dev/sdm


OR

First few sets of 4 KB  stripes (i.e PE size/ stripe width) occupies
/dev/sdm and next set of stripes /dev/sdl and then /dev/sdk and comes back
to /dev/sdm. i.e it continuously writes so many stripes to align to PE size.


Following is a representation of above statement:
stripe-1      PE:0     /dev/sdm
stripe-2      PE:0     /dev/sdm
;
stripe-x      PE:0    /dev/sdm

stripe-x+1  PE:0 /dev/sdl
stripe-X+2  PE:0 /dev/sdl
;
;
stripe-y     PE:0  /dev/sdl

stripe-y+1  PE:0  /dev/sdk
;
stripe-z      PE:0  /dev/sdk

stripe-z+1  PE:1  /dev/sdm           (repeates with physical extent of each
device)
stripe-Z+2  PE:1  /dev/sdm
;
;

i.e stripes are going to occupy on the device until at least 1 PE is fulll
before mnoving to next device.

OR
Does it something different from both of these. If so how to identify where
exactly particular stripe of data lies on which disk of the VG. Is there any
command or metadata dump or debug info where I can get those information?

Please let me know. Thanks for your time.

Thanks,
Gopal.


====================vgdisplay output====
spea64:~ # vgdisplay -v /dev/vg1
    Using volume group(s) on command line
    Finding volume group "vg1"
  --- Volume group ---
  VG Name               vg1
  System ID
  Format                lvm2
  Metadata Areas        4
  Metadata Sequence No  8
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                1
  Open LV               0
  Max PV                0
  Cur PV                4
  Act PV                4
  VG Size               1.94 GB
  PE Size               4.00 MB
  Total PE              496
  Alloc PE / Size       252 / 1008.00 MB
  Free  PE / Size       244 / 976.00 MB
  VG UUID               dp2pO1-qqNQ-BRrM-jrZ8-zkbo-y7OF-CgS5eo

--00032555488e918373047606df59
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi,</div>
<div>I would like to know little more details on how LV stripe is spreadout=
 on available devices in a VG.</div>
<div>=A0</div>
<div>I have created a logical volume and the lvdisplay -v -m output is show=
n below. From this out put no information about the stripes spread out. it =
is giving column information but it is not giving where each stripe lies.</=
div>

<div>=A0</div>
<div>Look at the lvdisplay output=A0=A0below. I have created VG with defaul=
t PE size of 4 MB and then created striped LV of stripe width 4 KB. </div>
<div>=A0</div>
<div>root:~ # lvdisplay -v -m /dev/vg1/lv1<br>=A0=A0=A0 Using logical volum=
e(s) on command line<br>=A0 --- Logical volume ---<br>=A0 LV Name=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /dev/vg1/lv1<br>=A0 VG Name=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 vg1<br>=A0 LV UUID=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 wIwIAU-Lq8J-Cva9-0eyb-fECN-h5TS-nrMUMu<br>
=A0 LV Write Access=A0=A0=A0=A0=A0=A0=A0 read/write<br>=A0 LV Status=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 available<br>=A0 # open=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0<br>=A0 LV Size=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 1008.00 MB<br>=A0 Current LE=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 252<br>=A0 Segments=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1<b=
r>=A0 Allocation=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 inherit<br>
=A0 Read ahead sectors=A0=A0=A0=A0 0<br>=A0 Block device=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 253:7</div>
<div>=A0 --- Segments ---<br>=A0 Logical extent 0 to 251:<br>=A0=A0=A0 Type=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 striped<br>=A0=A0=A0 Stripes=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 3<br>=A0=A0=A0 Stripe size=A0=A0=A0=A0=
=A0=A0=A0=A0 4 KB<br>=A0=A0=A0 Stripe 0:<br>=A0=A0=A0=A0=A0 Physical volume=
=A0=A0 /dev/sdm<br>=A0=A0=A0=A0=A0 Physical extents=A0 0 to 83<br>
=A0=A0=A0 Stripe 1:<br>=A0=A0=A0=A0=A0 Physical volume=A0=A0 /dev/sdl<br>=
=A0=A0=A0=A0=A0 Physical extents=A0 0 to 83<br>=A0=A0=A0 Stripe 2:<br>=A0=
=A0=A0=A0=A0 Physical volume=A0=A0 /dev/sdk<br>=A0=A0=A0=A0=A0 Physical ext=
ents=A0 0 to 83</div>
<div>=A0</div>
<div>=A0</div>
<div>Here the stripe stripe width is 4 KB and there are 3 stripe columns. I=
 would like to know how each stripe width is distributed. does it distribut=
ed round robin fashion among the devices or anything else? Above output giv=
es only column information. Is there any command or an option I can use to =
get to know more on stripes spreadout?</div>

<div>=A0</div>
<div>For example, in above case, LE/PE size is 4 MB(look at the vgdisplay o=
utput shown below)</div>
<div>=A0</div>
<div>So my question is:</div>
<div>=A0does the stripe spreads out as follow?</div>
<div>first 4 KB (stripe width) sits on /dev/sdm,=A0PE 0 and next 4 KB on /d=
ev/sdl andPE 0 and 3 rd stripe gets in to 0 th PE of /dev/sdk and then agai=
n this process repeates and start occypying 0 th PE of /dev/sdm and so on. =
When it finishes with 0 th PE (4 MB) =A0of each device, then corresponding =
stripe occupies .</div>

<div>=A0</div>
<div>Following is a representation of above statement:</div>
<div>=A0</div>
<div>stripe-1=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0PE: 0=A0=A0=A0 /dev/sdm</div>
<div>stripe-2=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 PE:0=A0=A0=A0 /dev/sdl</div>
<div>stripe-3=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 PE:0=A0=A0=A0 /dev/sdk</div>
<div>stripe-4=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 PE:0=A0=A0=A0 /dev/sdm</div>
<div>stripe-5=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 PE:0=A0=A0=A0 /dev/sdl</div>
<div>;</div>
<div>;</div>
<div>stripe-xx=A0=A0=A0=A0=A0=A0=A0=A0 PE:1=A0=A0 /dev/sdm</div>
<div>stripe-xx+1=A0=A0=A0=A0 PE:1=A0=A0 /dev/sdl</div>
<div>stripe-XX+2=A0=A0=A0=A0 PE:1=A0=A0 /dev/sdk</div>
<div>stripe-xx+3=A0=A0=A0=A0 PE:1=A0=A0 /dev/sdm</div>
<div>=A0</div>
<div>=A0</div>
<div>OR</div>
<div>=A0</div>
<div>First few sets of 4 KB=A0 stripes (i.e PE size/ stripe width) occupies=
 /dev/sdm and next set of stripes /dev/sdl and then /dev/sdk and comes back=
 to /dev/sdm. i.e it continuously writes so many stripes to align to PE siz=
e.</div>

<div>=A0</div>
<div>=A0</div>
<div>Following is a representation of above statement:</div>
<div>stripe-1=A0=A0=A0=A0=A0 PE:0=A0=A0=A0=A0 /dev/sdm</div>
<div>stripe-2=A0=A0=A0=A0=A0 PE:0=A0=A0=A0=A0 /dev/sdm</div>
<div>;</div>
<div>stripe-x=A0=A0=A0=A0=A0 PE:0=A0=A0=A0 /dev/sdm</div>
<div>=A0</div>
<div>stripe-x+1=A0 PE:0 /dev/sdl</div>
<div>stripe-X+2=A0 PE:0=A0/dev/sdl</div>
<div>;</div>
<div>;</div>
<div>stripe-y=A0=A0=A0=A0 PE:0=A0 /dev/sdl</div>
<div>=A0</div>
<div>stripe-y+1=A0 PE:0=A0 /dev/sdk</div>
<div>;</div>
<div>stripe-z=A0=A0=A0=A0=A0 PE:0=A0 /dev/sdk</div>
<div>=A0</div>
<div>stripe-z+1=A0 PE:1=A0 /dev/sdm=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (repeates=
 with physical extent of each device)</div>
<div>stripe-Z+2=A0 PE:1=A0 /dev/sdm</div>
<div>;</div>
<div>;</div>
<div>=A0</div>
<div>i.e stripes are going to occupy on the device until at least 1 PE is f=
ulll before mnoving to next device.</div>
<div>=A0</div>
<div>OR</div>
<div>Does it something different from both of these. If so how to identify =
where exactly particular stripe of data lies on which disk of the VG. Is th=
ere any command or metadata dump or debug info where I can get those inform=
ation?</div>

<div>=A0</div>
<div>Please let me know. Thanks for your time.</div>
<div>=A0</div>
<div>Thanks,</div>
<div>Gopal.<br></div>
<div>=A0</div>
<div>=A0</div>
<div>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3Dvgdisplay =
output=3D=3D=3D=3D</div>
<div>spea64:~ # vgdisplay -v /dev/vg1<br>=A0=A0=A0 Using volume group(s) on=
 command line<br>=A0=A0=A0 Finding volume group &quot;vg1&quot;<br>=A0 --- =
Volume group ---<br>=A0 VG Name=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 v=
g1<br>=A0 System ID<br>=A0 Format=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 lvm2<br>
=A0 Metadata Areas=A0=A0=A0=A0=A0=A0=A0 4<br>=A0 Metadata Sequence No=A0 8<=
br>=A0 VG Access=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 read/write<br>=A0 VG S=
tatus=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 resizable<br>=A0 MAX LV=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0<br>=A0 Cur LV=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 1<br>=A0 Open LV=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 0<br>=A0 Max PV=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0<br=
>
=A0 Cur PV=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 4<br>=A0 Act PV=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 4<br>=A0 VG Size=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 1.94 GB<br>=A0 PE Size=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 4.00 MB<br>=A0 Total PE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 496<br>=A0 Alloc PE / Size=A0=A0=A0=A0=A0=A0 252 / 1008.00 MB<br>=A0=
 Free=A0 PE / Size=A0=A0=A0=A0=A0=A0 244 / 976.00 MB<br>
=A0 VG UUID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dp2pO1-qqNQ-BRrM-jrZ8=
-zkbo-y7OF-CgS5eo<br></div>
<div>=A0</div>
<div>=A0</div>
<div>=A0</div>

--00032555488e918373047606df59--
