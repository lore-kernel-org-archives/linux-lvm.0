From: Tim <tim@connectlive.com>
Subject: Re: [linux-lvm] filesystem does not reflect new LV size
Message-ID: <20020606120917.B31838@connectlive.com>
References: <200206061638.g56GcYr19414@bach.leonora.org> <20020606165925.GA8756@fib011235813.fsnet.co.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020606165925.GA8756@fib011235813.fsnet.co.uk>; from joe@fib011235813.fsnet.co.uk on Thu, Jun 06, 2002 at 05:59:25PM +0100
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
Date: Thu Jun  6 12:09:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hey, out of curiosity, are there folks out there who have mounted an
ext3 filesystem as ext2, resized it, rebuilt the journal, and had good
success with the process?  At one point I was twiddling with this, but
instead I spec'd a great big RAID to migrate to and cp'ed it directly.
Unfortunately now that one is filling up and it's as big as Promise
currently makes, so I kind of have to make me a decision...

I'd hate to convert my monster volumes to XFS for this sort of thing
(and AFAIK, ReiserFS is not totally stable with NFS, so that's out of
the question -- anyways, I don't want to take it down if I needn't).
Mostly though, ext3 has been good to us, and I know RedHat will support
both ext3 and LVM in a pinch.  Since we use RedHat this is a big plus.

Thanks for any input,

--Tim



Quoth Joe Thornber:
> Resizing is always done in two steps, these steps are done in a
> different order depending whether you are extending or reducing.
> 
> Extending:
> 
> i) Resize the LV (lvextend)
> ii) Resize the filesystem (eg, ext2resize, resize_reiserfs)
> 
> Reducing:
> 
> i) Resize filesystem.
> ii) Resize the LV (lvreduce)
> 
> 
> There is a tool called e2fsadm provided in LVM1 which performs both of
> these steps iff you are using an ext2 filesystem.
> 
> - Joe
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 

     This is supposed to be a happy occasion.
     Let's not bicker and argue about who killed who.
