From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200009260441.e8Q4faE19672@webber.adilger.net>
Subject: Re: [linux-lvm] 2.2.17+LVM+online-ext2
In-Reply-To: <01C02742.093B9B40.smdenton@bellsouth.net> "from S. Michael Denton
 at Sep 25, 2000 10:43:33 pm"
Date: Mon, 25 Sep 2000 22:41:35 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "smdenton@bellsouth.net" <smdenton@bellsouth.net>
Cc: "'linux-lvm@msede.com'" <linux-lvm@msede.com>

Scott Denton writes:
> Well, it appears I was falsely testing the online ext2 patch...
> apparently ext2online wants a loopback fs mounted on /dev/loopx
> instead of straight on a file (using losetup to create the loopx
> device), but oh well I needed to go to .17 anyway

Why do you say this?  I did almost all of my testing on a real block
device.  Unless you have a specially patched kernel, you can't resize
loop devices anyways - they cache the device/file size an creation
time and never update it.

Maybe some actual error output would be helpful in diagnosing your problems?

> Thanks for all the info.  Next stop: journaling (ext3/reiser)

While there are online resize patches for ext3, they aren't really
complete - I've been working on ext3 itself, but haven't been working
on the resize code itself.  Adding ext3 resize support needs changes
to the user tools, so I'm working on the next release of ext2resize.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
