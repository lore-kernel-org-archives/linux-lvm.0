From: Andreas Dilger <adilger@turbolabs.com>
Date: Thu, 4 Oct 2001 11:33:09 -0600
Subject: Re: [linux-lvm] What have I done!?
Message-ID: <20011004113309.E31061@turbolinux.com>
References: <009401c14cc3$c63106c0$836788cf@industry> <009501c14cc7$2f5cd360$836788cf@industry>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <009501c14cc7$2f5cd360$836788cf@industry>
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
To: linux-lvm@sistina.com

On Oct 04, 2001  07:24 -0400, Jason A. Lixfeld wrote:
> Is there a way that I can blow the whole thing away and start over?  I
> think I've screwed things up too badly to try to resurrect them.  I'd
> really like to blow it all away and start over and see if this stuff
> happens again, but again I can't use the lv* tools to remove the
> configurations because of the errors I mention in my initial post so I
> need a manual way to blow away the entire LVM configuration and start
> from scratch again.

"pvcreate -ff" I think

Cheers, Andreas
--
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
