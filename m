Subject: RE: [linux-lvm] Strange message with 2.4.8+1.0.1rc1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Aug 2001 09:10:12 +0200
Message-ID: <B45465FD9C23D21193E90000F8D0F3DF0178FD26@mailsrv.linkvest.com>
Content-Class: urn:content-classes:message
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

> Logical volume. All is fine. Then, I reboot. After that, it's=20
> no more visible.=20
> If I run vgscan, nothing is found. vgchange -ay doesn't help=20

I found that if my VG name is : NORAID_HDX (10 characters), it's no more
visible after a reboot (no way to get it back, data loss) but if it's
named : NORAID then it's found after a reboot!

Is there a limit to 8 characters in LVM VGs names?
-jec
