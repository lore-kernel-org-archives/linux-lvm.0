Message-ID: <3F985B2D.5060008@xs4all.nl>
From: Gert van der Knokke <gertk@xs4all.nl>
MIME-Version: 1.0
References: <20031021171817.GA28462@mail.parplies.de>
In-Reply-To: <20031021171817.GA28462@mail.parplies.de>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Drive gone bad, now what?
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
Date: Thu Oct 23 17:52:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Well, LVM 'lured' me too into a false sense of security and I think 
there should be a warning label on it :-)
I know it's my own fault but still...

The problem:

We've setup a simple server machine with a bunch of harddisks of 60 and 
80 Gb.
With 6 drives and lvm(1) setup it provided us with a nice amount of 
storage space, of course there was always the risk of a drive going bad 
but I had thought that lvm would be robust enough to cope with that sort 
of thing (no I didn't expect redundancy or soemthing like that, just I 
would be able to access data on the surviving disks)

Alas a drive went bad (reallly bad, beyond repair so no chance of 
getting any data from it).
Ok time for plan B how do I access the data on this 'limp' lvm system.
Googling and reading the FAQ's there were 3 options:

1 replacing the disk with a fresh one (still the data would be gone, as 
well as the lvm volume data stuff)
2 install LVM2 and access the lvm in 'partial mode'
3 quick hacks to access the lvm with risk of hanging when data on the 
missing drive would be accessed.

Option 1:
tried with an extra drive to no avail, how does one get the metadata 
stuff back on such a drive ? I assume there is some kind of 'numbering' 
scheme internally in lvm so it knows which drive is mapped where.

Option 2:
Installed LVM2 tools. Still running with the old kernel it says on 
vgscan/pvscan that there is a lvm consisting of 6 devices with one 
missing. With vgchange it says (naturally) that it needs the device 
mapper stuff in the kernel.
Compiled a new kernel with devicemapper (1.03 and 1.05 tested) and then 
pvscan says something about data being inconsistent on devices hda and 
hdc and such. vgscan find some vague lvm stuff but at the end is says 
found 1 volume expected 0.. vgchange -ay -P exits with a segmentation 
fault. (whereas it runs without segfaulting on the kernel without the 
devicemapper)

Option 3: lvm can't be activated because it needs 6 and finds 5 devices...

Raah.. :-)

For now we let the system rest until lvm2 matures and maybe the tools 
will be there to rescue this set of disks, the data on the drives is 
about 300 Gb worth of music and part of the data is still on cdrom 
backup but much of the music was added later and must be 
restored/re-ripped from the original audio CD's..

On the lvm is ReiserFS as filesystem. With the missing drive and maybe 
partially reactivating the lvm, what is ReiserFS going to do  after 
mounting it ?

So for our new server system:

What is the best way to make a 'reliable' lvm system ?
Is mirroring the most viable option or is raid 5 also usable, keeping in 
mind the number of drives you can normally connect to a PC motherboard 
(some boards, ours too, have an on board ide-raid controller which we 
used as a simple ide extension since the bios onboard was only the 
'lite' version and handled 2 drives in raid config only)
On our system the OS was installed on a small 2Gb SCSI drive and 6 IDE 
drives were used for 'massive amounts of storage' with still two IDE 
places available.
LVM seemed an easy way to expand when needed..

If we used mirroring the total number of effective drives will be 8/2 
and the drives would have to be the same in pairs.
Upgrading the lvm would mean that 1 IDE port must be free to hook up a 
new (larger) set of drives, pvmove the data from the old (smaller) pair 
of drives we wish to replace to the new set and removing the smaller set 
out of the lvm.
But how about raid 5 ?

With raid 5 it is possible to hook up say 7 drives with 1 spare But then 
the upgrade path is almost impossible since all the drives have to be 
the same size for raid 5 to work...

Can anyone shed some light on this ?

Gert van der Knokke


 
