From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Recovery of a damaged striped volume
Message-ID: <20011109101639.A19131@sistina.com>
References: <001c01c168a3$9b172db0$0222a8c0@tux>
Mime-Version: 1.0
In-Reply-To: <001c01c168a3$9b172db0$0222a8c0@tux>; from plasma@pealpjpain.net on Thu, Nov 08, 2001 at 11:20:42PM +0100
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
Date: Fri Nov  9 03:20:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Philipp,

presuming that just the first sectors have been wiped out, your option
is to run vgcfgrestore(8) on the wiped disk, the vgscan + "vgchange -ay".

See the vgcfgrestore(8) manual page for details, please.

Regards,
Heinz    -- The LVM Guy --



On Thu, Nov 08, 2001 at 11:20:42PM +0100, Philipp wrote:
> Hello Folks!
> 
> My system consists of two brand new IBM Deskstar HDs with 60 GB each,
> connected to a Promise Ultra100 card, the rest of the system doesn't matter
> so far ... these two discs are joined together in a striped volume group.
> 
> I've got in some trouble: This week I wanted to reinstall the basic linux
> system. During this process I noticed some mysterious behaviour of one of
> the system discs, and so decided to check and clean that disc with the IBM
> 'Drive Fitness Test' program. But the darn thing ignored my choice and
> whiped out the first few sectors of one of the data discs.
> 
> The question: is it possible to restore the striped volume? Or more
> detailed: if I simply repeat the same steps I did when I build up the volume
> (write partition table, create pv's and vg, ...) so that the data on the
> discs is left untouched, will my ReiserFS on that volume be able to restore
> itself? Or is all the data on the discs  when I initialize them as 'physical
> volume'?
> 
> Many thanks in advance, and please someone help me out of that ... because
> I've got no backups so far :-(
> 
> Greetings >>>> Philipp
> 
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
