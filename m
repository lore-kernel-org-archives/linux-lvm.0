Subject: Re: [linux-lvm] lvm2 debian packages
Message-ID: <20020515161719.GA20704@ntlworld.com>
References: <20020508011851.GA2587@chunk.voxel.net> <20020513161418.GA12207@ntlworld.com> <20020514024053.GA26951@chunk.voxel.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020514024053.GA26951@chunk.voxel.net>
From: Andy Baillie <andrew.baillie@ntlworld.com>
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
Date: Wed May 15 11:14:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Much better,

a blank install, utilising an ext2 root partition now only needs the
device-mapper patch to be bootable, once DM is in the main tree then
I won't be running custom kernels at last!

The only other issue outstanding is that the vgscan process uses
/var/lock if this directory does not exist when the vgscan occurs
then the scan fails. Though I mount /var as an lvm partition I have
created /var/lock from root and this seems to work fine. I havn't
found any problems with that yet.

Initial testing shows it appears robust and it looks like my new server
gets to go into service soon!

Regards
Andy

On Mon, May 13, 2002 at 10:40:53PM -0400, Andres Salomon wrote:
> Try the newer packages (-3), they fix these issues.
> 
> 
> On Mon, May 13, 2002 at 05:14:18PM +0100, Andy Baillie wrote:
> > 
> > On Tue, May 07, 2002 at 09:18:51PM -0400, Andres Salomon wrote:
> > > For debian users who are interested in testing out LVM2, debian packages
> > > are now in unstable (apt-get install lvm2).  They've been successfully
> > > built for all 10 architectures; I'm especially interested in reports from
> > > people trying out lvm2 on non-x86 archs.
> > > 
> > > 
> > I have tried building a new system with LVM2 and was not able to get it
> > to boot from an ext2 ram disk, after ensuring the additional dm-mod
> > module was included and demanded in. Is there a standard boot procedure
> > builder yet? Is libdevmapper needed at boot time as its normal home is
> > in /usr/lib rather than /lib?
> > 
> > I then left root as a standard ext2 partition and made some of the basic
> > directories - tmp, usr and var into lvm'd partitions. The system wouldnt
> > recognise vgs at first as /var was only a mount point, I had to create
> > the /var/lock dir for vgscan and vgchange to work. Then the boot script
> > /etc/init.d/lvm2 failed as it uses things like awk which are in /usr/lib
> > I was able to manually go back and mount the missing partitions in
> > maintainance mode so its almost there...
> > 
> > Hope this is of use
> > Regards
-- 
            ---  ===  ~~~  Lands of Stone ~~~ === ---
UK Mudders, too lagged to the States? then have you considered 
 http://www.landsofstone.org/   telnet://mud.landsofstone.org:4801
            ---  ===  ~~~  Lands of Stone ~~~ === ---
