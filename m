From: James Hawtin <oolon@ankh.org>
Subject: RE: [linux-lvm] lvcreate distributed extent option
In-Reply-To: <615A249B783CD41192F400D0B747AC8608982668@hesse.bbn.hp.com>
Message-ID: <Pine.LNX.4.44.0211301932220.5528-100000@pzat.meep.org>
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
Date: Sat Nov 30 14:09:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: lvm-devel@sistina.com


On Sat, 30 Nov 2002, ZECHA,HOLGER (HP-Germany,ex1) wrote:

> Hello,
>
> there still seems to be a missunderstanding
> I want to have the following:
>

Hmm your worring to much about how your physical data is being layout! The
reason you see that difference between HP lvm and linux lvm is because
they implement striping differently.

On, HP, they take the modulo of the number of stripes and allocate the
disk in that fasion ie.

a      0   0%2 =0
b      1   1%2 =1
a      2   2%2 =0
b      1   3%2 =1

On linux its

LE Stripe Size (LSS) = Number of LE / Number of strips

a = 0 - (LSS-1)
b = LSS - (LSS*2-1)

But thats just how the Logical extends are mapped LE Stripe Size != real
stripe size on HP or Linux its just how the strip pools are layed out.
The LVM system still has to re cut things LEs up to make real stripes.

Advantage of the way HP does it...
No problems extending things....

Disadvantage
Harder on the maths?
Difficult to specify which LEs to pick when moving them from one PV to
another.


Advantage of Linux way
Easy to specify and check when moving LEs from one PV to another.
Maths easier?

Disadvantage.
LEs have to be renumbered if the LV is extended or reduced, hence not
possible on linux.

Still don't believe me?

Try this....

--- Logical volume ---
LV Name                /dev/sunset_vg/oolon4_lv
VG Name                sunset_vg
LV Write Access        read/write
LV Status              available
LV #                   5
# open                 0
LV Size                18.38 GB
Current LE             588
Allocated LE           588
Stripes                2
Stripe size (KByte)    16
Allocation             next free
Read ahead sectors     120
Block device           58:4

   --- Distribution of logical volume on 2 physical volumes  ---
   PV Name                  PE on PV     reads      writes
   /dev/ide/host2/bus0/target0/lun0/part5 294          0          0
   /dev/ide/host2/bus0/target1/lun0/part2 294          0          0

   --- logical volume i/o statistic ---
   0 reads  0 writes

   --- Logical extents ---
   LE    PV                        PE     reads      writes
   00000 /dev/ide/host2/bus0/target0/lun0/part5 00060  0          0
   00001 /dev/ide/host2/bus0/target0/lun0/part5 00061  0          0
   00002 /dev/ide/host2/bus0/target0/lun0/part5 00062  0          0
...
   00294 /dev/ide/host2/bus0/target1/lun0/part2 00060  0          0
   00295 /dev/ide/host2/bus0/target1/lun0/part2 00061  0          0
   00296 /dev/ide/host2/bus0/target1/lun0/part2 00062  0          0
...

bash# dd if=/dev/sunset_vg/oolon4_lv of=/dev/null bs=16k count=2
2+0 records in
2+0 records out
bash# dd if=/dev/sunset_vg/oolon4_lv of=/dev/null bs=16k count=2
2+0 records in
2+0 records out
bash# dd if=/dev/sunset_vg/oolon4_lv of=/dev/null bs=16k count=2
2+0 records in
2+0 records out

lvdisplay -vv /dev/sunset_vg/oolon4_lv

....

   --- Distribution of logical volume on 2 physical volumes  ---
   PV Name                  PE on PV     reads      writes
   /dev/ide/host2/bus0/target0/lun0/part5 294          240        0
   /dev/ide/host2/bus0/target1/lun0/part2 294          216        0

   --- logical volume i/o statistic ---
   456 reads  0 writes

   --- Logical extents ---
   LE    PV                        PE     reads      writes
   00000 /dev/ide/host2/bus0/target0/lun0/part5 00060  240        0
   00001 /dev/ide/host2/bus0/target0/lun0/part5 00061  0          0
   00002 /dev/ide/host2/bus0/target0/lun0/part5 00062  0          0
....
   00294 /dev/ide/host2/bus0/target1/lun0/part2 00060  216        0
   00295 /dev/ide/host2/bus0/target1/lun0/part2 00061  0          0
   00296 /dev/ide/host2/bus0/target1/lun0/part2 00062  0          0
....

As you see my stripe size was 16k and I grabbed the first 32k of the
device 3 times.

You will notice the read figures are relatively even... not quite sure why
they are not the same I assume LVM might have some kind of header on the
LV. Which would account for the difference...

(I did this after rebooting the system to get clean figures).

You will however notice the stripping did work, it did use both disks not
as you suggest just 1 (if that had been the case the second disk would
have shown 0 reads), test it yourself, as I explained above the
"difference" you are seeing is just down to how the implementation of the
strip parts has been made. Though personally I agree with you the HP
system (due to the fact it can be resized) is supperior!

James
