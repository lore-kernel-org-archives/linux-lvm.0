Return-Path: <heinrichs@qis-systemhaus.de>
Message-Id: <3AE7DA2B.D79DF1C2@qis-systemhaus.de>
Date: Thu, 26 Apr 2001 10:19:55 +0200
From: Dirk Heinrichs <heinrichs@qis-systemhaus.de>
Mime-Version: 1.0
Subject: Re: [linux-lvm] Cannot unmount my /usr partition.....
References: <3AE7D6AA.895E9C79@gecpalau.com>
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

Glenn Shannon wrote:
>=20
> Hi all!
>=20
> Great job on LVM...loving it so far..just have a quick question if I
> may..
>=20
> Boots fine (better than fine!) and devfs reiser and lvm seem to play
> well together while they are running...... but upon shutdown I cannot
> unmount my /usr partition for some reason it is busy.
>=20
> I have hacked the init scripts to let me reboot successfully (as it IS a
> production machine with automatic reboot times entered in the cron) but
> it cannot deactivate my LVM due to the /usr partition being busy.
Hmm, I had this problem sometimes with RH6.x, but w/o LVM. So it may not
be related to LVM. On the other hand, where did you put the LVM
userspace tools? If they reside in /usr, this may cause your problem.
IMHO they belong into /, because they are needed at boot/shutdown time.

Hope this helps...

	Dirk
--=20
Dirk Heinrichs		| Tel:	+49 (0)241 413 260
Configuration Manager	| Fax:	+49 (0)241 413 2640
QIS Systemhaus GmbH	| Mail:	dheinrichs@qis-systemhaus.de
J=EF=BF=BDlicher Str. 338b	| Web:	http://www.qis-systemhaus.de
D-52070 Aachen		| ICQ#:	110037733
