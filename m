Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i238vm801768
	for <linux-lvm@redhat.com>; Wed, 3 Mar 2004 03:57:48 -0500
Received: from mwinf0601.wanadoo.fr (smtp6.wanadoo.fr [193.252.22.25])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i238vlb12341
	for <linux-lvm@redhat.com>; Wed, 3 Mar 2004 03:57:47 -0500
Received: from tangerine.coulon.evette (ADijon-107-1-14-157.w81-250.abo.wanadoo.fr [81.250.95.157])
	by mwinf0601.wanadoo.fr (SMTP Server) with ESMTP id 0119F34002B4
	for <linux-lvm@redhat.com>; Wed,  3 Mar 2004 09:57:40 +0100 (CET)
Received: from localhost ([127.0.0.1])
	by tangerine.coulon.evette with esmtp (Exim 4.30)
	id 1AySC3-0000rs-OR
	for linux-lvm@redhat.com; Wed, 03 Mar 2004 09:57:31 +0100
Received: from tangerine.coulon.evette ([127.0.0.1])
	by localhost (tangerine [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 02629-05 for <linux-lvm@redhat.com>;
	Wed, 3 Mar 2004 09:57:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=tangerine)
	by tangerine.coulon.evette with esmtp (Exim 4.30)
	id 1AySC2-0000rl-6o
	for linux-lvm@redhat.com; Wed, 03 Mar 2004 09:57:30 +0100
From: "Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr>
Subject: =?iso-8859-1?B?UmWg?=
	=?iso-8859-1?Q?=3A?= [linux-lvm] Adding xfs module to the initrd-lvm
Message-ID: <20040303085729.GC2532@tangerine.coulon.evette>
References: <20040302152911.GI15556@tangerine.coulon.evette> <20040302154631.GB12779@tykepenguin.com> <200403021719.i22HJk407665@ecstasy1.winternet.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
	protocol="application/pgp-signature"; boundary="gj572EiMnwbLXET9"
Content-Disposition: inline
In-Reply-To: <200403021719.i22HJk407665@ecstasy1.winternet.com> (from kfuchs@winternet.com on mar, mar 02, 2004 at 18:19:46 +0100)
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
Date: Wed Mar  3 03:56:07 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--gj572EiMnwbLXET9
Content-Type: text/plain; Format=Flowed; DelSp=Yes; charset=ISO-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Tank you patrick and Ken for the answers,

Here is what I dit.
I've moved my root filesystemen (logical volume) to xfs and compiled a =20
couple of kernels, il was a bit long, my machine is not so fast. The =20
first one with xfs hard coded and the second with xfs as a module =20
applying the recipe given by Ken: I have built the normal initrd with =20
lvmcreate_initrd, then mounted/edited/copied it and have the following =20
result:

With XFS hardcoded, everything went fine and the system is running =20
fine.

With XFS as a module it isnot the case, even if the system load the =20
modole at boot, I get a kernel panic. Here are the messages I wriiten =20
down by hand ( :-O ):

/------------------
|... snipped ..
| RAMDISK: Compressed image found at block 0
| Freeing initrd memory: 1532k freed
| VFS: Mounter root (ext2 filesystem)
| LVM version 1.0.8 (17/11/2003=E0 module loaded
| SGI XFS with no debug enabled                 <-- was happy  ;-)
| SGI: XFS Quota Management subsystem
| vgscan -- reading all physical volumes (this may take a while)
| vgscan -- found inactive volume group "v00"
| vscan -- ERROR 28 writing volume group backup file
|        /etc/lvmtab.d/vg00.tmp in vg-cfgbackup.c [line 273]
| vgscan -- ERROR: unable to do  backup of volume group "vg003
| vgscan -- ERROR: "lvm_tab_vg_removed": ulink "removing volume group
|         "vg00" and "/etc/lvmtab.d"  succesfully created
| vgscan -- WARNING: This program doesnt do a VGA backup of your
|          volume group
| vgchang  -- no volume roup found
| VFS. Cannot open root device "3a02" or 3a:02
| Please append a corret "root=3D" boot option
|Kernel panic: VFS: Unable to mount root fs on 3a:02
\___________

End of story.
It seems to find and load my xfs module but then there is a vgscan =20
problem. As it work fine with xfs hard coded, I don't really *need* it =20
as a module but I would like to know where is the problem

--
Regards
			- Jean-Luc


Le 02.03.2004 18:19, Ken Fuchs a =E9crit=A0:
>To: linux-lvm@redhat.com
>In-reply-to: <20040302154631.GB12779@tykepenguin.com> (message from
>Patrick
>	Caulfield on Tue, 2 Mar 2004 15:46:32 +0000)
>Subject: Re: [linux-lvm] Adding xfs module to the initrd-lvm
>BCC: kfuchs@unicycling.org
>References: <20040302152911.GI15556@tangerine.coulon.evette>
><20040302154631.GB12779@tykepenguin.com>
>--text follows this line--
>>On Tue, Mar 02, 2004 at 04:29:11PM +0100, Jean-Luc Coulon (f5ibh)
>wrote:
>
>>> I would like to add the xfs module to the lvm created by
>>> lvmcreate_initrd.
>>>
>>> Is there a mean to do that easily?
>>> So I have to mount and existing one and add the module by hand?
>
>Patrick Caulfield wrote:
>
>>I suspect that's the easiest way if that's what you really need to =20
>> do.
>
>>> So I have to use the standard initrd tools?
>
>>You could edit the existing lvmcreate_initrd to add the module (look
>>for lvm-mod and write some similar code underneath it).
>>
>>But the easiest way, by far, is to have your kernel with XFS compiled
>>into it rather than as a module!
>
>An alternative is to simply modify the initrd manually (Very easy and
>rather straightforward):
>
>Make a backup copy of the initrd.
>
>(If the initrd is compressed, uncompress it using gunzip.)
>
># mount -o loop /boot/initrd-<version> /data1
># cp -p /lib/modules/<version>/kernel/fs/xfs/xfs.o
>/data1/lib/modules/<version>/kernel/fs/xfs/
>  <Destination directory can be anywhere as long as insmod arg in
>linuxrc
>   matches.>
># <edit> /data1/linuxrc
>  <Add insmod command to insert module xfs.o.>
>  /bin/insmod /lib/modules/<version>/kernel/fs/xfs/xfs.o
># umount /data1
>
>(If the initrd was compressed, compress it using gzip.)
>
># shutdown -r now
>
>Rather than replace the original initrd, one could copy and modify it
>and make a new lilo or grub entry for the old kernel/modified initrd.
>This allows one to boot from the original kernel/initrd in case the
>modified initrd contains a mistake that prevents proper booting.
>
>Sincerely,
>
>Ken Fuchs <kfuchs@winternet.com>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--gj572EiMnwbLXET9
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBARZ35UdGGXzzGnNARApVDAJ42I6YaV82+B7gdXY18+qO1SoBaDQCgoZuN
oZw+N0sziP3kHOT6Ltg3Aec=
=TFuu
-----END PGP SIGNATURE-----

--gj572EiMnwbLXET9--
