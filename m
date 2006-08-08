Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k786pGmA014091
	for <linux-lvm@redhat.com>; Tue, 8 Aug 2006 02:51:16 -0400
Received: from dark-templar.advansoft.us ([166.70.63.214])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k786pDUW031591
	for <linux-lvm@redhat.com>; Tue, 8 Aug 2006 02:51:15 -0400
Received: from [10.3.219.138] (72-254-42-65.client.stsn.net [72.254.42.65])
	by dark-templar.advansoft.us (Postfix) with ESMTP id 909B46812E
	for <linux-lvm@redhat.com>; Tue,  8 Aug 2006 00:51:07 -0600 (MDT)
From: "Lamont R. Peterson" <peregrine@openbrainstem.net>
Subject: Re: [linux-lvm] Running LVM on shared LUNs
Date: Tue, 8 Aug 2006 00:50:36 -0600
References: <1154987972.16651.28.camel@localhost.localdomain>
In-Reply-To: <1154987972.16651.28.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2304038.59QIrMFZNj";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200608080050.42004.peregrine@openbrainstem.net>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM <linux-lvm@redhat.com>

--nextPart2304038.59QIrMFZNj
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Monday 07 August 2006 03:59pm, Joshua Aune wrote:
> I have two systems that are connected to a SAN.  The SAN is exporting
> the same 4 luns to each system (/dev/sd[b,c,d,e]).  Under normal
> operation system1 will combine sdb with sdc into a vg and system2 will
> combine sdd with sde into a vg with both vgs consisting of one large lv
> and one small lv.  After the system is configured there will be no
> modifications made to the LVM configuration.  LVM is configured on one
> node and then copied over to the second node.
>
> The million dollar question is, can system1 and system2 simultaneously
> have both of the VGs active without hosing any data?

As I understand it, only if you are using a filesystem that supports cluste=
red=20
operations, like GFS.

> I am not trying to have the same filesystem mounted simultaneously, just
> have the LVs available simultaneously for failover needs

In that case, as long as you have some heartbeat or something that lets you=
=20
know when the one system needs to take over the other's PVs.  The trick her=
e=20
is that if you lose your network connection, but the box is still accessing=
=20
data on the LUNs, that could become problematic.  Maybe a tiny little share=
d=20
GFS thing would allow your boxes a place to write some status info (a=20
custom "heartbeat", if you will) so that a network disconnect or other issu=
e=20
won't cause false alarms.

Probably best to just use GFS.

> I know that this sort of config can be done with the GFS pool volume
> manger but I have been told that many other VMs don't support this
> behavior....

/me shrugs

Not sure about that as I don't have any SAN to play with :( .  Never tried =
it.
=2D-=20
Lamont R. Peterson <peregrine@OpenBrainstem.net>
=46ounder [ http://blog.OpenBrainstem.net/peregrine/ ]
GPG Key fingerprint: 0E35 93C5 4249 49F0 EC7B  4DDD BE46 4732 6460 CCB5
  ___                   ____            _           _
 / _ \ _ __   ___ _ __ | __ ) _ __ __ _(_)_ __  ___| |_ ___ _ __ ___
| | | | '_ \ / _ \ '_ \|  _ \| '__/ _` | | '_ \/ __| __/ _ \ '_ ` _ \
| |_| | |_) |  __/ | | | |_) | | | (_| | | | | \__ \ ||  __/ | | | | |
 \___/| .__/ \___|_| |_|____/|_|  \__,_|_|_| |_|___/\__\___|_| |_| |_|
      |_|               Intelligent Open Source Software Engineering
                              [ http://www.OpenBrainstem.net/ ]

--nextPart2304038.59QIrMFZNj
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQBE2DRBvkZHMmRgzLURAiMgAJ9iSY5IwT3DSRwcBQTWGVC8MYULBQCgguyU
n+5mfGTpoayVLJGP1WaYO0U=
=p+U7
-----END PGP SIGNATURE-----

--nextPart2304038.59QIrMFZNj--
