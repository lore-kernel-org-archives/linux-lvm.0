From: Greg Freemyer <freemyer@NorcrossGroup.com>
Subject: re[4]: [linux-lvm] Core questions from a LVM neophyte...
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20030312232735.PPIX5543.imf43bis.bellsouth.net@tiger2>
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
Date: Wed Mar 12 17:34:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>

 >>  >>  Question 1:  Is it possible today to:
 >>  >>  Have a large IDE RAID5 array that is virtualized through=20
 >>  >>  LVM and then exported to a Dynamic Disk on Win2K over a
 >>  >>  LAN (not necessarily WAN)?
 >>  >>=20
 >>  >>  I believe iSCSI and HyperSCSI would both work... However=20
 >>  >>  I have not found the approporiate interoperable software
 >>  >> drivers.
 >>  >=20
 >>  > I tried them also.  No luck yet.  Let us know if you get it working.

 >>  What was your setup and how did it fail?  No connection?  Such bad
 >>  performance that it didn't work?

Nothing at all for Win2k HyperSCSI.

For iSCSI I tried the initiators I could find:  Cisco and IBM.

Both are specifically designed to work with their hardware targets and use =
older revs. of the spec.  (rel. 0.8 ??)

I was trying to use the Intel target.

As I recall, the IBM initiator did not connect at all.

The Cisco attempted, but failed in the parameter negotiation that takes place =
at the start of a iSCSI session.

Since iSCSI was just approved a few weeks ago, I'm hoping that Microsoft will =
come out with a Win2K driver shortly.

If they do, I expect that someone will come out with a Linux target that =
supports it.

BTW: Have you tried Window UNIX Services 3.0

http://www.microsoft.com/windows2000/techinfo/howitworks/security/encrypt.asp

I haven't, but I'm hopeful that it will create "local" drives somehow.  (I very =
much doubt it, but I'm hopeful).

BTW2: In a pure Windows environment, HPs Storage Replicator does exactly what =
you want, but it is pricey (IIRC $10K)

http://h18000.www1.hp.com/products/sanworks/vr/description.html

Greg
--=20
Greg Freemyer
