From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] lvm and 'poor mans raid' on heterogenous hard drives!
Message-Id: <20020219221959.P25713@lynx.adilger.int>
References: <20020219205054.A3751@sistina.com>
    <NBBBKLKHMJHIJLHOGAOJKEOOJEAA.steve.wray@paradise.net.nz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <NBBBKLKHMJHIJLHOGAOJKEOOJEAA.steve.wray@paradise.net.nz>;
    from steve.wray@paradise.net.nz on Wed, Feb 20, 2002 at 03:54:09PM +1300
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
Date: Tue Feb 19 23:20:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Wray <steve.wray@paradise.net.nz>
Cc: linux-lvm@sistina.com

On Feb 20, 2002  15:54 +1300, Steve Wray wrote:
> Ok so I have 4 hard drives of very varying capacity
> I think 'maybe I can take advantage of the IDE
> system and put a drive on each master and stripe them.'
> 
> I expected some performance improvements.  Interestingly,
> the performance improvement is not dramatic, I expected better.

Well, basically you cannot get performace much better than 4x
the slowest disk.  The reason would be that because it is striped
across all 4 disks, no matter how fast the other disks run you
will always have to end up waiting for the slowest disk to complete
every 4th block I/O.

I think you will find that the performance of modern UDMA disks
is far better than any of the older disks, so you are better off
just using the single large disk for best performance & reliability.

> The main improvement seems to be that the striped volumes
> do better with larger file sizes and as file size increases
> the striped volume keeps its performance up better.

The other problem (as I always complain about whenever people try
striping and it doesn't work) is that unless you do large file
I/O (as you have seen) you don't get much performance gains.  This
is because for each small* read you basically have to wait for the
maxiumu seek time of all of the disks to do a read.  For normal I/O
patterns this is really bad.

(*) small means larger than the stripe size and less than maybe 8-12
    stripes.

You also have the problem that you are 4x as likely to lose all of
your data in this case.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
