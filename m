From: Greg Freemyer <freemyer@NorcrossGroup.com>
Subject: re[2]: [linux-lvm] [OT] Encrypted FS performance hit?
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20030312231704.OLVL11330.imf38bis.bellsouth.net@tiger2>
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
Date: Wed Mar 12 17:15:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>linux-lvm@sistina.com

Thanks.

I also found a couple of good articles.

One on theory http://www.securityfocus.com/infocus/1673

And one with good bonnie++ results:  (This took an hour of googling to find)

http://vware.hypermart.net/howto_filesystem_encryption.htm

From the last one:

Based on a Pentium 3 800 MHz - 60 GB IDE drive -- UDMA (66)

Crypto                   Write speed      % Loss           Read speed           =
 % Loss
Unencrypted            24619 kB/s       --                  25273 kB/s          =
     --
AES-128bit             20880 kB/s     15.2%               8054 kB/s           =
68.1%
AES-256bit             17699 kB/s     28.1%               8031 kB/s           =
68.2%
3DES-64bit               4846 kB/s     80.3%               3334 kB/s           =
86.8%
3DES-192bit             4869 kB/s     80.2%               3334 kB/s           =
86.8%
BLOWFISH-128bit 19769 kB/s    19.7%               8029 kB/s           68.2%
BLOWFISH-256bit 19755 kB/s    19.8%               8047 kB/s           68.2%

That agrees with your slowdown estimates.

Greg

 >>  On Wed, Mar 12, 2003 at 05:08:49PM -0500, Greg Freemyer wrote:
 >>  > All,
 >>  >=20
 >>  > I know this is off-topic, but does anyone know where I can find info on
 >>  the CPU hit from using a software encrypting FS.

 >>  well, i'll quickly bring in some LVM stuff, as i run encryption both under
 >>  and ontop of a LVM-system. (different cihper though).


 >>  > In particular I would like to see a comparison between None, Microsoft
 >>  EFS, and Linux loopback encryption.

 >>  well, isnt EFS a FS encryption? loopback is a block encryption, there is a
 >>  difference. My experience is that i with loop-AES or PPDD, (blowfish as
 >>  cipher) gets about 1/4 to 1/3 of the performance of raw.



 >>  JonB

 >>  _______________________________________________
 >>  linux-lvm mailing list
 >>  linux-lvm@sistina.com
 >>  http://lists.sistina.com/mailman/listinfo/linux-lvm
 >>  read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
