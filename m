Date: Tue, 9 Oct 2001 11:30:48 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Removing a SCSI device
Message-ID: <20011009113048.C25020@sistina.com>
References: <01100817152901.01127@lagothrix>
Mime-Version: 1.0
In-Reply-To: <01100817152901.01127@lagothrix>; from mwebster@ntlworld.com on Mon, Oct 08, 2001 at 05:15:29PM +0000
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

Martin,

LVMs vgscan should happily find your VG in that changed configuration again
and "vgchange -ay" will activate it afterwards.
BTW: there's no need to change the SCSI id of HD 1.

Regards,
Heinz    -- The LVM Guy --

On Mon, Oct 08, 2001 at 05:15:29PM +0000, Martin Webster wrote:
> I want to remove an internal Zip drive (SCSI ID#2) to make way for a DVD 
> drive. However, I have two SCSI drives set-up with LVM as follows and realise 
> that removing the Zip drive will cause a number of problems. Here's my 
> current configuration:
> 
> sda Hard disk 0 (boot) - ID#0
> sdb Zip disk - ID#1
> sdc Hard disk 1 - ID#2
> cdrecorder - ID#6
> 
> / (root) is /dev/sdc5 (reiserfs)
> /boot is /dev/sda5 (ext2)
> swap is /dev/sda6
> Everything else is on the LVM spanning two physical volumes: one logical 
> volume.
> 
> And here's what I plan to do:
> 
> 1. Unplug the Zip drive and change SCSI ID of Hard disk 1 to ID#1
> 2. Boot system into single user mode: linux S root=/dev/sdb5
> 3. Remount root filesystem and /boot as read/write: 
> mount -n -o remount, rw /
> mount -n -o remount, rw /boot
> 4. Edit /etc/lilo.conf and change instances of "sdc " to "sdb"
> 5. Run mk_initrd followed by LILO:
> mk_initrd && /sbin/lilo
> 6. Re-boot
> 
> What I am uncertain of is whether this approach will work with LVM. Can any 
> one advise?
> 
> BTW, I'm using SuSE 7.2 Professional.
> 
> TIA,
> 
> M
> -- 
> Martin Webster <mwebster@ntlworld.com>
> Registered Linux User #230322
> http://homepage.ntlworld.com/spider-monkey/
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
