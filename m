Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sB2B0AeM012345
	for <linux-lvm@redhat.com>; Tue, 2 Dec 2014 06:00:10 -0500
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sB2B066u008713
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Tue, 2 Dec 2014 06:00:08 -0500
Received: by mail-la0-f48.google.com with SMTP id s18so10353832lam.21
	for <linux-lvm@redhat.com>; Tue, 02 Dec 2014 03:00:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAE8gLh=_LmsMQjJcpBM1m7Mp0DGiDN2To53Yi_BFyT3FUkmzoA@mail.gmail.com>
References: <CAE8gLh=_LmsMQjJcpBM1m7Mp0DGiDN2To53Yi_BFyT3FUkmzoA@mail.gmail.com>
Date: Tue, 2 Dec 2014 06:00:06 -0500
Message-ID: <CAHEKYV5KqihaYWUb3Go53vSJj__X82ZiOCMXCG=-Kzm-uesPgw@mail.gmail.com>
From: Mauricio Tavares <raubvogel@gmail.com>
Content-Type: multipart/alternative; boundary=047d7b34398e3db590050939a13e
Subject: Re: [linux-lvm] LVM mirror or RAID1?
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

--047d7b34398e3db590050939a13e
Content-Type: text/plain; charset=UTF-8

On Dec 2, 2014 4:03 AM, "MegaBrutal" <megabrutal@gmail.com> wrote:
>
> Hi all,
>
> Could you please advise which is better? Creating mirrored logical
> volumes or raid1 logical volumes?
> The purpose of these 2 methods seem rather similar, so I'm curious
> what is the difference.
> I'd like to know the pros and contras of both methods. I'm also
> interested to hear about your personal experiences.
>
     I usually build raid volumes and then LVM on the top of that. IMHO LVM
is abstracting the physical storage: you can group a bunch of raid volumes
into a single volume group. So they kinda complement each other.

I've never done mirrored lvs so I can't vouch for that.

>
> Regards,
> MegaBrutal
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--047d7b34398e3db590050939a13e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Dec 2, 2014 4:03 AM, &quot;MegaBrutal&quot; &lt;<a href=3D"mailto:megabr=
utal@gmail.com">megabrutal@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi all,<br>
&gt;<br>
&gt; Could you please advise which is better? Creating mirrored logical<br>
&gt; volumes or raid1 logical volumes?<br>
&gt; The purpose of these 2 methods seem rather similar, so I&#39;m curious=
<br>
&gt; what is the difference.<br>
&gt; I&#39;d like to know the pros and contras of both methods. I&#39;m als=
o<br>
&gt; interested to hear about your personal experiences.<br>
&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0 I usually build raid volumes and then LVM on the t=
op of that. IMHO LVM is abstracting the physical storage: you can group a b=
unch of raid volumes into a single volume group. So they kinda complement e=
ach other.</p>
<p dir=3D"ltr">I&#39;ve never done mirrored lvs so I can&#39;t vouch for th=
at.</p>
<p dir=3D"ltr">&gt;<br>
&gt; Regards,<br>
&gt; MegaBrutal<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; linux-lvm mailing list<br>
&gt; <a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
&gt; <a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm">https://=
www.redhat.com/mailman/listinfo/linux-lvm</a><br>
&gt; read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/">ht=
tp://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</p>

--047d7b34398e3db590050939a13e--
