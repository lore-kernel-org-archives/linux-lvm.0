Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r2RNdfqN019192
	for <linux-lvm@redhat.com>; Wed, 27 Mar 2013 19:39:41 -0400
Received: from mail-bk0-f47.google.com (mail-bk0-f47.google.com
	[209.85.214.47])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2RNddpc003247
	for <linux-lvm@redhat.com>; Wed, 27 Mar 2013 19:39:40 -0400
Received: by mail-bk0-f47.google.com with SMTP id ik5so1793880bkc.20
	for <linux-lvm@redhat.com>; Wed, 27 Mar 2013 16:39:39 -0700 (PDT)
From: "=?iso-8859-1?Q?Bj=F6rn_Nadrowski?=" <bjrnfrdnnd@gmail.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_0A9AC252-FFAA-4F84-A600-EA8997559E10"
Message-Id: <A2373632-423B-435E-96D3-C52E46D19116@googlemail.com>
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
Date: Thu, 28 Mar 2013 00:39:35 +0100
References: <FAAB9C9B-FCA0-43CB-8B2C-F4F389941AAE@me.com>
	<533CFD97-2715-4B1C-A8C5-02161911747D@googlemail.com>
	<51509ECB.4050901@bmsi.com>
	<244E0086-C561-4034-BF26-31DFC419B72F@googlemail.com>
	<5150B555.4010207@bmsi.com>
	<0FEAF33E-7395-4820-9732-AFE70D3B5877@googlemail.com>
	<5150C1F8.8090107@bmsi.com>
	<CA+iDeo3Z80XNNzW4v9jwp4VuCi+L18RADtAi5WVcRXD68E8k3g@mail.gmail.com>
	<515351B4.8080804@bmsi.com>
In-Reply-To: <515351B4.8080804@bmsi.com>
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


--Apple-Mail=_0A9AC252-FFAA-4F84-A600-EA8997559E10
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252

I recovered my data.=20
Thanks for all your help.=20
The problem was in fact knoppix, but not because it had an older version =
of lvm2 or even lvm1.

The problem was that the human-readable part I extracted from the =
beginning of the device contained invisible characters in front of the=20=

'vol0' label in the file 'volt.txt' .
These characters were not visible in terminal using 'cat', 'more', and =
they also did not appear in standard error as a consequence of the =
'vgcfgrestore' command, as witnessed by the first line of the error:

'data/vol0.txt' does not contain volume group 'vol0'.

The reason why I could not observe this problem under knoppix is, that I =
did not use any other programs to display text than 'cat', 'more', =
standard error/standard out, and libreoffice. So I could not see that =
there were these invisible characters in front of 'vol0'.
Under knoppix, I did not have xemacs, which I usually use, so I could =
not locate the problem, thinking that my restore file vol0.txt was ok.
This belief was reinforced by the fact that I could use the file without =
problems to recreate the physical volume using pvcreate with the uuid =
switch.

You helped me finding the problem because of your comments on possible =
lvm2-version differences between ubuntu and knoppix, so I redid the =
whole thing with a ubuntu live cd, where I could install xemacs, and I =
noticed the characters.=20
I could then remove the bogey volume group that I had created from =
scratch using vgremove, and after that, the
vgcfgrestore command with the corrected file vol0.txt worked without =
problems.=20

Right now I am doing my backup, before switching the faulty drive to the =
new replacement=85 This is not gonna happen again.

Bottom-line:=20
Something during the replacement happened that did something with the =
metadata for the physical volume. I do not know what that was. =20
The human-readable metadata at the beginning of the raid10 device was =
still there and intact.
I copied the data from the beginning of the raid10 device using=20

sudo dd if=3D/dev/md127 bs=3D512 count=3D255 skip=3D1 of=3Dmd0.txt

Then copied the volume group description from md0.txt to a file called =
vol0.txt.

I could then recreate the physical volume using=20

sudo pvcreate --uuid WFo1On-anFb-2av8-DuRq-vKee-nJEt-ZLnu26 =
--restorefile vol0.txt /dev/md127

and I could recover the volume group and all its logical volumes using

sudo vgcfgrestore -f vol0.txt vol0

Thanks for helping!



On Mar 27, 2013, at 21:08 , Stuart D Gathman <stuart@bmsi.com> wrote:

> On 03/25/2013 05:50 PM, Bj=F6rn Nadrowski expounded in part:
>> Well, I see I would have to remove the volume group first, at the =
very least.
> I wouldn't.  Just think of your vgcreate as removing all LVs and =
renaming the VG.  Now you want to undo all that
> with a vgcfgrestore.
>> But I would just be back in the middle of my problem description on =
ubuntuforums, wouldn' t I?
>> Still no volume group, still no logical volumes...
> Does knoppix have an older lvm version that doesn't recognize your =
metadata?  I *hope* it doesn't have lvm1, which used binary metadata....
>=20
> If you see the human readable metadata, and knoppix doesn't, then =
there is a problem with knoppix.  Either ancient lvm, or the device =
filtered out for vgscan in lvm.conf.
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--Apple-Mail=_0A9AC252-FFAA-4F84-A600-EA8997559E10
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=windows-1252

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dwindows-1252"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; ">I =
recovered my data.&nbsp;<div>Thanks for all your =
help.&nbsp;</div><div>The problem was in fact knoppix, but not because =
it had an older version of lvm2 or even =
lvm1.</div><div><br></div><div>The problem was that the human-readable =
part I extracted from the beginning of the device contained invisible =
characters in front of the&nbsp;</div><div>'vol0' label in the file =
'volt.txt' .</div><div>These characters were not visible in terminal =
using 'cat', 'more', and they also did not appear in standard error as a =
consequence of the 'vgcfgrestore' command, as witnessed by the first =
line of the error:</div><div><br></div><div>'data/vol0.txt' does not =
contain volume group 'vol0'.</div><div><br></div><div>The reason why I =
could not observe this problem under knoppix is, that I did not use any =
other programs to display text than 'cat', 'more', standard =
error/standard out, and libreoffice. So I could not see that there were =
these invisible characters in front of 'vol0'.</div><div>Under knoppix, =
I did not have xemacs, which I usually use, so I could not locate the =
problem, thinking that my restore file vol0.txt was ok.</div><div>This =
belief was reinforced by the fact that I could use the file without =
problems to recreate the physical volume using pvcreate with the uuid =
switch.</div><div><br></div><div>You helped me finding the problem =
because of your comments on possible lvm2-version differences between =
ubuntu and knoppix, so I redid the whole thing with a ubuntu live cd, =
where I could install xemacs, and I noticed the =
characters.&nbsp;</div><div>I could then remove the bogey volume group =
that I had created from scratch using vgremove, and after that, =
the</div><div>vgcfgrestore command with the corrected file vol0.txt =
worked without problems.&nbsp;</div><div><br></div><div>Right now I am =
doing my backup, before switching the faulty drive to the new =
replacement=85 This is not gonna happen =
again.</div><div><br></div><div>Bottom-line:&nbsp;</div><div>Something =
during the replacement happened that did something with the metadata for =
the physical volume. I do not know what that was. &nbsp;</div><div>The =
human-readable metadata at the beginning of the raid10 device was still =
there and intact.</div><div>I copied the data from the beginning of the =
raid10 device using&nbsp;</div><div><br></div><div><pre =
class=3D"bbcode_code" style=3D"margin-top: 0px; margin-bottom: 0px; =
padding: 6px; font-family: 'Ubuntu Mono', monospace; line-height: 14px; =
border: 1px inset; text-align: left; overflow: auto; direction: ltr; =
background-image: none; background-color: rgb(239, 239, 239); font-size: =
14px; height: 36px; background-repeat: repeat no-repeat; ">sudo dd =
if=3D/dev/md127 bs=3D512 count=3D255 skip=3D1 =
of=3Dmd0.txt</pre><div><br></div></div><div>Then copied the volume group =
description from md0.txt to a file called =
vol0.txt.</div><div><br></div><div>I could then recreate the physical =
volume using&nbsp;</div><div><br></div><div><pre class=3D"bbcode_code" =
style=3D"margin-top: 0px; margin-bottom: 0px; padding: 6px; font-family: =
'Ubuntu Mono', monospace; line-height: 14px; border: 1px inset; =
text-align: left; overflow: auto; direction: ltr; background-image: =
none; background-color: rgb(239, 239, 239); font-size: 14px; height: =
36px; background-repeat: repeat no-repeat; ">sudo pvcreate --uuid =
WFo1On-anFb-2av8-DuRq-vKee-nJEt-ZLnu26 --restorefile vol0.txt =
/dev/md127</pre><div><br></div></div><div>and I could recover the volume =
group and all its logical volumes using</div><div><br></div><div><pre =
class=3D"bbcode_code" style=3D"margin-top: 0px; margin-bottom: 0px; =
padding: 6px; font-family: 'Ubuntu Mono', monospace; line-height: 14px; =
border: 1px inset; text-align: left; overflow: auto; direction: ltr; =
background-image: none; background-color: rgb(239, 239, 239); font-size: =
14px; height: 36px; background-repeat: repeat no-repeat; ">sudo =
vgcfgrestore -f vol0.txt vol0</pre><div><br></div></div><div>Thanks for =
helping!</div><div><br></div><div><br></div><div><br><div><div>On Mar =
27, 2013, at 21:08 , Stuart D Gathman &lt;<a =
href=3D"mailto:stuart@bmsi.com">stuart@bmsi.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><blockquote type=3D"cite">On =
03/25/2013 05:50 PM, Bj=F6rn Nadrowski expounded in part:<br><blockquote =
type=3D"cite">Well, I see I would have to remove the volume group first, =
at the very least.<br></blockquote>I wouldn't. &nbsp;Just think of your =
vgcreate as removing all LVs and renaming the VG. &nbsp;Now you want to =
undo all that<br>with a vgcfgrestore.<br><blockquote type=3D"cite">But I =
would just be back in the middle of my problem description on =
ubuntuforums, wouldn' t I?<br>Still no volume group, still no logical =
volumes...<br></blockquote>Does knoppix have an older lvm version that =
doesn't recognize your metadata? &nbsp;I *hope* it doesn't have lvm1, =
which used binary metadata....<br><br>If you see the human readable =
metadata, and knoppix doesn't, then there is a problem with knoppix. =
&nbsp;Either ancient lvm, or the device filtered out for vgscan in =
lvm.conf.<br><br>_______________________________________________<br>linux-=
lvm mailing list<br><a =
href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>https://w=
ww.redhat.com/mailman/listinfo/linux-lvm<br>read the LVM HOW-TO at =
http://tldp.org/HOWTO/LVM-HOWTO/<br></blockquote></div><br></div></body></=
html>=

--Apple-Mail=_0A9AC252-FFAA-4F84-A600-EA8997559E10--
