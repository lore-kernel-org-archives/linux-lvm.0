From: "yves.alloyer" <Yves.ALLOYER@slpinfoware.com>
Subject: RE: [linux-lvm] Setup for RAID1 with LVM
Message-Id: <NEBBLHFAEINCLDICDLOAAEGMCIAA.yves.alloyer@slpinfoware.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5E34D857F6BB704CA3369B7553233A81651A7E@ntsviemxs0152.connect.at-work.ent>
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
Date: Mon Nov 19 03:37:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com
Cc: Ferenc.Csuk@one.at

Sorry for the late answer, I was off line for some time. Sorry if you get
this one twice Ferenc.
I ran into a very similar issue some time ago using stock 1.0.1rc4 (not
CVS).
I tried zeroing the first block of the MD device... it didn't help.
This was discussed and solved in the "[linux-lvm] pvcreate fails on a
software RAID metadisk" thread.
The patch that was generated at that time and which made it into CVS was:
--- tools/lib/lvm_check_partitioned_dev.c.bluca	Thu Aug 23 07:51:53 2001
+++ tools/lib/lvm_check_partitioned_dev.c	Fri Oct  5 21:18:51 2001
@@ -55,6 +55,8 @@
 	switch (lvm_get_device_type(st_rdev)) {
 	case LVM_DEVICE_TYPE_INVALID:
 	    break;
+	case LVM_DEVICE_TYPE_MD:
+	    break;
 	default:
 	    ret =3D TRUE;
 	}

--

Yves
> -----Original Message-----
> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of Csuk, Ferenc
> Sent: Thursday, November 15, 2001 4:58 PM
> To: 'Mauelshagen@Sistina.com'
> Cc: 'linux-lvm@sistina.com'; 'jens.bruckmann@suse.de'
> Subject: [linux-lvm] Setup for RAID1 with LVM
>
>
> Dear Heinz,
>
> I have read your archive discussion on this topic and your suggested
> solution for it, see below. Now we would like to do it as well,
> but when we
> start pvcreate /dev/md0 we get the following error: invalid partition type
> 0x83 for /dev/md0" (must be 0x8e). Unfortunatelly we can=EF=BF=BDt change=
 it using
> fdisk.
>
> What was the solution for it in your case?
>
> Thank you in advance.
>
> Regards,
> Ferenc
>
>
>
> > - create a md0 RAID1 device with your 2 disks (mirror, no use of LVM)
> >   - set the parttion ID to RAID autodetect (0xfd)
> >   - edit /etc/raidtab (see RAID Howto)
> >   - mkraid /dev/md0
> > - install LVM utilities (0.9.1beta3)
> > - pvcreate /dev/md0
> > - vgcreate -n BGNAME /dev/md0
> > - lvcreate <some logical volume>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
