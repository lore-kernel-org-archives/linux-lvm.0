From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] Recovering a volume after OS upgrade (lost /etc/lvm*)
Message-ID: <20011120110846.P1308@lynx.no>
References: <20011119014754.A1308@lynx.no> <20011119155741.7961.qmail@web12306.mail.yahoo.com> <20011119095105.G1308@lynx.no> <20011120131612.7E7A02533C@oscar.casa.dyndns.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011120131612.7E7A02533C@oscar.casa.dyndns.org>; from tomlins@cam.org on Tue, Nov 20, 2001 at 08:16:11AM -0500
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
Date: Tue Nov 20 12:07:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ed Tomlinson <tomlins@cam.org>
Cc: linux-lvm@sistina.com, Lars Kellogg-Stedman <thelars@yahoo.com>

On Nov 20, 2001  08:16 -0500, Ed Tomlinson wrote:
> On November 19, 2001 11:51 am, Andreas Dilger wrote:
> > You saw the other posting about the MD devices fix?  This is fixed in
> > CVS, but not 1.0.1rc4.  Maybe it is time for a new LVM release.
> 
> If so please push the chagnes into the kernel asap.   Lets not end up months
> behind in the kernel again - please!  When you release, send the patches to 
> Linus or Marcelo at the same time.  If it was up to me I would send the
> patches first, then release.

The kernel and CVS are still different, so they need a bit of merging
anyways.  There is a _huge_ merge from Alan into the Linus tree right now,
to get the kernel up to 1.0.1rc4 or so.  I don't know if it is better to
do more changes now, or to wait until those previous changes are in an
official release, so there is less change all at the same time.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
