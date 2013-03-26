Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r2QIF0W5006024
	for <linux-lvm@redhat.com>; Tue, 26 Mar 2013 14:15:01 -0400
Received: from mail-bk0-f43.google.com (mail-bk0-f43.google.com
	[209.85.214.43])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2QIDbko014885
	for <linux-lvm@redhat.com>; Tue, 26 Mar 2013 14:13:38 -0400
Received: by mail-bk0-f43.google.com with SMTP id jm19so3430648bkc.2
	for <linux-lvm@redhat.com>; Tue, 26 Mar 2013 11:13:37 -0700 (PDT)
From: "=?iso-8859-1?Q?Bj=F6rn_Nadrowski?=" <bjrnfrdnnd@gmail.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_CFF26DB4-673E-41C2-83E9-A95288C7EB08"
Message-Id: <B19531EF-251A-44D3-9835-3FDB33A2908B@googlemail.com>
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
Date: Tue, 26 Mar 2013 19:13:34 +0100
References: <FAAB9C9B-FCA0-43CB-8B2C-F4F389941AAE@me.com>
	<533CFD97-2715-4B1C-A8C5-02161911747D@googlemail.com>
	<51509ECB.4050901@bmsi.com>
	<244E0086-C561-4034-BF26-31DFC419B72F@googlemail.com>
	<5150B555.4010207@bmsi.com>
	<0FEAF33E-7395-4820-9732-AFE70D3B5877@googlemail.com>
	<5150C1F8.8090107@bmsi.com>
	<CA+iDeo3WTK1gEiVzdmqA=kJ4nksZH-P76O1pBCL3MCTeme4zqg@mail.gmail.com>
	<5151A59B.5010909@bmsi.com>
In-Reply-To: <5151A59B.5010909@bmsi.com>
Subject: Re: [linux-lvm] vg disappeared after replacing disc in raid10
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>


--Apple-Mail=_CFF26DB4-673E-41C2-83E9-A95288C7EB08
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


On Mar 26, 2013, at 14:41 , Stuart D Gathman <stuart@bmsi.com> wrote:

> Long ago, Nostradamus foresaw that on 03/25/2013 05:45 PM, Bj=F6rn
> Nadrowski would write:
>> You were right,
>> the data has been overwritten.
>> It now reads thus (or rather, the first instance of human-readable
>> volume group description reads thus; my old volume group description
>> is still there, but further down...):
> Now you are getting somewhere.  The offset of your PV has shifted.=20
> First, copy that 2nd human readable part to removable media somewhere.=20=

> If possible, backup your drives (e.g. to USB drives) so you can =
recover
> from further mistakes.
>=20
> Why has the offset shifted?  Possibilities:
>=20
> 1) different md driver version on knoppix (although using an older
> version would move the md superblock from end of drive to beginning of
> drive - shifting the opposite way).  Or different options.  BUT mdadm
> seemed to recognize your RAID, so let's
> discount this theory.
>=20
> 2) alignment options to pvcreate - but it still should have been seen =
by
> lvs!
>=20
> 3) the offset hasn't shifted, but you've written over the first few
> sectors with the empty VG.  Is the 2nd human readable part, by any
> chance, missing the first part?  You could post both parts for us to
> look at.
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

Thanks for all these hints.=20
I can actually just restore the first bytes of the device as I saved the =
output of the original dd command to a file.=20

sudo dd if=3D/dev/md127 bs=3D512 count=3D255 skip=3D1 of=3Dmd0.txt

So I could just do=20
sudo dd if=3Dmd0.txt bs=3D512 count=3D255 skip=3D1 of=3D/dev/md127

Might this be the appropriate action?

I doubt that the entire array has shifted, as md0.txt contained two =
complete human-readable descriptions of my volume groups and my=20
logical volumes. This is the human-readable part of md0.txt (result of =
the dd command right after disc replacement):

------------------------------
vol0 {
id =3D "2daJft-nq2X-zJen-2VO1-c2Od-HREv-zyjKTz"
seqno =3D 7
status =3D ["RESIZEABLE", "READ", "WRITE"]
extent_size =3D 8192
max_lv =3D 0
max_pv =3D 0

physical_volumes {

pv0 {
id =3D "WFo1On-anFb-2av8-DuRq-vKee-nJEt-ZLnu26"
device =3D "/dev/md0"

status =3D ["ALLOCATABLE"]
dev_size =3D 5820316928
pe_start =3D 384
pe_count =3D 710487
}
}

logical_volumes {

root {
id =3D "iO0y32-L53R-msRI-3JiE-t7j1-Ija2-3SOnpC"
status =3D ["READ", "WRITE", "VISIBLE"]
segment_count =3D 1

segment1 {
start_extent =3D 0
extent_count =3D 11920

type =3D "striped"
stripe_count =3D 1	# linear

stripes =3D [
"pv0", 0
]
}
}

home {
id =3D "1Vk6QQ-c3NF-6z6h-zw7E-fkFU-mRWU-DKLM6t"
status =3D ["READ", "WRITE", "VISIBLE"]
segment_count =3D 1

segment1 {
start_extent =3D 0
extent_count =3D 674725

type =3D "striped"
stripe_count =3D 1	# linear

stripes =3D [
"pv0", 11920
]
}
}
}
}
# Generated by LVM2 version 2.02.39 (2008-06-27): Wed Jun 10 13:21:55 =
2009

contents =3D "Text Format Volume Group"
version =3D 1

description =3D ""

creation_host =3D "cn-b204-4"	# Linux cn-b204-4 2.6.28-11-generic =
#42-Ubuntu SMP Fri Apr 17 01:58:03 UTC 2009 x86_64
creation_time =3D 1244640115	# Wed Jun 10 13:21:55 2009






vol0 {
id =3D "2daJft-nq2X-zJen-2VO1-c2Od-HREv-zyjKTz"
seqno =3D 8
status =3D ["RESIZEABLE", "READ", "WRITE"]
extent_size =3D 8192
max_lv =3D 0
max_pv =3D 0

physical_volumes {

pv0 {
id =3D "WFo1On-anFb-2av8-DuRq-vKee-nJEt-ZLnu26"
device =3D "/dev/md0"

status =3D ["ALLOCATABLE"]
dev_size =3D 5820316928
pe_start =3D 384
pe_count =3D 710487
}
}

logical_volumes {

root {
id =3D "iO0y32-L53R-msRI-3JiE-t7j1-Ija2-3SOnpC"
status =3D ["READ", "WRITE", "VISIBLE"]
segment_count =3D 1

segment1 {
start_extent =3D 0
extent_count =3D 11920

type =3D "striped"
stripe_count =3D 1	# linear

stripes =3D [
"pv0", 0
]
}
}

home {
id =3D "1Vk6QQ-c3NF-6z6h-zw7E-fkFU-mRWU-DKLM6t"
status =3D ["READ", "WRITE", "VISIBLE"]
segment_count =3D 1

segment1 {
start_extent =3D 0
extent_count =3D 674725

type =3D "striped"
stripe_count =3D 1	# linear

stripes =3D [
"pv0", 11920
]
}
}

empty {
id =3D "YToY9o-223w-nMrv-X5qU-0S8t-oUbG-Zk6ZmV"
status =3D ["READ", "WRITE", "VISIBLE"]
segment_count =3D 1

segment1 {
start_extent =3D 0
extent_count =3D 23842

type =3D "striped"
stripe_count =3D 1	# linear

stripes =3D [
"pv0", 686645
]
}
}
}
}
# Generated by LVM2 version 2.02.39 (2008-06-27): Wed Jun 10 13:22:04 =
2009

contents =3D "Text Format Volume Group"
version =3D 1

description =3D ""

creation_host =3D "cn-b204-4"	# Linux cn-b204-4 2.6.28-11-generic =
#42-Ubuntu SMP Fri Apr 17 01:58:03 UTC 2009 x86_64
creation_time =3D 1244640124	# Wed Jun 10 13:22:04 2009

---------------------------

This is the human-readable part of the beginning of the device after my =
vgcreate action:

---------------------------

vol0 {
id =3D "8kEHPL-yDuF-7ffg-GeGH-dEg6-D0Qn-lUrKoh"
seqno =3D 1
format =3D "lvm2" # informational
status =3D ["RESIZEABLE", "READ", "WRITE"]
flags =3D []
extent_size =3D 8192
max_lv =3D 0
max_pv =3D 0
metadata_copies =3D 0

physical_volumes {

pv0 {
id =3D "WFo1On-anFb-2av8-DuRq-vKee-nJEt-ZLnu26"
device =3D "/dev/md127"

status =3D ["ALLOCATABLE"]
flags =3D []
dev_size =3D 5820316928
pe_start =3D 384
pe_count =3D 710487
}
}

}
# Generated by LVM2 version 2.02.95(2) (2012-03-06): Sun Mar 24 23:39:50 =
2013

contents =3D "Text Format Volume Group"
version =3D 1

description =3D ""

creation_host =3D "Microknoppix"	# Linux Microknoppix 3.6.11 #12 =
SMP PREEMPT Thu Dec 20 04:04:10 CET 2012 i686
creation_time =3D 1364168390	# Sun Mar 24 23:39:50 2013




vol0 {
id =3D "2daJft-nq2X-zJen-2VO1-c2Od-HREv-zyjKTz"
seqno =3D 8
status =3D ["RESIZEABLE", "READ", "WRITE"]
extent_size =3D 8192
max_lv =3D 0
max_pv =3D 0

physical_volumes {

pv0 {
id =3D "WFo1On-anFb-2av8-DuRq-vKee-nJEt-ZLnu26"
device =3D "/dev/md0"

status =3D ["ALLOCATABLE"]
dev_size =3D 5820316928
pe_start =3D 384
pe_count =3D 710487
}
}

logical_volumes {

root {
id =3D "iO0y32-L53R-msRI-3JiE-t7j1-Ija2-3SOnpC"
status =3D ["READ", "WRITE", "VISIBLE"]
segment_count =3D 1

segment1 {
start_extent =3D 0
extent_count =3D 11920

type =3D "striped"
stripe_count =3D 1	# linear

stripes =3D [
"pv0", 0
]
}
}

home {
id =3D "1Vk6QQ-c3NF-6z6h-zw7E-fkFU-mRWU-DKLM6t"
status =3D ["READ", "WRITE", "VISIBLE"]
segment_count =3D 1

segment1 {
start_extent =3D 0
extent_count =3D 674725

type =3D "striped"
stripe_count =3D 1	# linear

stripes =3D [
"pv0", 11920
]
}
}

empty {
id =3D "YToY9o-223w-nMrv-X5qU-0S8t-oUbG-Zk6ZmV"
status =3D ["READ", "WRITE", "VISIBLE"]
segment_count =3D 1

segment1 {
start_extent =3D 0
extent_count =3D 23842

type =3D "striped"
stripe_count =3D 1	# linear

stripes =3D [
"pv0", 686645
]
}
}
}
}
# Generated by LVM2 version 2.02.39 (2008-06-27): Wed Jun 10 13:22:04 =
2009

contents =3D "Text Format Volume Group"
version =3D 1

description =3D ""

creation_host =3D "cn-b204-4"	# Linux cn-b204-4 2.6.28-11-generic =
#42-Ubuntu SMP Fri Apr 17 01:58:03 UTC 2009 x86_64
creation_time =3D 1244640124	# Wed Jun 10 13:22:04 2009


---------------------------------

It seems, in both cases I have the description of the two last =
configurations of my volume group. The first one is the actual one.=20
Both are complete.

So, should I rewrite the beginning of the device with the dd command?

What then?

Thanks a lot for all your help!





--Apple-Mail=_CFF26DB4-673E-41C2-83E9-A95288C7EB08
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=iso-8859-1

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Diso-8859-1"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; =
"><br><div><div>On Mar 26, 2013, at 14:41 , Stuart D Gathman &lt;<a =
href=3D"mailto:stuart@bmsi.com">stuart@bmsi.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><blockquote type=3D"cite">Long ago, =
Nostradamus foresaw that on 03/25/2013 05:45 PM, Bj=F6rn<br>Nadrowski =
would write:<br><blockquote type=3D"cite">You were right,<br>the data =
has been overwritten.<br>It now reads thus (or rather, the first =
instance of human-readable<br>volume group description reads thus; my =
old volume group description<br>is still there, but further =
down...):<br></blockquote>Now you are getting somewhere. &nbsp;The =
offset of your PV has shifted. <br>First, copy that 2nd human readable =
part to removable media somewhere. <br>If possible, backup your drives =
(e.g. to USB drives) so you can recover<br>from further =
mistakes.<br><br>Why has the offset shifted? =
&nbsp;Possibilities:<br><br>1) different md driver version on knoppix =
(although using an older<br>version would move the md superblock from =
end of drive to beginning of<br>drive - shifting the opposite way). =
&nbsp;Or different options. &nbsp;BUT mdadm<br>seemed to recognize your =
RAID, so let's<br>discount this theory.<br><br>2) alignment options to =
pvcreate - but it still should have been seen by<br>lvs!<br><br>3) the =
offset hasn't shifted, but you've written over the first few<br>sectors =
with the empty VG. &nbsp;Is the 2nd human readable part, by =
any<br>chance, missing the first part? &nbsp;You could post both parts =
for us to<br>look =
at.<br><br>_______________________________________________<br>linux-lvm =
mailing list<br><a =
href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>https://w=
ww.redhat.com/mailman/listinfo/linux-lvm<br>read the LVM HOW-TO at =
http://tldp.org/HOWTO/LVM-HOWTO/<br></blockquote><br></div><div>Thanks =
for all these hints.&nbsp;</div><div>I can actually just restore the =
first bytes of the device as I saved the output of the original dd =
command to a file.&nbsp;</div><div><br></div><div><pre =
class=3D"bbcode_code" style=3D"margin-top: 0px; margin-bottom: 0px; =
padding: 6px; font-family: 'Ubuntu Mono', monospace; line-height: 14px; =
border: 1px inset; text-align: left; overflow: auto; direction: ltr; =
background-image: none; background-color: rgb(239, 239, 239); font-size: =
14px; height: 36px; background-repeat: repeat no-repeat; ">sudo dd =
if=3D/dev/md127 bs=3D512 count=3D255 skip=3D1 =
of=3Dmd0.txt</pre><div><br></div></div><div>So I could just =
do&nbsp;</div><div><pre class=3D"bbcode_code" style=3D"margin-top: 0px; =
margin-bottom: 0px; padding: 6px; font-family: 'Ubuntu Mono', monospace; =
line-height: 14px; border: 1px inset; text-align: left; overflow: auto; =
direction: ltr; background-image: none; background-color: rgb(239, 239, =
239); font-size: 14px; height: 36px; background-repeat: repeat =
no-repeat; ">sudo dd if=3Dmd0.txt bs=3D512 count=3D255 skip=3D1 =
of=3D/dev/md127</pre><div><br></div></div><div>Might this be the =
appropriate action?</div><div><br></div><div>I doubt that the entire =
array has shifted, as md0.txt contained two complete human-readable =
descriptions of my volume groups and my&nbsp;</div><div>logical volumes. =
This is the human-readable part of md0.txt (result of the dd command =
right after disc =
replacement):</div><div><br></div><div>------------------------------</div=
><div><div>vol0 {</div><div>id =3D =
"2daJft-nq2X-zJen-2VO1-c2Od-HREv-zyjKTz"</div><div>seqno =3D =
7</div><div>status =3D ["RESIZEABLE", "READ", =
"WRITE"]</div><div>extent_size =3D 8192</div><div>max_lv =3D =
0</div><div>max_pv =3D 0</div><div><br></div><div>physical_volumes =
{</div><div><br></div><div>pv0 {</div><div>id =3D =
"WFo1On-anFb-2av8-DuRq-vKee-nJEt-ZLnu26"</div><div>device =3D =
"/dev/md0"</div><div><br></div><div>status =3D =
["ALLOCATABLE"]</div><div>dev_size =3D 5820316928</div><div>pe_start =3D =
384</div><div>pe_count =3D =
710487</div><div>}</div><div>}</div><div><br></div><div>logical_volumes =
{</div><div><br></div><div>root {</div><div>id =3D =
"iO0y32-L53R-msRI-3JiE-t7j1-Ija2-3SOnpC"</div><div>status =3D ["READ", =
"WRITE", "VISIBLE"]</div><div>segment_count =3D =
1</div><div><br></div><div>segment1 {</div><div>start_extent =3D =
0</div><div>extent_count =3D 11920</div><div><br></div><div>type =3D =
"striped"</div><div>stripe_count =3D 1<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span># =
linear</div><div><br></div><div>stripes =3D [</div><div>"pv0", =
0</div><div>]</div><div>}</div><div>}</div><div><br></div><div>home =
{</div><div>id =3D =
"1Vk6QQ-c3NF-6z6h-zw7E-fkFU-mRWU-DKLM6t"</div><div>status =3D ["READ", =
"WRITE", "VISIBLE"]</div><div>segment_count =3D =
1</div><div><br></div><div>segment1 {</div><div>start_extent =3D =
0</div><div>extent_count =3D 674725</div><div><br></div><div>type =3D =
"striped"</div><div>stripe_count =3D 1<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span># =
linear</div><div><br></div><div>stripes =3D [</div><div>"pv0", =
11920</div><div>]</div><div>}</div><div>}</div><div>}</div><div>}</div><di=
v># Generated by LVM2 version 2.02.39 (2008-06-27): Wed Jun 10 13:21:55 =
2009</div><div><br></div><div>contents =3D "Text Format Volume =
Group"</div><div>version =3D 1</div><div><br></div><div>description =3D =
""</div><div><br></div><div>creation_host =3D "cn-b204-4"<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span># Linux =
cn-b204-4 2.6.28-11-generic #42-Ubuntu SMP Fri Apr 17 01:58:03 UTC 2009 =
x86_64</div><div>creation_time =3D 1244640115<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span># Wed Jun =
10 13:21:55 =
2009</div><div><br></div><div><br></div><div><br></div><div><br></div><div=
><br></div><div><br></div><div><div>vol0 {</div><div>id =3D =
"2daJft-nq2X-zJen-2VO1-c2Od-HREv-zyjKTz"</div><div>seqno =3D =
8</div><div>status =3D ["RESIZEABLE", "READ", =
"WRITE"]</div><div>extent_size =3D 8192</div><div>max_lv =3D =
0</div><div>max_pv =3D 0</div><div><br></div><div>physical_volumes =
{</div><div><br></div><div>pv0 {</div><div>id =3D =
"WFo1On-anFb-2av8-DuRq-vKee-nJEt-ZLnu26"</div><div>device =3D =
"/dev/md0"</div><div><br></div><div>status =3D =
["ALLOCATABLE"]</div><div>dev_size =3D 5820316928</div><div>pe_start =3D =
384</div><div>pe_count =3D =
710487</div><div>}</div><div>}</div><div><br></div><div>logical_volumes =
{</div><div><br></div><div>root {</div><div>id =3D =
"iO0y32-L53R-msRI-3JiE-t7j1-Ija2-3SOnpC"</div><div>status =3D ["READ", =
"WRITE", "VISIBLE"]</div><div>segment_count =3D =
1</div><div><br></div><div>segment1 {</div><div>start_extent =3D =
0</div><div>extent_count =3D 11920</div><div><br></div><div>type =3D =
"striped"</div><div>stripe_count =3D 1<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span># =
linear</div><div><br></div><div>stripes =3D [</div><div>"pv0", =
0</div><div>]</div><div>}</div><div>}</div><div><br></div><div>home =
{</div><div>id =3D =
"1Vk6QQ-c3NF-6z6h-zw7E-fkFU-mRWU-DKLM6t"</div><div>status =3D ["READ", =
"WRITE", "VISIBLE"]</div><div>segment_count =3D =
1</div><div><br></div><div>segment1 {</div><div>start_extent =3D =
0</div><div>extent_count =3D 674725</div><div><br></div><div>type =3D =
"striped"</div><div>stripe_count =3D 1<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span># =
linear</div><div><br></div><div>stripes =3D [</div><div>"pv0", =
11920</div><div>]</div><div>}</div><div>}</div><div><br></div><div>empty =
{</div><div>id =3D =
"YToY9o-223w-nMrv-X5qU-0S8t-oUbG-Zk6ZmV"</div><div>status =3D ["READ", =
"WRITE", "VISIBLE"]</div><div>segment_count =3D =
1</div><div><br></div><div>segment1 {</div><div>start_extent =3D =
0</div><div>extent_count =3D 23842</div><div><br></div><div>type =3D =
"striped"</div><div>stripe_count =3D 1<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span># =
linear</div><div><br></div><div>stripes =3D [</div><div>"pv0", =
686645</div><div>]</div><div>}</div><div>}</div><div>}</div><div>}</div><d=
iv># Generated by LVM2 version 2.02.39 (2008-06-27): Wed Jun 10 13:22:04 =
2009</div><div><br></div><div>contents =3D "Text Format Volume =
Group"</div><div>version =3D 1</div><div><br></div><div>description =3D =
""</div><div><br></div><div>creation_host =3D "cn-b204-4"<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span># Linux =
cn-b204-4 2.6.28-11-generic #42-Ubuntu SMP Fri Apr 17 01:58:03 UTC 2009 =
x86_64</div><div>creation_time =3D 1244640124<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span># Wed Jun =
10 13:22:04 =
2009</div><div><br></div><div>---------------------------</div><div><br></=
div><div>This is the human-readable part of the beginning of the device =
after my vgcreate =
action:</div><div><br></div><div>---------------------------</div><div><br=
></div><div><div>vol0 {</div><div>id =3D =
"8kEHPL-yDuF-7ffg-GeGH-dEg6-D0Qn-lUrKoh"</div><div>seqno =3D =
1</div><div>format =3D "lvm2" # informational</div><div>status =3D =
["RESIZEABLE", "READ", "WRITE"]</div><div>flags =3D =
[]</div><div>extent_size =3D 8192</div><div>max_lv =3D =
0</div><div>max_pv =3D 0</div><div>metadata_copies =3D =
0</div><div><br></div><div>physical_volumes =
{</div><div><br></div><div>pv0 {</div><div>id =3D =
"WFo1On-anFb-2av8-DuRq-vKee-nJEt-ZLnu26"</div><div>device =3D =
"/dev/md127"</div><div><br></div><div>status =3D =
["ALLOCATABLE"]</div><div>flags =3D []</div><div>dev_size =3D =
5820316928</div><div>pe_start =3D 384</div><div>pe_count =3D =
710487</div><div>}</div><div>}</div><div><br></div><div>}</div><div># =
Generated by LVM2 version 2.02.95(2) (2012-03-06): Sun Mar 24 23:39:50 =
2013</div><div><br></div><div>contents =3D "Text Format Volume =
Group"</div><div>version =3D 1</div><div><br></div><div>description =3D =
""</div><div><br></div><div>creation_host =3D "Microknoppix"<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span># Linux =
Microknoppix 3.6.11 #12 SMP PREEMPT Thu Dec 20 04:04:10 CET 2012 =
i686</div><div>creation_time =3D 1364168390<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span># Sun Mar 24 23:39:50 =
2013</div><div><br></div><div><br></div><div><br></div><div><br></div><div=
><div>vol0 {</div><div>id =3D =
"2daJft-nq2X-zJen-2VO1-c2Od-HREv-zyjKTz"</div><div>seqno =3D =
8</div><div>status =3D ["RESIZEABLE", "READ", =
"WRITE"]</div><div>extent_size =3D 8192</div><div>max_lv =3D =
0</div><div>max_pv =3D 0</div><div><br></div><div>physical_volumes =
{</div><div><br></div><div>pv0 {</div><div>id =3D =
"WFo1On-anFb-2av8-DuRq-vKee-nJEt-ZLnu26"</div><div>device =3D =
"/dev/md0"</div><div><br></div><div>status =3D =
["ALLOCATABLE"]</div><div>dev_size =3D 5820316928</div><div>pe_start =3D =
384</div><div>pe_count =3D =
710487</div><div>}</div><div>}</div><div><br></div><div>logical_volumes =
{</div><div><br></div><div>root {</div><div>id =3D =
"iO0y32-L53R-msRI-3JiE-t7j1-Ija2-3SOnpC"</div><div>status =3D ["READ", =
"WRITE", "VISIBLE"]</div><div>segment_count =3D =
1</div><div><br></div><div>segment1 {</div><div>start_extent =3D =
0</div><div>extent_count =3D 11920</div><div><br></div><div>type =3D =
"striped"</div><div>stripe_count =3D 1<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span># =
linear</div><div><br></div><div>stripes =3D [</div><div>"pv0", =
0</div><div>]</div><div>}</div><div>}</div><div><br></div><div>home =
{</div><div>id =3D =
"1Vk6QQ-c3NF-6z6h-zw7E-fkFU-mRWU-DKLM6t"</div><div>status =3D ["READ", =
"WRITE", "VISIBLE"]</div><div>segment_count =3D =
1</div><div><br></div><div>segment1 {</div><div>start_extent =3D =
0</div><div>extent_count =3D 674725</div><div><br></div><div>type =3D =
"striped"</div><div>stripe_count =3D 1<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span># =
linear</div><div><br></div><div>stripes =3D [</div><div>"pv0", =
11920</div><div>]</div><div>}</div><div>}</div><div><br></div><div>empty =
{</div><div>id =3D =
"YToY9o-223w-nMrv-X5qU-0S8t-oUbG-Zk6ZmV"</div><div>status =3D ["READ", =
"WRITE", "VISIBLE"]</div><div>segment_count =3D =
1</div><div><br></div><div>segment1 {</div><div>start_extent =3D =
0</div><div>extent_count =3D 23842</div><div><br></div><div>type =3D =
"striped"</div><div>stripe_count =3D 1<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span># =
linear</div><div><br></div><div>stripes =3D [</div><div>"pv0", =
686645</div><div>]</div><div>}</div><div>}</div><div>}</div><div>}</div><d=
iv># Generated by LVM2 version 2.02.39 (2008-06-27): Wed Jun 10 13:22:04 =
2009</div><div><br></div><div>contents =3D "Text Format Volume =
Group"</div><div>version =3D 1</div><div><br></div><div>description =3D =
""</div><div><br></div><div>creation_host =3D "cn-b204-4"<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span># Linux =
cn-b204-4 2.6.28-11-generic #42-Ubuntu SMP Fri Apr 17 01:58:03 UTC 2009 =
x86_64</div><div>creation_time =3D 1244640124<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span># Wed Jun =
10 13:22:04 =
2009</div><div><br></div><div><br></div><div>-----------------------------=
----</div><div><br></div><div>It seems, in both cases I have the =
description of the two last configurations of my volume group. The first =
one is the actual one.&nbsp;</div><div>Both are =
complete.</div><div><br></div><div>So, should I rewrite the beginning of =
the device with the dd command?</div><div><br></div><div>What =
then?</div><div><br></div><div>Thanks a lot for all your =
help!</div><div><br></div><div><br></div></div></div></div></div><div><br>=
</div><div><br></div></body></html>=

--Apple-Mail=_CFF26DB4-673E-41C2-83E9-A95288C7EB08--
