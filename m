Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 65A005D772
	for <linux-lvm@redhat.com>; Fri, 23 Aug 2019 00:18:38 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
	[66.111.4.28])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 83E8459449
	for <linux-lvm@redhat.com>; Fri, 23 Aug 2019 00:18:36 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.nyi.internal (Postfix) with ESMTP id 88AEB21EFE
	for <linux-lvm@redhat.com>; Thu, 22 Aug 2019 20:18:35 -0400 (EDT)
Mime-Version: 1.0
Message-Id: <e11a2dbd-de9c-475f-bf6e-36cab78f7165@www.fastmail.com>
Date: Thu, 22 Aug 2019 20:18:13 -0400
From: "Dave Cohen" <linux-lvm@dave-cohen.com>
Subject: [linux-lvm] repair pool with bad checksum in superblock
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
To: linux-lvm@redhat.com

I've read some old posts on this group, which give me some hope that I might recover a failed drive.  But I'm not well-versed in LVM, so details of what I've read are going over my head. 

My problems started when my laptop failed to shut down properly, and afterwards booted only to dracut emergency shell.  I've since attempted to rescue the bad drive, using `ddrescue`.  That tool reported 99.99% of the drive rescued, but so far I'm unable to access the LVM data.

Decrypting the copy I made with `ddrescue` gives me /dev/mapper/encrypted_rescue, but I can't activate the LVM data that is there.  I get these errors:

$ sudo lvconvert --repair qubes_dom0/pool00
  WARNING: Not using lvmetad because of repair.
  WARNING: Disabling lvmetad cache for repair command.
bad checksum in superblock, wanted 823063976
  Repair of thin metadata volume of thin pool qubes_dom0/pool00 failed (status:1). Manual repair required!

$ sudo thin_check /dev/mapper/encrypted_rescue
examining superblock
  superblock is corrupt
    bad checksum in superblock, wanted 636045691

(Note the two command return different "wanted" values.  Are there two superblocks?)

I found a post, several years old, written by Ming-Hung Tsai, which describes restoring a broken superblock.  I'll show that post below, along with my questions, because I'm missing some of the knowledge necessary.

I would greatly appreciate any help! 

-Dave

Original post from several years ago, plus my questions:
> The original post asks how to do if the superblock was broken (his superblock
> was accidentally wiped). Since that I don't have time to update the program
> at this moment, here's my workaround:
> 
> 1. Partially rebuild the superblock
> 
> (1) Obtain pool parameter from LVM
> 
> ./sbin/lvm lvs vg1/tp1 -o transaction_id,chunksize,lv_size --units s
> 
> sample output:
> Tran Chunk LSize
> 3545 128S 7999381504S
> 
> The number of data blocks is $((7999381504/128)) = 62495168
> 

Here's what I get:

$ sudo lvs qubes_dom0/pool00 -o transaction_id,chunksize,lv_size --units S 
  TransId Chunk LSize     
    14757  512S 901660672S

So, number of data blocks if I undestand correctly is $((901660672/512)) = 1761056

> (2) Create input.xml with pool parameters obtained from LVM:
> 
> <superblock uuid="" time="0" transaction="3545"
> data_block_size="128" nr_data_blocks="62495168">
> </superblock>
> 
> (3) Run thin_restore to generate a temporary metadata with correct superblock
> 
> dd if=/dev/zero of=/tmp/test.bin bs=1M count=16
> thin_restore -i input.xml -o /tmp/test.bin
> 
> The size of /tmp/test.bin depends on your pool size.

I don't understand the last sentence.  What should the size of my /tmp/test.bin be?  Should I be using "bs=1M count=16"?


> 
> (4) Copy the partially-rebuilt superblock (4KB) to your broken metadata.
> (<src_metadata>).
> 
> dd if=/tmp/test.bin of=<src_metadata> bs=4k count=1 conv=notrunc
>

What is <src_metadata> here?
 
> 2. Run thin_ll_dump and thin_ll_restore
> https://www.redhat.com/archives/linux-lvm/2016-February/msg00038.html
> 
> Example: assume that we found data-mapping-root=2303
> and device-details-root=277313
> 
> ./pdata_tools thin_ll_dump <src_metadata> --data-mapping-root=2303 \
> --device-details-root 277313 -o thin_ll_dump.txt
> 
> ./pdata_tools thin_ll_restore -E <src_metadata> -i thin_ll_dump.txt \
> -o <dst_metadata>
> 
> Note that <dst_metadata> should be sufficient large especially when you
> have snapshots, since that the mapping trees reconstructed by thintools
> do not share blocks.

Here, I don't have commands `thin_ll_dump` or `thin_ll_restore`.  How should I obtain those?  Or is there a way to do this with the tools I do have.  (I'm on fedora 30, FYI).

> 
> 3. Fix superblock's time field
> 
> (1) Run thin_dump on the repaired metadata
> 
> thin_dump <dst_metadata> -o thin_dump.txt
> 
> (2) Find the maximum time value in data mapping trees
> (the device with maximum snap_time might be remove, so find the
> maximum time in data mapping trees, not the device detail tree)
> 
> grep "time=\"[0-9]*\"" thin_dump.txt -o | uniq | sort | uniq | tail
> 
> (I run uniq twice to avoid sorting too much data)
> 
> sample output:
> ...
> time="1785"
> time="1786"
> time="1787"
> 
> so the maximum time is 1787.
> 
> (3) Edit the "time" value of the <superblock> tag in thin_dump's output
> 
> <superblock uuid="" time="1787" ... >
> ...
> 
> (4) Run thin_restore to get the final metadata
> 
> thin_restore -i thin_dump.txt -o <dst_metadata>
> 
> 
> Ming-Hung Tsai
