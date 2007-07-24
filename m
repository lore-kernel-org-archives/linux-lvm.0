Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l6O8mNBl023091
	for <linux-lvm@redhat.com>; Tue, 24 Jul 2007 04:48:23 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l6O8mL0m025161
	for <linux-lvm@redhat.com>; Tue, 24 Jul 2007 04:48:22 -0400
Date: Tue, 24 Jul 2007 10:48:20 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Flexible storga: LVM setup on top of mdadm sets. Good
	idea or not?
Message-ID: <20070724084820.GA26108@percy.comedia.it>
References: <20070723072320.GB30790@percy.comedia.it>
	<Pine.LNX.4.44.0707231231340.4791-100000@bmsred.bmsi.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0707231231340.4791-100000@bmsred.bmsi.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Mon, Jul 23, 2007 at 12:43:17PM -0400, Stuart D. Gathman wrote:
>On Mon, 23 Jul 2007, Luca Berra wrote:
>
>> On Sun, Jul 22, 2007 at 02:57:33PM -0400, Stuart D. Gathman wrote:
>> >The main drawback to md raid1 is that it always resynchronizes
>> >the *entire* partition when a disk goes offline temporarily.  I also
>> False. md uses bitmaps to avoid this.
>
>I am using md on dozens of systems up through Centos-5.  If there are any
>bitmaps, they don't work.  Or maybe they are a new feature not in kernel
>2.6.18.  The only change I've noticed since RH7.3 is that sync speed is no
>longer limited to 10K.  Or maybe I'm not looking at the right thing.
man mdadm
Bitmaps are a feature of md since mdadm-2.0 (kernel 2.6.13 or 2.6.14)

...

>How would I see these bitmaps in action?

man mdadm
but basically
mdadm -G /dev/md?? -b internal

>BTW, to upgrade a 7.2 system to Centos5, I plan to install on a disk
>with matching partition sizes and replace boot drive.  Is there any
>chance that md raid1 will sync from the old system overtop the new?
>(Because the new wouild have lower sequence numbers?)  Or is there some
>kind of UUID in the raid superblock to prevent this?  (Of course I plan
>to change partition types away from RAID Auto just to be safe...)
unfortunately redhat insisted for a long time on using the in-kernel md
auto-detect, which iirc just ignores md uuid. i think this is still true
in redhat5.

changing partition type will prevent this
creating the new raid with a different minor will prevent this
or change the minor of the old raid.
... but we're getting offtopic.
if you have further questions post them on linux-raid.

L.


-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
