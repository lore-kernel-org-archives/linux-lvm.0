From: Andreas Dilger <adilger@turbolabs.com>
Date: Wed, 10 Oct 2001 09:24:49 -0600
Subject: Re: [linux-lvm] More strangeness
Message-ID: <20011010092448.A10443@turbolinux.com>
References: <20011009215612.K6348@turbolinux.com> <000c01c15174$e552f580$836788cf@industry>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000c01c15174$e552f580$836788cf@industry>
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

On Oct 10, 2001  06:18 -0400, Jason A. Lixfeld wrote:
> No official patch for ext3 and 2.4.10?!  Can I run an older kernel
> version?  2.4.8 or 9 maybe?  Will that run ext3 and lvmtools 1.0.1rc4?
> 
> This is going back to a comment I made earlier about asking for a stable
> version of LVM/kernel to use.  Everyone said 1.0.1rc4/2.4.10 would be
> fine (but I didn't mention ext3, because I didn't think it was a
> factor).

Try 2.4.10-ac(latest) (optionally + ext3 patches).  That sounds relatively
stable from reports on l-k, and also has good performance.  It already
has ext3 and a relatively up-to-date LVM in the kernel (although there
are newer patches for both as well).

Cheers, Andreas
--
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
