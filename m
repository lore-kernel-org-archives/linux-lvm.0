From: Ed Tomlinson <tomlins@cam.org>
Subject: Re: [linux-lvm] Recovering a volume after OS upgrade (lost /etc/lvm*)
References: <20011119014754.A1308@lynx.no> <20011119155741.7961.qmail@web12306.mail.yahoo.com> <20011119095105.G1308@lynx.no>
In-Reply-To: <20011119095105.G1308@lynx.no>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20011120131612.7E7A02533C@oscar.casa.dyndns.org>
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
Date: Tue Nov 20 08:09:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, Andreas Dilger <adilger@turbolabs.com>, Lars Kellogg-Stedman <thelars@yahoo.com>

On November 19, 2001 11:51 am, Andreas Dilger wrote:
> On Nov 19, 2001  07:57 -0800, Lars Kellogg-Stedman wrote:
> > The RAID device appears to be working just fine.  With the MD driver,
> > simply recreating /etc/raidtab and running raidstart worked without a
> > problem.
>
> You saw the other posting about the MD devices fix?  This is fixed in
> CVS, but not 1.0.1rc4.  Maybe it is time for a new LVM release.

If so please push the chagnes into the kernel asap.   Lets not end up months
behind in the kernel again - please!  When you release, send the patches to 
Linus or Marcelo at the same time.  If it was up to me I would send the patches
first, then release.

Thanks
Ed Tomlinson
