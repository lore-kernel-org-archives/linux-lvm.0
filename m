Received: from [192.168.1.100] (vpn-248-128.boston.redhat.com [10.13.248.128])
	by pobox.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l7KEmbWE028872
	for <linux-lvm@redhat.com>; Mon, 20 Aug 2007 10:48:38 -0400
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <200708181124.03742.benscott@nwlink.com>
References: <200708181124.03742.benscott@nwlink.com>
Message-Id: <B484E4B6-DBA5-426A-8A3B-EAB16A465BFD@redhat.com>
Content-Transfer-Encoding: 7bit
From: Jonathan Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] using lvconvert for mirroring
Date: Mon, 20 Aug 2007 09:44:58 -0500
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Try using the additional '-a' argument (e.g. 'lvs -a -o +devices).   
That should tell you more.

The reason you are getting errors with the last convert mentioned is  
because you didn't specify enough devices.  Mirroring (with disk  
logging) requires at least 3 devices - two for the actual mirror  
images and one for the log.

There are some pending enhancements to the allocation code that allow  
the log device to be placed on the same physical disk as a mirror  
device - thus only requiring two devices.  I'm not sure when the  
allocation changes will go in.

  brassow

On Aug 18, 2007, at 1:24 PM, ben scott wrote:

> I have been playing with lvconvert but I can't quite figure out  
> what it is
> doing.  If I start with this:
>
> 	Debian# lvs -o +devices
> 	  LV    VG   Attr   LSize Origin Snap%  Move Log Copy%  Devices
> 	  lvol0 vg1  -wima- 7.81G                               /dev/hde2(0)
>
> Then run:
>
> 	Debian# lvconvert -m1 vg1/lvol0
>
> I get this:
>
> Debian# lvs -o +devices
> 	  LV    VG   Attr   LSize Origin Snap%  Move Log        Copy%   
> Devices
> 	  lvol0 vg1  mwima- 7.81G                    lvol0_mlog   2.75  
> lvol0_mimage_0			
> (0),lvol0_mimage_1(0)
>
> So my first question is how do I find out where the mirror really  
> is? I have
> also tried specifying the physical volume at the end of the command  
> to put
> the mirror on a different pv but then I get this error message:
>
> 	Debian# lvconvert -m1 vg1/lvol0 /dev/hdg1
> 	  Not enough PVs with free space available for parallel allocation.
> 	  Consider --alloc anywhere if desperate.
>
> Thank you for any insight.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
