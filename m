From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Disk crash , LVM and ext2... (bis)
Message-ID: <20021004123352.A9010@sistina.com>
References: <3D90EBDA.5070605@free.fr> <20020925071843.GI1291@tykepenguin.com> <3D91674F.3040601@free.fr> <20020925075113.GK1291@tykepenguin.com> <3D98D656.2070904@free.fr> <3D99B6CC.30102@free.fr>
Mime-Version: 1.0
In-Reply-To: <3D99B6CC.30102@free.fr>; from emmanuel.varagnat@free.fr on Tue, Oct 01, 2002 at 04:53:00PM +0200
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
Date: Fri Oct  4 05:40:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Oct 01, 2002 at 04:53:00PM +0200, Emmanuel Varagnat wrote:
> Emmanuel Varagnat wrote:
> > I played a bit with that, and it looks like when device-mapper can't 
> > access a zone it returns zeros.
> > What I did, is to create an LV over 4 or 5 partitions, format it, zeroed 
> > the first partition, do a 'vgscan -P' and try to read the block device 
> > (LV raw data).
> > I supposed that this is the device-mapper that hide the missing 
> > informations by returning zeros. Is there a way to know (via ioctl for 
> > example) that a data is not available ?
> > For my program, I need to know, what is readable and what is not readable.
> > 
> 
> Do you think the LV_BMAP ioctl command could tell me if a block is 
> available or not into the LV ?
> Its purpose is to give the sector number and the drive of a logical 
> block, isn't it ?
> 
> What I want from the LVM is to tell me if data returned by a read 
> command can be trusted. If it returns me a lot of zeros is it because 
> the block is not available or because the block effectivly contains zeros.

We don't support zeroing of the data in the error case so far and do return
an io error to the application. Later we plan to as an option.

So today you get a read error if the block is not available and the data
is not zeroed in memory. No need to (ab)use LV_BMAP.

If your application needs to distinguish those cases anyways, you would want
to stay with 'io error returned'.

> 
> Thanks a lot.
> 
> -=( manu )=-
> 
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
