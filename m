Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nAG4sGa5028471
	for <linux-lvm@redhat.com>; Sun, 15 Nov 2009 23:54:16 -0500
Received: from palakse.guam.net (palakse.guam.net [202.128.0.38])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nAG4s54O012084
	for <linux-lvm@redhat.com>; Sun, 15 Nov 2009 23:54:05 -0500
From: "Michael D. Setzer II" <mikes@kuentos.guam.net>
Date: Mon, 16 Nov 2009 14:54:03 +1000
MIME-Version: 1.0
Subject: Re: [linux-lvm] Recovering data from an LV/VG w/ a crashed PV
Message-ID: <4B00DAEB.4894.C5A715@mikes.kuentos.guam.net>
In-reply-to: <99f624940911152036y65fb3474ib4eb90cbca91da@mail.gmail.com>
References: <99f624940911152036y65fb3474ib4eb90cbca91da@mail.gmail.com>
Content-transfer-encoding: 7BIT
Content-description: Mail message body
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
To: Ken Bass <daytooner@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>

Something you might want to try is replacing the controller board on the disk.
On two occassions, I had friends with disk that died, but we were able to get 
the data completely off the disk by replacing the controller board on the disk 
itself. This does require that you get exactly the same board as is on the 
drive, and this only works if the failure was due to the disk controller, and not 
internal hardware. From a Defcon presentation, this is the case in I recall 
85% of disk failures. 

I found the exact same disk as my friends disk on ebay for $20, and just 
replaced the board. May or may not work, but it is worth a shot, and will 
either work or not. 

Be carefull when disconnecting the boards, to make sure you don't damage 
the cables that connect to the internal hardware.

Good Luck.

+----------------------------------------------------------+
  Michael D. Setzer II -  Computer Science Instructor      
  Guam Community College  Computer Center                  
  mailto:mikes@kuentos.guam.net                            
  mailto:msetzerii@gmail.com
  http://www.guam.net/home/mikes
  Guam - Where America's Day Begins                        
+----------------------------------------------------------+

http://setiathome.berkeley.edu (Original)
Number of Seti Units Returned:  19,471
Processing time:  32 years, 290 days, 12 hours, 58 minutes
(Total Hours: 287,489)

BOINC@HOME CREDITS
SETI 8,839,360.988 | EINSTEIN 3,255,438.231 | ROSETTA 1,455,251.513
