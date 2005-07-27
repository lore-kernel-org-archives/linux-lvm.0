Received: from [10.15.80.209] (dhcp80-209.msp.redhat.com [10.15.80.209])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id j6RGWIaA016323
	for <linux-lvm@redhat.com>; Wed, 27 Jul 2005 12:32:19 -0400
Mime-Version: 1.0 (Apple Message framework v622)
In-Reply-To: <008001c59203$1553fc70$7e01a8c0@asuspc>
References: <008001c59203$1553fc70$7e01a8c0@asuspc>
Content-Type: multipart/alternative; boundary=Apple-Mail-3-293381347
Message-Id: <ef523605066ee0d0a6b20345a70677dd@redhat.com>
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] How to recover data corrupted by vgcreate
Date: Wed, 27 Jul 2005 11:33:05 -0500
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
To: LVM general discussion and development <linux-lvm@redhat.com>


--Apple-Mail-3-293381347
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=ISO-2022-JP;
	format=flowed

I'm not familiar exactly with how the metadata gets laid on disk, but I 
would think you could just 'vgcreate vg_name /dev/hdd2' (you did this 
already) then 'lvcreate -n <lvname> -l <max size> vg_name'...  This of 
course assumes that the previous lv resided wholly on /dev/hdd2.  Then 
try mounting the new lv and see what happens.

  brassow


On Jul 26, 2005, at 11:57 AM, 張廷州 wrote:

> Hi,
>  
> I have a Linux PC with Fedora C3 installed.
> The disk was partitioned automatically when Linux was installed.
> So, LVM2 partition was created.
> The CPU is damaged today and I move the disk to another Linux PC and 
> try to read data out.
> The disk is connected to device /dev/hdd. /dev/hdd2 is the LVM2 
> partition.
> But, I do a stupid thing. I invoke vgcreate command on /dev/hdd2.
>  
>     vgcreate vg_name /dev/hdd2
>  
> The partition seems to be lost.
> How can I recover the data in /dev/hdd2?
> It's very important data to me.
> Thanks for any help.
>  
> Davis
>  _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--Apple-Mail-3-293381347
Content-Transfer-Encoding: 7bit
Content-Type: text/enriched;
	charset=ISO-2022-JP

I'm not familiar exactly with how the metadata gets laid on disk, but
I would think you could just 'vgcreate vg_name /dev/hdd2' (you did
this already) then 'lvcreate -n <<lvname> -l <<max size> vg_name'... 
This of course assumes that the previous lv resided wholly on
/dev/hdd2.  Then try mounting the new lv and see what happens.


 brassow



On Jul 26, 2005, at 11:57 AM,
<fontfamily><param>Hiragino Kaku Gothic Pro</param>張廷州</fontfamily>
wrote:


<excerpt><smaller>Hi,</smaller>

<smaller> </smaller>

<smaller>I have a Linux PC with Fedora C3 installed.</smaller>

<smaller>The disk was partitioned automatically when Linux was
installed.</smaller>

<smaller>So, LVM2 partition was created.</smaller>

<smaller>The CPU is damaged today and I move the disk to another Linux
PC and try to read data out.</smaller>

<smaller>The disk is connected to device /dev/hdd. /dev/hdd2 is the
LVM2 partition.</smaller>

<smaller>But, I do a stupid thing. I invoke vgcreate command on
/dev/hdd2.</smaller>

<smaller> </smaller>

<smaller>    vgcreate vg_name /dev/hdd2</smaller>

<smaller> </smaller>

<smaller>The partition seems to be lost.</smaller>

<smaller>How can I recover the data in /dev/hdd2?</smaller>

<smaller>It's very important data to me.</smaller>

<smaller>Thanks for any help.</smaller>

<smaller> </smaller>

<smaller>Davis</smaller>

<smaller> </smaller>_______________________________________________

linux-lvm mailing list

linux-lvm@redhat.com

https://www.redhat.com/mailman/listinfo/linux-lvm

read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/</excerpt>
--Apple-Mail-3-293381347--
