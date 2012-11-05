Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id qA5MORmh003522
	for <linux-lvm@redhat.com>; Mon, 5 Nov 2012 17:24:27 -0500
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qA5MOP6v024362
	for <linux-lvm@redhat.com>; Mon, 5 Nov 2012 17:24:25 -0500
Received: by mail-ie0-f174.google.com with SMTP id k13so10482616iea.33
	for <linux-lvm@redhat.com>; Mon, 05 Nov 2012 14:24:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <alpine.BSF.2.00.1211051646040.1851@tdream.lly.earlham.edu>
References: <alpine.BSF.2.00.1211051646040.1851@tdream.lly.earlham.edu>
Date: Tue, 6 Nov 2012 09:24:25 +1100
Message-ID: <CANN7Ug1XvFE=_dmHDCh6psn87GF7iM56c6TW7_Xk8=muXdg+cQ@mail.gmail.com>
From: Scott Merrilees <scott.merrilees@gmail.com>
Content-Type: multipart/alternative; boundary=14dae9340681ab7a7704cdc6f231
Subject: Re: [linux-lvm] how to swap a bad drive on a non-standard mirror
Reply-To: scott@merrilees.net,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

--14dae9340681ab7a7704cdc6f231
Content-Type: text/plain; charset=ISO-8859-1

Looks like a dmraid setup.  Googling Linux isw found me a rebuild guide.
On 06/11/2012 9:05 AM, "Randy Schultz" <schulra@earlham.edu> wrote:

> Hey all,
>
> I have a system that somebody set up, reportedly during the RHEL install,
> to have the 2 on-board drives
> mirrored.  We lost the second drive.  I know how to do deal with this on a
> standard setup with 2 PV's, but it
> looks like there is only 1 PV and I cannot find any documentation on how
> to deal with this.
>
> The system has 2 drives partitioned this way:
>      ? fdisk -l
>
>      Disk /dev/sda: 1000.2 GB, 1000204886016 bytes
>      255 heads, 63 sectors/track, 121601 cylinders
>      Units = cylinders of 16065 * 512 = 8225280 bytes
>
>         Device Boot      Start         End      Blocks   Id  System
>      /dev/sda1   *           1          13      104391   83  Linux
>      /dev/sda2              14      121600   976647577+  8e  Linux LVM
>
>      Disk /dev/sdb: 1000.2 GB, 1000204886016 bytes
>      255 heads, 63 sectors/track, 121601 cylinders
>      Units = cylinders of 16065 * 512 = 8225280 bytes
>
>         Device Boot      Start         End      Blocks   Id  System
>      /dev/sdb1   *           1          13      104391   83  Linux
>      /dev/sdb2              14      121600   976647577+  8e  Linux LVM
>
>
> The fstab mounts things as:
>      ? cat /etc/fstab
>      /dev/VolGroup00/LogVol00 /                       ext3    defaults
>    1 1
>      /dev/VolGroup00/LogVol02 /var                    ext3    defaults
>    1 2
>      /dev/VolGroup00/LogVol03 /opt                    ext3    defaults
>    1 2
>      LABEL=/boot             /boot                   ext3    defaults
>    1 2
>      tmpfs                   /dev/shm                tmpfs   defaults
>    0 0
>      devpts                  /dev/pts                devpts
>  gid=5,mode=620  0 0
>      sysfs                   /sys                    sysfs   defaults
>    0 0
>      proc                    /proc                   proc    defaults
>    0 0
>      /dev/VolGroup00/LogVol01 swap                    swap    defaults
>    0 0
>
>
> giving these mountpoints:
>      ? df -h
>      Filesystem            Size  Used Avail Use% Mounted on
>      /dev/mapper/VolGroup00-**LogVol00
>                             24G  9.1G   14G  41% /
>      /dev/mapper/VolGroup00-**LogVol02
>                             24G  555M   22G   3% /var
>      /dev/mapper/VolGroup00-**LogVol03
>                            770G   45G  686G   7% /opt
>      /dev/mapper/isw_ccebcbejfi_**Volume0p1
>                             99M   26M   69M  28% /boot
>      tmpfs                  14G     0   14G   0% /dev/shm
>
> There are no md devices:
>      ? cat /proc/mdstat
>      Personalities :
>      unused devices: <none>
>
>
> DMsetup shows:
>      ? dmsetup status
>      isw_ccebcbejfi_Volume0p2: 0 1953295155 linear
>      isw_ccebcbejfi_Volume0p1: 0 208782 linear
>      VolGroup00-LogVol03: 0 1666580480 linear
>      VolGroup00-LogVol02: 0 51183616 linear
>      VolGroup00-LogVol01: 0 184287232 linear
>      VolGroup00-LogVol00: 0 51183616 linear
>      isw_ccebcbejfi_Volume0: 0 1953519352 mirror 2 8:0 8:16 14905/14905 1
> AR 1 core
>
>
> Here's where things get weird.  Pvscan shows only 1 device:
>      ? pvscan -v
>          Wiping cache of LVM-capable devices
>          Wiping internal VG cache
>          Walking through all physical volumes
>        PV /dev/mapper/isw_ccebcbejfi_**Volume0p2   VG VolGroup00   lvm2
> [931.38 GB / 0    free]
>        Total: 1 [931.38 GB] / in use: 1 [931.38 GB] / in no VG: 0 [0   ]
>
>
> So, if I understand this correctly, sda2 and sdb2 were tied together
> somehow as a mirror, then this was
> presented to lvm as the PV.  Cool, but how do I swap out sdb?!
>
> --
>  Randy    (schulra@earlham.edu)      765.983.1283         <*>
>
> nosce te ipsum
>
> ______________________________**_________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/**mailman/listinfo/linux-lvm<https://www.redhat.com/mailman/listinfo/linux-lvm>
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-**HOWTO/<http://tldp.org/HOWTO/LVM-HOWTO/>
>

--14dae9340681ab7a7704cdc6f231
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Looks like a dmraid setup.=A0 Googling Linux isw found me a =
rebuild guide. </p>
<div class=3D"gmail_quote">On 06/11/2012 9:05 AM, &quot;Randy Schultz&quot;=
 &lt;<a href=3D"mailto:schulra@earlham.edu">schulra@earlham.edu</a>&gt; wro=
te:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Hey all,<br>
<br>
I have a system that somebody set up, reportedly during the RHEL install, t=
o have the 2 on-board drives<br>
mirrored. =A0We lost the second drive. =A0I know how to do deal with this o=
n a standard setup with 2 PV&#39;s, but it<br>
looks like there is only 1 PV and I cannot find any documentation on how to=
 deal with this.<br>
<br>
The system has 2 drives partitioned this way:<br>
=A0 =A0 =A0? fdisk -l<br>
<br>
=A0 =A0 =A0Disk /dev/sda: 1000.2 GB, 1000204886016 bytes<br>
=A0 =A0 =A0255 heads, 63 sectors/track, 121601 cylinders<br>
=A0 =A0 =A0Units =3D cylinders of 16065 * 512 =3D 8225280 bytes<br>
<br>
=A0 =A0 =A0 =A0 Device Boot =A0 =A0 =A0Start =A0 =A0 =A0 =A0 End =A0 =A0 =
=A0Blocks =A0 Id =A0System<br>
=A0 =A0 =A0/dev/sda1 =A0 * =A0 =A0 =A0 =A0 =A0 1 =A0 =A0 =A0 =A0 =A013 =A0 =
=A0 =A0104391 =A0 83 =A0Linux<br>
=A0 =A0 =A0/dev/sda2 =A0 =A0 =A0 =A0 =A0 =A0 =A014 =A0 =A0 =A0121600 =A0 97=
6647577+ =A08e =A0Linux LVM<br>
<br>
=A0 =A0 =A0Disk /dev/sdb: 1000.2 GB, 1000204886016 bytes<br>
=A0 =A0 =A0255 heads, 63 sectors/track, 121601 cylinders<br>
=A0 =A0 =A0Units =3D cylinders of 16065 * 512 =3D 8225280 bytes<br>
<br>
=A0 =A0 =A0 =A0 Device Boot =A0 =A0 =A0Start =A0 =A0 =A0 =A0 End =A0 =A0 =
=A0Blocks =A0 Id =A0System<br>
=A0 =A0 =A0/dev/sdb1 =A0 * =A0 =A0 =A0 =A0 =A0 1 =A0 =A0 =A0 =A0 =A013 =A0 =
=A0 =A0104391 =A0 83 =A0Linux<br>
=A0 =A0 =A0/dev/sdb2 =A0 =A0 =A0 =A0 =A0 =A0 =A014 =A0 =A0 =A0121600 =A0 97=
6647577+ =A08e =A0Linux LVM<br>
<br>
<br>
The fstab mounts things as:<br>
=A0 =A0 =A0? cat /etc/fstab<br>
=A0 =A0 =A0/dev/VolGroup00/LogVol00 / =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 ext3 =A0 =A0defaults =A0 =A0 =A0 =A01 1<br>
=A0 =A0 =A0/dev/VolGroup00/LogVol02 /var =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0ext3 =A0 =A0defaults =A0 =A0 =A0 =A01 2<br>
=A0 =A0 =A0/dev/VolGroup00/LogVol03 /opt =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0ext3 =A0 =A0defaults =A0 =A0 =A0 =A01 2<br>
=A0 =A0 =A0LABEL=3D/boot =A0 =A0 =A0 =A0 =A0 =A0 /boot =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 ext3 =A0 =A0defaults =A0 =A0 =A0 =A01 2<br>
=A0 =A0 =A0tmpfs =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /dev/shm =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0tmpfs =A0 defaults =A0 =A0 =A0 =A00 0<br>
=A0 =A0 =A0devpts =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/dev/pts =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0devpts =A0gid=3D5,mode=3D620 =A00 0<br>
=A0 =A0 =A0sysfs =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /sys =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0sysfs =A0 defaults =A0 =A0 =A0 =A00 0<br>
=A0 =A0 =A0proc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/proc =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 proc =A0 =A0defaults =A0 =A0 =A0 =A00 0<br>
=A0 =A0 =A0/dev/VolGroup00/LogVol01 swap =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0swap =A0 =A0defaults =A0 =A0 =A0 =A00 0<br>
<br>
<br>
giving these mountpoints:<br>
=A0 =A0 =A0? df -h<br>
=A0 =A0 =A0Filesystem =A0 =A0 =A0 =A0 =A0 =A0Size =A0Used Avail Use% Mounte=
d on<br>
=A0 =A0 =A0/dev/mapper/VolGroup00-<u></u>LogVol00<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 24G =A09.1G =A0 14G=
 =A041% /<br>
=A0 =A0 =A0/dev/mapper/VolGroup00-<u></u>LogVol02<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 24G =A0555M =A0 22G=
 =A0 3% /var<br>
=A0 =A0 =A0/dev/mapper/VolGroup00-<u></u>LogVol03<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0770G =A0 45G =A0686G=
 =A0 7% /opt<br>
=A0 =A0 =A0/dev/mapper/isw_ccebcbejfi_<u></u>Volume0p1<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 99M =A0 26M =A0 69M=
 =A028% /boot<br>
=A0 =A0 =A0tmpfs =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A014G =A0 =A0 0 =A0 14G =
=A0 0% /dev/shm<br>
<br>
There are no md devices:<br>
=A0 =A0 =A0? cat /proc/mdstat<br>
=A0 =A0 =A0Personalities :<br>
=A0 =A0 =A0unused devices: &lt;none&gt;<br>
<br>
<br>
DMsetup shows:<br>
=A0 =A0 =A0? dmsetup status<br>
=A0 =A0 =A0isw_ccebcbejfi_Volume0p2: 0 1953295155 linear<br>
=A0 =A0 =A0isw_ccebcbejfi_Volume0p1: 0 208782 linear<br>
=A0 =A0 =A0VolGroup00-LogVol03: 0 1666580480 linear<br>
=A0 =A0 =A0VolGroup00-LogVol02: 0 51183616 linear<br>
=A0 =A0 =A0VolGroup00-LogVol01: 0 184287232 linear<br>
=A0 =A0 =A0VolGroup00-LogVol00: 0 51183616 linear<br>
=A0 =A0 =A0isw_ccebcbejfi_Volume0: 0 1953519352 mirror 2 8:0 8:16 14905/149=
05 1 AR 1 core<br>
<br>
<br>
Here&#39;s where things get weird. =A0Pvscan shows only 1 device:<br>
=A0 =A0 =A0? pvscan -v<br>
=A0 =A0 =A0 =A0 =A0Wiping cache of LVM-capable devices<br>
=A0 =A0 =A0 =A0 =A0Wiping internal VG cache<br>
=A0 =A0 =A0 =A0 =A0Walking through all physical volumes<br>
=A0 =A0 =A0 =A0PV /dev/mapper/isw_ccebcbejfi_<u></u>Volume0p2 =A0 VG VolGro=
up00 =A0 lvm2 [931.38 GB / 0 =A0 =A0free]<br>
=A0 =A0 =A0 =A0Total: 1 [931.38 GB] / in use: 1 [931.38 GB] / in no VG: 0 [=
0 =A0 ]<br>
<br>
<br>
So, if I understand this correctly, sda2 and sdb2 were tied together someho=
w as a mirror, then this was<br>
presented to lvm as the PV. =A0Cool, but how do I swap out sdb?!<br>
<br>
--<br>
=A0Randy =A0 =A0(<a href=3D"mailto:schulra@earlham.edu" target=3D"_blank">s=
chulra@earlham.edu</a>) =A0 =A0 =A0765.983.1283 =A0 =A0 =A0 =A0 &lt;*&gt;<b=
r>
<br>
nosce te ipsum<br>
<br>
______________________________<u></u>_________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/<u></u>mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-<u></u>HOWTO/</a><br>
</blockquote></div>

--14dae9340681ab7a7704cdc6f231--
