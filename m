Message-Id: <XFMail.20020321124927.f.hinzmann@hamburg.de>
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Florian Hinzmann <f.hinzmann@hamburg.de>
Subject: [linux-lvm] vgscan errors, segmentation faults
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
Date: Thu Mar 21 06:07:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello!

I am desperate. I can't access my LVs at all currently.
vgscan and vgcfgrestore say something about
"only found 0 of x LEs for LV foo" and then they die
with a segmentation fault.

"vgchange -ay" does the same of course ..


The box with that problem is an ordinary PC running
Debian Linux (unstable/sid).

I am trying to solve this right now. I will check for replies
to this mail (list and private) regularily. I am eager to 
help debugging this; giving more information or doing
things someone wants me to try. 
Short: Please help me, I will do whatever I can to help.  ;)


I will now try to remember as much as possible of
what happened and what I did:

- I started to play around with LVM (v1.0.1, Debian package) with 
  a stock 2.4.17 kernel (compiled by myself).
- I had a volume group spread across several partitions 
  (one per physical harddisk).
- I added and removed PVs to my VG and resized some LVs.
- Later I had two VGs and I was shifting them around quite
  heavily.
- Later I merged that two groups.

A short time after that action the problems began. I don't remember
my actions exactly. I think I had LVs with equal names inside both
VGs. I did some moving of PEs, I renamed at least one LV and at some
point I tried to merge both VGs.

If I remember that correctly vgmerge worked fine, but I had some
problems afterwards. I am not able to recollect all the steps I perfomed.

I am sure activating did not work at some point and vgscan did not 
display my new VG correctly. The only way I found to mount my LVs 
was calling 
"vgcfgrestore -f foo/vg01.conf /dev/hda2" and
"vgcfgrestore -f foo/vg01.conf /dev/hdb1" and 
_not_ calling any scan programs afterwards. 

Especially vgscan messed up my setup. I remember getting contradictory 
messages about to which VG /dev/hdb1 belongs while trying to 
solve that. 

Whatever, I was able to use my LVs if I wrote the metadata using
vgcfgrestore. And calling vgscan was a sure way to make my LVs not
working.


I thought the new version might solve this for me and that box
is running with lvm-1.1rc1 (again Debian package) + kernel 2.4.18 + 
linux-2.4.18-VFS-lock.patch + lvm-1.1-rc1-2.4.18.patch.

But now vgscan and vgcfgrestore segfault like I did
write above.


What can I try? What information may I provide?

Please help!


  TIA
   Florian Hinzmann


--
  Florian Hinzmann                         private: f.hinzmann@hamburg.de
                                            Debian: fh@debian.org
PGP Key / ID: 1024D/B4071A65
Fingerprint : F9AB 00C1 3E3A 8125 DD3F  DF1C DF79 A374 B407 1A65
