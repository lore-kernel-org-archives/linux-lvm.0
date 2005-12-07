From: "James G. Sack (jim)" <jsack@tandbergdatacorp.com>
Date: Wed, 07 Dec 2005 11:34:05 -0800
Message-Id: <1133984046.4964.43.camel@jgs4.ino.pvt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Found: workaround for crash on snapshot removal,
	and hopefully a good clue to the underlying bug
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
To: "LVM LIST linux-lvm@redhat.com" <linux-lvm@redhat.com>
Cc: Alasdair G Kergon <agk@redhat.com>

Hooray! 

I think I've found a definitive clue to a crash during lvremove of a
snapshot. I have a reliably repeatable failure test and a workaround
that seems to be passing.

Here's the regression test:
--------------------------

1. arrange to have some continuous i/o on an lvm volume
 I do it with a simple shell loop that copies a 1GB file to another name
and then back (essentially: 'while :;do cp abcd wxyz;cp wxyz abcd;done')

2. while that's running, start a snapshot create/remove loop
 Such as 'while :;do lvcreate -snSnap -L10G LVorigin;
  lvremove -f /dev/VG/Snap;done

My experience is that a system crash always occurs upon executing the
lvremove call. The first one! 

  (On my most recent experiments, the system is locking hard, 
   although earlier I was able to see a kcopyd oops and the 
   keyboard scollback worked.)


Here's the workaround
---------------------

In the snap-cycle test surround the lvremove command with suspend/resume
  dmsetup suspend VG-LVorigin
  lvremove -f /dev/VGorigin/Snap
  dmsetup resume VG-LVorigin

I am currently testing this workaround on a patched 2.6.14-1.1637_FC4
kernel 
  (using 4 patches suggested by agk on Tue, 15 Nov 2005 22:33:58 +0000)

<excerpt from that prior message>
---------------------------------
> > The kcopyd.c BUG at line 145 is triggered by the first lvremove
> > following start of the i/o (copy loop).

Try some kernel patches.

  http://www.kernel.org/pub/linux/kernel/people/agk/patches/2.6/editing/

in particular these four:

  dm-snapshot-bio_list-fix.patch
  dm-snapshot-metadata-reading-separation.patch
  dm-snapshot-load-metadata-on-creation.patch
  dm-ioctl-reduce-pf-memalloc-usage.patch
</excerpt>
  

==> BUT I suspect the lvremove problem is independent of those patches,
as I was getting the same symptom before putting in the suspend/resume.


I thought I had tried suspend/resume previously and found that they were
unnecessary because the create automatically performed a suspend/resume
-- so my current workaround is the result of a desperation-experiment of
applying the suspend/resume wrapper ONLY to the lvremove step. 

==> SO MAYBE this current success points to a bug in the lvremove code,
eh?


I plan on repeating my test on a vanilla kernel. In the meantime, I hope
someone can look at the lvremove code (agk?..).

Regards,
..jim
