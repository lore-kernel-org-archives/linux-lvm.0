Return-Path: <mjt@tls.msk.ru>
Message-ID: <3B240ED6.F8951EE8@tls.msk.ru>
Date: Mon, 11 Jun 2001 04:20:38 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LILO configuration for LVM "boot" filesystem
References: <20010605210727.C1870@pc.ilinx> <3B1F9E1C.1984FAF8@wrkhors.com> <3B1FED48.DB80BF00@tls.msk.ru> <20010608153036.G21909@jensbenecke.de> <20010611120459.A26558@mail.wave.co.nz>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Mark van Walraven wrote:
> 
> On Fri, Jun 08, 2001 at 03:30:36PM +0200, Jens Benecke wrote:
> > On Fri, Jun 08, 2001 at 01:08:24AM +0400, Michael Tokarev wrote:
> > > Another thing to consider if you run 2.4 kernel -- mount tmpfs on /tmp
> > > (and give some reasonable size restrictions).   This way, /tmp works much
> > > faster, does not need to be cleaned on boot, and will not eat root's
> > > space.  You should have reasonable swap space it you plan to use it
> > > heavily.  Works very well here.
> >
> > tmpfs? I thought that existed only on Solaris, and the primary reason for
> > tmpfs is that Solaris's UFS is so ssllooww compared to other FS (e.g.
> > ext2, reiser, etc.)
> 
> It's in Linux 2.4 also.  It has the same unfortunate problem as on Solaris,
> that once someone fills /tmp, you run out swap and daemons start dying.

Hey, do not allow users to fill it up! ;)  There is a mount option for
tmpfs on linux that allows you to specify max size of a filesystem to
create.

About tmpfs and a "real" filesystems.  No, ufs isn't so slow on solaris,
it is comparable with ext2, and faster sometimes (and slow other times),
it is hard to say which is better (I prefer ufs on solaris, as it is
more reliable with almost the same speed).  But with any real on-disk fs,
it is impossible to skip writing to disk (as fs designed to store data,
not to loose it), while tmpfs shurely can skip writing if there is
enouth memory, or with short files (ext2 will update directory at least,
maybe batching that update for many files, but it will not eliminate
update if a file will be created and deleted shortly).

BTW, this started to be offtopic... ;)

Regards,
 Michael.
