Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8ADZ3TJ021088
	for <linux-lvm@redhat.com>; Wed, 10 Sep 2014 09:35:04 -0400
Received: from mail.guam.net (mail3.guam.net [202.128.0.48])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8ADZ0ZP005654
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 10 Sep 2014 09:35:01 -0400
From: "Michael D. Setzer II" <mikes@kuentos.guam.net>
Date: Wed, 10 Sep 2014 23:34:48 +1000
MIME-Version: 1.0
Message-ID: <54105378.710.57565@mikes.kuentos.guam.net>
In-reply-to: <54104C04.7060405@ankh.org>
References: <5410138C.9010603@cemery.org.uk>,
	<CAD+pdNeD-waiZwurw3niih1BPk6fBf9HOannBH6EiLGyYnn3DQ@mail.gmail.com>,
	<54104C04.7060405@ankh.org>
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Subject: Re: [linux-lvm] Replace small drive with bigger, using LVM?
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
To: James Hawtin <oolon@ankh.org>, LVM general discussion and development <linux-lvm@redhat.com>

On 10 Sep 2014 at 14:03, James Hawtin wrote:

Date sent:      	Wed, 10 Sep 2014 14:03:00 +0100
From:           	James Hawtin <oolon@ankh.org>
To:             	LVM general discussion and development 
<linux-lvm@redhat.com>
Subject:        	Re: [linux-lvm] Replace small drive with bigger, using 
LVM?
Send reply to:  	LVM general discussion and development 
<linux-lvm@redhat.com>
	
<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
	
<mailto:linux-lvm-request@redhat.com?subject=subscribe>

> On 10/09/14 13:35, Fran Garcia wrote:
> >
> > Also note you should be using parted rather than fdisk for sdb.
> > You'll need to enable GPT support to partition anything larger than
> > 2Tb.
> >
> >
> Very good point.
> 
> James

Another issue that you may run into is that the grub boot menu uses the uuid 
of the disk for mount instead of the older /dev/sda format, so you may have 
to manually reset the grub.cfg or menu.lst depending on your setup. 

In the past I have done clones of the smaller disk to larger, and then just 
created new partition for the extra space. A bit level copy will also set the 
uuid the same as the original disk. So, look at your current boot config file, 
and see if it has uuid options.



> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


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
ROSETTA     19531221.297211   |   SETI        32889183.808174
ABC         16613838.513356   |   EINSTEIN    32404680.703230
