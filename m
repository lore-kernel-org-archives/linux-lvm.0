From: "William Blunn" <bill+f.9sfuw6uo@tao-group.com>
Subject: Re: [linux-lvm] I'm confused
Message-ID: <BDEMIPDEGABMNEFIHCPDCEBPEEAA.bill+f.9sfuw6uo@tao-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <73620000.1039399481@[192.168.100.3]>
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
Date: Mon Dec  9 04:16:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> > I think hardisk manufacturers use base 10, rather than base 2, when they
> > speak  of "mega" and "giga", ie. mega =3D 1000K and not 1024K. That mea=
ns
> > that a 120G  hardisk is only 114.4G. Hence, 109.77G + about 3G =3D about
> > 113G. Hmm, still  about 1.5G missing.
>=20
> They also quote the size before laying down timing tracks
> and bad block mappings -- along with the bad blocks. That
> accounts for another 10%.

What you are saying is completely wrong.

When a drive manufacturer quotes a drive with a capacity of 100 GB, what
they are quoting is the *user* capacity.

There are at least 100 GB available to the "user".

The "user" is the host machine.

For a typical 512 byte block size that will mean that there will be at
least:

   100 x 10^9 / 512 blocks

   195 312 500 blocks

available to the *user*, i.e. the host machine.

Whatever the drive uses internally is not counted.

If you look at drive specs, you will sometimes see a figure quoted for
"user data sectors" (in this case 195 312 500) and this always indicates
a capacity higher than the quoted drive capacity.

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
