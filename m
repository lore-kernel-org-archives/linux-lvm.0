From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] lvm and 'poor mans raid' on heterogenous hard drives!
Message-Id: <20020220103147.A890@lynx.adilger.int>
References: <20020219221959.P25713@lynx.adilger.int>
    <NBBBKLKHMJHIJLHOGAOJIEPAJEAA.steve.wray@paradise.net.nz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <NBBBKLKHMJHIJLHOGAOJIEPAJEAA.steve.wray@paradise.net.nz>;
    from steve.wray@paradise.net.nz on Wed, Feb 20, 2002 at 06:47:42PM +1300
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
Date: Wed Feb 20 11:32:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Wray <steve.wray@paradise.net.nz>
Cc: linux-lvm@sistina.com

On Feb 20, 2002  18:47 +1300, Steve Wray wrote:
> > The other problem (as I always complain about whenever people try
> > striping and it doesn't work) is that unless you do large file
> > I/O (as you have seen) you don't get much performance gains.  This
> > is because for each small* read you basically have to wait for the
> > maxiumu seek time of all of the disks to do a read.  For normal I/O
> > patterns this is really bad.
> 
> This is very very true. I'm having second thoughts about having
> all of /var on it. Maybe seperate some of the /var directories
> into their own striped volumes.

In most applications, you are better off to put separate trees each on
their own drive.  Usually you only have a single application writing
into each tree (e.g. sendmail writing to /var/spool/{mail,mqueue},
other programs writing to /var/tmp, lpd writing to /var/spool/lpd, etc).
If you have each of the high-volume trees on a separate drive it means
that each app can write at the full disk bandwidth without much seeking,
instead of the striped case where each app needs to seek every drive
for every write.

> But what do you think of the huge drop in performance at file sizes
> of 16M and up (at all block sizes)?
> It goes from 50Mps down to less than 20Mps starting when the file size
> hits 16M? Looking at the figures, it virtually halves.
> Read is even more dramatic from 108213Kps at 8192K files down to
> 14796Kps at 16384K files!

Could be several things - cache size issues, journal size, maybe once
you are reading large enough files and your bus/CPU/cache can't keep
up you need to skip a full disk revolution for each subsequent read...

> > You also have the problem that you are 4x as likely to lose all of
> > your data in this case.
> 
> yeah but its only /var, /usr/lib, /usr/share, /tmp, swap that sort of thing.
> I think swap may have been a mistake looking at the benchmark!

Swap is a bad move, since you can just add multiple swap spaces with the
same priority (if you so choose) and it will do the striping for you.
Likewise, you could put each of the above trees on their own drive and
you would probably get better overall performance than striping.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
