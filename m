From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] File size limit exceeded
Message-ID: <20011217004350.L855@lynx.no>
References: <20011217014227.A453@golem.blacknet.de> <20011217035851.B4880@tiger.bigcats.invalid>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011217035851.B4880@tiger.bigcats.invalid>; from weissel@netcologne.de on Mon, Dec 17, 2001 at 03:58:51AM +0100
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
Date: Mon Dec 17 01:41:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm <linux-lvm@sistina.com>

On Dec 17, 2001  03:58 +0100, Wolfgang Weisselberg wrote:
> Goetz Bock (bock@blacknet.de) wrote 160 lines:
> > I've a strange problem with my LVM:
> 
> > root # lvcreate -L 20G -n dragon filebase
> > root # mke2fs /dev/filebase/dragon
> 
> > File size limit exceeded
> 
> Funny, that one popped up over here as well (though I get
> it when lvcreate'ing).  I belive it started somewhere after
> kernel 2.4.15 or 16 and/or LVM 1.0.1.
> 
> Also funny: It works OK from the console, but not under X -- if
> I use screen on the console and reconnect to that screen under
> X it still works, even creating new windows inside screen.
> (Yes, yes, the ulimits are the same under the console and
> under X for root.  X itself doesn't run under root, of course.)

It is a kernel problem, and not limited to LVM.  You need to log
in directly as root (no "su -") so that you don't have any ulimit
set for your shell.  Block devices moved into the page cache in
2.4.10, and were (incorrectly) affected by file size limits.  This
is fixed in 2.4.17-pre(something), or there is a patch to fix this
also (search for "setrlimit" on l-k).

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
