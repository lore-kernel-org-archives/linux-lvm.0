From: Marc MERLIN <marc_lvm@merlins.org>
Subject: Re: [linux-lvm] Can't mke2fs lv
Message-Id: <20020211202503.GA22401@merlins.org>
References: <20020211173404.GB23@merlins.org>
    <20020211190928.A31248@sistina.com> <20020211183020.GP21505@merlins.org>
    <20020211130701.J9826@lynx.turbolabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020211130701.J9826@lynx.turbolabs.com>
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
Date: Mon Feb 11 14:25:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Feb 11, 2002 at 01:07:01PM -0700, Andreas Dilger wrote:
> > Unfortunately, that's  not it,  the machine  doens't have  any users,  and I
> > ssh'ed in as root
> 
> It could still be that the ssh process inherits the ulimit from its parent.
> The real problem with this bug is that "ulimit -f" returns "unlimited", but
> in fact it is really 2GB.  The user tools think 2GB is unlimited, but the
> kernel thinks 4GB is unlimited.  This assumes you don't have a ulimit set
> at some value less than 2GB.
 
Well, I didn't set the ulimit, but sure enough, something did.
After upgrading from bash 2.04 to bash 2.05 and from ssh 2.5.x to 3.0.x, I
got:
gargamel:~# ulimit -f
2097151

I  am  not setting  this  in  /etc/security/limits.conf, so  something  else
probably is.

Either way, after
gargamel:~# ulimit -f unlimited
it works like a charm
 
> I _thought_ that glibc-2.2 was not affected by this problem, but it
> could be that if you have an old shell which uses the old getrlimit
> syscall it will still break your system.

I don't know if  bash 2.05 is considered old or not, but  it's true that the
ulimit could be set by anything along the chain.

I haven't  upgraded e2fsprogs  yet, but  if it tries  to reset  the filesize
limit to unlimited, it would definitely fix the problem I had.

Anyway, it's all working now.

Thanks a lot,
Marc
-- 
Microsoft is to operating systems & security ....
                                      .... what McDonalds is to gourmet cooking
  
Home page: http://marc.merlins.org/   |   Finger marc_f@merlins.org for PGP key
