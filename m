Message-ID: <3BD1E714.B8CF216D@libertysurf.fr>
From: Philippe Lefevre <ph.l@libertysurf.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] LVM-1.0.1-rc4 and kernel-2.2.19 patch
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
Date: Sat Oct 20 15:12:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

 Hello all,
 =

 I had to update my current kernel (2.2.17) to 2.2.19 with ext3 but I
 totaly forget to check if a patch were created for it to support
 LVM-1.0.1-rc4 (which runs fine for me with K2.4.10, thank you LVM team
 !!)
 =

 I was able to build one using the rawio patch designed to 2.2.18 and
 easily fixing two small problems (two hunks were failed)
 but I'm tiedous to apply it like this.
 =

 What do you think about that ? are there any plans for a 2.2.19 patch
??
 using 2.2.18 fragments coud it be a solution ?
 shoud I getting back to Kernel 2.2.18 ?
 =

 Thanks for any answer,
 PhiL

-- =

----------------------------------------------------------------------
Linux 2.2.17 | Philippe Lefevre   E-mail: ph.l@libertysurf.fr |  =3D=B0)
             |                                                |  /\\
----------------------------------------------------------------_\_V--
