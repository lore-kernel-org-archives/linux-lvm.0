Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: [linux-lvm] More strangeness
Date: Wed, 10 Oct 2001 14:37:03 +0200
Message-ID: <B45465FD9C23D21193E90000F8D0F3DF0178FF07@mailsrv.linkvest.com>
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

> No official patch for ext3 and 2.4.10?!  Can I run an older=20
> kernel version?  2.4.8 or 9 maybe?  Will that run ext3 and=20
> lvmtools 1.0.1rc4?

I use 2.4.9 from RedHat 7.2 (rawhide) that already have ext3.
I patched LVM 1.0.1rc{2,4} and all is fine.

-jec

PS: Take the sources of the kernel from SRPMS of rawhide.
