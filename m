Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t84GqwJ5032273
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Fri, 4 Sep 2015 12:52:58 -0400
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mx1.redhat.com (Postfix) with ESMTPS id 92940C1C49E9
	for <linux-lvm@redhat.com>; Fri,  4 Sep 2015 16:52:57 +0000 (UTC)
Received: by igbut12 with SMTP id ut12so18155155igb.1
	for <linux-lvm@redhat.com>; Fri, 04 Sep 2015 09:52:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <55E97AFE.6010009@redhat.com>
References: <CAFBvFDAwXs=JQ3eBDdUSYLQ8ja+McY38VC0WiGK1bTQRgjZB2g@mail.gmail.com>
	<55E97AFE.6010009@redhat.com>
From: Mike McCracken <mike.mccracken@canonical.com>
Date: Fri, 4 Sep 2015 09:52:37 -0700
Message-ID: <CAFBvFDAv_Gz0AjBzFso+JqWfXxKorhkiEa_HGz0bi34QZ-UHSw@mail.gmail.com>
Content-Type: multipart/alternative; boundary=089e013cc28e4a79d9051eeebb88
Subject: Re: [linux-lvm] Does LVM always do 'dm suspend' when lvcreating a
 thin snapshot?
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

--089e013cc28e4a79d9051eeebb88
Content-Type: text/plain; charset=UTF-8

OK, thanks for confirming!
I'd like to help improve the documentation about this - did I miss a place
where it was mentioned explicitly? If not, where would a discussion of FS
suspending fit? I'm happy to contribute a patch.


On Fri, Sep 4, 2015 at 4:05 AM, Zdenek Kabelac <zkabelac@redhat.com> wrote:

> Dne 4.9.2015 v 00:04 Mike McCracken napsal(a):
>
>> When creating a thin snapshot of a thin volume, does LVM always freeze
>> the FS?
>>
>> I see when I run lvcreate with -vvv that it sends the 'dm suspend'
>> message to
>> the origin lv, but on looking at the code I wasn't quite able to convince
>> myself that it will always do that, or under what circumstances it won't.
>>
>>
> Hi
>
> Yes - suspend of thin's snapshot origin is always enforced
> as you normally want snapshot FS to be in consistent state.
>
> Zdenek
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--089e013cc28e4a79d9051eeebb88
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">OK, thanks for confirming!<div>I&#39;d like to help improv=
e the documentation about this - did I miss a place where it was mentioned =
explicitly? If not, where would a discussion of FS suspending fit? I&#39;m =
happy to contribute a patch.</div><div><br></div></div><div class=3D"gmail_=
extra"><br><div class=3D"gmail_quote">On Fri, Sep 4, 2015 at 4:05 AM, Zdene=
k Kabelac <span dir=3D"ltr">&lt;<a href=3D"mailto:zkabelac@redhat.com" targ=
et=3D"_blank">zkabelac@redhat.com</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">Dne 4.9.2015 v 00:04 Mike McCracken napsal(a):<span class=3D=
""><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
When creating a thin snapshot of a thin volume, does LVM always freeze the =
FS?<br>
<br>
I see when I run lvcreate with -vvv that it sends the &#39;dm suspend&#39; =
message to<br>
the origin lv, but on looking at the code I wasn&#39;t quite able to convin=
ce<br>
myself that it will always do that, or under what circumstances it won&#39;=
t.<br>
<br>
</blockquote>
<br></span>
Hi<br>
<br>
Yes - suspend of thin&#39;s snapshot origin is always enforced<br>
as you normally want snapshot FS to be in consistent state.<br>
<br>
Zdenek<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" rel=3D"norefe=
rrer" target=3D"_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</=
a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div><br></div>

--089e013cc28e4a79d9051eeebb88--
