Message-ID: <38398B9C.85D2E779@mchp.siemens.de>
Date: Mon, 22 Nov 1999 19:29:48 +0100
From: Gerhard Fuernkranz <gerhard.fuernkranz@mchp.siemens.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Q: active/inactive/imported/exported group ?
References: <199911221628.RAA25600@u9etz.ez-darmstadt.telekom.de>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: mauelsha@u9etz.ez-darmstadt.telekom.de
Cc: mge@u9etz.ez-darmstadt.telekom.de, linux-lvm@msede.com

mauelsha@u9etz.ez-darmstadt.telekom.de wrote:

> > Assume I have a group g1 with volume v1 and a group g2 with
> > volume v2. Now I turn off the machine, remove g1's physical
> > disks and power on the machine again. Does this mean, that
> > vgscan may assign a *different* minor number to v2 after the
> > reboot?
> 
> Yes.
> But that's only a local resource for sure.

That's what I was afraid of.
The problem is the following:
The NFS server identifies files by a file handle,
which also contains the major/minor number of the
disk, where the exported filesystem resides.
Assume there is a NFS server, which exports a filesystem
residing on a LVM volume. There also exist NFS clients,
which have hard-mounted this filesystem.
If the NFS server crashes and reboots, then the clients
should hang on NFS calls while the server is down, but
should resume normal operation once the server is back
(w/o umounting and re-mounting the FS!). But this only
works, if the volumes get the same minor device number
after the reboot in order that the old filehandle still
references the same file on the same device.

So I think there's also the reqirement for a "sticky"
minor device number for volumes (or at least for a specific
subset of volumes). VxVM also has recognized this and
provides a method to assign minor device numbers to volumes.

Do you have an idea, how I could integrate such a
feature into LVM? My 1st idea was the following:

- I have a table e.g. /etc/lvm_minors, which contains
  {volume_name, minor_number} pairs for all sticky
  volumes

- Change vgscan to do the following:
     ...
     for (all volumes of the group) {
        ...
        if (entry for volume exists in /etc/lvm_minors) {
            if (minor number from lvm_minors already in use
                for a different volume)
            {
                fail, print an error message and skip this volume
            }
            else {
               assign the minor number from /etc/lvm_minors
               to the volume
            }
        }
        else {
            assign a free minor number to this volume
            similar as it currently does
        }
        ...
     }

Any comments?


> I want to achive this by keeping a UUID of the VG owning sytem in the VGDA.

The question is: What is the "owning" system?
Is it the system which has imported the group?
Or the system which has activated the group at last?

> IMO we would need a cluster manager to take care of mastership of
> shared resources.

I currently don't want to use "real" shared resources, which
are configured at more than one host at the same time.

I'll guarantee, that only one host at a time will activate
a specific group. If a host crashes, I'll guarantee, that the
crashed host is actually down and stays down (of course it
may reboot, but it won't re-activate the volume after the reboot
automatically).

...
> But in this case a crashing host is not able to release the VG anyway.
> So there must be a --force option to gain ownership of such a VG
> _and_ the sure knowlegde that the crashed system is down _and_ stays down.
> If not so there could be tricky races where the original 'owner' system
> of our VG would try to regain ownership.

Currently I won't care very much about such race conditions as I'll
only bring the group online on one host at a time automatically.
I'd rather see the ownership only as additional security feature in
order that the sysadmin cannot accidently activate the same
group at the same time on a different host.

Gerhard
