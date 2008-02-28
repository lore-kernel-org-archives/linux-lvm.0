Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m1SI5bqA021409
	for <linux-lvm@redhat.com>; Thu, 28 Feb 2008 13:05:37 -0500
Received: from ag-out-0708.google.com (ag-out-0708.google.com [72.14.246.247])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m1SI53t1005302
	for <linux-lvm@redhat.com>; Thu, 28 Feb 2008 13:05:03 -0500
Received: by ag-out-0708.google.com with SMTP id 31so9087899agc.3
	for <linux-lvm@redhat.com>; Thu, 28 Feb 2008 10:05:03 -0800 (PST)
Message-ID: <a9e5040802281004m6104a205o36fcee9021a3c5aa@mail.gmail.com>
Date: Thu, 28 Feb 2008 13:04:58 -0500
From: "Rob West" <robertfwest@gmail.com>
Subject: Re: [linux-lvm] Question: How much space is needed do make sure that
	a LVM snapshot won't overflow
In-Reply-To: <1202841598.32238.15.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1202841598.32238.15.camel@localhost.localdomain>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

To guarantee that the snapshot will not overflow, you have to make it
big enough to contain all of the origin plus the maximum COW table
overhead.

The maximum overhead is the chunk size * (max_number_exceptions_chunks
+ 1).  The "+ 1" is for the header chunk. The maximum number of
exception chunks is the number of origin chunks divided by the number
of exceptions per exception chunk, plus one to account for a possible
allocated but unused exception chunk. The number of exceptions per
exception chunk is the chunk size divided by the size of an exception
structure, which is 16 bytes.

Here is some code that may help:

        /* Do some calculations. The - 1 and + 1 stuff is to handle any
         * remainders. The extra + 1 for num_exception_chunks is for the
         * allocated, but unused, exception chunk.
         */
        u_int64_t num_chunks_in_origin =
            ((lv_info.size - 1) / OUR_CHUNK_SIZE_INT) + 1;
        u_int64_t num_exceptions_per_chunk =
            ((OUR_CHUNK_SIZE_INT - 1) / sizeof(dm_disk_exception_t)) + 1;
        u_int64_t num_exception_chunks =
            ((num_chunks_in_origin - 1) / num_exceptions_per_chunk) + 1 + 1;

        /* The maximum size of the COW device overhead is the chunk size times
         * (the number of exception chunks plus 1 for the header chunk).
         */
        u_int64_t sizeof_max_overhead =
            (num_exception_chunks + 1) * OUR_CHUNK_SIZE_INT;

Hope this helps,
Rob

On Tue, Feb 12, 2008 at 1:39 PM, Guilherme Destefani
<gd@helixbrasil.com.br> wrote:
> Hi.
>
>  In the LVM2 HOWTO, it says:
>  (http://www.tldp.org/HOWTO/LVM-HOWTO/snapshotintro.html),
>
>  "Full snapshot are automatically disabled"
>  and:
>  "If the snapshot size equals the origin size, it will never overflow.".
>
>  But if one snapshot is created and an equal size is allocated to the
>  snapshot, it still overflows (creates a volume with 32M, a snapshot with
>  32M, and fills the volume with zeros).
>  Using more space, it doesn't overflow (same thing, but 64M for the
>  snapshot).
>
>  How much more space is needed to be alocated to the snapshot to ensure
>  that it will never overflow?
>
>  Thanks in advance,
>
>  Guilherme.
>
>
>         Script started on Tue 12 Feb 2008 02:11:11 PM BRST
>         [root@localhost ~]# lvcreate -L 32M -n base_volume hf
>           Logical volume "base_volume" created
>         [root@localhost ~]# lvcreate -s -L 32M -n
>         copy_volume /dev/hf/base_volume
>           Logical volume "copy_volume" created
>         [root@localhost ~]# lvdisplay |grep -A 13 "_volume"
>           LV Name                /dev/hf/base_volume
>           VG Name                hf
>           LV UUID                qPzWgG-ON3V-swUr-O0IP-I172-G3YV-GH431K
>           LV Write Access        read/write
>           LV snapshot status     source of
>                                  /dev/hf/copy_volume [active]
>           LV Status              available
>           # open                 0
>           LV Size                32.00 MB
>         --
>           LV Name                /dev/hf/copy_volume
>           VG Name                hf
>           LV UUID                oGK0gG-o62D-Tu84-9CW0-rvPb-H7HX-bjUwk0
>           LV Write Access        read/write
>           LV snapshot status     active destination
>         for /dev/hf/base_volume
>           LV Status              available
>           # open                 0
>           LV Size                32.00 MB
>           Current LE             1
>           COW-table size         32.00 MB
>           COW-table LE           1
>           Allocated to snapshot  0.05%
>           Snapshot chunk size    8.00 KB
>           Segments               1
>           Allocation             inherit
>           Read ahead sectors     0
>           Block device           253:20
>
>         [root@localhost ~]# dd if=/dev/zero of=/dev/hf/copy_volume
>         dd: writing to `/dev/hf/copy_volume': No space left on device
>         65537+0 records in
>         65536+0 records out
>         33554432 bytes (34 MB) copied, 8.01466 s, 4.2 MB/s
>         [root@localhost ~]# lvresize -L 64M /dev/hf/copy_volume
>           /dev/dm-20: read failed after 0 of 4096 at 0: Input/output
>         error
>           Extending logical volume copy_volume to 64.00 MB
>           Logical volume copy_volume successfully resized
>         [root@localhost ~]# lvdisplay |grep -A 13 "_volume"
>           /dev/dm-20: read failed after 0 of 4096 at 0: Input/output
>         error
>           LV Name                /dev/hf/base_volume
>           VG Name                hf
>           LV UUID                qPzWgG-ON3V-swUr-O0IP-I172-G3YV-GH431K
>           LV Write Access        read/write
>           LV snapshot status     source of
>                                  /dev/hf/copy_volume [INACTIVE]
>           LV Status              available
>           # open                 0
>           LV Size                32.00 MB
>           Current LE             1
>           Segments               1
>           Allocation             inherit
>           Read ahead sectors     0
>           Block device           253:18
>         --
>           LV Name                /dev/hf/copy_volume
>           VG Name                hf
>           LV UUID                oGK0gG-o62D-Tu84-9CW0-rvPb-H7HX-bjUwk0
>           LV Write Access        read/write
>           LV snapshot status     INACTIVE destination
>         for /dev/hf/base_volume
>           LV Status              available
>           # open                 0
>           LV Size                32.00 MB
>           Current LE             1
>           COW-table size         64.00 MB
>           COW-table LE           2
>           Snapshot chunk size    8.00 KB
>           Segments               1
>           Allocation             inherit
>           Read ahead sectors     0
>           Block device           253:20
>
>         [root@localhost ~]# lvremove /dev/hf/copy_volume
>           /dev/dm-20: read failed after 0 of 4096 at 0: Input/output
>         error
>         Do you really want to remove active logical volume
>         "copy_volume"? [y/n]: y
>           Logical volume "copy_volume" successfully removed
>         [root@localhost ~]# lvcreate -s -L 64M -n \
>         copy_volume /dev/hf/base_volume
>           Logical volume "copy_volume" created
>         [root@localhost ~]# lvdisplay |grep -A 13 "_volume"
>           LV Name                /dev/hf/base_volume
>           VG Name                hf
>           LV UUID                qPzWgG-ON3V-swUr-O0IP-I172-G3YV-GH431K
>           LV Write Access        read/write
>           LV snapshot status     source of
>                                  /dev/hf/copy_volume [active]
>           LV Status              available
>           # open                 0
>           LV Size                32.00 MB
>           Current LE             1
>           Segments               1
>           Allocation             inherit
>           Read ahead sectors     0
>           Block device           253:18
>         --
>           LV Name                /dev/hf/copy_volume
>           VG Name                hf
>           LV UUID                LSUqQB-O2n4-8zmk-iL9n-2vDQ-qSsB-yOBDL1
>           LV Write Access        read/write
>           LV snapshot status     active destination
>         for /dev/hf/base_volume
>           LV Status              available
>           # open                 0
>           LV Size                32.00 MB
>           Current LE             1
>           COW-table size         64.00 MB
>           COW-table LE           2
>           Allocated to snapshot  0.02%
>           Snapshot chunk size    8.00 KB
>           Segments               1
>           Allocation             inherit
>           Read ahead sectors     0
>           Block device           253:20
>
>         [root@localhost ~]# dd if=/dev/zero of=/dev/hf/copy_volume
>         dd: writing to `/dev/hf/copy_volume': No space left on device
>         65537+0 records in
>         65536+0 records out
>         33554432 bytes (34 MB) copied, 9.5375 s, 3.5 MB/s
>         [root@localhost ~]# lvdisplay |grep -A 13 "_volume"
>           LV Name                /dev/hf/base_volume
>           VG Name                hf
>           LV UUID                qPzWgG-ON3V-swUr-O0IP-I172-G3YV-GH431K
>           LV Write Access        read/write
>           LV snapshot status     source of
>                                  /dev/hf/copy_volume [active]
>           LV Status              available
>           # open                 0
>           LV Size                32.00 MB
>           Current LE             1
>           Segments               1
>           Allocation             inherit
>           Read ahead sectors     0
>           Block device           253:18
>
>           --- Logical volume ---
>           LV Name                /dev/hf/F4_burn
>           VG Name                hf
>           LV UUID                Bj1VJS-1JUK-BA18-egFj-xOoY-qrbq-jbZFFY
>         --
>           LV Name                /dev/hf/copy_volume
>           VG Name                hf
>           LV UUID                LSUqQB-O2n4-8zmk-iL9n-2vDQ-qSsB-yOBDL1
>           LV Write Access        read/write
>           LV snapshot status     active destination
>         for /dev/hf/base_volume
>           LV Status              available
>           # open                 0
>           LV Size                32.00 MB
>           Current LE             1
>           COW-table size         64.00 MB
>           COW-table LE           2
>           Allocated to snapshot  50.12%
>           Snapshot chunk size    8.00 KB
>           Segments               1
>           Allocation             inherit
>           Read ahead sectors     0
>           Block device           253:20
>
>         [root@localhost ~]# exit
>
>         Script done on Tue 12 Feb 2008 02:13:07 PM BRST
>         [Gui@localhost:~]$
>
>
>
>
>  _______________________________________________
>  linux-lvm mailing list
>  linux-lvm@redhat.com
>  https://www.redhat.com/mailman/listinfo/linux-lvm
>  read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
