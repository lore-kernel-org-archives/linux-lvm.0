From: Ulrich Wiederhold <U.Wiederhold@gmx.net>
Message-ID: <20011024110758.D8640@sky.net>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] /etc ro mounten
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
Date: Wed Oct 24 04:05:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hello,
at debian-user-de runs a thread at the moment to mount /etc ro and a
consens is that in /etc only static files should be stored.

lvm need=B4s to write /etc at bootup and for backup-copies. I would prefer
to stor the files that need to be writeable in /var.=20

What do you think about a change for the next release? (or is there
already a compile-function?).

This would solve the problems with / ro at startup, isn=B4t it?

Uli

--=20
'The box said, 'Requires Windows 95 or better', so i installed Linux - TKK 5
