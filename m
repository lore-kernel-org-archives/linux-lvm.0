From: Xavier Montagutelli <Xavier.Montagutelli@gmm.insa-tlse.fr>
Subject: Re: [linux-lvm] mounting reiserfs snaphost fails
In-Reply-To: <3D9D4C5B.F4352F4E@silicide.dk>
Message-ID: <Pine.LNX.4.44.0210041047310.21409-100000@gmmpc1.gmm.priv>
MIME-Version: 1.0
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
Date: Fri Oct  4 03:53:32 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, 4 Oct 2002, Jon Bendtsen wrote:

> "Heinz J . Mauelshagen" wrote:
> >
> > Did you put the VFS lock patch in?
> > You need that to be able to mount snapshots of *journaled* filesystems.
>
> Where do i find that patch ?
> Does 2.4.19 contain it ? does the latest kernel, if 2.4.19 isnt the
> latest ?

You will find it under PATCHES/linux-2.4.19-VFS-lock.patch in the LVM
source archive.

--
[ Xavier Montagutelli          `""'                                   ]
[ INSA Toulouse                0--0                                   ]
[               ---------oOOo---()---oOOo----------                   ]
[ Dpt de Math / Service Informatique  Tel: +33 5 61 55 93 38 / 67     ]
[ 135, Avenue de Rangueil             Fax: +33 5 61 55 93 20 / 60     ]
[ 31077 Toulouse Cedex 4              Mel: montagut@gmm.insa-tlse.fr  ]
