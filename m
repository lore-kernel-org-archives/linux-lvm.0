From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] PV Status NOT available
Message-ID: <20030210143353.A5958@sistina.com>
References: <000801c2d0e8$91e8d320$0d01a8c0@aphrodite>
Mime-Version: 1.0
In-Reply-To: <000801c2d0e8$91e8d320$0d01a8c0@aphrodite>; from rupert.hair@ntlworld.com on Mon, Feb 10, 2003 at 09:41:18AM -0000
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
Date: Mon Feb 10 07:38:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Rupert,

do all 3 PVs show up active (the [] following 'PV:' should contain 'AA'
unless you set a PV to inallocatable) in /proc/lvm/global ?

if so pvdisplay (pv_status in the library respectively) doesn't seem
to get the PV_ACTIVE status from the kernel correctly.


On Mon, Feb 10, 2003 at 09:41:18AM -0000, Rupert Hair wrote:
> Hi Everyone.
> 
> I have a rather strange 'problem' with my LVM setup.  I am using a very
> standard install of Redhat 8.0 (Kernel 2.4.18-14smp (I guess the "-14smp" is
> some Redhat version number.)) with LVM version 1.0.3(19/02/2002).  I used
> the Redhat installer to create a single VG (datavg) and LV (datalv) made up
> of 3 PVs (hdd5 hdd6 hdd7 (Yes all three PVs are on the same disk as this is
> just a test setup.)).  This all went fine and the installer created an ext3
> filesystem on top of the LV.  I have put some data on the filesystem and
> rebooted a few times to test it out and everything works great.
> 
> Now the 'problem': two of my PVs (hdd5 hdd7) have a status of "NOT
> available" (reported by pvdisplay).  This is very strange as the whole setup
> seems to work fine and all three PVs are on the same disk (which is working
> fine).  I have attached various files which are the outputs of some of the
> LVM utilities that seemed useful.
> 
> I would be very grateful if anyone could shed any light on this problem and
> what I have done wrong.
> 
> Thanks.
> Rupert

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
