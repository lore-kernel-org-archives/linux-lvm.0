Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o250xud9024861
	for <linux-lvm@redhat.com>; Thu, 4 Mar 2010 19:59:56 -0500
Received: from n11.bullet.mail.mud.yahoo.com (n11.bullet.mail.mud.yahoo.com
	[209.191.125.210])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id o250xfSN031119
	for <linux-lvm@redhat.com>; Thu, 4 Mar 2010 19:59:41 -0500
From: Afonso Henriques Silva Leite <afonsoleite@ymail.com>
Date: Thu, 04 Mar 2010 20:59:35 -0400
Message-ID: <1267750775.2916.23.camel@portuga-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] my project
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com

Hi everybody!!
First of all, I would like to apologize if my inexperience causes any
inconvenience.
I was reading lvm howto, and in the 5.7 section there was a suggestion
do discuss my ideas on the developer list, so here I am.
My project is to create a lvgroup to enlarge my root partition, so that
I can install Sage and Mathematica on it.
I divided my only 40GB hard disk as follows:

Comando (m para ajuda): p

Disco /dev/sda: 40.1 GB, 40060403712 bytes
255 heads, 63 sectors/track, 4870 cylinders
Unidades =3D cilindros de 16065 * 512 =3D 8225280 bytes
Identificador do disco: 0xea84ea84

Dispositivo Boot In=C3=ADcio Fim Blocos Id Sistema
/dev/sda1   *           1         623     5004216    7  HPFS ou NTFS
/dev/sda2             624        4870    34114027+   5  Estendida
/dev/sda5            4689        4870     1461883+  82  Linux swap /
Solaris
/dev/sda6             624        1246     5004184+  83  Linux
/dev/sda7            1247        4688    27647833+  83  Linux

My idea was to have a big partition only for documents, and a lower one
just for distro installations, so that I wouldn't need to do backups
when I decided to change the distributions. But after a few weeks, the
root partition was almost fullfilled, as df -H shows:

Sist. Arq.             Tam    Usado Disp  Uso% Montado em
/dev/sda6              5,1G   4,1G   738M  85% /
udev                   257M   283k   257M   1% /dev
none                   257M   873k   256M   1% /dev/shm
none                   257M    87k   257M   1% /var/run
none                   257M      0   257M   0% /var/lock
none                   257M      0   257M   0% /lib/init/rw
none                   5,1G   4,1G   738M
85% /var/lib/ureadahead/debugfs
/dev/sda7               28G    17G   9,8G
63% /media/04d003f6-a6ee-4a6c-8c84-2dd1136f8242

So guys, what do you think? Can I solve my problem with lvm? I mean, I
remember reading a warning to do not use lvm with root partitions. It's
impossible to do it?

Again, sorry for my poor english and inexperience, and thanks anyway.
