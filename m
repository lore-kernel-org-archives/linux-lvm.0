Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j13IuhO13859
	for <linux-lvm@redhat.com>; Thu, 3 Feb 2005 13:56:43 -0500
Received: from e-liberty.pl (yh226.internetdsl.tpnet.pl [80.55.241.226])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j13IuavT009016
	for <linux-lvm@redhat.com>; Thu, 3 Feb 2005 13:56:36 -0500
Received: from PIW (mizzar.multicon.pl [81.219.100.2])
	by e-liberty.pl (Postfix) with ESMTP id E8982499DD
	for <linux-lvm@redhat.com>; Thu,  3 Feb 2005 21:20:40 +0100 (CET)
Date: Thu, 3 Feb 2005 19:56:25 +0100
From: Piw <piw@e-liberty.pl>
Message-ID: <1413507193.20050203195625@e-liberty.pl>
Subject: Re: [linux-lvm] reducing lv
In-Reply-To: <42000F5E.7020400@m-cam.com>
References: <42000F5E.7020400@m-cam.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

NiHao Arshavir,

Wednesday, February 2, 2005, 12:23:10 AM, you wrote:

> Hi,

> I have a very large LV across 4 pv-s (2 disks - /dev/hdb, /dev/hdd + 2
> partitions on different sisks - /dev/hda2, /dev/hdc2).
> Is there any way to determine how the data on the lv is stored and 
> whether it would be possible to consolidate the data on 1 disk + 2 
> partitions (/dev/hdb, /dev/hda2, /dev/hdc2) and replace the other disk
> (/dev/hdd).
> I am running Reiserfs.

> Thanks for any pointer on how to do this.
> Arshavir

Hi

It depends...
0. first check, if any of you PV has free extents.
# pvdisplay
   - check how many 'Allocated PE' has /dev/hdd
   - check is sum of 'Free PE' from other 3 PV is greater then that.

If  yes,  it  will  be easy (other PV can store all the PE from hdd).
look at scenario 1.

If no, it will still be easy, but filesystem shrnking will be needed.
look at scenario 2.

scenario 1.
So other PVs can take all data... ok... we will use pvmove to do that.

1. Check, if there is any PV that can take all the PE in one move.
ie. you have 10 allocated PE in hdd, and other PV has 13, 8, 5 PEs free.

if yes, simply:
pvmove /dev/hdd /dev/hdx (hdx has more free PEs then hdd allocated PEs)

if no:
If you  have  to  move  to 2 or 3 PVs (ie. hdd use 10 PE, other PVs has
7,  5, 3 free) you  have  to do some trick - (correct me if i'm wrong,
but LVM still cannot move PE to multiple PV in one run?).
You have to manually move fragments of source PV to other PVs.
#pvmove /dev/hdd:1-7 /dev/1st.target
#pvmove /dev/hdd:8-10 /dev/2nd.target

And thats all.

scenario 2.
First  you  have  to  shirink  filesystem, to regain free PEs in Volume
Group.
1. Check PE size in your VG (pvdisplay - 'PE Size (KByte)')
2. Check number of 'Allocated PE' in hdd
3. check number of 'Free PE' in others PV
4. allocated - free = gives you how much PE U have to relese
5. multiple number of PE to release by size of 1 PE
6. now you know how many KB you have to regain.
7. multiple it by 1.1 - to gain safty margin #1
8. now make sure that (free space in filesystem > KB to release)
9. umount lv
9. shrink filesystem
# resize_reiserfs -f -s -(KB to release)K /dev/vg/lv
10. multiple (KB to release) by 0.95 to gain safety margin #2
11. shrink lv
# lvreduce -L -(KB to release)K /dev/vg/lv
12. expand filesystem to regain space lost for safe margin #2
# resize_reiserfs /dev/vg/lv

13. recalculate if now U have enought free PE to reallocate all PE form
hdd. If yes, go to scenario 1, if no, back to beginning of scenario 2.

When you finish, U can do:
lvextend  -L  +(numer of free PEs) /dev/vg/lv
to regain PE used to safty margin #1.

good luck :)

PS.  If  U  can get lots of free space in filesystem, use bigger safty
margins (ie. 1.2 first, 0.9 second) - space isnt lost, and give U more flexibility.
--
Piw
Jabb with me at piw@e-liberty.pl M0r3 1nf0 4t http://www.jabberpl.org/
