Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j43GgeO14929
	for <linux-lvm@redhat.com>; Tue, 3 May 2005 12:42:40 -0400
Received: from whirlwind.atmosp.physics.utoronto.ca
	(whirlwind.atmosp.physics.utoronto.ca [128.100.80.80])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j43GgeEG021464
	for <linux-lvm@redhat.com>; Tue, 3 May 2005 12:42:40 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by whirlwind.atmosp.physics.utoronto.ca (8.12.11/8.12.11) with ESMTP id
	j43Gg8tS11931962
	for <linux-lvm@redhat.com>; Tue, 3 May 2005 12:42:29 -0400 (EDT)
Message-ID: <4277A9F7.20808@utoronto.ca>
Date: Tue, 03 May 2005 12:42:31 -0400
From: Guido Vettoretti <g.vettoretti@utoronto.ca>
MIME-Version: 1.0
Subject: Re: [linux-lvm] large logical volumes
References: <424B4459.5050207@utoronto.ca>	<3b24531c0504291300587dd539@mail.gmail.com>	<42729A76.6050204@atmosp.physics.utoronto.ca>
	<20050503152149.GB25616@internet2.edu>
In-Reply-To: <20050503152149.GB25616@internet2.edu>
Content-Type: multipart/alternative;
	boundary="------------060201070102050404050601"
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

This is a multi-part message in MIME format.
--------------060201070102050404050601
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Dan Pritts wrote:

>On Fri, Apr 29, 2005 at 04:35:02PM -0400, Guido Vettoretti wrote:
>  
>
>>32-bit machines:
>>ext3 : 2Tb (I managed to create a 4TB fs for some reason)
>>    
>>
>
>  
>
>I'm not sure this is true - i think that this limit was there but was
>removed in newer versions of ext2/3
>
>  
>
I haven't heard anything about the new versions but I was workiing with 
kernel 2.6.9, and the number of block groups would roll over to 0 when I 
specified a number greater than 32768. Thus the max limitation seemes to 
be 4096(bytes/block)*32768(blocks/group)*32768(blockgroups) =  4TB

[root@cyclone ~]# mkfs -t ext3 /dev/vol0/lvol0
mke2fs 1.35 (28-Feb-2004)
max_blocks 4294967295, rsv_groups = 0, rsv_gdb = 1024
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
512016384 inodes, 1024002048 blocks
8250429 blocks (0.81%) reserved for the super user
First data block=0
Maximum filesystem blocks=1027604480
31251 block groups
32768 blocks per group, 32768 fragments per group


>>ext3: 2Tb (? not sure about this one)
>>    
>>
>
>I have created larger filesystems on 64-bit.
>
>  
>
>>One of the hardware support people said there was a 2Tb limit on the 
>>SCSI protocol (not sure about this), 
>>    
>>
>
>More or less true, but some newer hardware and device drivers 
>have fixed this.  The keyword you need to look for is "64-bit LBA".
>
>I've had success with an Atto celerity fibre channel adapter and
>an infortrend-based RAID on x86_64.  However, each one needed a
>firmware/driver update from what was shipped to me in December of
>last year to work.
>
>  
>
This is useful info,
Thanks
Guido

--------------060201070102050404050601
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html;charset=ISO-8859-1" http-equiv="Content-Type">
  <title></title>
</head>
<body bgcolor="#ffffff" text="#000000">
Dan Pritts wrote:<br>
<blockquote cite="mid20050503152149.GB25616@internet2.edu" type="cite">
  <pre wrap="">On Fri, Apr 29, 2005 at 04:35:02PM -0400, Guido Vettoretti wrote:
  </pre>
  <blockquote type="cite">
    <pre wrap="">32-bit machines:
ext3 : 2Tb (I managed to create a 4TB fs for some reason)
    </pre>
  </blockquote>
  <pre wrap=""><!---->
  </pre>
</blockquote>
<blockquote cite="mid20050503152149.GB25616@internet2.edu" type="cite">
  <pre wrap="">I'm not sure this is true - i think that this limit was there but was
removed in newer versions of ext2/3

  </pre>
</blockquote>
I haven't heard anything about the new versions but I was workiing with
kernel 2.6.9, and the number of block groups would roll over to 0 when
I specified a number greater than 32768. Thus the max limitation seemes
to be 4096(bytes/block)*32768(blocks/group)*32768(blockgroups) =&nbsp; 4TB <br>
<pre wrap="">[root@cyclone ~]# mkfs -t ext3 /dev/vol0/lvol0
mke2fs 1.35 (28-Feb-2004)
max_blocks 4294967295, rsv_groups = 0, rsv_gdb = 1024
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
512016384 inodes, 1024002048 blocks
8250429 blocks (0.81%) reserved for the super user
First data block=0
Maximum filesystem blocks=1027604480
31251 block groups
32768 blocks per group, 32768 fragments per group</pre>
<br>
<blockquote cite="mid20050503152149.GB25616@internet2.edu" type="cite">
  <pre wrap=""></pre>
  <blockquote type="cite">
    <pre wrap="">ext3: 2Tb (? not sure about this one)
    </pre>
  </blockquote>
  <pre wrap=""><!---->
I have created larger filesystems on 64-bit.

  </pre>
  <blockquote type="cite">
    <pre wrap="">One of the hardware support people said there was a 2Tb limit on the 
SCSI protocol (not sure about this), 
    </pre>
  </blockquote>
  <pre wrap=""><!---->
More or less true, but some newer hardware and device drivers 
have fixed this.  The keyword you need to look for is "64-bit LBA".

I've had success with an Atto celerity fibre channel adapter and
an infortrend-based RAID on x86_64.  However, each one needed a
firmware/driver update from what was shipped to me in December of
last year to work.

  </pre>
</blockquote>
This is useful info,<br>
Thanks<br>
Guido<br>
</body>
</html>

--------------060201070102050404050601--
