From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] LE discussion
Message-Id: <20020103102910.W12868@lynx.no>
References: <20020103034817.44722.qmail@web14601.mail.yahoo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020103034817.44722.qmail@web14601.mail.yahoo.com>;
    from anoland@yahoo.com on Wed, Jan 02, 2002 at 07:48:17PM -0800
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
Date: Thu Jan  3 11:26:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Noland <anoland@yahoo.com>
Cc: linux-lvm@sistina.com

On Jan 02, 2002  19:48 -0800, Adrian Noland wrote:
> I'm starting to use LVM, and I would like to know the pros & cons of
> using a different LE size other than the 4mb default. What kind of
> performance issues are there with different size LE's? I saw a *very*
> brief discussion in one of the docs (not the HOWTO), but cant find the
> reference now.

LE size will not likely affect performance, because they are so large.
The only reason for using larger LE size is if you want to have very
large LVs.  With the default 4MB LE size, you have a maximum LV size
of 256GB.  With a 16MB LE size, you have a max LV size of 1TB (which
is the largest that Linux will reliably support at present).  If you
expect to increase the size of a particular LV more than that in the
future (when Linux supports it), scale your LE size accordingly.

Note that you waste about 1.5 LEs of space per PV with the current
LVM tools, so you don't want to over do the LE size.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
