Date: Thu, 11 Oct 2001 01:14:44 +0200
From: Ulrich Wiederhold <U.Wiederhold@gmx.net>
Message-ID: <20011011011444.A2302@sky.net>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Problems after restarting my debian
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
I had to restart my PC because of a power-failure...
Now I can=B4t mount my lvm-volume anymore.

I fixed the uuids using the uuid_fixer on all my pv=B4s.

home:/home/fzzgrr# vgscan=20
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
group

Now I wanna restore my backups using
home:/home/fzzgrr# vgcfgrestore -n vg01 -l
Speicherzugriffsfehler

(memory access failure)


I can=B4t even make a pvscan or pvdisplay:
home:/home/fzzgrr# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ERROR "pv_read(): LVM structure version" reading physical
volumes

home:/home/fzzgrr# pvdisplay /dev/sdb1
pvdisplay -- ERROR "pv_read(): LVM structure version" no VALID physical
volume "/dev/sdb1"


What can I do?
Uli


--=20
'The box said, 'Requires Windows 95 or better', so i installed Linux - TKK 5
