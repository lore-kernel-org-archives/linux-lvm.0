From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Lost a full volume group!
Message-ID: <20030313123949.A6905@sistina.com>
References: <20030312170112.GA19864@es.ehas.org>
Mime-Version: 1.0
In-Reply-To: <20030312170112.GA19864@es.ehas.org>; from rodrigo@es.ehas.org on Wed, Mar 12, 2003 at 06:01:12PM +0100
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
Date: Thu Mar 13 05:41:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Rodrigo,

somthing must have corrupted your LVM metadata on /dev/hda4.
Can't be LVM because there's no mention of any changes to the PV in /dev/hda4.

Don't try to change your VGs before we figured out what went wrong!

Did you run vgck and what did it tell you about your VGs ?
Does pvscan still show _all_ you PVs ?


On Wed, Mar 12, 2003 at 06:01:12PM +0100, Rodrigo de Salazar wrote:
> Hi there, I hope someone can help me with this. I had a VG with a single
> PV (/dev/hda4), with several LVs in it (including the ones I use as /var, /var/www and
> /tmp). I changed /etc/fstab, after resizing and adding a 
> LV to the other VG I have (on another hdd). Reboot, and I find out that
> I had not written fstab correctly, no big deal, just correct it in
> single user mode and reboot again. Weird thing comes now: the first VG
> (called vg1) has dissapeared. The /dev/vg1 directory and everything
> inside have just vanished, vgscan says:
> 
> 	vgscan -- found inactive volume group "vg1"
> 
> and any attempt to vgchange -a y /dev/vg1 results in:
> 
> 	vgchange -- ERROR "Bad address" activating volume group "vg1"
> 
> So, is there a way to recover this VG and all the LVs in it, or will I
> have to restore the system by another method (I lost /var...)?
> Also, is this very unusual, or LVM is just not so stable?
> I am running Debian GNU/Linux, kernel 2.4.20, and lvm 1.0.4.
> Thanks in advance.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

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
