Message-Id: <3BAF2471.EEE47116@qis-systemhaus.de>
Date: Mon, 24 Sep 2001 14:17:53 +0200
From: Dirk Heinrichs <heinrichs@qis-systemhaus.de>
Mime-Version: 1.0
Subject: Re: [linux-lvm] Linux File System
References: <71B659EFA1EAD311932700508B6460B9017A5204@mailman.isoft.intranet.gr>
Content-Transfer-Encoding: quoted-printable
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

linux-lvm-admin@sistina.com wrote:
>=20
> Hi there !
> I have installed the LVM tools on a Mandrake Linux system. After the
> creation of a volume group, and the succesfull creation of a logical
> volume
> I have tried to add a filesystem within this logical volume. After
> mounting
> the file system, I have this problem: after I have used half of the fil=
e
> system's free space, system reports that file system is full (!)
> although I
> can see with "df -k" that there is still enough space available. I woul=
d
> apreciate any help,
Maybe you ran out of inodes, try df -i to show available inodes.

Bye...

	Dirk
--=20
Dirk Heinrichs		| Tel:	+49 (0)241 413 260
Configuration Manager	| Fax:	+49 (0)241 413 2640
QIS Systemhaus GmbH	| Mail:	dheinrichs@qis-systemhaus.de
J=FClicher Str. 338b	| Web:	http://www.qis-systemhaus.de
D-52070 Aachen		| ICQ#:	110037733
