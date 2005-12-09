From: "James G. Sack (jim)" <jsack@tandbergdatacorp.com>
In-Reply-To: <1134092500.6522.9.camel@jgs4.ino.pvt>
References: <1134092500.6522.9.camel@jgs4.ino.pvt>
Date: Thu, 08 Dec 2005 18:07:32 -0800
Message-Id: <1134094053.6522.31.camel@jgs4.ino.pvt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] 
	Re: Found: workaround for crash on snapshot removal, and
	hopefully a good clue to the underlying bug
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com
Cc: Alasdair G Kergon <agk@redhat.com>

More testing results..

A) The snapshot create/remove cycle with the suspend/resume calls around
the lvremove ran over 1500 passes before I stopped it -- all the while
with continuous i/o to the origin filesystem. Remember this is on a
patched 2.6.14-1_1637_FC4 (patches listed in previous message below). 

B) I installed vanilla FC4 build 2.6.14-1.1644_FC4, and tried the same
test, but in this case, the suspend prevents lvremove from running -- I
guess an automatic suspend has been added to 1644 which was missing or
broken in 1637 (maybe?). Anyway, I took out the suspend/resume and the
crash came back! So maybe the patches had something to do with test A
succeeding?

C) I rebooted to valilla 2.6.14-1_1637_FC4 and am now starting a test
with the suspend/resume calls around the lvremove. So far it looks like
it's passed a few dozen cycles. So maybe the patches are irrelevant. 

Can anybody make any sense of this? 

I'm logging 'level = 6' to lvm2.log -- would anybody be able to suggest
what to look for in there? Hmmm, maybe tomorrow, I should create a
simple log with a single failure to see if there's any locking
asymmetries or something like that.

Another context reminder: I'm runnning
lvm version
  LVM version:     2.02.01-cvs (2005-11-10)
  Library version: 1.02.01-cvs (2005-11-10)
  Driver version:  4.4.0

Will let the test run overnight, and report tomorrow.

Regards,
..jim



On Thu, 2005-12-08 at 17:41 -0800, James G. Sack (jim) wrote:
> Hooray! 
> 
> I think I've found a definitive clue to a crash during lvremove of a
> snapshot. I have a reliably repeatable failure test and a workaround
> that seems to be passing.
> 
> Here's the regression test:
> --------------------------
> 
> 1. arrange to have some continuous i/o on an lvm volume
>  I do it with a simple shell loop that copies a 1GB file to another name
> and then back (essentially: 'while :;do cp abcd wxyz;cp wxyz abcd;done')
> 
> 2. while that's running, start a snapshot create/remove loop
>  Such as 'while :;do lvcreate -snSnap -L10G LVorigin;
>   lvremove -f /dev/VG/Snap;done
> 
> My experience is that a system crash always occurs upon executing the
> lvremove call. The first one! 
> 
>   (On my most recent experiments, the system is locking hard, 
>    although earlier I was able to see a kcopyd oops and the 
>    keyboard scollback worked.)
> 
> 
> Here's the workaround
> ---------------------
> 
> In the snap-cycle test surround the lvremove command with suspend/resume
>   dmsetup suspend VG-LVorigin
>   lvremove -f /dev/VGorigin/Snap
>   dmsetup resume VG-LVorigin
> 
> I am currently testing this workaround on a patched 2.6.14-1.1637_FC4
> kernel 
>   (using 4 patches suggested by agk on Tue, 15 Nov 2005 22:33:58 +0000)
> 
> <excerpt from that prior message>
> ---------------------------------
> > > The kcopyd.c BUG at line 145 is triggered by the first lvremove
> > > following start of the i/o (copy loop).
> 
> Try some kernel patches.
> 
>   http://www.kernel.org/pub/linux/kernel/people/agk/patches/2.6/editing/
> 
> in particular these four:
> 
>   dm-snapshot-bio_list-fix.patch
>   dm-snapshot-metadata-reading-separation.patch
>   dm-snapshot-load-metadata-on-creation.patch
>   dm-ioctl-reduce-pf-memalloc-usage.patch
> </excerpt>
>   
> 
> ==> BUT I suspect the lvremove problem is independent of those patches,
> as I was getting the same symptom before putting in the suspend/resume.
> 
> 
> I thought I had tried suspend/resume previously and found that they were
> unnecessary because the create automatically performed a suspend/resume
> -- so my current workaround is the result of a desperation-experiment of
> applying the suspend/resume wrapper ONLY to the lvremove step. 
> 
> ==> SO MAYBE this current success points to a bug in the lvremove code,
> eh?
> 
> 
> I plan on repeating my test on a vanilla kernel. In the meantime, I hope
> someone can look at the lvremove code (agk?..).
> 
> Regards,
> ..jim
> 
> 
