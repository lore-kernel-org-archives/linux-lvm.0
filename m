Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: [linux-lvm] Strange message with 2.4.8+1.0.1rc1
Date: Wed, 29 Aug 2001 12:29:20 +0200
Message-ID: <B45465FD9C23D21193E90000F8D0F3DF0178FD30@mailsrv.linkvest.com>
From: "Jean-Eric Cuendet" <Jean-Eric.Cuendet@linkvest.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> > Is there a limit to 8 characters in LVM VGs names?
>=20
> No. The limit is 128 characters and I've had plenty that were=20
> longer than 10. I suspect that the action of renaming has=20
> made the difference. I suspect (and if you're brave you could=20
> try this!) that if you rename the VG back to NORAID_HDX will=20
> still work.

I haven't renamed it!
What I made:
1st try:
- create NORAID_HDX VG
- create LV
- reboot
- VG not found by vgscan. NO way to restore it.

2nd try:
- create NORAID VG
- create LV
- reboot
- VG found by vgscan.

Note that VG was entirely destroyed between each attempt. Pvcreate
rerun.

Idea?
-jec
