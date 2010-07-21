Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o6LKfjtJ001117
	for <linux-lvm@redhat.com>; Wed, 21 Jul 2010 16:41:45 -0400
Received: from mail-px0-f174.google.com (mail-px0-f174.google.com
	[209.85.212.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o6LKfaJR026339
	for <linux-lvm@redhat.com>; Wed, 21 Jul 2010 16:41:37 -0400
Received: by pxi14 with SMTP id 14so3527817pxi.33
	for <linux-lvm@redhat.com>; Wed, 21 Jul 2010 13:41:36 -0700 (PDT)
Message-ID: <4c475b80.017c8d0a.36d8.253a@mx.google.com>
From: <daytooner@gmail.com>
Date: Wed, 21 Jul 2010 13:41:00 -0700
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] [SOLVED?] rebuilding LV ext4 filesystem
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Thx. That's one try. 

BTW: what is a .milk file? There were several of these I found under several layers under lost+found.

Ken
-----Original Message-----

From:  Brian McCullough <bdmc@bdmcc-us.com>
Subj:  Re: [linux-lvm] [SOLVED?] rebuilding LV ext4 filesystem
Date:  Wed Jul 21, 2010 11:58 am
Size:  1K
To:  LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Jul 21, 2010 at 11:34:45AM -0700, Ken Bass wrote:
> Okay, I finally got to do what Stuart D. Gathman suggested. And it worked,
> sort of.
> 
> NOW: I am left with a clean ext filesystem, but with about 300GB in
> lost+found, and not other files. Just guessing on that amount, since that is
> how much was on the LV before the crash. So the next logical and obvious
> (and desperate) question is: how to I restore all (or any) of the files
> under lost+found?
> 
> Most of them (that I am interested in)were either image files (jpg, png,
> bmp), ISO images (DVD, CD), music files (mp3, flac, etc), and a few MS
> executables. Is there a utiliity that can help restore these files, maybe
> scan the lost+found files for these types?

Not a lot of help, probably, but the "file" command should at least give you some idea of what type of files they are.


Brian

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
