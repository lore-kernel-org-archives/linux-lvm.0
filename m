From: Greg Freemyer <freemyer@NorcrossGroup.com>
Subject: re[2]: [linux-lvm] What are they talking about?
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20030521204843.ZNFH1333.imf40bis.bellsouth.net@tiger2>
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
Date: Wed May 21 15:46:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>, "Tas)   <vze2sjj7@verizon.net>" <Anastasios>
Cc: EVMS <evms-devel@lists.sourceforge.net>

Kevin,

I understand how LVM2, DM, and EVMS are architected.

I still have no idea what the article is talking about.

Are you saying that the referenced sources just don't understand how it all =
works=20
and that the "industrial-strength Logical Volume Manager" they want is =
achievable via
the current DM implementation in combination with appropriate high quality=20
user-space tools?

That certainly agrees with what I thought and why I was so confused by the =
article.

Thanks
Greg
--=20
Greg Freemyer


 >>  (Once more - with feeling this time!)

 >>  Device-Mapper is the new kernel driver in 2.5. It replaced the LVM1 kernel
 >> =20
 >>  driver from 2.4. This driver provides generic "volume management"=20
 >>  capabilities. Specifically, it can create devices which simply redirect
 >>  I/O=20
 >>  to other underlying devices. Such a device could be thought of as a
 >>  "logical=20
 >>  volume".

 >>  LVM2 and EVMS are both actively developed projects that utilize the=20
 >>  Device-Mapper driver for creating their "logical volumes". Neither LVM2
 >>  nor=20
 >>  EVMS are (or will be) "in the kernel". All of the real complexity of
 >>  volume=20
 >>  management is done in user-space. It is far more sensible to ask a
 >>  question=20
 >>  like "will LVM2 and/or EVMS be included in the next release of Red Hat or=20
 >>  Debian?" And the next major release of these distros may not correspond=20
 >>  exactly with the release of the 2.6.0 kernel.

 >>  To prevent reposting all of the gory details, please see a very similar=20
 >>  previous discussion at:
 >>  http://marc.theaimsgroup.com/?t=3D104164610600002&r=3D1&w=3D2
 >>  and
 >>  http://marc.theaimsgroup.com/?t=3D104195031700002&r=3D1&w=3D2


 >>  On Wednesday 21 May 2003 12:42, Anastasios A. Papadopoulos \(Tas\) wrote:
 >>  > Now I am really confused.  (Sorry folks, it doesn't take much).
 >>  >
 >>  > I thought that EVMS was dead.  The EVMS web site says something to the
 >>  > effect that the new EVMS product will be mostly a front end for (LVM?).=20
 >>  Am
 >>  > I reading that wrong?
 >>  >
 >>  > Also in their announcement, the EVMS development group said that Linus
 >>  etal
 >>  > decided to include LVM but not EVMS.
 >>  >
 >>  > Can someone straighten me out, please?
 >>  >
 >>  > Thanks
 >>  >
 >>  > ----- Original Message -----
 >>  > From: "Greg Freemyer" <freemyer@NorcrossGroup.com>
 >>  > To: "LVM Mailing list" <linux-lvm@sistina.com>
 >>  > Sent: Wednesday, May 21, 2003 1:06 PM
 >>  > Subject: [linux-lvm] What are they talking about?
 >>  >
 >>  >
 >>  > In the article at http://www.eweek.com/article2/0,3959,1054003,00.asp
 >>  >
 >>  > they talk about the 2.6 kernel having a DM, but not a LVM.
 >>  >
 >>  > What are they trying to say?  What is it they think is missing?
 >>  >
 >>  > =3D=3D=3D Quote from the article
 >>  >
 >>  > According to Witham, a number of features that the development community
 >>  > believes are not yet ready to be incorporated into the 2.6 kernel may
 >>  very
 >>  > well be pushed to 2.7.
 >>  >
 >>  > Among these features are support for complete Non-Uniform Memory Access
 >>  > as well as an EVMS (Enterprise Volume Management System), which deals
 >>  > with the difficult and controversial issue of volume management, Frye
 >>  said,
 >>  > adding that 2.6 would be better than 2.4 in terms of volume management
 >>  even
 >>  > without the EVMS.
 >>  >
 >>  > Oracle Corp. and Red Hat Inc. officials have also previously called for
 >>  > volume
 >>  > management. Wim Coekaerts, principal member of Oracle's technical staff,
 >>  in
 >>  > Redwood Shores, Calif., said: "We would like Linux to have a Logical
 >>  Volume
 >>  > Manager. The 2.6 kernel will have a device manager, but we need an LVM."
 >>  >
 >>  > Paul Cornier, executive vice president of Red Hat, in Raleigh, N.C.,
 >>  > agreed.
 >>  >
 >>  > "Making a more generic cluster file system is important to us, as is an
 >>  > industrial-strength Logical Volume Manager," Cornier said. "A
 >>  distributed
 >>  > lock
 >>  > manager completes things. This is functionality that needs to go into
 >>  the
 >>  > operating
 >>  > system but is unlikely to be found in the next [kernel] upgrade."
 >>  >
 >>  > IBM's Frye said that there's clearly a need for an improved volume
 >>  > management
 >>  > system and that Linux is not yet good enough in that regard.
 >>  > =3D=3D=3D=3D
 >>  >
 >>  > Thanks
 >>  > Greg
 >>  > --
 >>  > Greg Freemyer

 >>  --=20
 >>  Kevin Corry
 >>  kevcorry@us.ibm.com
 >>  http://evms.sourceforge.net/


 >>  _______________________________________________
 >>  linux-lvm mailing list
 >>  linux-lvm@sistina.com
 >>  http://lists.sistina.com/mailman/listinfo/linux-lvm
 >>  read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
