From: "William Blunn" <bill+f.9sfuw6uo@tao-group.com>
Subject: Re: [linux-lvm] LVM and transferring filesystem
Message-ID: <BDEMIPDEGABMNEFIHCPDAEJBEJAA.bill+f.9sfuw6uo@tao-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3E673068.7E5905D4@tid.es>
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
Date: Thu Mar  6 05:57:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

>  I am installing a redhat 7.3 linux box with X-Window.
>=20
>  I have installed LVM splitting the system with the following scheme:
>=20
>  /boot and / are installed each in different non-LVM partitions.

Smart move.

>  LVM volumes:
>=20
>  /usr , /var/ , /tmp
>=20
>  I have noticed that when I mount the filesystem using the LVM volumes
> my X-Windows server doesnt work, but when I deactivate the LVM volumes
> using the original configuration stored in the original / partition
> (which still have the original /var, /tmp, /usr partitions) then
> X-Window works perfectly.
>=20
>  Then I assume that I havent transferred the filesystem well.
>=20
>  I use from / the following command from the LVM howtos:
>=20
>  tar cplf - -C var .|tar xvlf - -C /mnt/var
>=20
>  and the same thing for the rest of partitions.
>=20
>  Any suggestion?

Permissions on /tmp ?

Should be 1777 (drwxrwxrwt).

To copy filesystems, I use:

  rsync -avxSHW --delete /var/ /mnt/var

This has the added benefit that you can copy most data over whilst the syst=
em is up and running.

Then you can take it down to single user, do the rsync again, and only the =
changed data will need to be copied.

This minimises the time the system is in single user (which is good if you =
are working on a server).

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
