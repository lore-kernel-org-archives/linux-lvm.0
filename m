From: Xavier Montagutelli <Xavier.Montagutelli@gmm.insa-tlse.fr>
Subject: Re: [linux-lvm] mount reiserfs snapshot failed
In-Reply-To: <3CBEA630.E186CE9C@mc-lindinger.de>
Message-Id: <Pine.LNX.4.44.0204181405220.24233-100000@gmmpc1.gmm.priv>
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
Date: Thu Apr 18 07:14:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, 18 Apr 2002, Markus Bartl wrote:

> Joe Thornber wrote:
> >
> > On Thu, Apr 18, 2002 at 11:33:31AM +0200, Markus Bartl wrote:
> > > Hi there.
> > >
> > > Im using the original kernel 2.4.18 with the locking patch and the
> > > lvm-patch applied. I use the lvm in Version 1.1rc1.
> > > I got one harddisk with 4 partitions on it, 1 partition is Linux LVM.
> > > The volume to backup is mounted on /home and has reiserfs.
> > >
[..]
> > > In some cases mounting the snapshot volume fails with error 32 (wrong fs
> > > type or bad superblock).
> > > Anybody got any idea???

No idea, but for information, I have the same problem on a kernel 2.4.17 +
linux-2.4.11-VFS-lock.patch + patch reiserfs-quota, with LVM 1.0.2

> Im now going to build the 1.0.3 kernel module and try it that way.



[ Xavier Montagutelli          `""'                                   ]
[ INSA Toulouse                0--0                                   ]
[               ---------oOOo---()---oOOo----------                   ]
[ Dpt de Math / Service Informatique  Tel: +33 5 61 55 93 38 / 67     ]
[ 135, Avenue de Rangueil             Fax: +33 5 61 55 93 20 / 60     ]
[ 31077 Toulouse Cedex 4              Mel: montagut@gmm.insa-tlse.fr  ]
