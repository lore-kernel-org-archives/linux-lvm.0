From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] locate module /dev/nb
Message-ID: <20030716210439.A31999@sistina.com>
References: <200307151253.h6FCrqUY012089@ruby.ridersoft.net>
Mime-Version: 1.0
In-Reply-To: <200307151253.h6FCrqUY012089@ruby.ridersoft.net>; from lvm@ridersoft.net on Tue, Jul 15, 2003 at 02:53:52PM +0200
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
Date: Wed Jul 16 14:07:06 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

This is caused by the vgscan run you mention, which scans
for all LVM supported devices triggering the kernel module loader to
load a module for /dev/nb.

The message can be safely ignored.

On Tue, Jul 15, 2003 at 02:53:52PM +0200, lvm@ridersoft.net wrote:
> I have just done a fresh install of gentoo. And then converted the root system to LVM. 
> 
> But now every time I run vgscan, it insists on politly telling me that
> 
> modprobe /dev/nb could not be found
> 
> Or a similair statement concerning /dev/vg. Now vg is my volume group. But nb is nowhere even mentioned by me. Does anyone know what this means.
> 
> The system seems to work fine tough.


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
