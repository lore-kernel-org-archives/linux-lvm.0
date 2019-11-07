MIME-Version: 1.0
References: <CACrcyfJE2rEGTVOGTXGTf08w1Z-js8xTRshibCm+PuZNxp3OUA@mail.gmail.com>
	<5BDF90CF-72E7-44A0-8C78-7854B2B8996A@gmail.com>
	<29ad8317-4a55-f017-6a0b-c06bf40ccab8@redhat.com>
	<CACrcyfJxYvr7BC6Srts1bnNWLxsme8d3hjEQqYQyBz9sqbNp6g@mail.gmail.com>
	<alpine.LRH.2.02.1911051131360.14929@file01.intranet.prod.int.rdu2.redhat.com>
	<CACrcyf+7r6-SExT9wkBvN+LREZRHHux-3-0hrP5pkSqUL8z_Sw@mail.gmail.com>
	<alpine.LRH.2.02.1911071153470.31278@file01.intranet.prod.int.rdu2.redhat.com>
In-Reply-To: <alpine.LRH.2.02.1911071153470.31278@file01.intranet.prod.int.rdu2.redhat.com>
From: =?UTF-8?Q?Tomas_Dalebj=C3=B6rk?= <tomas.dalebjork@gmail.com>
Date: Thu, 7 Nov 2019 18:29:21 +0100
Message-ID: <CACrcyfJBtsVFwf8wFjDAc1sOKPiOVBJjKbDC3c+3G-z6v5SCpA@mail.gmail.com>
Content-Type: multipart/alternative; boundary="00000000000037ecc90596c50289"
Subject: Re: [linux-lvm] exposing snapshot block device
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
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>

--00000000000037ecc90596c50289
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Great, thanks!

Den tors 7 nov. 2019 kl 17:54 skrev Mikulas Patocka <mpatocka@redhat.com>:

>
>
> On Tue, 5 Nov 2019, Tomas Dalebj=C3=B6rk wrote:
>
> > Thanks,
> >
> > That really helped me to understand how the snapshot works.
> > Last question:
> > - lets say that block 100 which is 1MB in size is in the cow device, an=
d
> a write happen that wants to something or all data on that region of bloc=
k
> 100.
> > Than I assume; based on what have been previously said here, that the
> block in the cow device will be overwritten with the new changes.
>
> Yes, the block in the cow device will be overwritten.
>
> Mikulas
>
> > Regards Tomas

--00000000000037ecc90596c50289
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Great, thanks! <br></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">Den tors 7 nov. 2019 kl 17:54 skrev Mik=
ulas Patocka &lt;<a href=3D"mailto:mpatocka@redhat.com">mpatocka@redhat.com=
</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On Tue, 5 Nov 2019, Tomas Dalebj=C3=B6rk wrote:<br>
<br>
&gt; Thanks,<br>
&gt; <br>
&gt; That really helped me to understand how the snapshot works.<br>
&gt; Last question:<br>
&gt; - lets say that block 100 which is 1MB in size is in the cow device, a=
nd a write happen that wants to something or all data on that region of blo=
ck 100.<br>
&gt; Than I assume; based on what have been previously said here, that the =
block in the cow device will be overwritten with the new changes.<br>
<br>
Yes, the block in the cow device will be overwritten.<br>
<br>
Mikulas<br>
<br>
&gt; Regards Tomas</blockquote></div>

--00000000000037ecc90596c50289--
