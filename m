From: Andreas Dilger <adilger@turbolabs.com>
Date: Thu, 27 Sep 2001 09:42:43 -0600
Subject: Re: [linux-lvm] Disk Died - Ideas?
Message-ID: <20010927094243.B19527@turbolinux.com>
References: <3BB09C88.8234FDE4@lmco.com> <20010925110909.D392@turbolinux.com> <3BB30FD9.853E39DA@lmco.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3BB30FD9.853E39DA@lmco.com>
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

On Sep 27, 2001  07:39 -0400, Jeff Layton wrote:
> Andreas Dilger wrote:
> > dd if=/dev/pv1 of=<backup> bs=1024 skip=<offset #1 in kB> count=<count #1>
> >
> > Do the same thing for the next set of consecutive PEs, with:
> >
> > dd if=/dev/pv1 of=<backup> bs=1024 skip=<offset #2 in kB> \
> >         seek=<count #1> count=<count #2>
> >
> > dd if=/dev/pv1 of=<backup> bs=1024 skip=<offset #3 in kB> \
> >         seek=<count #1 + count #2> count=<count #3>
> 
>    Sorry the late follow-up. I follow you so far (I think). The next step
> after copy these "blocks" using dd to some backup device is to
> rebuild the filesystem on the disks and then copy back the data
> from the backup device using dd (just reverse the procedure).
> Is this correct? (Sorry the novice question but I want to be sure I
> have the correct steps before trying this).

If you do the above "dd" steps so that they save the PEs in LE order
(as given by pvdata -avP) then you simply need to "dd" the entire
backup file out to the LV once it is built (assuming you have enough
space to save the entire LV somewhere).  If you are fortunate, and
there is only a single contiguous string of PEs/LEs on each disk it
will not be too much work.  If needed, you could "dd" the data from
each disk to a separate tape/remote machine disk, but then you need
to make sure you get the "seek" offsets correct when you are restoring
it (it should just be the sum of all the block counts output from
previous "dd" runs).

Cheers, Andreas
--
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
