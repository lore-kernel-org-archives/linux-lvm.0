Received: from dogpound.rdu.redhat.com (dogpound.rdu.redhat.com [172.16.59.2])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id k2AG87W8017740
	for <linux-lvm@redhat.com>; Fri, 10 Mar 2006 11:08:07 -0500
Date: Fri, 10 Mar 2006 10:52:42 -0500
From: Josef Whiter <jwhiter@redhat.com>
Subject: Re: [linux-lvm] pvmove didn't work - now system won't boot
Message-ID: <20060310155242.GB7891@dogpound.rdu.redhat.com>
References: <6c3e3c670603090729ue151783w37c1c5ac412f7bd1@mail.gmail.com>
	<20060309165329.GC25789@percy.comedia.it>
	<6c3e3c670603090936j58ec03b0ke7e37d8b622d4ddd@mail.gmail.com>
	<6c3e3c670603091623h5eba4488y7dc8d96916a20af4@mail.gmail.com>
	<6c3e3c670603100757k7b8632d1kf0b93542535059b3@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6c3e3c670603100757k7b8632d1kf0b93542535059b3@mail.gmail.com>
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

Hello,

Yeah you'll want to reduce the size of your filesystem, though you might want to
back stuff up first (dd and such), just incase, since the last time i checked
(which admittedly has been a while) this feature would sometimes result in an
unusable filesystem.  Thank you,

Josef

On Fri, Mar 10, 2006 at 10:57:02AM -0500, Chad Rebuck wrote:
> I am confident someone else will read and reply someday so I'll keep posting :)
> 
> I believe the source of my problem is that I reduced the size of my LV
> by 10G to make room for the PV I moved.  However, I did not reduce the
> filesystem by 10G so fsck is seeing the filesystem is too big for the
> LV.
> 
> If I run 'e2fsadm -L-10G /dev/pv00/lv00' then maybe everything will
> work once again?
> 
> This util wasn't available on my fedora 4 rescue CD but maybe I can
> find it on knoppix or another rescue disk.
> 
> My file system is ext3.  Is this any problem with versions of e2fsadm
> I am likely to find on popular live or recovery CDs?
> 
> Chad
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
