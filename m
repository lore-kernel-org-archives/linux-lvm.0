From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] vgscan bug?
Message-Id: <20020106161653.R12868@lynx.no>
References: <20020106130151.55565.qmail@web14605.mail.yahoo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020106130151.55565.qmail@web14605.mail.yahoo.com>;
    from anoland@yahoo.com on Sun, Jan 06, 2002 at 05:01:50AM -0800
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
Date: Sun Jan  6 17:14:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Noland <anoland@yahoo.com>
Cc: linux-lvm@sistina.com

On Jan 06, 2002  05:01 -0800, Adrian Noland wrote:
> Next question. Does LVM keep track of device names and such in the
> configuration. That is, can I set up a system on a LVM-ed /dev/hdb and
> then swap it so that it is /dev/hda without problems?

Yes, you need to run vgscan.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
