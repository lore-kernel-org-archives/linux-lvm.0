Received: from fentible.pjc.net (vpnuser2.surrey.redhat.com [172.16.9.2])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i239EQuq031995
	for <linux-lvm@redhat.com>; Wed, 3 Mar 2004 09:14:27 GMT
Received: from patrick by fentible.pjc.net with local (Exim 4.30)
	id 1AySTl-0004dm-7A
	for linux-lvm@redhat.com; Wed, 03 Mar 2004 09:15:49 +0000
From: Patrick Caulfield <pcaulfie@redhat.com>
Message-ID: <20040303091549.GB17625@tykepenguin.com>
References: <20040302152911.GI15556@tangerine.coulon.evette> <20040302154631.GB12779@tykepenguin.com> <200403021719.i22HJk407665@ecstasy1.winternet.com> <20040303085729.GC2532@tangerine.coulon.evette>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20040303085729.GC2532@tangerine.coulon.evette>
Subject: [linux-lvm] Re: Re
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Wed Mar  3 04:12:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com

On Wed, Mar 03, 2004 at 09:57:30AM +0100, Jean-Luc Coulon (f5ibh) wrote:
> Tank you patrick and Ken for the answers,
>=20
> Here is what I dit.
> I've moved my root filesystemen (logical volume) to xfs and compiled a =20
> couple of kernels, il was a bit long, my machine is not so fast. The =20
> first one with xfs hard coded and the second with xfs as a module =20
> applying the recipe given by Ken: I have built the normal initrd with =20
> lvmcreate_initrd, then mounted/edited/copied it and have the following =20
> result:
>=20
> With XFS hardcoded, everything went fine and the system is running =20
> fine.
>=20
> With XFS as a module it isnot the case, even if the system load the =20
> modole at boot, I get a kernel panic. Here are the messages I wriiten =20
> down by hand ( :-O ):
>=20
> /------------------
> |... snipped ..
> | RAMDISK: Compressed image found at block 0
> | Freeing initrd memory: 1532k freed
> | VFS: Mounter root (ext2 filesystem)
> | LVM version 1.0.8 (17/11/2003=EF=BF=BD module loaded
> | SGI XFS with no debug enabled                 <-- was happy  ;-)
> | SGI: XFS Quota Management subsystem
> | vgscan -- reading all physical volumes (this may take a while)
> | vgscan -- found inactive volume group "v00"
> | vscan -- ERROR 28 writing volume group backup file
> |        /etc/lvmtab.d/vg00.tmp in vg-cfgbackup.c [line 273]
> | vgscan -- ERROR: unable to do  backup of volume group "vg003
> | vgscan -- ERROR: "lvm_tab_vg_removed": ulink "removing volume group
> |         "vg00" and "/etc/lvmtab.d"  succesfully created
> | vgscan -- WARNING: This program doesnt do a VGA backup of your
> |          volume group
> | vgchang  -- no volume roup found
> | VFS. Cannot open root device "3a02" or 3a:02
> | Please append a corret "root=3D" boot option
> |Kernel panic: VFS: Unable to mount root fs on 3a:02
> \___________
>=20
> End of story.
> It seems to find and load my xfs module but then there is a vgscan =20
> problem. As it work fine with xfs hard coded, I don't really *need* it =20
> as a module but I would like to know where is the problem

It looks like the initrd is too full to hold the LVM metadata backups. That=
's
one of the prolems with adding stuff to initrds - it takes up space that mi=
ght
be needed for other things!

patrick
