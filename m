Message-ID: <3E55201B.919C8D41@conterra.de>
From: Dieter Stueken <stueken@conterra.de>
MIME-Version: 1.0
Subject: [linux-lvm] Re: How to handle Bad Block relocation with LVM? 
 	I actually quite agree.  Here are a few points:
 	
 	o A PE is typically less than 0.01% of my total disk space.
 	
 	o Corruption on a drive tends to spread, especially if sectors near the
 	corruption are accessed frequently, so it's best to avoid a whole
 	section of a drive around a bad spot.
 	
 	o In general, I would want to throw away a drive that had so many bad
 	sectors that it's firmware relocation software could no longer handle
 	them.  So, my main purpose in relocating the PE is to recover as much
 	data from it as I can before junking the drive.
Content-Transfer-Encoding: 8bit
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
Date: Thu Feb 20 12:36:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

Eric M. Hopper wrote:

>I actually quite agree.  Here are a few points:
>
>o A PE is typically less than 0.01% of my total disk space.

I just have the same problem on a 300GB volume and some bad sectors.
The relative amount of a lost PE might be small, but it is still 64Mb,
which are 131072 lost sectors for each (512byte) bad one :(-

Up to now, I could solve the problem by running the IBM-DFT tool to
replace bad sectors.(http://www.hgst.com/hdd/support/download.htm)
If this succeed, the secor was blank, but readable. After running
an fsck I even may verify if any file content was damaged by asking
debugfs.

Unfortunately the "sector-repair" failed this time :-(

What I need instead would be a hack that simply turns a bad sector into
an empty sector. This could best be implemented at lowest level when
reading single sectors, before buildings blocks (=> 4K == 8 sectors
affected).
This could be something like a hdparm option. But still reporting such
events to syslog could be helpful.

>o Corruption on a drive tends to spread, especially if sectors near the
>corruption are accessed frequently, so it's best to avoid a whole
>section of a drive around a bad spot.

Therefore it would be good, if the system will not retry to read a
broken
sector again and again and again, as done by now 8 times for each 4k
block
plus n times by all the read-ahed attempts.

Dieter.
-- 
Dieter St�ken, con terra GmbH, M�nster
    stueken@conterra.de        
    http://www.conterra.de/   
    (0)251-7474-501
