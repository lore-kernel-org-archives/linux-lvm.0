Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: [linux-lvm] how to upgrade from rh70 to rh71
Date: Tue, 2 Oct 2001 08:34:25 +0200
Message-ID: <B45465FD9C23D21193E90000F8D0F3DF0178FEA8@mailsrv.linkvest.com>
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

> > I never really thought about this when I decided to put all my=20
> > filesystems on LVM logical volumes; but how am I going to=20
> be able to=20
> > upgrade to RedHat 7.1?

I could have the same problem. But I don't run the updater. I update "by
hand".
That means, updating packages one by one with "rpm -U". That's a big
work but at least I'm sure that it'll work. The only time I upgraded
with RH installer, the system was UNUSABLE! Reinstall from scratch!
By updating this way, the LVM problem disappears!

-jec
