Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0FHPjO16693
	for <linux-lvm@redhat.com>; Sat, 15 Jan 2005 12:25:45 -0500
Received: from svsmail.gsfc.nasa.gov (svsmail.gsfc.nasa.gov [128.183.34.28])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j0FHPiYh026716
	for <linux-lvm@redhat.com>; Sat, 15 Jan 2005 12:25:44 -0500
Received: from [128.183.34.47] (nu.gsfc.nasa.gov [128.183.34.47])
	by svsmail.gsfc.nasa.gov (Postfix) with ESMTP id 2F6A0801FF
	for <linux-lvm@redhat.com>; Sat, 15 Jan 2005 12:25:39 -0500 (EST)
Message-ID: <41E95212.1030208@svs.gsfc.nasa.gov>
Date: Sat, 15 Jan 2005 12:25:38 -0500
From: "Randall A. Jones" <rajones@svs.gsfc.nasa.gov>
MIME-Version: 1.0
Subject: Re: [linux-lvm] understanding large LVM volumes
References: <41E80382.1000403@svs.gsfc.nasa.gov>	<1266458715.20050114224006@free.fr>
	<415694421.20050115033804@e-liberty.pl>
In-Reply-To: <415694421.20050115033804@e-liberty.pl>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Piw wrote:

>NiHao Stephane,
>
>  
>
>>>How does the Physical Extent size affect the maximum VG size?
>>>How does one go about chosing a PE size for a VG?
>>>      
>>>
>
>  
>
>Those limits (65536 LE per LV) does not apply to LVM 2 and 2.6 kernel.
>Your LV can have MUCH more LE (I dont know if there is even reachable
>limit  for  this).  One  and only feedback (if you can notice this) is
>that  userspace  programs for managing LVM works _little_ slower, when
>there is enormous number od LE to administrate.
>I tested it with 4GB LV on 16MB LE (but I didnt see difference)
>
>  
>
I figured that this limitation was gone in LVM 2, but I have not read 
that anywhere.
And, as Stephane pointed out, the man page for vgcreate states the 
limits which created more confusion for me.
I was able to create a single LV from my 4.3TB VG.  There are 1134586 PE 
in this one LV. 
Now I understand why this is possible in LVM 2.

What I am still not sure about is how to choose a PE size for this large VG.
What are the benefits of a small PE size compared to a large PE size?
As mentioned, it does seem like a larger PE might be more efficient 
since there are fewer LEs per LV to manage.
Are there any other benefits?

>>But think hard about it....
>>Are you sure you can't "logicaly" split it ? and that the 10 TB of
>>data will concern the same software or pool of user and so on ?
>>Are you sure you will not have to move only a part of the data one day ?
>>(add a new server and need to export some of the data to import it
>>to the new server ?)
>>Also think about how you will (if you need) backup the whole thing...
>>    
>>
>
>When  I  create  logical structure of my LVM diskspace, I always think
>about those things:
>
>1) Never assign ALL your disks at once between VGs.
>You can ALWAYS add disk later to vg, according to your needs. Removing
>involves  pvmove,  whitch is more stressing then vgextend. (of course,
>if  U  have  more, then 5-6 disks). And almost all filesystems support
>extending of FS, but not all like shrinking.
>
>2) Never create BIG vg, unless they are base on raid disks.
>Damage of one disk whitch is not in RAID, damages VG (of course, U
>can  recreate  structure of vg by clonig PV ID, but filesystems will be
>damaged - mabye in more then one LV.)
>  
>
There is a lot of redundancy built into our data archives; RAID-5, hot 
spare drives, cold spare drives, huge tape backup, off site tape 
backup.  This is the first time an archive will grow over the 32 bit, 
pre LBD, 2TB limit.
I just want to make sure I get the setup correct and that I understand 
all the possibilities before we commit to a configuration.  Recreating a 
10TB data store after the data is present takes a *long* time.

Thank you for all the info and discussion.

-- 
..:.::::
Randall Jones     GST      NASA Goddard Space Flight Center
HPC Visualization Support       http://hpcvis.gsfc.nasa.gov
Scientific Visualization Studio    http://svs.gsfc.nasa.gov
rajones@svs.gsfc.nasa.gov      Code 610.3      301-286-2239
