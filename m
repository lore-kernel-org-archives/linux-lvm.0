Date: Mon, 23 Aug 1999 09:12:44 -0500
From: Brian Wolfe <ahzz@yamato.terrabox.com>
Subject: Re: [linux-lvm] LVM and Debian
Message-ID: <19990823091244.D23814@yamato.terrabox.com>
References: <37BD9B5B.A1247F83@mainland.ab.ca> <19990820140959.A23553@cyberhqz.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary=rqzD5py0kzyFAOWN; micalg=pgp-md5;
	protocol="application/pgp-signature"
In-Reply-To: <19990820140959.A23553@cyberhqz.com>; from Ryan Murray on Fri, Aug 20, 1999 at 02:09:59PM -0700
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@msede.com


--rqzD5py0kzyFAOWN
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 20, 1999 at 02:09:59PM -0700, Ryan Murray wrote:
> On Fri, Aug 20, 1999 at 12:15:55PM -0600, Drew Smith wrote:
> > 	So I did manage to get 0.7 to compile happily under Debian - using
> > 2.2.10-ac12.  This was difficult, and I've discovered why - either
> > Debian or LVM isn't properly referencing where the includes are stored.=
=20
> > My fix was:
>=20
> I haven't actually compiled the tools under debian myself.  Debian does
> not have /usr/include/linux matching up with the kernel release, so any
> patches you might do to the kernel won't show up.
>=20

	Actualy you are supposed to symlink /usr/include/linux to /usr/src/linux/i=
nclude/linux. I'm told by the head honchos at Debian that this method has b=
een semi-officialy endorsed as the proper method instead of installing the =
.h files in /usr/include/linux. If you do it this way you find all the patc=
hes include files as well.

> > 	My problems begin here - it worked happily!  I shared it out to the
> > others via Samba, and they happily drug and dropped mass quantities of
> > .MP3's to it.  After a while, it crashed.
>=20
> Was there anything recorded by syslog?  How did it crash?
>=20
> > 	I'm sort of hypothesizing that it crashed as it hit the end of the
> > first drive - I'm only doing a linear setup, no stripes.  Roughly at the
>=20
> I've got about 40GB of mix'n'match drives -- 12GB IDE's, .5GB SCSIs,
> full height, half height, a real mix of everything, so striping wouldn't
> help that much.  If you are using ext2fs on the lv, you'll hit all over
> the drives, so there won't be a "just before the second drive".  ext2fs
> will space out the files all over the lv.
>=20
> > time that it WOULD have hit 9G, it locked the system solid, requiring a
> > power-down.  Unfortunately, the machine doesn't have a head most of the
> > time, so no errors were noted.
>=20
> Do you have magic sys-rq compiled in?  This could be useful...
>=20
> > 	Since then, I've compiled 2.2.11-ac3, and have been working on getting
> > the same setup running again - with one exception.  I tried to put a
>=20
> I've been using 2.2.10-ac12 and 2.2.11-ac1, althought -ac1 has known TCP
> problems...
>


Running vanilla 2.2.10+lvm-0.7 here on a production server that gets pounde=
d every night round 2am. :) It's serving as a primary mirror for Debian htt=
p and ftp distribution. I get occasional scsi errors out of my ancient aha2=
940-pci and lvm handles these very nicely so far.=20
=20
> > seems I don't own a single 50-pin ribbon cable that is clean enough to
> > avoid timeouts.  At 2am, I powered it off and left it for my bed - had
>=20
> Yes, that can be a problem.  It's also a problem when one drive dies and
> you aren't running raid on it at any level.  When using older full
> height SCSI drives in stripe/linear, if you don't add raid to it
> somewhere, you are only as strong as the weakest drive.  I dunno if I'd
> trust heavily used drives nearing the end of their life...
>=20
> > tonight. Has anyone had any problems with stability under Debian, and/or
> > tracked down what those might stem from?  I'm running the machine now
>=20
> I'm running debian potato on one machine, but it isn't running LVM.  The
> LVM system is a Slackware 4.0 system, still on libc5.  Maybe it is libc?
>  If you are running the latest from potato (2.1.x) it may not be
> compatible with the tools as is, I dunno if anyone has looked into it
> yet.

	As noted above, Debian Potato( 2.2 ) with vanilla 2.2.10+lvm-0.7. Dual pII=
I 450/512MB 9g,5x4.5g scsi.

yamato.terrabox.com:

  9:11am  up 10 days, 11:14,  2 users,  load average: 0.52, 0.33, 0.18

Host: scsi0 Channel: 00 Id: 00 Lun: 00 main.html
  Vendor: SEAGATE  Model: ST410800N        Rev: 0025
  Type:   Direct-Access                    ANSI SCSI revision: 02
Host: scsi0 Channel: 00 Id: 01 Lun: 00
  Vendor: SEAGATE  Model: ST15150N         Rev: 0017
  Type:   Direct-Access                    ANSI SCSI revision: 02
Host: scsi0 Channel: 00 Id: 02 Lun: 00
  Vendor: SEAGATE  Model: ST15150N         Rev: 1005
  Type:   Direct-Access                    ANSI SCSI revision: 02
Host: scsi0 Channel: 00 Id: 03 Lun: 00
  Vendor: SEAGATE  Model: ST15150N         Rev: 0020
  Type:   Direct-Access                    ANSI SCSI revision: 02
Host: scsi1 Channel: 00 Id: 10 Lun: 00
  Vendor: MICROP   Model: 4345WS           Rev: x43h
  Type:   Direct-Access                    ANSI SCSI revision: 02
Host: scsi1 Channel: 00 Id: 11 Lun: 00
  Vendor: MICROP   Model: 4345WS           Rev: X502
  Type:   Direct-Access                    ANSI SCSI revision: 02

Linux yamato 2.2.10 #2 SMP Mon Aug 9 03:59:02 CDT 1999 i686 unknown

LVM version 0.7  by Heinz Mauelshagen  (12/07/1999)
lvm -- Driver successfully initialized
(scsi0) <Adaptec AHA-294X SCSI host adapter> found at PCI 17/0
(scsi0) Narrow Channel, SCSI ID=3D7, 16/255 SCBs
(scsi0) Downloading sequencer code... 406 instructions downloaded
(scsi1) <Adaptec AHA-294X Ultra SCSI host adapter> found at PCI 18/0
(scsi1) Wide Channel, SCSI ID=3D7, 16/255 SCBs
(scsi1) Downloading sequencer code... 413 instructions downloaded
scsi0 : Adaptec AHA274x/284x/294x (EISA/VLB/PCI-Fast SCSI) 5.1.17/3.2.4
       <Adaptec AHA-294X SCSI host adapter>
scsi1 : Adaptec AHA274x/284x/294x (EISA/VLB/PCI-Fast SCSI) 5.1.17/3.2.4
       <Adaptec AHA-294X Ultra SCSI host adapter>
scsi : 2 hosts.


	Here are the scsi errros i've logged since i booted 10 days ago. Everythin=
g seems to be ok and functional...

SCSI disk error : host 0 channel 0 id 2 lun 0 return code =3D 2
scsidisk I/O error: dev 08:21, sector 5976322
(scsi0:0:2:0) Performing Domain validation.
(scsi0:0:2:0) Successfully completed Domain validation.
nmap uses obsolete (PF_INET,SOCK_PACKET)
SCSI disk error : host 0 channel 0 id 2 lun 0 return code =3D 2
scsidisk I/O error: dev 08:21, sector 8287666
(scsi0:0:2:0) Performing Domain validation.
(scsi0:0:2:0) Successfully completed Domain validation.
SCSI disk error : host 0 channel 0 id 2 lun 0 return code =3D 2
scsidisk I/O error: dev 08:21, sector 5478418
(scsi0:0:2:0) Performing Domain validation.
(scsi0:0:2:0) reducing SCSI transfer speed due to Domain validation failure.
(scsi0:0:2:0) Performing Domain validation.
(scsi0:0:2:0) Successfully completed Domain validation.




--rqzD5py0kzyFAOWN
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: 2.6.3ia

iQCVAwUBN8FW3FoyucRTDyulAQFqZgQAlVhekTpS0oBMHUUe2qc/e7D2zh2A/0Vs
RwbZ+UMR5jvXjQdMRaLeGLbm+zjIMFH3jCprcV6R3hhsc7F3N9HHf5sN+M7aFAHr
rOdRUh5by0Blgmvi2YRft2IkBiRsynbkO0/8rvMCDqV3KNm09hS2+IlPj4vbX/Or
OhIjZs3AC+4=
=jpjy
-----END PGP SIGNATURE-----

--rqzD5py0kzyFAOWN--
