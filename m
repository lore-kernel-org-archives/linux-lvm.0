Date: Thu, 22 May 2014 16:49:47 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
Message-ID: <20140522154946.GD14236@redhat.com>
References: <20140522101837.GB14236@redhat.com> <537E0D25.7010108@redhat.com>
	<20140522152232.GC14236@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20140522152232.GC14236@redhat.com>
Subject: Re: [linux-lvm] Testing the new LVM cache feature
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Zdenek Kabelac <zkabelac@redhat.com>


It works once I use a single VG.

However the performance is exactly the same as the backing hard disk,
not the SDD.  It seems I'm getting no benefit ...

# lvs
[...]
  testoriginlv           vg_guests Cwi-a-C--- 100.00g lv_cache [testoriginlv_corig]                                 

# mount /dev/vg_guests/testoriginlv /tmp/mnt
# cd /tmp/mnt

# dd if=/dev/zero of=test.file bs=64K count=100000 oflag=direct
100000+0 records in
100000+0 records out
6553600000 bytes (6.6 GB) copied, 57.6301 s, 114 MB/s

# dd if=test.file of=/dev/zero bs=64K iflag=direct
100000+0 records in
100000+0 records out
6553600000 bytes (6.6 GB) copied, 47.6587 s, 138 MB/s

(Exactly the same numbers as when I tested the underlying HDD, and
about half the performance of the SDD.)

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-builder quickly builds VMs from scratch
http://libguestfs.org/virt-builder.1.html
