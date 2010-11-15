Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oAFJri9W021574
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 14:53:44 -0500
Received: from mail-ey0-f174.google.com (mail-ey0-f174.google.com
	[209.85.215.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAFJrVCn031920
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 14:53:31 -0500
Received: by eye27 with SMTP id 27so3221636eye.33
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 11:53:30 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 15 Nov 2010 14:53:29 -0500
Message-ID: <AANLkTi=ZPUWoFk9Xj2b_-9qggGreV9-Z7xv04bGYYjPF@mail.gmail.com>
From: Stirling Westrup <swestrup@gmail.com>
Subject: [linux-lvm] Move pvmove questions Was: Need help with a particular
	use-case for pvmove.
Reply-To: swestrup@gmail.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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

On Sun, Nov 14, 2010 at 6:52 PM, Stirling Westrup <swestrup@gmail.com> wrote:
>>
> Thanks for going through all those steps. It does make the procedure a
> lot clearer in my mind, and it does look like dd_rescue is the way to
> go then. I'm going to head off to try it now.
>

Okay, I've tried the dd_rescue method that was outlined for me, and it
failed, although not for any reasons inherent in the method. It seems
that what is wrong with my 'flakey' drive is not that it has bad
sectors, but that it has a tendency to heat up when used, and then
fail all operations until its cooled down.

So, I went out and managed to borrow a sata card for my server so that
I could hook up all five drives at once, and actually have an active
system while working on it, and now I would like to pvmove all of the
PE's from the old flakey drive to the replacement.

pvmove typically reports getting somewhere around 7% done before the
drive fails, but I would like to know what that represents in terms of
checkpointed data. The man pages are frustratingly vague on a large
number of points:

1) how do you get a list of PEs on a PV?
2) how often are checkpoints made, and can you control that in any way?
3) can you request a given number of PEs to be moved? (I googled and
found someone who claimed to do that in a similar situation, but I
could find no further details).
4) the man page for pvmove says that you can reference a physical
volume with PhysicalVolume[:PE[-PE]..., but it doesn't say what those
suffixes mean, nor could I find any man page which explained it.

Basically, I want to attempt to optimize my uses of pvmove to transfer
as much as possible in as few attempts as possible. Any help would be
appreciated.





-- 
Stirling Westrup
Programmer, Entrepreneur.
https://www.linkedin.com/e/fpf/77228
http://www.linkedin.com/in/swestrup
http://technaut.livejournal.com
