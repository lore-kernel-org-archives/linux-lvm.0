Subject: Re: [linux-lvm] using 160GB IDE drives under linux with LVM.
References: <Pine.LNX.4.10.10202072207550.12213-100000@pzat.meep.org>
From: Terje Kvernes <terjekv@math.uio.no>
In-Reply-To: <Pine.LNX.4.10.10202072207550.12213-100000@pzat.meep.org>
Message-Id: <wxxofj01vol.fsf@nommo.uio.no>
MIME-Version: 1.0
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
Date: Thu Feb  7 21:48:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

James Hawtin <oolon@ankh.org> writes:

> On 7 Feb 2002, Terje Kvernes wrote:
> 
> > the box currently runs vanilla 2.4.16, only patched with LVM-1.0.1
> > from 26/11.  patches or anything people want to toss at this will
> > be highly appreciated.  we have two of these beasts from Maxtor,
> > and stand to loose about 60GiB of space, which isn't all that
> > neat.
> > 
> 
> Whats your Extent size? 

  32MB.

> if its the default 4MB that allows you to address 256GB in that
> volume group.... Please do a vgdisplay -v

--- Volume group ---
VG Name               stuff
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                255
Cur LV                1
Open LV               1
MAX LV Size           1.00 TB
Max PV                255
Cur PV                3
Act PV                3
VG Size               302.66 GB
PE Size               32.00 MB
Total PE              9685
Alloc PE / Size       3204 / 100.12 GB
Free  PE / Size       6481 / 202.53 GB
VG UUID               9FXZZm-T2nv-dw2p-NoRj-9VeI-GVJJ-jzzbCD

--- Logical volume ---
LV Name                /dev/stuff/test
VG Name                stuff
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                100.12 GB
Current LE             3204
Allocated LE           3204
Allocation             next free
Read ahead sectors     10000
Block device           58:0


--- Physical volumes ---
PV Name (#)           /dev/hdc (3)
PV Status             available / allocatable
Total PE / Free PE    4094 / 4094

PV Name (#)           /dev/hda4 (1)
PV Status             available / allocatable
Total PE / Free PE    2784 / 0

PV Name (#)           /dev/hdb4 (2)
PV Status             available / allocatable
Total PE / Free PE    2807 / 2387
  
  I only get 4094 extents on /dev/hdc.  
 
> You only use that disk for linux? 

  nope.  I have two other 100GB drives in the box.

> do you need it to be partitioned at all?  

  nope.

> Do you want the whole of the disk to be available under LVM?  

  yes, please.  :)

> You could do your pvcreate on the whole device that would get
> arround partition table addressing problems.

  oddly enough, that doesn't seem to work either.  unless 134GB is
  160GiB.  and unless my math is _very_ off, this seems strange.  :)

-- 
Terje
