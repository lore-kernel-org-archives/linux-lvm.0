Message-ID: <3D6606DD.72E5BB37@ac-amiens.fr>
From: Thierry VOYAT <Thierry.Voyat@ac-amiens.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] can't snap a mounted (reiserfs|ext3) with kernel 2.2.x
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
Date: Fri Aug 23 05:01:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

I need to unmount the lvm partition before i can realize a valid
snapshot of a journalized fs (reiserfs or ext)
All works fine with ext2 :

mount -t ext3 /dev/vg0/ext3fs	=3D>ok
lvreate snap /dev/vg0/ext3fs	=3D> ok
mount snap  	=3D> FAILED
	mount: block device /dev/vg0/snap is write-protected, mounting
read-only
	mount: wrong fs type, bad option, bad superblock on /dev/vg0/snap,
	       or too many mounted file systems

umount /dev/vg0/ext3fs	=3D>ok
lvreate snap /dev/vg0/ext3fs	=3D> ok
mount snap  	=3D> ok

mount -t ext2 /dev/vg0/ext2fs	=3D>ok
lvreate snap /dev/vg0/ext2fs	=3D> ok
mount snap  	=3D> ok


Redhat 6.2 on IBM Netfinity
kernel used: 2.2.19, 2.2.20, 2.2.21
patches: reiserfs-3.5.35,=20
	ext3-0.0.7a
	linux-2.2.18-rawio.patch,=20
	linux-2.2.19.kdb.diff,=20
	linux-2.2.19.ext3.diff
LVM: 1.0.3, 1.0.4, 1.0.5 patches and utils


I known there was a patch for kernel 2.4.x for VFS-lock but nothing for
kenel 2.2.x series.

I can't upgrade to kernel 2.4. What can i do ?



--=20
     ?????      Thierry VOYAT       T=EF=BF=BDl: (33) 3 22 82 38 39
    ( 0 0 )     Rectorat Amiens     Fax: (33) 3 22 82 39 16
---oOo(_)oOo--- 20 boulevard Alsace-Lorraine - 80063 AMIENS
Les faiblesses des hommes font la force des femmes. Voltaire
