From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: [linux-lvm] vgscan errors
Message-Id: <20020308021214.I1566@turbolinux.com>
References: <3C83AD42.20301@theiqgroup.com>
    <20020305002428.B13751@sistina.com> <3C85289C.8060606@theiqgroup.com>
    <20020305223226.A19035@sistina.com> <3C854B93.2060402@theiqgroup.com>
    <3C87A0A3.8080605@theiqgroup.com> <20020308094454.C519@sistina.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020308094454.C519@sistina.com>
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
Date: Fri Mar  8 03:12:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mar 08, 2002  09:44 +0100, Heinz J . Mauelshagen wrote:
> On Thu, Mar 07, 2002 at 11:17:23AM -0600, Kelly Corbin wrote:
> > OK, now I have another problem.  I got vgscan to run fine now off of my 
> > boot CD, but now the system fails the vgscan on boot (/ is an LVM) with 
> > an 'ERROR 28 writing volume group backup file /etc/...'
> > 
> > I'm assuming this is because the initrd created by lvmcreate_initrd is 
> > not big enough to accomodate the metadata backup.
> 
> Exactly.
> 
> > What size is this 
> > generally (lvmcreate_initrd says it calculates this automatically) and 
> > to what size should I set this manually to get this to work?  How much 
> > space do I need for the backups during vgscan?
> 
> Calculate your given initrd size plus your /etc/lvconf/* backup sizes
> you need to store in the initrd once vgscan is run
> and change the INITRDSIZE to that number in kilobytes + 1MB.

I think a lot of people have this same problem (not enough free space in
initrd).  Can't we just disable backups somehow?  It's the initrd after
all, so it's not like the backups are useful.  Alternately, it is better
to just fix the script to have more leeway in the INITRDSIZE in the
first place.

Cheers, Andreas
--
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
