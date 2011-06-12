Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p5C5escO016030
	for <linux-lvm@redhat.com>; Sun, 12 Jun 2011 01:40:54 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p5C5eqlG014065
	for <linux-lvm@redhat.com>; Sun, 12 Jun 2011 01:40:52 -0400
Received: from r74-192-17-33.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.17.33] helo=[10.0.2.103])
	by ps536.phatservers.com with esmtpa (Exim 4.66)
	(envelope-from <support@bettercgi.com>) id 1QVdPn-0004ub-Nq
	for linux-lvm@redhat.com; Sat, 11 Jun 2011 22:40:51 -0700
References: <4DF3EFD8.21200.145B56@mikes.kuentos.guam.net>
In-Reply-To: <4DF3EFD8.21200.145B56@mikes.kuentos.guam.net>
MIME-Version: 1.0
From: Ray Morris <support@bettercgi.com>
Date: Sun, 12 Jun 2011 00:40:41 -0500
Message-ID: <6d61e92c-9507-451e-87e8-52ec45167482@email.android.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Question on LVM and Bare Metal Restore?
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

See vgcfgrestore.
-- 
Ray Morris
Http://bettercgi.com

"Michael D. Setzer II" <mikes@kuentos.guam.net> wrote:

>I'm the maintainer for the G4L disk imaging project since version 
>0.15 to the current 0.37, and working on 0.38. 
>
>Backing up the regular partitions that contain an LVM has been 
>always been available, and backing up the whole disk image. 
>Recent versions have added the ability to backup the LVM dm 
>partitions as well. Backing up and restore works fine as long as 
>the LVM setup is already there, but it a disk completely fails one 
>would need to recreate the LVM before being able to restore it.
>
>Similar to how one backs up the MBR and partition table for disks, 
>I'd like to have a method that would allow for the recreation of the 
>LVM, so that restores could be done. Additionally, with the 
>fsarchiver doing backups of files in use, it is generally faster than 
>doing a raw dd type backup. 
>
>Is there a script or how to that explains the process of creating a 
>script to recreate the LVM from scratch or from an already existing 
>partition table?
>
>Thanks.
>
>+----------------------------------------------------------+
>  Michael D. Setzer II -  Computer Science Instructor      
>  Guam Community College  Computer Center                  
>  mailto:mikes@kuentos.guam.net                            
>  mailto:msetzerii@gmail.com
>  http://www.guam.net/home/mikes
>  Guam - Where America's Day Begins                        
>  G4L Disk Imaging Project maintainer 
>  http://sourceforge.net/projects/g4l/
>+----------------------------------------------------------+
>
>http://setiathome.berkeley.edu (Original)
>Number of Seti Units Returned:  19,471
>Processing time:  32 years, 290 days, 12 hours, 58 minutes
>(Total Hours: 287,489)
>
>BOINC@HOME CREDITS
>SETI        10870621.860383   |   EINSTEIN     6012510.330851
>ROSETTA      3240336.813559   |   ABC          6279463.408252
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
