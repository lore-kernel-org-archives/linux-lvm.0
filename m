From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] System hang during boot
Message-ID: <20021105134037.A27825@sistina.com>
References: <20021103012651.42052.qmail@web9607.mail.yahoo.com>
Mime-Version: 1.0
In-Reply-To: <20021103012651.42052.qmail@web9607.mail.yahoo.com>; from bill_oconnor@yahoo.com on Sat, Nov 02, 2002 at 05:26:51PM -0800
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
Date: Tue Nov  5 06:45:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Nov 02, 2002 at 05:26:51PM -0800, Bill OConnor wrote:
> Hello,
> 
> I'm running SuSE 8.0 on a PC.
> 
> I tried to build and install Xine which hung my
> machine when I ran it.  Unpon reboot my machine does a
> 
> check root for LVM activation
> rmount for vgscan
> Scanning for LVM volume groups
> 
> and then hangs never to return.  I assume Xine
> corrupted something but what.  I can get to the files
> with a rescue disk but what do I rescue and how?

Before you change anything, you want to save copies of your LVM on-disk 
metadata (i.e. "dd if=/dev/PV of=PV.vgda bs=1k count=4k"; do that in
sequence replacing "PV" by your actual devices used as physical volumes).

For the next steps, I assume that you _don't_ have root on a logical volume
and do have the (same) LVM software accessable on your rescue device as on
the broken system.

Mount the regular root filesystem somewhere read-only and save the output
files from the dd-runs above _and_ all automatically taken metadata copies
in */etc/lvmconf/* on some seperate (external) media.

fsck the root filesystem and remount it read-write.

chroot to that mounted regular root, "strace vgscan" and report, where it
hangs (if it does again).

With that let's decide how to procede further (crossing fingers
that no data got destroyed). Next step will likely be vgcfgrestore(8).

> 
> thanks
> 
> __________________________________________________
> Do you Yahoo!?
> HotJobs - Search new jobs daily now
> http://hotjobs.yahoo.com/
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
