MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <16280.27367.874758.610758@gargle.gargle.HOWL>
From: "John Stoffel" <stoffel@lucent.com>
Subject: Re: [linux-lvm] Drive gone bad, now what?
In-Reply-To: <3F985B2D.5060008@xs4all.nl>
References: <20031021171817.GA28462@mail.parplies.de>
	<3F985B2D.5060008@xs4all.nl>
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
Date: Thu Oct 23 18:59:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Gert> We've setup a simple server machine with a bunch of harddisks of
Gert> 60 and 80 Gb.  With 6 drives and lvm(1) setup it provided us
Gert> with a nice amount of storage space, of course there was always
Gert> the risk of a drive going bad but I had thought that lvm would
Gert> be robust enough to cope with that sort of thing (no I didn't
Gert> expect redundancy or soemthing like that, just I would be able
Gert> to access data on the surviving disks)

Wait a second, let me try to understand this.  Did you just
concatentate or stripe the data across all the drives?  Did you use
RAID5 in this setup, or RAID1?  Or was it just a 6 x 60gb = 320gb
volume without any redundancy?  You need to be precise in specifying
what you had here. 

Gert> Alas a drive went bad (reallly bad, beyond repair so no chance
Gert> of getting any data from it).  Ok time for plan B how do I
Gert> access the data on this 'limp' lvm system.  Googling and reading
Gert> the FAQ's there were 3 options:

If you had just a simple concatenation of all the disks, then you are
toast.  How do you expect LVM to restore the missing 60gb if there's
no parity information or mirrored blocks?  It's impossible!

Gert> For now we let the system rest until lvm2 matures and maybe the
Gert> tools will be there to rescue this set of disks, the data on the
Gert> drives is about 300 Gb worth of music and part of the data is
Gert> still on cdrom backup but much of the music was added later and
Gert> must be restored/re-ripped from the original audio CD's..

This leads me to believe that you just concatenated the disks into one
big volume, without using RAID5 or RAID 1, correct?

Gert> What is the best way to make a 'reliable' lvm system ?  Is
Gert> mirroring the most viable option or is raid 5 also usable,
Gert> keeping in mind the number of drives you can normally connect to
Gert> a PC motherboard (some boards, ours too, have an on board
Gert> ide-raid controller which we used as a simple ide extension
Gert> since the bios onboard was only the 'lite' version and handled 2
Gert> drives in raid config only) On our system the OS was installed
Gert> on a small 2Gb SCSI drive and 6 IDE drives were used for
Gert> 'massive amounts of storage' with still two IDE places
Gert> available.  LVM seemed an easy way to expand when needed..

Gert> If we used mirroring the total number of effective drives will
Gert> be 8/2 and the drives would have to be the same in pairs.
Gert> Upgrading the lvm would mean that 1 IDE port must be free to
Gert> hook up a new (larger) set of drives, pvmove the data from the
Gert> old (smaller) pair of drives we wish to replace to the new set
Gert> and removing the smaller set out of the lvm.  But how about raid
Gert> 5 ?

Gert> With raid 5 it is possible to hook up say 7 drives with 1 spare
Gert> But then the upgrade path is almost impossible since all the
Gert> drives have to be the same size for raid 5 to work...

You've basically hit upon the basic tradeoffs here, though you're
missing a performance issue, in that you should really try to keep
just one drive per IDE channel if at all possible from a performance
point of view.  

John
   John Stoffel - Senior Unix Systems Administrator - Lucent Technologies
	 stoffel@lucent.com - http://www.lucent.com - 978-952-7548
