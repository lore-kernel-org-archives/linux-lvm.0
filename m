Message-ID: <3B95D17F.60104@st-peter.stw.uni-erlangen.de>
Date: Wed, 05 Sep 2001 09:17:19 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: what i need is a little attention-RE [linux-lvm] SoftRaid and LVM   Jean-Eric Cuendet
References: <B45465FD9C23D21193E90000F8D0F3DF0178FD77@mailsrv.linkvest.com>
Content-Type: multipart/mixed;
 boundary="------------070008070505010401070103"
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
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.
--------------070008070505010401070103
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi
some month's ago i had a running  LVM over sofware RAID-0 setup
i have currently also a normal VG ( PV's are normal partitions) wich has 
no troubles with ext2 nad reiserfs
but the new VG (containing striped LV's) which is
/dev/hdh10
/dev/md6  linear software RAID
/dev/md7 linear software RAID

i can not format with ext2 or reiserfs , when i try mke2fs mkreiserfs 
they segfaults
because of the troubles with ext2 and reiserfs i think that i can not be 
sure that everything with the LV's works
but probably i'll try cpio-ing my installation over it and give it a try

i'm running ABIT's BP6 2xCelleron533 512Mb RAM 2xWD 30Gb 1xMaxtor 40Gb
raidtools-0.90 lvm-1.0.1rc2 e2fsprogs1.23 1.24 1.24a reiserfs-progs-3.x.0j

and one more question about the min-max
i don't speak "C" can you tell me how to do it with pre linux-2.4.9patches
wich i wont to aply to linux-2.4.10pre2 and they are giving me problems 
with min-max definition



Jean-Eric Cuendet wrote:

>Hi,
>I'll give you my setup.
>I have a 5 36Gb SCSI disks machine which do MD+LVM+ext2 on them
>Each disk is splitted in 4 (~9Gb each partition) and then grouped 5 by 5
>to form 4 MD (md5, md6, md7, md8) each ~36Gb in RAID5.
>Then these 4 MDs are added in a VG and LVs are created for each need
>(CVS, HOMES, FILES, ...). 
>The machine is a PIII 733 with 256Mb RAM and has RH7.1 installed
>I use MD 0.90.0, LVM 1.0.1rc1 and e2fsprogs 1.23. I have NO reiserfs nor
>XFS nor JFS.
>
>All that works fine for me with little problems since upgrade to
>LVM-0.9.1-beta7
>
>Each partition on the physical disk is marked as fd (Linux RAID
>autodectect) then pvcreate is made on /dev/md[5678] . There is no need
>to put either "Linux Native (83)" nor "Linux LVM (8e)" on the /dev/md1
>or something like that. Just the fd on physical partitions will do the
>trick.
>
>Hope this helps.
>-jec
>
>>-----Original Message-----
>>From: svetljo [mailto:galia@st-peter.stw.uni-erlangen.de] 
>>Sent: mardi, 4. septembre 2001 19:44
>>To: bluca@comedia.it; linux-lvm@sistina.com
>>Subject: Re: what i need is a little attention-RE [linux-lvm] 
>>SoftRaid and LVM Jean-Eric Cuendet
>>
>>
>>well the problem currently is that i can not format the LV 
>>with ext2 or 
>>reiserfs
>>in the beginning i could access the LV only with IBM's JFS and i had 
>>troubles mounting it with XFS
>>but i've upgraded to 2.4.10-pre2-xfs-cvs and now i have no 
>>problem with XFS but i still have the problem with ext2 and 
>>reiserfs which i think is not 
>>normal
>>and i'm wondering whether it's safe to use the LV
>>
>>i used e2fsprogs-1.23 and 1.24 and reiserfs progs  3.x.0j
>>but when i try to format the LV mke2fs and mkreiserfs segfaults
>>
>>and i can format normal partitions and software raid with mke2fs and 
>>mkreiserfs
>>
>>
>>the VG :
>>
>>/dev/hdh10
>>/dev/md6  software linear RAID
>>/dev/md7 software linear RAID
>>
>>the LV's are striped over the 3 PV's
>>
>>Luca Berra wrote:
>>
>>>On Tue, Sep 04, 2001 at 07:08:10PM +0200, svetljo wrote:
>>>
>>>>if smbd take a look at all meseages with sender svetljo and with 
>>>>subject
>>>>releated to PB's with LVM on software RAID
>>>>i think he'll get the idea what is all about
>>>>
>>>OK i am using lvm over softraid
>>>can you please do a recap.
>>>
>>>L.
>>>
>>
>>
>>
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@sistina.com 
>>http://lists.sistina.com/mailman/listinfo/linu> x-lvm
>>read the 
>>LVM HOW-TO at 
>>http://www.sistina.com/lvm/Pages/howto.html
>>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>


--------------070008070505010401070103
Content-Type: text/plain;
 name="a_simple_partition_table.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="a_simple_partition_table.txt"


/dev/hde1  dos partition
/dev/hde5 /boot
/dev/hde6 ------X----------> /dev/md7 linear software RAID  ------------------------------------------------ |
/dev/hde11------|              ( raid-devs hde6 hde11)                                                       |
/dev/hde7--------------------X---->   VG wish   PV's hde7 hdg8 hdh5                                          |
/dev/hde8 -----------X---> that is /dev/md0 sofware RAID-0                                                   |
/dev/hde9 swap       |       |                                                                               |
/dev/hde10 ----------|-------|-----------X-------> /dev/md1 software RAID-0                                  |                 
                     |       |           |                                                                   |
/dev/hdg1------------|-------|-----------|-------X------> /dev/md6 linear software RAID----------------------X--> VG myData
/dev/hdg5------------|-------|-----------|-------X           ( raid-devs hdg1 hdg5 hdg6 hdg12 )              | PV's hdh10 md6 md7
/dev/hdg6------------|-------|-----------|-------X                                                           |
/dev/hdg7------------|-------|-----------|-------|------------X-----> /dev/md8 software RAID-0               |
/dev/hdg8 -----------|-------X           |       |            |       (raid-devs hdg7 hdh8 )                 |
/dev/hdg9 -----------|-------|-----------X       |            |                                              |
/dev/hdg10 ----------X       |           |       |            |                                              |
/dev/hdg11 swap      |       |           |       |  	      | 					     |
/dev/hdg12 ----------|-------|-----------|-------|            |                                              |
		     |	     |		 |		      | 				             |
/dev/hdh1  dos partiton      |           |                    |  	                                     |
/dev/hdh5 -----------|-------|           |                    |   	                                     |
/dev/hdh6 -----------|                   |                    |                                              |
/dev/hdh7--------------------------------|                    |                                              |
/dev/hdh8-----------------------------------------------------|         				     |
/dev/hdh9 swap                                                      				             |
/dev/hdh10---------------------------------------------------------------------------------------------------|

 X notifies conection   

i hope it's almost understandable now
--------------070008070505010401070103--
