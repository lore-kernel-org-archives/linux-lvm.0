From: "B. J. Zolp" <bjzolp@wisc.edu>
Subject: Re: [linux-lvm] restoration of LVM setup?
In-reply-to: <20030312132252.A1259@sistina.com>
Message-id: <200303120924.23057.bjzolp@wisc.edu>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-disposition: inline
References: <200303111936.24376.novafire@novafett.com>
 <20030312132252.A1259@sistina.com>
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
Date: Wed Mar 12 09:27:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I am currently using Mandrake 9.0, sso if I ever installed 9.0+ I should be 
able to see the VG with little problems.  BTW, is the metadata stored on each 
one of the partitions in the VG?  What if one of the drives in the VG died?  
Is the VG easially recoverable and will it still run? (minus the data lost on 
the down drive of course)..

Thanks for the help

bjz


On Wednesday 12 March 2003 06:22, Heinz J . Mauelshagen wrote:
> On Tue, Mar 11, 2003 at 07:36:24PM -0600, Nova FIre wrote:
> > 	I am thinking about setting up LVM on my file server and would like to
> > know how easy it is to re-setup a LVM layout if I install a new distro.  
> > A few times I have had one of the OS drives fail on me which required a
> > fresh install of linux on a new drive.  But since all my file storage
> > drives were just single ext3 partitions I could mount them and the file
> > server was back up in no time with no loss of important data.
> >
> > 	How easy is it to do the same thing with a LVM setup?
>
> Presumably the new distro has LVM in, it is a question of
> scanning in the LVM metadata (vgscan) and activating the VG(s) (vgchange
> -ay).
>
> Depending on the distro's upgrade support that works for basic filesystems
> on LVs (/usr, /opt, ...) as well.
>
> > bjz
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
