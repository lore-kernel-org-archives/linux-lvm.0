Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9UJkMXe020157
	for <linux-lvm@redhat.com>; Fri, 30 Oct 2009 15:46:22 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9UJk4G5019446
	for <linux-lvm@redhat.com>; Fri, 30 Oct 2009 15:46:04 -0400
Received: from r74-192-24-94.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.24.94] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1N3xQC-00046Z-4B
	for linux-lvm@redhat.com; Fri, 30 Oct 2009 12:46:04 -0700
Date: Fri, 30 Oct 2009 14:46:03 -0500
From: Ray Morris <support@bettercgi.com>
Subject: Re: [linux-lvm] Best Practices deploying LVM
In-Reply-To: <868096450910300152s271d34dcl74980fff211d15b4@mail.gmail.com>
	(from jockah@gmail.com on Fri Oct 30 03:52:43 2009)
Message-Id: <1256931963.28005.3@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"; delsp="Yes"; format="Flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

    With your way, you can add a new 2GB disk and use
half of it for /home, half for /opt, if you wish.
You can also leave some of it unused and expand
any LV in the future as needed.  That's one important
reason why most people use voluem groups as groups -
contianing several volumes.  Does your colleague know
of ANY advantage to creating a bunch of different
groups?   If not, your way wins - it has advantages
over his way, and his way has no advantage.

> we have to discard different kinds of hard disk
> because they're exactly the same

   I have no idea what this is supposed to mean.
Different kinds of hard disk are exactly the same?
If this is supposed to mean "we are not able to
use different types of drives for different
partitions", I can understand that.  However,
for what purpose would you use different types
of disks?  Perhaps he wants a fast disk for one
partition, and a large, cheap disk for another
partition?  If you use two cheap disks in a
striped LV it's going to be faster AND cheaper
than the "fast drive" option.  MAYBE if you were
going to use a super fast RAID array of SSD drives
for some small amount of data, but not if we're
talking standard magnetic hard drives.


> a lot of servers running under VMware. This client
> have a lot of problems with the storage, because they
> never have enough space so when they have to allocate
> disk in servers, they add small virtual hard disks
> with, for example, 5 or 10GB.

lvextend.  Ours resize automatically on the fly, using
a cron job that checks to see if any virtual servers
need more space.

> discarding concept things like a volume group was designed
> to be a group, because we're looking for good reasons

   "Concept reasons", like using the tool designed for the
job, may be the very best reasons because that one reason
actually covers the hundred reasons that don't come to mind
immediately.  You don't know what issues you'll run into
next week or next month, but you can bet you won't be the
first one - other people will have had the same issues,
and will use the standard tools for the standard purposes
to solve that problem.  Better for you if you can use
the same solutions.  Also, there are certain features
and optimizations you don't know about, but you'll gain
from those grouping features if you use groups as groups.
No one knows about the features and optimizations that
will be added next year, but if you use the tools the
way they were designed you'll benefit from future
enhancements that allow you to better use them for their
purposes.
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 10/30/2009 03:52:43 AM, Abraham P�rez wrote:
> Thanks for the instant answers!
> 
> Well... I'll try to explain myself better. I'm working in a client  
> who have
> a lot of servers running under VMware. This client have a lot of  
> problems
> with the storage, because they never have enough space so when they  
> have to
> allocate disk in servers, they add small virtual hard disks with, for
> example, 5 or 10GB.
> 
> Then for the OS installation, we follow the basic schema based on disk
> partitions (/dev/sda1 pointing to / with ext3, /dev/sda2 pointing to  
> /home
> and so on) and for the applications data, we use VG and LV pointing  
> to /opt
> 
> The client have some applications who need a lot of mountpoints, so my
> colleague adds 1-3 LV per VG (aproximated) and I only create only one  
> VG and
> inside it, different LVs.  With this infrastructure, we have to  
> discard
> different kinds of hard disk because they're exactly the same... and  
> we have
> that doubt: what schema is better and why, discarding concept things  
> like a
> volume group was designed to be a group, because we're looking for  
> good
> reasons based in performance of future actions, it's not important...  
> or am
> I mistaken???
> 
> I don't know if I explained myself very well, so thanks all anyway!
> 
> Regards,
> Abraham P�rez
> 
> 2009/10/30 <malahal@us.ibm.com>
> 
> > Ray Morris [support@bettercgi.com] wrote:
> > >     I don't know about a whitepaper, but I can address
> > > your example.
> > >
> > > > he makes one volume group for each logical volume (more or less)
> > >
> > >     If each one has one volume, that's not exactly a volume
> > > GROUP, is it?  If groups and volumes are basically synomous,
> > > he gives up all the benfits of groups.  In fact, he gives
> > > up most of the benefits of logical volumes, since each PV
> > > has to be in one group, and each VG is one LV, you're left
> > > with one LV per PV - might as well just use partitions
> > > directly.
> >
> > I agree, you lose some flexibility but it has some advantage  
> compared to
> > plain partitions without LVM. E.g. he can make a file system larger  
> than
> > any disk with multiple disks in the above LVM (one LV per VG)
> > configuration.  There are other advantages. I am not sure the  
> reason for
> > making only one LV per VG though!
> >
> > Thanks, Malahal.
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >
> 

------quoted attachment------
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
