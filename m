From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Question on VG activation
Message-ID: <20030523123645.C24103@sistina.com>
References: <099901c31fac$c0722d50$fc6a6d0a@corp.int.digex.com>
Mime-Version: 1.0
In-Reply-To: <099901c31fac$c0722d50$fc6a6d0a@corp.int.digex.com>; from vze2sjj7@verizon.net on Wed, May 21, 2003 at 11:22:11AM -0400
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
Date: Fri May 23 05:46:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, May 21, 2003 at 11:22:11AM -0400, Anastasios A. Papadopoulos Tas" wrote:
> What is the best way to have LVM auto-activate the VG's on bootup?

Put "vgchange -ay" into your pre-fsmount startup script (if your distributor
didn't do it for you already).

If your HW-configuration changes (e.g. new disk drives), you need
to run vgscan as well (in case of LVM2 tools, you eant to check, if your
device name filters are still ok in /etc/lvm/lvm.conf).

^
> 
> Tas Papadopoulos


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
