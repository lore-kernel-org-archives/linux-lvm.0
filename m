Subject: Re: [linux-lvm] Help with restoring missing VG
From: Randy Perkins <randyperkins@randyperkins.com>
In-Reply-To: <200305100135.50292.bjzolp@wisc.edu>
References: <200305100135.50292.bjzolp@wisc.edu>
Message-Id: <1052549748.13416.13.camel@randy.randyperkins.com>
Mime-Version: 1.0
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
Date: Sat May 10 01:55:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Sat, 2003-05-10 at 01:35, B. J. Zolp wrote:

> I had a hunch that the most recent drive I added to the volume group was 
> dying, so I ran  vgreduce vg0 /dev/hdf to remove that disk and hopeed to  

i never ran this command

but

i just had a drive crash on me
my drive was completely gone, clicking and unrecognizable by the bios.
now that i have it out, i see it is still under warranty.
western digital 7200rpm 40GB

i know just enough about lvm to get it going and that is all.


what saved me was a backup of the vgcfg
it was stored in /etc/lvmconf/<name_of_my_vg>.conf
i have read that if i didnt have that file, i could
upgrade to lvm2 and use some of its tools to recover.

basically what i did:

remove the bad drive from the computer.
replace it with a good drive of the same capacity.
run pvcreate on the new drive
use the vgcfgrestore command to restore the backup config data
	to the new, empty drive.
vgscan;vgchange -a y to activate the vg
then i mounted and retrieved the data that i could

what i never did was run vgreduce like you did,
so i am sure your situation is different.

i got some help/hope from people on this list,
and more info from the mailing list.
but studying the man pages helped me the most

i have lvm 1.0.3 and one thing that didnt work for me was
vgcfgrestore with the -o option.
you only need the -o if you disk have been rearranged from
when the backup was taken.  i had to move the ide cables
on my system to match the backup config

i got everything back i *really* needed except
my daughters first birthday pictures :(

good luck
randy
