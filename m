Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m04Jcuu2000687
	for <linux-lvm@redhat.com>; Fri, 4 Jan 2008 14:38:56 -0500
Received: from fmailhost02.isp.att.net (fmailhost02.isp.att.net
	[207.115.11.52])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m04JcQR7028191
	for <linux-lvm@redhat.com>; Fri, 4 Jan 2008 14:38:26 -0500
Received: from localhost (mail.bdmcc-us.com [192.168.1.133])
	by bdmcc-us.com (Postfix) with ESMTP id 42E7117FB47
	for <linux-lvm@redhat.com>; Fri,  4 Jan 2008 14:38:20 -0500 (EST)
Received: from bdmcc-us.com ([127.0.0.1])
	by localhost (mail.bdmcc-us.com [127.0.0.1]) (amavisd-maia, port 10024)
	with LMTP id 01930-05 for <linux-lvm@redhat.com>;
	Fri,  4 Jan 2008 14:38:19 -0500 (EST)
Date: Fri, 4 Jan 2008 14:38:19 -0500
From: Brian McCullough <bdmc@bdmcc-us.com>
Subject: Re: [LINUX-LVM] shrinking a volume inside an LVM
Message-ID: <20080104193819.GA2021@bdmcc-us.com>
References: <F61B3F3722111146AF452DF29FDCCF5F038D1BD3@xchg03.bolivar.k12.mo.us>
	<F61B3F3722111146AF452DF29FDCCF5F038D1BD6@xchg03.bolivar.k12.mo.us>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F61B3F3722111146AF452DF29FDCCF5F038D1BD6@xchg03.bolivar.k12.mo.us>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Jan 04, 2008 at 01:07:42PM -0600, Kemp, Levi wrote:
> I'm sure it's been asked before, but I must be terrible at searching because I cannot find the answer. I have, like many, followed defaults and ended up wiht a boot partion and a lvm. Inside the lvm is a / and a swap. I'd like to shrink the / so that I can do another install of a different distro without upsetting my current one. I don't have another computer, or equal setup to run my test on and cannot take this one down yet either. If it's impossible let me know, but either way thanks for the help.

This is relatively easy, as long as you are careful.

First, which filesystem format are you using?  I will base my answer on
ext2/ext3, because that's what I am most familiar with, others can
answer better if you have something else.


Second, I presume from your question that / is not full.


1. Boot with a Rescue Disk or Live CD ( you need to make sure that your
LVM is not Live and being used. )

2. Start a terminal window and run:

3. vgchange -a y

4. e2fsck -f /dev/"volgroupname"/"volname of '/'"  ( you can fill in the
blanks )

5. mkdir /mnt1

6. mount /dev/"volgroupname"/"volname of '/'" /mnt1

7. df ( check the amount of space occupied in / )

8. umount /mnt1

9. resize2fs /dev/"volgroupname"/"volname of '/'" "amount occupied +
some"

10. lvreduce -L "size from 9" /dev/"volgroupname"/"volname of '/'" 
( If you want to be extra paranoid, you can add a "-t" parameter once,
and then run it without. )

11. resize2fs /dev/"volgroupname"/"volname of '/'" 
( This will adjust the filesystem to fit the Logical Volume. )


At this point, you should have a smaller / volume and some free space.
Note that resize2fs will insist on the e2fsck, and may require it more
often than I have shown.

I have put in a couple of paranoia steps, such as 6-8, to make sure that
you are using the correct sizes in the next couple of steps.



Have fun!
Brian
