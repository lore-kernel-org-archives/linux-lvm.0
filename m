From: Xavier Montagutelli <Xavier.Montagutelli@insa-tlse.fr>
Subject: Re: [linux-lvm] LVM1 Snapshot
In-Reply-To: <20030401153516.59070.qmail@web14409.mail.yahoo.com>
Message-ID: <Pine.LNX.4.44.0304011748590.15791-100000@gmmpc1.gmm.priv>
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
Date: Tue Apr  1 09:53:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, 1 Apr 2003, Aman Shahi wrote:

>
> Using LVM1, how do I create a snapshot LV on a
> different physical device than the original LV

Add at the end of your "lvcreate" command the name of the physical device
to use :

fantastic:/usr/local/sbin# lvcreate --help
Logical Volume Manager 1.0.6
Heinz Mauelshagen, Sistina Software  25/10/2002 (IOP 10)

[..]

lvcreate -s|--snapshot [-c|--chunksize ChunkSize]
        {-l|--extents LogicalExtentsNumber |
         -L|--size LogicalVolumeSize[kKmMgGtT]}
        -n|--name SnapshotLogicalVolumeName
        LogicalVolume[Path] [PhysicalVolumePath...]


But it does not work if the physical volume is a md device.

--
[ Xavier Montagutelli          `""'                                   ]
[ INSA Toulouse                0--0                                   ]
[               ---------oOOo---()---oOOo----------                   ]
[ Dpt de Math / Service Informatique  Tel: +33 5 61 55 93 38 / 67     ]
[ 135, Avenue de Rangueil             Fax: +33 5 61 55 93 20 / 60     ]
[ 31077 Toulouse Cedex 4              Mel: montagut@gmm.insa-tlse.fr  ]
