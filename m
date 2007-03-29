Message-ID: <460BC7C2.3060206@jeppesen.com>
Date: Thu, 29 Mar 2007 16:05:54 +0200
From: Olle Liljenzin <olle.liljenzin@jeppesen.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How to re-stripe a LV after pvmove?
References: <460BA637.9050604@carmen.se> <20070329123929.GA7718@redhat.com>
In-Reply-To: <20070329123929.GA7718@redhat.com>
Content-Transfer-Encoding: 7bit
Reply-To: olle@carmen.se,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: mauelshagen@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

Heinz Mauelshagen wrote:
> On Thu, Mar 29, 2007 at 01:42:47PM +0200, Olle Liljenzin wrote:
>   
>> Hello,
>>
>> How can I rearrange a striped volume after pvmove has been run, so that 
>> I get back the original structure with the stripes equally distributed 
>> on PVs?
>>     
>
> I need to presume, that IO to the striped LV was going on during pvmove.
> Hence restoring the old mapping won't help and will lead to data corruption.
>
> pvmove back using the destination options of the command.
>   

Maybe an example is helpful. After the commands below I have two stripes 
on sdb2 and one on sdb3. How do I move one of the stripes from sdb2 to sdb4?

pvcreate /dev/sdb{1,2,3}
vgcreate vg /dev/sdb{1,2,3}
lvcreate -i 3 -L100M -n lv /dev/vg
vgreduce /dev/vg /dev/sdb1
pvremove /dev/sdb1
pvcreate /dev/sdb4
vgextend /dev/vg /dev/sdb4
lvdisplay -m /dev/vg/lv

--- Logical volume ---
  LV Name                /dev/vg/lv
  VG Name                vg
  LV UUID                NVBrvT-5fZe-0qKA-LCYA-Z9au-X84A-fXYkx3
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                108.00 MB
  Current LE             27
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:2
  --- Segments ---
  Logical extent 0 to 26:
    Type                striped
    Stripes             3
    Stripe size         64 KB
    Stripe 0:
      Physical volume   /dev/sdb2
      Physical extents  9 to 17
    Stripe 1:
      Physical volume   /dev/sdb2
      Physical extents  0 to 8
    Stripe 2:
      Physical volume   /dev/sdb3
      Physical extents  0 to 8
