From: YouMizuki <appendix@hatsune.cc>
Subject: Re: [linux-lvm] vgscanfailed"novolumegroupsfound"
In-Reply-To: <20011025014038.X23590@turbolinux.com>
References: <200110250515.OAA15476@center01.shooting-star.ne.jp> <20011025014038.X23590@turbolinux.com>
Message-Id: <20011026003002.5332.APPENDIX@hatsune.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Thu Oct 25 10:23:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

>> My VG structure is following
>> /dev/md2,md3,md4,md5,md6,md7,md8,md9,md10 => vg0
>You say 9 md devices, and list 9 above for vg0.
>pvscan -- inactive PV "/dev/md10" of VG "vg1" [4.48 GB / 4.48 GB free]
>One of your PVs says it is in another VG   ^^^ very strange.  

This PV device is not used now.This PV is not included "vg0"

# Really,this device was included "vg0",but when I tried to recovery this,
# It was broken ,cause of my mistake.
# It may be broken part of this VG, but I think the area will be not used by filesystem. 
# I want to recovery remaining....
 

>> >pvdata -PP pvdata -PP /dev/md2
>> --- Physical volume ---
>> PV#                   2
>> PV UUID               gyivka-8v8R-s8N6-UHW1-mXO2-A7pe-3V2UtL
>This matches "001" above.  You need to check each of the other MD devices
>to see which ones have valid UUIDs.  You may need to use the uuid-fixer
>tool.

Thanks! I will try to use uuid-fixer.
-- 
YouMizuki <appendix@hatsune.cc>
