Message-ID: <38A6424C.F230E4C@geotec.net>
Date: Sat, 12 Feb 2000 23:34:04 -0600
From: mrharris <mrharris@geotec.net>
Reply-To: mrharris@geotec.net
MIME-Version: 1.0
Subject: Re: [linux-lvm] Configuring boot partition with LVM (fwd)
References: <38A1E06D.732A9B0@tkg.com>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux LVM mailing list <linux-lvm@msede.com>

As of AIX 4.3.3 you can dump to a mirrored device, you can also now
stripe and mirror with 4.3.3, a major improvement for production
systems.

Christopher Shaulis wrote:
> 
> As of AIX 4.3.3, you can't boot off of a striped logical volume,
> although you can have your boot partition mirrored on multiple physical
> volumes. All of the physical volumes with a copy of the boot lv must be
> in the boot list. Thats new as of AIX 4.2.0, although you need a couple
> APARs to have it work right at that version.
> 
> I can't remember exactly how they explained it, but IBM has a good
> reason for not allowing mirrored dump devices. I think the idea is that
> in order to catch the system dumping in the LVM code itself, you have to
> write the dump without the aid of the LVM. I think the way that works is
> that it precomputes a list of offset:extent lists for the device when it
> is brought online. If anyone really wants to know what goes on behind
> the scenes let me know -- I've got a couple colleagues that do AIX
> kernel development at IBM. You are allowed to have a secondary dump
> device but that only gets used if writing to the first device fails.
> 
> Christopher
> 
> From: Jens-Uwe Mager <jum@anubis.han.de>
> > At least the IBM people with the AIX LVM are able to make that
> > work. The only thing that they were not able for a long time is to
> > make system dumps work in such a configuration. But I believe that
> > even that works under AIX 4.3.x now.

-- 
Chaos, panic, & disorder - my work here is done.
