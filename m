From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] Recovering a volume after OS upgrade (lost /etc/lvm*)
Message-ID: <20011119095105.G1308@lynx.no>
References: <20011119014754.A1308@lynx.no> <20011119155741.7961.qmail@web12306.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011119155741.7961.qmail@web12306.mail.yahoo.com>; from thelars@yahoo.com on Mon, Nov 19, 2001 at 07:57:41AM -0800
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
Date: Mon Nov 19 10:49:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lars Kellogg-Stedman <thelars@yahoo.com>
Cc: linux-lvm@sistina.com

On Nov 19, 2001  07:57 -0800, Lars Kellogg-Stedman wrote:
> The RAID device appears to be working just fine.  With the MD driver,
> simply recreating /etc/raidtab and running raidstart worked without a
> problem.

You saw the other posting about the MD devices fix?  This is fixed in
CVS, but not 1.0.1rc4.  Maybe it is time for a new LVM release.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
