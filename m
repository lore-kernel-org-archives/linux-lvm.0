From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LV only detected when using "lvscan -D" on amd64 kernel
Message-ID: <20031027160955.M848@sistina.com>
References: <3F994F88.8030908@elitedvb.net> <20031025091006.I848@sistina.com> <3F9C0AC9.6050805@elitedvb.net> <20031027120104.K848@sistina.com> <3F9D327C.6020102@elitedvb.net>
Mime-Version: 1.0
In-Reply-To: <3F9D327C.6020102@elitedvb.net>; from tmbinc@elitedvb.net on Mon, Oct 27, 2003 at 03:58:04PM +0100
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
Date: Mon Oct 27 09:09:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Oct 27, 2003 at 03:58:04PM +0100, Felix Domke wrote:
> Hi,
> 
> >User space parses and passes it via ioctls to the kernel.
> >Please look at lvm.h for the ioctls defined and the structures involved.
> >Grep the LVM1 library source in tools/lib/ for "ioctl" to get you started.
> >  
> >
> Where exactly is the LV information passed to the kernel? is it 
> "LV_CREATE"?

Yes.

> 
> The kernel seems to don't know the LV, the LV_STATUS_BYINDEX on the 
> "/dev/fast/group" returns "No such device or address" (ENXIO) for each 
> index, including 0, which should be the LV in question.
> 
> It looks as "lvm_do_lv_status_byindex" in the kernel returns -ENXIO 
> because vg_ptr->lv[lv_status_byindex_req.lv_index] is zero. Where is the 
> point where this array is written? I only found LV_CREATE, but that's 
> only called in vgimport, vgmerge and lvcreate, so it looks as there is 

See lvm_do_vg_create() and lvm_do_lv_create() functions in the driver.

> another place.
> 
> 
> Can you point me in the direction?
> 
> 
> Felix
> 
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
