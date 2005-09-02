Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j828acV09916
	for <linux-lvm@redhat.com>; Fri, 2 Sep 2005 04:36:38 -0400
Received: from mrp.swissptt.ch (outmail2.swisscom.com [138.190.3.29])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j828aWm6016012
	for <linux-lvm@redhat.com>; Fri, 2 Sep 2005 04:36:35 -0400
Received: from mwdsp001.swissptt.ch (mwdsp001.swissptt.ch [10.221.40.203])
	by mrp.swissptt.ch with ESMTP id j828aVxf010565
	(using TLSv1/SSLv3 with cipher EDH-RSA-DES-CBC3-SHA (168 bits) verified
	NO) for <linux-lvm@redhat.com>; Fri, 2 Sep 2005 10:36:32 +0200 (MEST)
Received: from mwdsp001 (localhost [127.0.0.1])
	by mwdsp001.swissptt.ch (8.13.3/8.12.11) with ESMTP id j828aLmf015157
	for <linux-lvm@redhat.com>; Fri, 2 Sep 2005 10:36:21 +0200
Date: Fri, 2 Sep 2005 10:36:21 +0200
From: Chris Osicki <Krzysztof.Osicki@swisscom.com>
Subject: Re: [linux-lvm] Moving space between logical volumes?
Message-ID: <20050902103621.5b201d8a@mwdsp001>
In-Reply-To: <3BED18D345FC9245B8B26F4273CFFBAF0333FD33@IOWAEVS02.iowa.uiowa.edu>
References: <3BED18D345FC9245B8B26F4273CFFBAF0333FD33@IOWAEVS02.iowa.uiowa.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>


Howard

I've got more experience with growing filesystems as with reducing them. Never managed to 
delete enough data so a shring would make sense ;-)
Just yesterday I inncreased size of a ext3 FS by doing this

	umount /local
	lvextend --size +4G /dev/gv00/local
	resize2fs

resize2fs asked me to fsck -f /dev/gv00/local

	mount /local

That was it.
Shrinking is a bit more tricky as you have to be careful shrinking your LVol not to make is 
smaller than the filesystem. 

I've never used tune2fs or e2fsadm for this purpose and I think it's not the way to go.

Hope it helps.

Regards,
Chris

On Thu, 1 Sep 2005 10:28:57 -0500
"Meadows, Howard T" <howard-meadows@uiowa.edu> wrote:

> Chris,
> 
>     Thanks for your reply. The logical volumes in question are ext3
> filesystems. I did read the man page for lvreduce and its warning about
> possible loss of data was what originally prompted me to ask for help.
> 
>     I do not want to resize the partition (they are all on the same
> partition), so I am wondering if e2fsadm might do the trick? It looks like
> you can shrink (and expand) logical volumes using e2fsadm with the
> restriction that shrinking only works on unmounted filesystems (if I'm
> reading the man page correctly). So... my current thought is as follows:
> 
>     * unmount the filesystems in question.
>     * use 'tune2fs -O ^has_journal /dev/sda5' to turn off journaling
>     * use 'e2fsadm -L -100G /dev/vg/lv1' to reduce lv1 by 100GB
>     * use 'e2fsadm -L +100G /dev/vg/lv2' to increase lv2 by 100GB
>     * use 'e2fsck -f /dev/sda5' to check the filesystems
>     * use 'tune2fs -j /dev/sda5' to turn journaling back on
>     * re-mount the filesystems
> 
>     It seems (from the man page for e2fsadm) that lvreduce/lvextend would
> then not be needed. Is this true?
> 
>     I would like to feel more confident that this would actually work before
> I jump in there and do it because I don't feel like looking for a new job if
> it doesn't. ;-)
> 
>     Thanks,
> 
> -Howard
>  
> 
> -----Original Message-----
> From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On
> Behalf Of Chris Osicki
> Sent: Wednesday, August 31, 2005 4:28 PM
> To: LVM general discussion and development
> Subject: Re: [linux-lvm] Moving space between logical volumes?
> 
> 
> Hi Howard
> 
> Your start point is "man lvreduce". Depending of the filesystem type
> you're using you would have to find out how to resize the FS _before_
> using lvreduce/lvextend. Depending on the FS type it may or may not be
> possible to do it on a mounted FS. In worst case a boot from Rescue-CD
> would be necessary == down-time.
> 
> You will have to do this:
> 
> 	 resize (decrease size of) the file system on the huge_lvol
> 	 lvreduce huge_lvol
> 	 lvextend tight_lvol
> 	 resize (increase size of) the file system on the tight_lvol
> 
> LVols resizing was I think the first and most important motivation to
> write LVM.
> Good luck.
> 
> Regards,
> Chris
> 
> On Wed, Aug 31, 2005 at 02:56:40PM -0500, Meadows, Howard T wrote:
> > 
> > I have a volume group with 4 logical volumes. One of the logical volumes
> has
> > a huge amount of space allocated to it, and another is running out of its
> > space.
> > 
> > I am assuming there is a way to re-allocate space from the one with lots
> of
> > space to the one that is running out. I am nervous about using losing data
> > with a reduce-extend combination of commands. Can someone who has done
> this
> > explain exactly how this is done (safely)?
> > 
> > Thanks,
> > 
> > -Howard
> > 
> > 
> > =======================================================
> > Howard Meadows                 howard-meadows@uiowa.edu
> > ITS - SPA, Unix Systems Group              319-335-5519
> > The University of Iowa                    Iowa City, IA
> >  
> > 
> 
> 
> 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> -- 
> 
> Chris Osicki osk@osk.ch
> Dipl. Informatik-Ing. HTL
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
