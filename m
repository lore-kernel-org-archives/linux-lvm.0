From: Xavier Montagutelli <Xavier.Montagutelli@gmm.insa-tlse.fr>
Subject: Re: [linux-lvm] md + lvm + reiser
In-Reply-To: <20020907221823.GL22569@maybe.net>
Message-ID: <Pine.LNX.4.44.0209082340310.3113-100000@gmmpc1.gmm.priv>
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
Date: Sun Sep  8 16:46:10 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, 7 Sep 2002, Chris Jantzen wrote:

> Excuse me if this has been covered already, though I did try to read
> through the archives. I am running md raid5 (software) over several
> drives and importing that into LVM and using reiserfs. It's worked fine
> for some time, but now I want to start snapshots. I've learned about the
> VFS lock patch, yes, but my real question is: why is the raid5 buffer
> cache constantly thrashing back and forth? I assume this has to do with
> a conflict between reiserfs's 4096 byte blocks and LVM's 512
> SECTOR_SIZE. Or did I configure something wrong somewhere? Is it safe to
> just change SECTOR_SIZE in lvm.h or will that mess up on-disk
> structures? Thank you.

I have exactly the same symptoms with the same configuration (md + lvm +
reiser) ; the raid5 cache size keeps changing when I start using
snapshots. Does someone have some tips to avoid/explain this ?


--
[ Xavier Montagutelli          `""'                                   ]
[ INSA Toulouse                0--0                                   ]
[               ---------oOOo---()---oOOo----------                   ]
[ Dpt de Math / Service Informatique  Tel: +33 5 61 55 93 38 / 67     ]
[ 135, Avenue de Rangueil             Fax: +33 5 61 55 93 20 / 60     ]
[ 31077 Toulouse Cedex 4              Mel: montagut@gmm.insa-tlse.fr  ]
