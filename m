From: Frank Van Damme <frank.vandamme@student.kuleuven.ac.be>
Subject: Re: [linux-lvm] [newbie] name changes in physial volumes
References: <Pine.LNX.4.44.0210132102040.13779-100000@pzat.meep.org>
In-Reply-To: <Pine.LNX.4.44.0210132102040.13779-100000@pzat.meep.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200210191223.12101.frank.vandamme@student.kuleuven.ac.be>
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
Date: Sat Oct 19 05:23:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Sunday 13 October 2002 23:18, James Hawtin wrote:
> Ok there are a number of questions in that one.
>
> PV = Physical Volume
> VG = Volume Group
> LV = Logical Volume
>
> Answer 1
>
> Basically So long as the data does not change LVM will not care about
> where the PV is in the partion table.
>
> Answer 2
>
> Just removing a PV (via the partition table) may cause LVM a problem.
> Why do I say May?
>
> 1) If the PV was part of a VG which spanned multipe PVs that VG would no
> longer be mountable, and you would have problems recovering any LV in that
> volume group (others can tell you how...)
>
> 2) If that PV was in a VG of its own just that VG and all the LVs in it
> would be lost.
>
> ----
>
> The "safe" way to remove a PV.
>
> pvchange -x n <PV device>
> lvmove or lvremove the LVs on that PV
> (Use pvdisplay -v <PV device> to see what LVs are on the physical device)
> Example.... Below be sure to use | more ...
> you can see from the example video2 video3 and var are on that PV...
>
> When the PV is empty you can use vgreduce <pv device> to remove it...
> then you can realloc that space to dos...

Q1: Ok, so if you changed the VG to take 1 less partition, just reformatting 
the partition doesn't cause any problems, but what if you remove the 
partition?

thus:
1) hda1=dos, hda2-3-4 = lvm
2) do black magic: hda1=dos, hda3-4 = lvm, hda2 = nothing
3) remove hda2 (and resize hda1) --> now hda3-4 have become hda2-3 recently.
Does this cause problems for lvm? as in "help, I thought my lvm started at 
hda3!" ?

Q2: What if the PV isn't empty? You need to resize the LV on it I suppose, and 
then it will fre the space on that PV since you issued the 
pvchange -x n <device> 
command?

If in that case, the LV contains too much data too be resized, you can just 
first decrease the size of another LV, extend the LV so it takes the freshly 
freed space, and make it smaller again so it removes the PE's on the PV you 
want to convert to (win)do(w)s; so then you can safely remove the PV from the 
VG?

Do I understand how LVM works?? :-)

Q3:One last question: what file system is recommended to have on lvm's? Is it 
safe to resize reiserfs (recently had a bad experience with parted but I 
dunno about resize_reiserfs)? Is it better to unmount the FS before resizing?

Sorry for this much questions, but lvm is way too interesting ;-)

-- 
Frank Van Damme
homepage:       www.student.kuleuven.ac.be/~m9917684
jabber (=IM):   yalu@jabber.com
