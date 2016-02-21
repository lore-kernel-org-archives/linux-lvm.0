Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1LFfeQm024474
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sun, 21 Feb 2016 10:41:40 -0500
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mx1.redhat.com (Postfix) with ESMTPS id F2FC1C1F7B
	for <linux-lvm@redhat.com>; Sun, 21 Feb 2016 15:41:38 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id y9so96908018qgd.3
	for <linux-lvm@redhat.com>; Sun, 21 Feb 2016 07:41:38 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAGU4k=0B-uXUvc0gNyYH3eF62tNWoGBWVpqg826YH6Xo1Gp4Aw@mail.gmail.com>
References: <CAGU4k=0B-uXUvc0gNyYH3eF62tNWoGBWVpqg826YH6Xo1Gp4Aw@mail.gmail.com>
Date: Sun, 21 Feb 2016 23:41:38 +0800
Message-ID: <CAAYit8Q_8GkkBSOQXAFWNKAh4rtQM+wT6D8Kpc+D_0srZciJGg@mail.gmail.com>
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

Hi,

I updated the program with some bug fix. Please download it again.
https://www.dropbox.com/s/6g8gm1hndxp3rpd/pdata_tools?dl=0

Here's a quick guide to manually repair a metadata, if thin_repair doesn't help.

1. Run thin_scan to do some basic checking

  ./pdata_tools thin_scan <metadata> [-o <output.xml>]

  The output contains information about:
  (1) metadata blocks' type, properties, and integrity
  (2) metadata utilization, then you can ignore the rest of metadata
      (usually, the last block is an index_block)

  Example output:
    <single_block type="superblock" location="0" ref_count="4294967295" \
                  is_valid="1"/>
    <range_block type="bitmap_block" location_begin="1" blocknr_begin="1" \
                 length="3" ref_count="4294967295" is_valid="1"/>
    ...
    <single_block type="index_block" location="26268" blocknr="26268" \
                  ref_count="4294967295" is_valid="1"/>


2. Check data mapping tree and device details tree

  If you don't know how to use thin_debug or superblock's layout,
  then you can use thin_ll_dump to obtain the tree roots:

  ./pdata_tools thin_ll_dump <metadata> [-o <output.xml>] \
                                        [--end <last_utilized_block+1>]

  Example output:
    <superblock blocknr="0" data_mapping_root="25036" \
                device_details_root="25772">
      ...
    </superblock>
    <orphans>
      ...
    </orphans>

  According to thin_scan's output, we know that the data_mapping_root and
  device_details_root points to a wrong location. That's why thin_dump doesn't
  work.

  <range_block type="btree_leaf" location_begin="25031" blocknr_begin="25031" \
               length="7" ref_count="4" is_valid="1" value_size="8"/>
  ...
  <range_block type="btree_leaf" location_begin="25772" blocknr_begin="25772" \
               length="2" ref_count="4" is_valid="1" value_size="4"/>


3. Find the correct data mapping root and device details root

  (1) If you are using LVM, run lvs to know the thin device ids. That's the key
      for data mapping tree and device details tree. Try to find the nodes with
      key ranges containing the device ids (see thin_scan's output)
  (2) For device details tree, if you have less than 127 thin volumes, then the
      tree root is also a leaf. Check the nodes with value_size="24".

  Example:
  (1) data_mapping_root = 22917 or 25316
    (see thin_ll_dump's output)
    <node blocknr="22917" flags="2" key_begin="1" key_end="105" \
          nr_entries="74"/>
    <node blocknr="25316" flags="2" key_begin="1" key_end="105" \
          nr_entries="74"/>

  (2) device_details_root = 26263 or 26267
    (see thin_scan's output)
    <single_block type="btree_leaf" location="26263" blocknr="26263" \
                  ref_count="4294967295" is_valid="1" value_size="24"/>
    <single_block type="btree_leaf" location="26267" blocknr="26267" \
                  ref_count="4294967295" is_valid="1" value_size="24"/>

  Currently, thin_ll_dump only lists orphan nodes with value_size==8,
  so the orphan device-details leaves won't be listed.


4. Run thin_ll_dump with correct root information:

  ./pdata_tools thin_ll_dump <metadata_file> --device-details-root=<blocknr> \
                --data-mapping-root=<blocknr> [-o thin_ll_dump.xml] \
                         [--end=<last_utilized_block+1>]

  Example:
  ./bin/pdata_tools thin_ll_dump server_meta.bin --device-details-root=26263 \
                    --data-mapping-root=22917 -o thin_ll_dump2.xml --end=26269

  If the roots are correct, then the number of orphans should be less
than before.


5. Run thin_ll_restore to recover the metadata

  ./bin/pdata_tools thin_ll_restore -i <edited thin_ll_dump.xml> \
                    -E <source metadata> -o <output metadata>

  Example (restore to /dev/loop0):
  ./bin/pdata_tools thin_ll_restore -i thin_ll_dump.xml -E server_meta.bin \
                    -o /dev/loop0


Advance use of thin_ll_restore
===============================

1. Handle the case if the root was broken, and you can only find some internal
   or leaf nodes.

  Example: All the mappings reachable from block#1234 and #4567 will
be dumped to device#1.
  <superblock blocknr="0" data_mapping_root="22917" device_details_root="26263">
    <device dev_id="1">
      <node blocknr="1234"/>
      <node blocknr="5678"/>
      ...
    </device>
  </superblock>

2. Create a new device

  If the device_id cannot be found in the device details tree,
  then thin_ll_dump will create a new device with default device_details values.


Please let me know if you have any questions.


Ming-Hung Tsai

2016-02-18 15:17 GMT+08:00 Mars <kirapangzi@gmail.com>:
> Hi,
> We have tried your tools, here's the result:
>
> ...
>
> The output file have nearly 20000 lines and you can find it in attachment.
>
> Thank you very much.
> Mars
