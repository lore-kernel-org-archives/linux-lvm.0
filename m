Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i193UNa19973
	for <linux-lvm@redhat.com>; Sun, 8 Feb 2004 22:30:23 -0500
Received: from yakka.services.adelaide.edu.au (yakka.services.adelaide.edu.au [129.127.41.32])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i193UJb02102
	for <linux-lvm@redhat.com>; Sun, 8 Feb 2004 22:30:22 -0500
Message-ID: <4026FEC4.2050005@adelaide.edu.au>
From: Chris Doherty <chris.doherty@adelaide.edu.au>
MIME-Version: 1.0
Subject: Re: [linux-lvm]Re: corrupt /dev/lvm - bizzare properties
References: <1076220042.4025d08a18acb@pandani.services.adelaide.edu.au> <yw1xn07tu7w8.fsf@kth.se> <1076241638.402624e656f43@pandani.services.adelaide.edu.au> <200402081354.15872.rainer@krienke.org> <1076247930.40263d7a87098@pandani.services.adelaide.edu.au> <yw1xbro9u1c7.fsf@kth.se>
In-Reply-To: <yw1xbro9u1c7.fsf@kth.se>
Content-Transfer-Encoding: 8bit
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Sun Feb  8 22:29:06 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@redhat.com
Cc: Rainer krienke <rainer@krienke.org>, linux-lvm@sistina.com

M�ns Rullg�rd wrote:

> Chris Doherty <chris.doherty@adelaide.edu.au> writes:
> 
> 
>>>>>>root@connect4:~# ls -la /dev/lvm
>>>>>>?---rws-w-  8306 840966198 976250230 875573298 Sep 24  2004 /dev/lvm
>>>>>
>>>>>Your filesystem seems to have taken some heavy blows.  You should fsck
>>>>>it properly.  You might need the -f flag to fsck to force a complete
>>>>>check if filesystem is marked clean.
>>>>
>>>>the filesystem can't be mounted (which is the really worrying part) so i
>>>>can't fsck it.
>>>>
>>>
>>>A filesystem that is to be fscked can and may *never* be mounted when 
>>>performing an fsck. Usually all fsck tools won't do anything but stop if the
>>
>>oops, sorry my last statement was ambiguous.  what i meant was that the 
>>filesystem can't be mounted *and* fsck refuses to acknowledge that it is (or 
>>was?) a filesystem.
> 
> 
> The filesystem containing /dev has been damaged somehow.  You should
> fsck it.  Most likely fsck will remove /dev/lvm so you'll have to
> recreate it with proper values.  Don't just rm it.  Something bad has
> obviously happened and changing things without a proper fsck can make
> things worse.

thanks.  i'll try this tonight and report back. :)  my limited understanding 
of LVM leads me to believe that the volume group and logical volume within it 
are actually still safe and sound in /dev/vg1

 >>root@connect4:~# ls /dev/vg1/
 >>total 124
 >>dr-xr-xr-x    2 root     root         4096 Feb  6 18:46 ./
 >>drwxr-xr-x   22 root     root       118784 Feb  8 14:19 ../
 >>crw-r-----    1 root     disk     109,   0 Feb  6 18:46 group
 >>brw-rw----    1 root     disk      58,   0 Feb  6 18:46 lv1

the partition tables on the disks (hdc and hdd) still look ok (sorry i'm at 
work now and don't have the output of fdisk to demonstrate it) so i expect the 
contents of those disks is also ok.  as i've already shown, i can't check the 
the LVM physical volumes with pvdisplay because the kernel module won't / 
can't be loaded.

is /dev/lvm just a character device which is used to transmit data from the 
volume group (vg1) to the device driver?  you mention that fsck will probably 
remove /dev/lvm and that i should recreate it.  is there any risk to vg1/lv1 
if i do that?  (as i still haven't successfully backed up anything in it's 
current state)
