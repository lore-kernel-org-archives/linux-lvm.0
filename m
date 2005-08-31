Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7VLSdV19851
	for <linux-lvm@redhat.com>; Wed, 31 Aug 2005 17:28:39 -0400
Received: from gw.osk.ch (80-218-244-161.dclient.hispeed.ch [80.218.244.161])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j7VLSSHU008202
	for <linux-lvm@redhat.com>; Wed, 31 Aug 2005 17:28:38 -0400
Received: from gutek.osk.ch (gutek.osk.ch [192.168.10.2])
	by gw.osk.ch (8.11.6/8.11.6) with ESMTP id j7VLSR001291
	for <linux-lvm@redhat.com>; Wed, 31 Aug 2005 23:28:27 +0200
Received: from gutek.osk.ch (localhost [127.0.0.1])
	by gutek.osk.ch (8.13.4/8.13.4) with ESMTP id j7VLSRCI011738
	for <linux-lvm@redhat.com>; Wed, 31 Aug 2005 23:28:27 +0200
Received: (from osk@localhost)
	by gutek.osk.ch (8.13.4/8.13.3/Submit) id j7VLSRgr011734
	for linux-lvm@redhat.com; Wed, 31 Aug 2005 23:28:27 +0200
Date: Wed, 31 Aug 2005 23:28:27 +0200
From: Chris Osicki <lvm@osk.ch>
Subject: Re: [linux-lvm] Moving space between logical volumes?
Message-ID: <20050831212827.GC11522@gutek>
References: <3BED18D345FC9245B8B26F4273CFFBAF0333F999@IOWAEVS02.iowa.uiowa.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3BED18D345FC9245B8B26F4273CFFBAF0333F999@IOWAEVS02.iowa.uiowa.edu>
Reply-To: lvm@osk.ch,
	LVM general discussion and development <linux-lvm@redhat.com>
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


Hi Howard

Your start point is "man lvreduce". Depending of the filesystem type
you're using you would have to find out how to resize the FS _before_
using lvreduce/lvextend. Depending on the FS type it may or may not be
possible to do it on a mounted FS. In worst case a boot from Rescue-CD
would be necessary == down-time.

You will have to do this:

	 resize (decrease size of) the file system on the huge_lvol
	 lvreduce huge_lvol
	 lvextend tight_lvol
	 resize (increase size of) the file system on the tight_lvol

LVols resizing was I think the first and most important motivation to
write LVM.
Good luck.

Regards,
Chris

On Wed, Aug 31, 2005 at 02:56:40PM -0500, Meadows, Howard T wrote:
> 
> I have a volume group with 4 logical volumes. One of the logical volumes has
> a huge amount of space allocated to it, and another is running out of its
> space.
> 
> I am assuming there is a way to re-allocate space from the one with lots of
> space to the one that is running out. I am nervous about using losing data
> with a reduce-extend combination of commands. Can someone who has done this
> explain exactly how this is done (safely)?
> 
> Thanks,
> 
> -Howard
> 
> 
> =======================================================
> Howard Meadows                 howard-meadows@uiowa.edu
> ITS - SPA, Unix Systems Group              319-335-5519
> The University of Iowa                    Iowa City, IA
>  
> 



> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Chris Osicki osk@osk.ch
Dipl. Informatik-Ing. HTL
