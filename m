Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p5CFMQhh028845
	for <linux-lvm@redhat.com>; Sun, 12 Jun 2011 11:22:26 -0400
Received: from mail3.guam.net (mail3.guam.net [202.128.0.97])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p5CFMPM9032477
	for <linux-lvm@redhat.com>; Sun, 12 Jun 2011 11:22:25 -0400
Received: from localhost (unknown [10.255.255.190])
	by mail3.guam.net (Postfix) with ESMTP id C3268164175C
	for <linux-lvm@redhat.com>; Mon, 13 Jun 2011 01:36:51 +1000 (ChST)
Received: from smtp3.guam.net ([127.0.0.1])
	by localhost (smtp3.guam.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WDTm4Cv6ZXQC for <linux-lvm@redhat.com>;
	Mon, 13 Jun 2011 01:18:48 +1000 (ChST)
Received: from [192.168.128.201] (202-128-91-158.d.c300.guam.net
	[202.128.91.158])
	by smtp3.guam.net (Postfix) with ESMTP id 22EBAFE4C13
	for <linux-lvm@redhat.com>; Mon, 13 Jun 2011 01:18:48 +1000 (ChST)
From: "Michael D. Setzer II" <mikes@kuentos.guam.net>
Date: Mon, 13 Jun 2011 01:22:21 +1000
MIME-Version: 1.0
Message-ID: <4DF4D9AD.3708.6B051@mikes.kuentos.guam.net>
In-reply-to: <4DF48075.4070804@redhat.com>
References: <4DF3EFD8.21200.145B56@mikes.kuentos.guam.net>,
	<4DF48075.4070804@redhat.com>
Content-transfer-encoding: 7BIT
Content-description: Mail message body
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

On 12 Jun 2011 at 11:01, Milan Broz wrote:

Date sent:      	Sun, 12 Jun 2011 11:01:41 +0200
From:           	Milan Broz <mbroz@redhat.com>
To:             	LVM general discussion and development <linux-
lvm@redhat.com>
Copies to:      	"Michael D. Setzer II" 
<mikes@kuentos.guam.net>
Subject:        	Re: [linux-lvm] Question on LVM and Bare Metal 
Restore?

> On 06/12/2011 12:44 AM, Michael D. Setzer II wrote:
> 
> > Backing up the regular partitions that contain an LVM has been 
> > always been available, and backing up the whole disk image. 
> > Recent versions have added the ability to backup the LVM dm 
> > partitions as well. Backing up and restore works fine as long as 
> > the LVM setup is already there, but it a disk completely fails one 
> > would need to recreate the LVM before being able to restore it.
> 
> Recovery is very easy with LVM (once you find how to do that:-)
> 
> I suggest you read the LVM documentation, mainly
> the section 6. LVM troubleshooting.
> 
> http://docs.redhat.com/docs/en-US/Red_Hat_Enterprise_Linux/6/html-single/Logical_Volume_Manager_Administration/index.html
> 
> All you need to recover LVM metadata is metadata backup
> (automatically maintained in /etc/lvm or directory specified in lvm.conf)
> and then something like
> pvcreate -u <uuid> --restorefile <backup file> <PV> # only if PV header is lost!
> vgcfgrestore -f <backup file> <VG>
> 
> Milan
> 
Thanks for both messages, they will give me a starting point to 
test. 

In doing a backup of a 250GB physical partition with a LVM and 
swap it takes about 1 hour and 40 minutes to backup, but only 20 
minutes to use fsarchiver to backup the lvm root directly. 

Perhaps adding vgcfgbackup and vgcfgrestore options to the mbr 
backup section will work. Will have to setup a test machine, and 
see if I can complete wipe the disk, and have it restore LVM from 
scratch.

Thanks again.


+----------------------------------------------------------+
  Michael D. Setzer II -  Computer Science Instructor      
  Guam Community College  Computer Center                  
  mailto:mikes@kuentos.guam.net                            
  mailto:msetzerii@gmail.com
  http://www.guam.net/home/mikes
  Guam - Where America's Day Begins                        
  G4L Disk Imaging Project maintainer 
  http://sourceforge.net/projects/g4l/
+----------------------------------------------------------+

http://setiathome.berkeley.edu (Original)
Number of Seti Units Returned:  19,471
Processing time:  32 years, 290 days, 12 hours, 58 minutes
(Total Hours: 287,489)

BOINC@HOME CREDITS
SETI        10870621.860383   |   EINSTEIN     6012510.330851
ROSETTA      3240336.813559   |   ABC          6279463.408252
