From: "Steve Wray" <steve.wray@paradise.net.nz>
Subject: RE: [linux-lvm] lvm and 'poor mans raid' on heterogenous hard drives!
Message-Id: <NBBBKLKHMJHIJLHOGAOJEEPHJEAA.steve.wray@paradise.net.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20020220103147.A890@lynx.adilger.int>
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
Date: Wed Feb 20 16:02:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of Andreas Dilger
> 
> On Feb 20, 2002  18:47 +1300, Steve Wray wrote:
> > > The other problem (as I always complain about whenever people try
> > > striping and it doesn't work) is that unless you do large file
> > > I/O (as you have seen) you don't get much performance gains.  This
> > > is because for each small* read you basically have to wait for the
> > > maxiumu seek time of all of the disks to do a read.  For normal I/O
> > > patterns this is really bad.
> > 
> > This is very very true. I'm having second thoughts about having
> > all of /var on it. Maybe seperate some of the /var directories
> > into their own striped volumes.
> 
> In most applications, you are better off to put separate trees each on
> their own drive.  Usually you only have a single application writing
> into each tree (e.g. sendmail writing to /var/spool/{mail,mqueue},
> other programs writing to /var/tmp, lpd writing to /var/spool/lpd, etc).
> If you have each of the high-volume trees on a separate drive it means
> that each app can write at the full disk bandwidth without much seeking,
> instead of the striped case where each app needs to seek every drive
> for every write.

Ohhhhh. Now thats a consideration I didn't take into account.
Thanks for the insight. Next time I reinstall this sucker,
I'll give it a go. Plus the parallel swap suggestion (which
I also just read in the software RAID howto). Pity I can't
just resize the partitions and insert somenew ones! (I doubt that
partition magic will successfully move'n'resize an LVM partition!
(even if I did have a windoze install on that box)).


> > But what do you think of the huge drop in performance at file sizes
> > of 16M and up (at all block sizes)?
> > It goes from 50Mps down to less than 20Mps starting when the file size
> > hits 16M? Looking at the figures, it virtually halves.
> > Read is even more dramatic from 108213Kps at 8192K files down to
> > 14796Kps at 16384K files!
> 
> Could be several things - cache size issues, journal size, maybe once
> you are reading large enough files and your bus/CPU/cache can't keep
> up you need to skip a full disk revolution for each subsequent read...

It seems dependent on system memory. I increased it from 68M to 192M
and ran the same benchmarks; the 8M-16M step was displaced to 32M-64M.
The really interesting thing is that the step is stable across all
block sizes (as near as I can tell). Ie; before the step, blocksize
is very important (small block sizes are way faster) after the step
it doesn't matter what the blocksize is, the step goes down to 20Mps.

I know this is unlikely to be LVM related tho. I can't see that this has
anything to do with extent size or whatever, and its nothing to
do with striping vs linear. So I guess I better shut up about it
on this list...
:)

 
> > > You also have the problem that you are 4x as likely to lose all of
> > > your data in this case.
> > 
> > yeah but its only /var, /usr/lib, /usr/share, /tmp, swap that 
> sort of thing.
> > I think swap may have been a mistake looking at the benchmark!
> 
> Swap is a bad move, since you can just add multiple swap spaces with the
> same priority (if you so choose) and it will do the striping for you.
> Likewise, you could put each of the above trees on their own drive and
> you would probably get better overall performance than striping.
> 
> Cheers, Andreas
> --
> Andreas Dilger
> http://sourceforge.net/projects/ext2resize/
> http://www-mddsp.enel.ucalgary.ca/People/adilger/
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
