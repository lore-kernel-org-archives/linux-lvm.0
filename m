Return-Path: <torsten@pclab.ifg.uni-kiel.de>
From: Torsten Landschoff <torsten@pclab.ifg.uni-kiel.de>
Date: Sat, 28 Apr 2001 22:41:25 +0200
Message-ID: <20010428224125.A4222@pclab.ifg.uni-kiel.de>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Removing a disk from the system
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi *,

Today I learned something about LVM the hard way. We are still using
0.8i with 2.2.19 over here since I had nothing but problems with 
0.8 and 0.9beta2 (or which beta it was). (The problems were already
reported on this list so I chose to do nothing about it).

Now today I replaced a disk in the server being the only PV of the VG
data. Simple thing: Install the next disk, add it to the VG and pvmove 
the data over to it, then remove the old PV.

Then I took out the old disk and jumpered the new one as master. As
expected I got an error message from LVM on reboot - I should run
vgscan. 

I then ran vgscan to get the vg activated again but killed my other
volume group!? I spent hours to get it working again but finally
figured to jumper the new disk as slave again, vgexport the VG and
import it again after setting it to master.

Seems like I should have used vgexport/import in the first time. Anyway, 
now I am wondering what will happen if we need to replace a disk
since it starts to die or something along that line? pvmoving the 
data is no problem, but what can I do if the disk fails before I can 
do anything? 

IOW: Is the problem I ran into a problem by design or is it a bug in 
the 0.8i LVM?

cu
	Torsten
