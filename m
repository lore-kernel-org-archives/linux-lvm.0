From: "'Andreas Dilger'" <adilger@turbolabs.com>
Subject: Re: [linux-lvm] Logical Volume disappears
Message-Id: <20020207142840.V15496@lynx.turbolabs.com>
References: <BC9564600E40C541983FCD6BEAF814FE03C94E6C@xch-knt-15.nw.nos.boeing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BC9564600E40C541983FCD6BEAF814FE03C94E6C@xch-knt-15.nw.nos.boeing.com>;
    from gordon.w.wolfe@boeing.com on Thu, Feb 07, 2002 at 12:59:12PM -0800
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
Date: Thu Feb  7 15:29:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Wolfe, Gordon W" <gordon.w.wolfe@boeing.com>
Cc: linux-lvm@sistina.com

On Feb 07, 2002  12:59 -0800, Wolfe, Gordon W wrote:
> That's the whole problem.  The CD's I need to have on line are the new SuSE
> Linux SLES7 which has the new LVM on it.  I can't install it until I get the
> data on the CDs mounted where I can use it, which means I need LVM first.

Well, rather than configring your DASD to be logical volumes, then copying
CD images there, you could just create 4 minidisks, copy the CD images into
the raw devices, and mount them directly.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
