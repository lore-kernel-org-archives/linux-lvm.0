Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uAABMhe5001019
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 10 Nov 2016 06:22:43 -0500
Received: from mail.bitfolk.com (bitfolk.com [85.119.80.223])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 40F53C04B945
	for <linux-lvm@redhat.com>; Thu, 10 Nov 2016 11:22:42 +0000 (UTC)
Received: from andy by mail.bitfolk.com with local (Exim 4.72)
	(envelope-from <andy@strugglers.net>) id 1c4nRI-0000pn-La
	for linux-lvm@redhat.com; Thu, 10 Nov 2016 11:22:40 +0000
Date: Thu, 10 Nov 2016 11:22:40 +0000
From: Andy Smith <andy@strugglers.net>
Message-ID: <20161110112240.GM21587@bitfolk.com>
References: <CAGXs5wWNcNf0mSW5bwYhc_xXyRcpmrJOD2m4Gg5wjS-EBvmMYw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXs5wWNcNf0mSW5bwYhc_xXyRcpmrJOD2m4Gg5wjS-EBvmMYw@mail.gmail.com>
Subject: Re: [linux-lvm] Is it considered safe to resize a mounted partition
 (root filesystem) with lvextend
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Hi Kevin,

On Thu, Nov 10, 2016 at 09:12:58AM +0200, Kevin Wilson wrote:
> Is it safe to extend a mounted partition ?

Yes, if the tool you would use without LVM (e.g. resize2fs) is safe
for that. LVM just uses the appropriate tool, in your case
resize2fs, which can handle on-line resize.

> If I try it I get:
> "on-line resizing required" message, which I am not sure what it means.

It means that resize2fs has detected that the device is mounted and
so is doing an on-line resize. It is merely informational. That
message comes from resize2fs and so this is not really an LVM
question.

As you can see…

> lvextend --size +20G --resizefs /dev/mapper/vg_paeiserver5-lv_my_partition
>   Extending logical volume lv_ubuntu to 34.00 GiB
>   Logical volume lv_ubuntu successfully resized

…from this point on the output comes from the resize2fs program.

> resize2fs 1.42.9 (4-Feb-2014)
> Filesystem at /dev/mapper/vg_paeiserver5-lv_my_partition is mounted on
> /; on-line resizing required
> old_desc_blocks = 1, new_desc_blocks = 3
> The filesystem on /dev/mapper/vg_paeiserver5-lv_my_partition is now
> 8912896 blocks long.

Cheers,
Andy
