From: Goetz Bock <bock@blacknet.de>
Message-ID: <20020615005656.A3860@zealot.blacknet.de>
References: <OF8353947B.FB8E02FC-ON80256BD8.00693D8A@de.ibm.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <OF8353947B.FB8E02FC-ON80256BD8.00693D8A@de.ibm.com>; from BORKEN@de.ibm.com on Fri, Jun 14, 2002 at 08:30:52PM +0100
Subject: [linux-lvm] Re: =?iso-8859-1?Q?=5Blinux-lvm=5D_LVM_mit_einem_Readonly_rootfs_m=F6glich?=
 =?iso-8859-1?Q?=3F?=
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
Date: Fri Jun 14 17:57:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: Linux-LVM@Sistina.com

On Fri, Jun 14 '02 at 20:30, Andre Borkenfeld wrote:
> Hallo Herr Mauelshagen,
While I'm not Heinz, I know German and might have a different solution
... (btw. I think it's rude to post to an international ML in German,
but there might be some documentation that leads people to belive this
is a personal mail address :-/ )
=20
> wir setzen die SuSE Distribution f=EF=BF=BDr die zSeries ein (s390, 64bit=
). Unserer
> kernelstand ist 2.4.17-timer mit gcc 2.95.
> Wir haben folgendes vor:
> - Aufbau eines Linux systems als "Mastersystem"
> - Aufbau mehrerer Linux-Clone. Diese haben readonly Zugriff auf das
> root-filesystem des Mastersystemes.
> Dies soll Plattenplatz aber vor allem Wartung sparen.
[ In English:
  We're currently using SuSE on a zSeries with kernel 2.4.17-timer and gcc
  2.95. We'd like to create a master linux image and multiple colnes with RO
  access to the master root filesystem.Beside saving storage space, it
  should save maintenance. ]
=20
> Wir haben nun ein Problem:
> Wir wollen Ihren LVM einsetzen. Leider schreibt der LVM in /etc mehrere
> files/directories. Die Directories konnten wir durch links in ein
> rw-filesystem umlenken; Bei der lvmtab versagt diese Technik jedoch.
[ While we'd like to use LVM but it requires rw for /etc. ]

I'd like to suggest:

a) skip vgscan, it is not requires IF your LVM meta information is
   correct (IIRC)
b) what about linking  =20
   /etc/lvmtab -> /var/run/lvmtab
   /etc/lvmconf -> /var/run/lvmconf/
   /etc/lvmtab.d -> /var/run/lvmtab.d/
   as long as LVM does not remove the link for lvmtab first, this should
   work (I did not test this)

Cu,
    Goetz.
