From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Volume groups on SAN storage
Message-ID: <20040213142829.GA10943@redhat.com>
References: <402CD9D6.5CAAA796@gmx.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <402CD9D6.5CAAA796@gmx.net>
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Fri Feb 13 09:28:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com
Cc: hjm@redhat.com

Thomas,

sounds odd that your storage system exposes more than one device
to access the same data.

Anyway: the only way to avoid accesses to SCSI devices you don't want to be used
by LVM1 is to move their device nodes out of /dev
(eg, mkdir /dev/.SAV; mv /dev/sdc2 to /dev/.SAV) and rerun vgscan afterwards.

FYI: with LVM2, youd can set up device name filters to avoid accesses
     to devices.

Regards,
Heinz    -- The LVM Guy --


On Fri, Feb 13, 2004 at 03:06:14PM +0100, Thomas Meller wrote:
> Hello everybody,
> 
> recently (today) I had a problem.
> 
> I'm trying to create a HA Cluster for a DCE server.
> This is difficult work and sometimes very confusing.
> 
> My goal is to make it bootable from a SAN.
> So far I managed to install GRUB and boot the machine. The rootfs and the rest can be
> mounted.
> I found, then, that the SCSI-devices inside one of my volume groups were the wrong ones.
> 
> What is special about that is that the same content on a device can be seen on different
> SCSI-devices. This is due to some mirroring within the storage sytems. I cannot avoid that.
> 
> Now, I have a readonly physical volume inside one of my volume groups. I want to insert the
> writeable mirror and get rid of the readonly.
> AFAICS this is not possible because I cannot force vgscan to insert a specified SCSI-device.
> Of course the VGDA is marked "part of VG xxx" and cannot be written anymore. So it cannot be
> imported nor exported or added to a new VG.
> 
> Maybe there is an option anywhere how to scan a particular device. 
> 
> Does anybody know how to trick LVM?
> Is there a hexeditor to patch the VGDA backups to use different /dev/sdXX devices?
> And if so, does that help?
> 
> I'm using redhat 8.0 and I'm bound to that version.
> 
> TIA
> 
> Thomas
> 
> -- 
> Thomas Meller
> mailto: thomas.meller@t-systems.ch
> mailto: thomas.meller@gmx.net
> ----
> ...Our continuing mission: To seek out knowledge of C, to explore strange
> UNIX commands, and to boldly code where no one has had a man page before.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat, Inc.
Consulting Development Engineer                   Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
