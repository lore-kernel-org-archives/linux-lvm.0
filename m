From: Herbert Poetzl <herbert@13thfloor.at>
Subject: Re: [linux-lvm] Where can I get liblvm?
Message-ID: <20030529132717.GA20900@www.13thfloor.at>
References: <200305281327.15326.seawolf@attglobal.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200305281327.15326.seawolf@attglobal.net>
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
Date: Thu May 29 08:26:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, May 28, 2003 at 01:27:07PM -0400, Les Hazelton wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> I just installed a fresh copy of Mandrake 9.1 on a formatted drive.  I used 
> the included LVM and reisersfs for most of the directory tree.
> 
> I also installed the mondo/mindi backup packages. The problem is, when I try 
> to use them they are calling for a file called liblvm which I can't locate in 
> any of the packages included with the MDK 9.1 distro.  Searches on google 
> indicate that such a file used to be part of the LVM package.
> 
> Can anyone help me locate liblvm or tell me what happened to it?

hmm, guess they (re)moved it ...

I had a similar issue, and decided to change the package
now I use a self made lvm-1.0.7-1mdk which includes

/lib/liblvm-10.so
/lib/liblvm-10.so.1
/lib/liblvm-10.so.1.0

if you want, I can send it to you ...

best,
Herbert

> Any help would be greatly appreciated.
> 
> - -- 
> Les Hazelton
> - --- Registered Linux user # 272996 ---
> Experience varies directly with equipment ruined.
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.2 (GNU/Linux)
> 
> iD8DBQE+1PFvlFHS90xAwgwRApiVAJ9PXMZKer4kZd0LvH0IjJCc1tRNiQCfatyK
> M1QWf4+ZHFPuZu/yskrpnFs=
> =LSQD
> -----END PGP SIGNATURE-----
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
