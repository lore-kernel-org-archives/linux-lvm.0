Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1IEMhLd026627
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 18 Feb 2016 09:22:43 -0500
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mx1.redhat.com (Postfix) with ESMTPS id 7CF6EC00F6E2
	for <linux-lvm@redhat.com>; Thu, 18 Feb 2016 14:22:42 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id o6so18810128qkc.2
	for <linux-lvm@redhat.com>; Thu, 18 Feb 2016 06:22:42 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAGU4k=0B-uXUvc0gNyYH3eF62tNWoGBWVpqg826YH6Xo1Gp4Aw@mail.gmail.com>
References: <CAGU4k=0B-uXUvc0gNyYH3eF62tNWoGBWVpqg826YH6Xo1Gp4Aw@mail.gmail.com>
Date: Thu, 18 Feb 2016 22:22:41 +0800
Message-ID: <CAAYit8R=U4M+z2LvMQNsmGhMariKVx6Gemk6icW8OTN3Dv165Q@mail.gmail.com>
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
Cc: kirapangzi@gmail.com

2016-02-18 15:17 GMT+08:00 Mars <kirapangzi@gmail.com>:
> Hi,
> We have tried your tools, here's the result:
>
> <superblock>
>   <device dev_id="7050">
>   </device>
>   <device dev_id="7051">
>   </device>
> ...
> </superblock>
> <orphans>
>   <node blocknr="22496" flags="2" key_begin="0" key_end="128" nr_entries="126"/>
>   <node blocknr="17422" flags="2" key_begin="0" key_end="128" nr_entries="126"/>
>   <node blocknr="23751" flags="2" key_begin="0" key_end="2175" nr_entries="126"/>
> ...
>   <node blocknr="26257" flags="2" key_begin="7972758" key_end="50331647" nr_entries="242"/>
> </orphans>
>
> The output file have nearly 20000 lines and you can find it in attachment.

Looks strange. How many thin volumes do you have? The top-level
mappings tree contains 208 keys, so the top-level mapping tree might
point to a wrong location. Also, no mapped value was output, not sure
if it is a bug...

1. Please run lvs to show the device id
lvs -o lv_name,thin_id
The try to find the orphan nodes with key range containing the device
ids. That could be the real top-level tree node.

2. What's your pool chunk size?
lvs vgg145155121036c/pool_nas -o chunksize

3. Could you please provide your RAW metadata for me to debug? I want
to know why the output went wrong...
You don't need to dump the entire 16GB metadata:

(1) Please run thin_scan to know the metadata utilization (do not rely
on the metadata space map)

./pdata_tools thin_scan /dev/mapper/vgg145155121036c-pool_nas_tmeta0

You don't need to wait for it to complete scanning. Ctrl-C to stop the
program when it stuck for some minutes. The last line is the last
utilized metadata block. For example:

...
<single_block type="btree_leaf" location="234518" blocknr="234518"
ref_count="0" is_valid="1" value_size="4"/>
<single_block type="btree_leaf" location="234519" blocknr="234519"
ref_count="0" is_valid="1" value_size="32"/>
<single_block type="index_block" location="234520" blocknr="234520"
ref_count="0" is_valid="1"/>
(the program stuck here, break the program)

Then block#234520 is the last utilized metadata block. Usually it is
an index_block.

(2) dump & compress the used part. Send me the file if you can.
dd if=/dev/mapper/vgg145155121036c-pool_nas_tmeta0 of=tmeta.bin bs=4K
count=$((234520+1))
tar -czvf tmeta.tar.gz tmeta.bin


Thanks,
Ming-Hung Tsai
