Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5KII9022429
	for <linux-lvm@redhat.com>; Sun, 20 Jun 2004 14:18:09 -0400
Received: from mail.ukfsn.org (s2.ukfsn.org [217.158.120.143])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i5KII8e1018437
	for <linux-lvm@redhat.com>; Sun, 20 Jun 2004 14:18:08 -0400
Received: from localhost (lucy.ukfsn.org [127.0.0.1])
	by mail.ukfsn.org (Postfix) with ESMTP id 45D09E6D46
	for <linux-lvm@redhat.com>; Sun, 20 Jun 2004 19:17:24 +0100 (BST)
Received: from mail.ukfsn.org ([127.0.0.1])
	by localhost (lucy.ukfsn.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 23107-06 for <linux-lvm@redhat.com>;
	Sun, 20 Jun 2004 19:17:24 +0100 (BST)
Received: from oak.dgreaves.com (modem-2288.karuhiruhi.dialup.pol.co.uk
	[81.78.136.240]) by mail.ukfsn.org (Postfix) with ESMTP id 74215E6D3B
	for <linux-lvm@redhat.com>; Sun, 20 Jun 2004 19:17:23 +0100 (BST)
Received: from ash.dgreaves.com ([10.0.0.66])
	by oak.dgreaves.com with esmtp (Exim 4.20) id 1Bc6vG-0000bc-9w
	for linux-lvm@redhat.com; Sun, 20 Jun 2004 19:20:06 +0100
Message-ID: <40D5D4D6.9020307@dgreaves.com>
Date: Sun, 20 Jun 2004 19:17:58 +0100
From: David Greaves <david@dgreaves.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM2 seems to chop performance by 33%
References: <40C86F52.4090500@dgreaves.com>	<200406101105.47606.StuartHarper@tampabay.rr.com>	<40C87F8A.7080304@dgreaves.com>
	<1086885029.13087.15.camel@localhost>
In-Reply-To: <1086885029.13087.15.camel@localhost>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Clint Byrum wrote:

>On Thu, 2004-06-10 at 08:34, David Greaves wrote:
>  
>
>>Thanks
>>
>>I'd tried that, but no real change. I started 1t 128k and also tried 
>>64k, 256k :) (oh, and 1k)
>>
>>    
>>
>
>I did some tests a few months ago with bonnie++.. might offer some
>encouragement (please don't post this to slashdot.. ;)
>
>http://spamaps.org/raidtests.php
>
>There's a lot of data there, but if you look at the LVM stuff, you might
>notice that the concurrent performance (having 3 processes hammering the
>disks in different places instead of just one) was quite good when
>compared to flat out RAID5. I'll pay 5% performance for manageability
>any day. :-D
>  
>
Thanks to those that made suggestions.

In the end I used
blockdev --setra 4096 on all my devices (/dev/sda,b,c,d and the /dev/md0 
and the /dev/video_vg/video_lv) and this doubled throughput.

I am reading multi-gigabyte video files so these parameters are not for 
everyone.

No-one ever replied as to why blockdev --setra / --getra is not the same 
as that displayed in lvdisplay
And it's not documented that I can find. There's a comment: "Not used by 
device-mapper." And that means.....?
It's ignored? not implemented yet? Good luck?

# lvdisplay /dev/video_vg/huge_lv
  --- Logical volume ---
  LV Name                /dev/video_vg/huge_lv
  VG Name                video_vg
  LV UUID                3kz7n9-97Rg-2LJw-J9ml-1BBS-jGs0-Onh4NI
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                312.50 GB
  Current LE             5000
  Segments               1
  Allocation             inherit
  Read ahead sectors     120
  Block device           253:1

# blockdev --getra /dev/video_vg/huge_lv
4096

<sigh> Let this post be there for Google - the modern man-page for 
linux. (if you've got your fingers crossed!)

David
