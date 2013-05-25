Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r4P47eho001636
	for <linux-lvm@redhat.com>; Sat, 25 May 2013 00:07:40 -0400
Received: from mail-pb0-f53.google.com (mail-pb0-f53.google.com
	[209.85.160.53])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r4P47biv023460
	for <linux-lvm@redhat.com>; Sat, 25 May 2013 00:07:38 -0400
Received: by mail-pb0-f53.google.com with SMTP id un4so4943817pbc.12
	for <linux-lvm@redhat.com>; Fri, 24 May 2013 21:07:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20130524204516.35a24798@lolek.nigdzie>
References: <knkd3m$5kr$1@ger.gmane.org>
	<20130524204516.35a24798@lolek.nigdzie>
Date: Sat, 25 May 2013 07:07:36 +0300
Message-ID: <CACfWNia8DjxEQT3jr1v93r-rV1WP_XCPRZaY4jQqawB03unOaQ@mail.gmail.com>
From: Alexis Pellicier <alexis.pellicier@nds.k12.tr>
Content-Type: multipart/alternative; boundary=047d7b6243404f954604dd830e04
Subject: Re: [linux-lvm] snapshot an lvm disk containing ext4 partitions
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
To: Jacek Konieczny <jajcus@jajcus.net>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

--047d7b6243404f954604dd830e04
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

And theire is no risk to lose data?
Le 24 mai 2013 21:45, "Jacek Konieczny" <jajcus@jajcus.net> a =C3=A9crit :

> On Thu, 23 May 2013 09:31:23 +0300
> Alexis <alexis.pellicier@nds.k12.tr> wrote:
> > Hello,
> >
> > I was use to snapshot an LVM volume containing ext4 partitions for
> > backup purpose. This is a disk for Xen DomU paravirtualized linux box.
> >
> > With lvm-2.02.98 and kernel  3.4.11 from opensuse 12.2 the ext4
> > partitions inside  the snapshot were clean.
> >
> > Now I've upgraded to opensuse 12.3 (kernel 3.7.10 lvm-2.02.98)
> >
> > Is lvm supposed to keep my inside ext4 partitions clean when
> > snapshotting my volume? If not is theire any way of doing this?
>
> Use read-write snapshots instead of read-only ones.
>
> The first time you mount the snapshot (read-only mount is enough)
> the journal will get replayed and the stored file-system will become
> clean.
>
> Greets,
>         Jacek
>

--047d7b6243404f954604dd830e04
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p>And theire is no risk to lose data?</p>
<div class=3D"gmail_quote">Le 24 mai 2013 21:45, &quot;Jacek Konieczny&quot=
; &lt;<a href=3D"mailto:jajcus@jajcus.net">jajcus@jajcus.net</a>&gt; a =C3=
=A9crit=C2=A0:<br type=3D"attribution"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
On Thu, 23 May 2013 09:31:23 +0300<br>
Alexis &lt;<a href=3D"mailto:alexis.pellicier@nds.k12.tr">alexis.pellicier@=
nds.k12.tr</a>&gt; wrote:<br>
&gt; Hello,<br>
&gt;<br>
&gt; I was use to snapshot an LVM volume containing ext4 partitions for<br>
&gt; backup purpose. This is a disk for Xen DomU paravirtualized linux box.=
<br>
&gt;<br>
&gt; With lvm-2.02.98 and kernel =C2=A03.4.11 from opensuse 12.2 the ext4<b=
r>
&gt; partitions inside =C2=A0the snapshot were clean.<br>
&gt;<br>
&gt; Now I&#39;ve upgraded to opensuse 12.3 (kernel 3.7.10 lvm-2.02.98)<br>
&gt;<br>
&gt; Is lvm supposed to keep my inside ext4 partitions clean when<br>
&gt; snapshotting my volume? If not is theire any way of doing this?<br>
<br>
Use read-write snapshots instead of read-only ones.<br>
<br>
The first time you mount the snapshot (read-only mount is enough)<br>
the journal will get replayed and the stored file-system will become<br>
clean.<br>
<br>
Greets,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Jacek<br>
</blockquote></div>

--047d7b6243404f954604dd830e04--
