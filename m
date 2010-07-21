Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o6LIsJXR005963
	for <linux-lvm@redhat.com>; Wed, 21 Jul 2010 14:54:20 -0400
Received: from buadh-brath.com (mail.buadh-brath.com [66.109.101.7])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o6LIs5wa017032
	for <linux-lvm@redhat.com>; Wed, 21 Jul 2010 14:54:08 -0400
Date: Wed, 21 Jul 2010 11:54:04 -0700
From: Brian McCullough <bdmc@bdmcc-us.com>
Message-ID: <20100721185404.GA14889@bdmcc-us.com>
References: <AANLkTikwNhMWtusJHicMya9k5IS9geQ17ss4aHurjm4z@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AANLkTikwNhMWtusJHicMya9k5IS9geQ17ss4aHurjm4z@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

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
