From: =?iso-8859-1?Q?Alf_B_Lerv=E5g?= <alfborge@pvv.ntnu.no>
Subject: [linux-lvm] Help recovering my volume groups
Message-Id: <20020206030901.A64005@pvv.ntnu.no>
MIME-Version: 1.0
Content-Disposition: inline
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
Date: Tue Feb  5 20:09:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi, I just had a stroke of panic since my lvm vg didn't come back up
after I shut down my computer and removed a faulty disc.

I searched the web, and found a thread on your mailinglist that matched
my situation pretty well. Following the instructions in that thread, I
managed to get my system back up and running.

Here's a link to the thread I was talking about.

http://lists.sistina.com/pipermail/linux-lvm/2001-January/005948.html

I run linux 2.4.17 on an athlon 1.2G with 1G RAM.

I initially had 3 ide hd's, but one of them was behaving strangly, so I
decided to get a new one on warranty. After taking backups of the data
on that disc, I unmounted it, halted the system and removed it. Then I
turned the system back up. I realize now that I might have saved abit of
work if I ran some commands before I halted the system, but I don't know
what commands those whould have been.

I use one vg called idehd

I had 3 pv's, /dev/hda2, /dev/hdb1 and /dev/hdc
I removed /dev/hdc

When the system came back up, I ran vgscan, which reported that it
didn't find any vg's. While the system was in this state, I ran
dd if=/dev/hda2 of=hda2_pvdump.txt bs=1024 count=4
dd if=/dev/hdb1 of=hdb1_pvdump.txt bs=1024 count=4
pvdisplay -vvd /dev/hdb1 >& hdb1_pvdisplay.txt
pvdisplay -vvd /dev/hda2 >& hda2_pvdisplay.txt
If you are interested in these files, I'll be happy to provide them.

I don't really know if this info is of any use to anyone, but I hope it
might be. Other than this slight hickup I've had no problems with the
lvm system. It makes life alot easier when it comes to hdpartitions and
stuff like that.

To get things up and running again, I ran
vgcfgrestore -n idehd /dev/hda2
vgcfgrestore -n idehd /dev/hdb1
vgchange -ay

-- 
Alf
