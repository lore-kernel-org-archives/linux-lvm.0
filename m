Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i23F6D828208
	for <linux-lvm@redhat.com>; Wed, 3 Mar 2004 10:06:13 -0500
Received: from mwinf0503.wanadoo.fr (smtp5.wanadoo.fr [193.252.22.26])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i23F6Db16559
	for <linux-lvm@redhat.com>; Wed, 3 Mar 2004 10:06:13 -0500
Received: from tangerine.coulon.evette (ADijon-107-1-19-194.w81-251.abo.wanadoo.fr [81.251.17.194])
	by mwinf0503.wanadoo.fr (SMTP Server) with ESMTP id 804D2680026A
	for <linux-lvm@redhat.com>; Wed,  3 Mar 2004 16:06:06 +0100 (CET)
Received: from localhost ([127.0.0.1])
	by tangerine.coulon.evette with esmtp (Exim 4.30)
	id 1AyXwi-00084X-II
	for linux-lvm@redhat.com; Wed, 03 Mar 2004 16:06:04 +0100
Received: from tangerine.coulon.evette ([127.0.0.1])
	by localhost (tangerine [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 01162-09 for <linux-lvm@redhat.com>;
	Wed, 3 Mar 2004 16:06:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=tangerine)
	by tangerine.coulon.evette with esmtp (Exim 4.30)
	id 1AyXwh-00084Q-1l
	for linux-lvm@redhat.com; Wed, 03 Mar 2004 16:06:03 +0100
From: "Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr>
Subject: =?iso-8859-1?Q?Re=A0=3A?= [linux-lvm] Re: Re
Message-ID: <20040303150602.GA3465@tangerine.coulon.evette>
References: <20040302152911.GI15556@tangerine.coulon.evette> <20040302154631.GB12779@tykepenguin.com> <200403021719.i22HJk407665@ecstasy1.winternet.com> <20040303085729.GC2532@tangerine.coulon.evette> <20040303091549.GB17625@tykepenguin.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
	protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Content-Disposition: inline
In-Reply-To: <20040303091549.GB17625@tykepenguin.com> (from pcaulfie@redhat.com on mer, mar 03, 2004 at 10:15:49 +0100)
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
Date: Wed Mar  3 10:04:08 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; Format=Flowed; DelSp=Yes; charset=ISO-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le 03.03.2004 10:15, Patrick Caulfield a =E9crit=A0:
>On Wed, Mar 03, 2004 at 09:57:30AM +0100, Jean-Luc Coulon (f5ibh)
>wrote:
>> Tank you patrick and Ken for the answers,
>>
>> Here is what I dit.
>> I've moved my root filesystemen (logical volume) to xfs and compiled
>a
>> couple of kernels, il was a bit long, my machine is not so fast. The
>
>> first one with xfs hard coded and the second with xfs as a module
>> applying the recipe given by Ken: I have built the normal initrd =20
>> with
>
>> lvmcreate_initrd, then mounted/edited/copied it and have the
>following
>> result:
>>
>> With XFS hardcoded, everything went fine and the system is running
>> fine.
>>
>> With XFS as a module it isnot the case, even if the system load the
>> modole at boot, I get a kernel panic. Here are the messages I =20
>> wriiten
>
>> down by hand ( :-O ):
>>
>> /------------------
>> |... snipped ..
>> | RAMDISK: Compressed image found at block 0
>> | Freeing initrd memory: 1532k freed
>> | VFS: Mounter root (ext2 filesystem)
>> | LVM version 1.0.8 (17/11/2003=E0 module loaded
>> | SGI XFS with no debug enabled                 <-- was happy  ;-)
>> | SGI: XFS Quota Management subsystem
>> | vgscan -- reading all physical volumes (this may take a while)
>> | vgscan -- found inactive volume group "v00"
>> | vscan -- ERROR 28 writing volume group backup file
>> |        /etc/lvmtab.d/vg00.tmp in vg-cfgbackup.c [line 273]
>> | vgscan -- ERROR: unable to do  backup of volume group "vg003
>> | vgscan -- ERROR: "lvm_tab_vg_removed": ulink "removing volume =20
>> group
>> |         "vg00" and "/etc/lvmtab.d"  succesfully created
>> | vgscan -- WARNING: This program doesnt do a VGA backup of your
>> |          volume group
>> | vgchang  -- no volume roup found
>> | VFS. Cannot open root device "3a02" or 3a:02
>> | Please append a corret "root=3D" boot option
>> |Kernel panic: VFS: Unable to mount root fs on 3a:02
>> \___________
>>
>> End of story.
>> It seems to find and load my xfs module but then there is a vgscan
>> problem. As it work fine with xfs hard coded, I don't really *need*
>it
>> as a module but I would like to know where is the problem
>
>It looks like the initrd is too full to hold the LVM metadata backups.
>That's
>one of the prolems with adding stuff to initrds - it takes up space
>that might
>be needed for other things!
>
>patrick
>

Finally, I've modified the lvmcreate_initrd script to add the path to =20
xfs.o and modprobe the module in linuxrc. This way, it works... even if =20
it is not better than with the xfs driver hard coded in the kernel  ;-)

--
			- Jean-Luc
--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBARfRaUdGGXzzGnNARAnRFAKClkdCL2GqIB5wmkd/WsQyEbpMiKwCaAlMS
l7iYmcYhd+Q0IJgZup1snso=
=fV/t
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--
