From: Andreas Dilger <adilger@turbolabs.com>
Date: Tue, 28 Aug 2001 17:57:21 -0600
Subject: Re: [linux-lvm] Very small but important whoops in lvmcreate_initrd in 1.0.1-rc1
Message-ID: <20010828175721.I1367@turbolinux.com>
References: <200108282153.f7SLr3b05929@foo-bar-baz.cc.vt.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200108282153.f7SLr3b05929@foo-bar-baz.cc.vt.edu>
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
Content-Transfer-Encoding: 7bit
To: Valdis.Kletnieks@vt.edu
Cc: LVM-Devel@sistina.com, Linux-LVM@sistina.com

On Aug 28, 2001  17:53 -0400, Valdis.Kletnieks@vt.edu wrote:
> There was a gratuitous 'shift' in the script, causing it to swallow the
> next parameter.  This wasn't very nice when I tried to call it with
> '--nodep 2.4.9' and watched it over-write my initrd-lvm-2.4.5.gz ;)

Have fixed this in CVS.

Cheers, Andreas

PS - no commit message was mailed out, because "adilger@sistina.com" is
     not a valid user ID.  Somebody broke the commit message script.
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
