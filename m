Return-Path: <fzzgrr@gmx.net>
Date: Tue, 21 Aug 2001 13:00:33 +0200
From: Ulrich Wiederhold <U.Wiederhold@gmx.net>
Message-ID: <20010821130033.D402@sky.net>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] vgscan && vgchange -ay at startup
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

Hello,
if I reboot, the file /etc/rcS.d/S25lvm failed to find and activate my
vg.
I suppose that=B4s because the shutdown of the vg fails. (Not umounted all
before?)

Anybody else had this problems with debian unstable?
Uli

--=20
'The box said, 'Requires Windows 95 or better', so i installed Linux - TKK 5
