From: Greg Freemyer <freemyer@NorcrossGroup.com>
Subject: re[2]: [linux-lvm] where do i find the device mapper/LVM2 documentation?
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20030530171732.KHXN4433.imf46bis.bellsouth.net@tiger2>
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
Date: Fri May 30 12:14:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>

 >>  On Thu, May 29, 2003 at 10:21:27PM +0100, Joe Thornber wrote:
 >>  > On Thu, May 29, 2003 at 02:27:15PM +0200, Daniel Phillips wrote:
 >>  >=20
 >>  > If you're interested in writing your own targets I suggest you look at
 >>  > a couple of the trivial targets that already exist.  Such as
 >>  > dm-linear.c, dm-stripe.c.

 >>  i am planning to write my own targets as a graduate project.
 >>  My idea was encryption and possibly compression as well.
 >>  (is anyone else doing any of these targets?)

An encrypting target would be nice, but does it offer any value over an =
encrypting loopback device?

(I assume LVM2 is compatible with the existing loopback encrypting devices.)

A compressing target would be uniquely valuable because I don't think it can be =
implemented via a loopback device.

i.e. I believe a loopback device requires a 1:1 (or constant) ratio between =
input size and output size.

Actually, that sounds like a pretty interesting problem to try to work on. =20

Greg
--=20
Greg Freemyer
