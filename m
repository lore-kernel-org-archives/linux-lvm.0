From: Greg Freemyer <freemyer@NorcrossGroup.com>
Subject: re: [linux-lvm] question about LVM kernel module - mirroring
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20021011171128.WJD12965.imf08bis.bellsouth.net@Mother2>
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
Date: Fri Oct 11 12:10:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>

 >>  2) How can I perform mirroring using LVM? I know the kernel can do that=20
 >>  on local disks. Is it possible for the kernel of  two clustered machines=20
 >>  to mirror two disks on an external storage?
 >>  I am working on a HA cluster.

 >>  Thanks for your attention

 >>  Luca Lavorante
Luca,

If you want to have only one node at a time have access to the data, then the =
heartbeat mailing list may be a better place to ask.  www.linux-ha.org  In =
particular look thru their archives.  The subject comes up often.

If you want both to be able to have simultaneous access, then there are 3 or 4 =
choices I think.  The only 3 I can think of offhand are Sistina's GFS, OpenGFS, =
and Oracles OCFS.  The latter 2 are open source and not quite production ready =
in my opinion.  Sistina has been selling their GFS as production ready for over =
a year..

Greg Freemyer
