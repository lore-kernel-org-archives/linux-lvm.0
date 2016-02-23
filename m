Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1NCC6Nr006695
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 23 Feb 2016 07:12:06 -0500
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mx1.redhat.com (Postfix) with ESMTPS id C328963147
	for <linux-lvm@redhat.com>; Tue, 23 Feb 2016 12:12:05 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id y9so135813644qgd.3
	for <linux-lvm@redhat.com>; Tue, 23 Feb 2016 04:12:05 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAAYit8Q_8GkkBSOQXAFWNKAh4rtQM+wT6D8Kpc+D_0srZciJGg@mail.gmail.com>
References: <CAGU4k=0B-uXUvc0gNyYH3eF62tNWoGBWVpqg826YH6Xo1Gp4Aw@mail.gmail.com>
	<CAAYit8Q_8GkkBSOQXAFWNKAh4rtQM+wT6D8Kpc+D_0srZciJGg@mail.gmail.com>
Date: Tue, 23 Feb 2016 20:12:04 +0800
Message-ID: <CAAYit8Sr8fYSuKnkD_akX5kQhcCYJ-qmVf0msJ_1TNWHDsGQkQ@mail.gmail.com>
From: "M.H. Tsai" <mingnus@gmail.com>
Subject: Re: [linux-lvm] Repair thin pool
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
Cc: Mars <kirapangzi@gmail.com>

The original post asks how to do if the superblock was broken (his superblock
was accidentally wiped). Since that I don't have time to update the program
at this moment, here's my workaround:

1. Partially rebuild the superblock

  (1) Obtain pool parameter from LVM

       ./sbin/lvm lvs vg1/tp1 -o transaction_id,chunksize,lv_size --units s

      sample output:
       Tran Chunk LSize
       3545  128S 7999381504S

      The number of data blocks is $((7999381504/128)) = 62495168

  (2) Create input.xml with pool parameters obtained from LVM:

       <superblock uuid="" time="0" transaction="3545"
data_block_size="128" nr_data_blocks="62495168">
       </superblock>

  (3) Run thin_restore to generate a temporary metadata with correct superblock

       dd if=/dev/zero of=/tmp/test.bin bs=1M count=16
       thin_restore -i input.xml -o /tmp/test.bin

      The size of /tmp/test.bin depends on your pool size.

  (4) Copy the partially-rebuilt superblock (4KB) to your broken metadata.
      (<src_metadata>).

      dd if=/tmp/test.bin of=<src_metadata> bs=4k count=1 conv=notrunc

2. Run thin_ll_dump and thin_ll_restore
    https://www.redhat.com/archives/linux-lvm/2016-February/msg00038.html

   Example: assume that we found data-mapping-root=2303
     and device-details-root=277313

   ./pdata_tools thin_ll_dump <src_metadata> --data-mapping-root=2303 \
              --device-details-root 277313 -o thin_ll_dump.txt

   ./pdata_tools thin_ll_restore -E <src_metadata> -i thin_ll_dump.txt \
                                 -o <dst_metadata>

   Note that <dst_metadata> should be sufficient large especially when you
   have snapshots, since that the mapping trees reconstructed by thintools
   do not share blocks.

3. Fix superblock's time field

  (1) Run thin_dump on the repaired metadata

      thin_dump <dst_metadata> -o thin_dump.txt

  (2) Find the maximum time value in data mapping trees
      (the device with maximum snap_time might be remove, so find the
       maximum time in data mapping trees, not the device detail tree)

      grep "time=\"[0-9]*\"" thin_dump.txt -o | uniq | sort | uniq | tail

      (I run uniq twice to avoid sorting too much data)

      sample output:
        ...
        time="1785"
        time="1786"
        time="1787"

      so the maximum time is 1787.

  (3) Edit the "time" value of the <superblock> tag in thin_dump's output

     <superblock uuid="" time="1787" ... >
        ...

  (4) Run thin_restore to get the final metadata

      thin_restore -i thin_dump.txt -o <dst_metadata>


Ming-Hung Tsai
