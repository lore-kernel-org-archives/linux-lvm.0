Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID: <CEADF0D83077F7458B763904E47AA709BD61@exchange.neokimia.com>
From: "Yanick Quirion" <yanick.quirion@neokimia.com>
Subject: [linux-lvm] RE: EXT3 vs Reiserfs
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
Date: Mon Dec  8 10:34:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi Chris,

>=20
> We run SUSE primarily... therefore we use reiserfs (mostly with LVMs).
> RH is sorta new to the LVM thing... so although we use ext3 on our RH
> systems,
> most of them do not use LVM.  We have over 7TB of data that uses LVM
with
> reiserfs... we're quite pleased with the performance and capability.
>=20
> We love the ability to do resize_reiserfs while the filesystem is
mounted.
> Constantly amazes the "Unix" purists.

I'm currently testing another file system which supports LVM and online
extension: XFS. I was able to patch kernel and install XFS utilities on
FC1 without any problems. It seems to works fine, but I will make more
tests within the next days.

But, if tests are good I think I will use xfs for all devices that have
LVM & ALC enable on it, and the rest will probably be ext3 (like /, /tmp
& /var).

Thanks for your answer.

Yanick
