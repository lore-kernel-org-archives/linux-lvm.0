From: Michael Frotscher <michael@frotscher.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200209251011.05774.michael@frotscher.net>
Subject: [linux-lvm] drive-spindown
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
Date: Wed Sep 25 03:18:44 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello, all

I'd like to have the drives of my LVM-system (SuSE 8.0) to spin down=20
when the volume is not used (it's a data-volume only, the system=20
resides somewhere else). The volume consists of one partition of hda=20
and drives hdb and hdc are completely dedicated to it.

I tried to set a spindown-time in BIOS as well as hdparm -S, but=20
strangely only hdc powers down (checked that with hdparm -C). I don't=20
really expect hda to power down as the system resides on it, but hdb=20
obviously should. Does anyone have an idea why it doesn't?=20
--=20
cheers,

Michael
