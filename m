From: "William Blunn" <bill+f.9sfuw6uo@tao-group.com>
Subject: Re: [linux-lvm] I'm confused
Message-ID: <BDEMIPDEGABMNEFIHCPDEECAEEAA.bill+f.9sfuw6uo@tao-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <200212082343.49466.pantaleimon@home.no>
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Mon Dec  9 04:29:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> I think hardisk manufacturers use base 10, rather than base 2,
> when they speak of "mega" and "giga", ie. mega =3D 1000K and not
> 1024K. That means that a 120G hardisk is only 114.4G.

No.

You are right in that "mega =3D 1000K", but from your figure of 114.4, you
still appear to have "K =3D 1024" and "G =3D 1024M", both of which are
wrong.

Hard disk manufacturers use SI defined multipliers, i.e. they use a
documented standard.

  K =3D 10^3
  M =3D 10^6
  G =3D 10^9

  120 GB =3D 120 000 000 000 B

Computer people have traditionally abused these symbols to mean
multipliers with similar values, but based on powers of two.

Symbols have been defined for these multipliers, but some people still
haven't caught up to them.

  Ki =3D 2^10 =3D 1024
  Mi =3D 2^20 =3D 1048576
  Gi =3D 2^30 =3D 1073741824

So

  120 GB ~=3D 111.8 GiB

Interestingly, LVM1's vgdisplay incorrectly uses "GB" in its output
where it should say "GiB".

Bill
--=20
William H. Blunn - <bill+s.9sfuw6uo@tao-group.com> - Developer Support
Tao
62/63 Suttons Business Park, Earley, READING, RG6 1AZ, United Kingdom
Tel: +44 118 901 2999 - Fax: +44 118 901 2963 - http://tao-group.com/

The contents of this e-mail and any attachments are confidential and may
be legally privileged. If you have received this e-mail and you are not
a named addressee, please inform us as soon as possible on
+44 118 901 2999 and then delete the e-mail from your system. If you are
not a named addressee you must not copy, use, disclose, distribute,
print or rely on this e-mail. Any views expressed in this e-mail or any
attachments may not necessarily reflect those of Tao's management.
Although we routinely screen for viruses, addressees should scan this
e-mail and any attachments for viruses. Tao makes no representation or
warranty as to the absence of viruses in this e-mail or any attachments.
Please note that for the protection of our business, we may monitor and
read e-mails sent to and from our server(s).
