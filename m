Message-ID: <925726E04C33D511B1D20002B3289E8E02F751D5@bardeen.logica.co.uk>
From: "Chandler, Alan" <Alan.Chandler@logicacmg.com>
MIME-Version: 1.0
Subject: [linux-lvm] Help - how do I recover a lost Volume Group
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
Date: Tue Apr 15 03:29:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>
Cc: "'alan@chandlerfamily.org.uk'" <alan@chandlerfamily.org.uk>

I am not subscribed to this list - please CC me back again and to the copy
address (home and work).

I am in a mess, probably of my own making.  I would like to get out of it.
In what I describe below, I will use /dev/hda etc although I have devfs
installed and really mean the full path to the devices.

My main disk /dev/hda has a non-lvm root partition (/dev/hda2) and one lvm
partition (/dev/hda3)  [/dev/hda1 is a partition with another OS on it :-( ]

It was starting to fail so I have purchased another disk and temporarily
wired it in as /dev/hdb.  I created three partitions on in with /dev/hdb3 as
the lvm partition.  I successfully copied the first two partitions but with
the third, in order to preserve my volume group name (vg1), I did pvcreate
/dev/hdb3, vgextend vg1 /dev/hdb3 and pvmove /dev/hda3 so that all the data
should now be on /dev/hdb3.

I then shut down the machine, removed /dev/hda and moved what was /dev/hdb
so it is now /dev/hda.  I booted up with my rescue CD and managed to run
lilo so /dev/hda2 now boots up as the correct rootfs.

Unfortunately when I run vgscan I am getting an error message something like
(I don't have the exact message - I am copying the from this lists archives)


vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of
volume group "vg1" from physical volume(s)

I guess, I have left something behind on the old disk.

Is there a way out of this so I don't loose the data?   I can wire up the
old disk again if necessary but I am not sure what I did wrong the first
time so I might be just wasting my time.  So any help as to what to do would
be very welcome.

Thanks

--
Alan Chandler
Alan.Chandler@LogicaCMG.com



This e-mail and any attachment is for authorised use by the intended recipient(s) only.  It may contain proprietary material, confidential information and/or be subject to legal privilege.  It should not be copied, disclosed to, retained or used by, any other party.  If you are not an intended recipient then please promptly delete this e-mail and any attachment and all copies and inform the sender.  Thank you.
