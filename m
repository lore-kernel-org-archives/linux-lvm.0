From: Randy Perkins <randyperkins@randyperkins.com>
Message-Id: <1052416232.17357.32.camel@randy.randyperkins.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] hard drive crash info please
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Thu May  8 12:50:03 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

hello,
	I have a lvm setup of 5 PV (disks), 1 VG,  and 1 LV.  one of the drives
just started clicking, and is not recognizable by the bios. Now when i
boot up my volume group is not recognized.
some info:

redhat 8.0
lvm 1.0.3
readable copy of /etc/lvmconf/my_vg.conf ( about 5 months old )


	How can i retrieve some of the data that is contained soley
on the other 4 drives. ?? Any help is appreciated.


	i have been looking over the list,
and it appears this thread talks about extracting data from LV
that didnt span the bad disk, but i only have one LV.
http://lists.sistina.com/pipermail/linux-lvm/2003-April/013911.html
it looks like he is using lvm2
.
	does lvm2 have additional tools that can be used to bring back some of
my data. ??

i was just keeping mp3 on this LV, but when i upgraded redhat i moved
all my data to it for awhile, and never moved it back.  my wife is
pissed cause i lost all my digital pictures, and i lost all my personal
files.  i knew better but didnt listen to myself.  the hard drive gave
no errors in the logs, which i monitor, it just up and started beating
its head against the wall.  thanks for any help

randy
