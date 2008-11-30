Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mAUG75Ap023698
	for <linux-lvm@redhat.com>; Sun, 30 Nov 2008 11:07:05 -0500
Received: from mail.nosys.net (mail.nosys.net [62.93.171.218])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mAUG6nUa011640
	for <linux-lvm@redhat.com>; Sun, 30 Nov 2008 11:06:49 -0500
Date: Sun, 30 Nov 2008 17:06:48 +0100
From: "J. Javier Maestro" <jjmaestro@ieee.org>
Message-ID: <20081130160648.GA11393@2jotas.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM snapshots overflow due to initial "overhead"?
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com


Hi there,

I was thinking about using snapshots to build a backup system when I came
across this:

http://www.tldp.org/HOWTO/LVM-HOWTO/snapshots_backup.html

  Full snapshot are automatically disabled

    If the snapshot logical volume becomes full it will be dropped (become
    unusable) so it is vitally important to allocate enough space. The amount
    of space necessary is dependent on the usage of the snapshot, so there is
    no set recipe to follow for this. 
    
    **If the snapshot size equals the origin size, it will never overflow.**
    
    (** emphasis mine)


When I read that, I set up a testbed and did the following:

  root@eden:~# lvcreate --name testing --size 4M vm
    Logical volume "testing" created
  root@eden:~# lvcreate --snapshot --name testing-snapshot --size 4M vm/testing
    Logical volume "testing-snapshot" created
  root@eden:~# lvs --units b /dev/vm/testing*
    LV               VG   Attr   LSize    Origin  Snap%  Move Log Copy% 
    testing          vm   owi-a- 4194304B                               
    testing-snapshot vm   swi-a- 4194304B testing   0.39                

I thought it was very weird that just by creating the snapshot, I would be
using 0.39% of it :-?  That would mean that I could only snapshot 99.61% of
the actual LV!  I thought, "Nonsense, the HOWTO clearly says that by creating
a snapshot the size of the LV, things cannot go wrong". So I tried,

  root@eden:~# dd if=/dev/zero of=/dev/vm/testing
  dd: writing to `/dev/vm/testing': No space left on device
  8193+0 records in
  8192+0 records out
  4194304 bytes (4.2 MB) copied, 0.518928 s, 8.1 MB/s
  root@eden:~# lvs --units b /dev/vm/testing*
    /dev/vm/testing-snapshot: read failed after 0 of 4096 at 4128768: Input/output error
    /dev/vm/testing-snapshot: read failed after 0 of 4096 at 0: Input/output error
    LV               VG   Attr   LSize    Origin  Snap%  Move Log Copy% 
    testing          vm   owi-a- 4194304B                               
    testing-snapshot vm   Swi-I- 4194304B testing 100.00                

So, it actually broke :-(


I wanted to see what the real usage was, because percents are not really
useful when I want to see what is going on. So I tweaked the lvm tools, just
adding one line to the percent calculation:

--- 8< -----------------------------------------------------------------------
--- dev_manager.c       2007-06-22 13:19:15.000000000 +0200
+++ dev_manager.jjmaestro.c 2008-11-22 20:31:59.000000000 +0100
@@ -391,6 +391,7 @@
        else if (*percent < 0)
                *percent = 100;

+       log_verbose("LV raw extent usage: %" PRIu64 " of %" PRIu64 " used", total_numerator, total_denominator);
        log_debug("LV percent: %f", *percent);
        r = 1;

--- 8< -----------------------------------------------------------------------

Now, when doing an lvdisplay -v I could see that right after creating a
snapshot, total_numerator was always 32, that in my case is 32*512 =
16384 or 2*8KB. That is, 2 chunks of the snapshot were always used just by
creating it!

Thus, the HOWTO is **very** wrong and the only way to be sure that a snapshot
wont overflow is making it bigger than the LV, in fact, I believe 2 chunks
bigger!

This is impossible, since apparently in my case I can only create LVs in 4M
chunks. This is not too bad, since it is marginal as the LV size is bigger,
but it is certainly annoying having to check what size the LV is and sum 4M
to be sure that nothing will ever break...


In any case, why do snapshots use those 8K upfront? (my guess is that it
holds a pointer translation table or something like that)

Could they not keep whatever info stored in those 8K somewhere else? 

Why the lvcreate --snapshot sentence when missing the --size flag does not
create a snapshot "big enough" to avoid overflow?  Is this an easy patch to
work on?

Thanks in advanced,

Cheers,

-- 
 .''`.  
: :'  :   J. Javier Maestro
`. `'`   <jjmaestro@ieee.org>
  `-
