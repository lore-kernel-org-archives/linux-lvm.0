From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Help: LVM on top of SW RAID0+1
Message-ID: <20030318100926.C30525@sistina.com>
References: <Pine.LNX.4.53.0303121824410.2531@light.webcon.net> <3E70411C.AC385DAD@silicide.dk> <140150000.1047758272@[192.168.200.4]> <20030315223816.GB16976@gw.silicide.dk> <20030316194809.A9464@uk.sistina.com>
Mime-Version: 1.0
In-Reply-To: <20030316194809.A9464@uk.sistina.com>; from agk@uk.sistina.com on Sun, Mar 16, 2003 at 07:48:09PM +0000
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
Date: Tue Mar 18 03:12:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Mar 16, 2003 at 07:48:09PM +0000, Alasdair G Kergon wrote:
> On Sat, Mar 15, 2003 at 11:38:16PM +0100, jon+lvm@silicide.dk wrote:
> > You cant resize striped LV's. (AFAIR).
> 
> Unless you upgrade to LVM2.

Well,
LVM1 limits a stripe to a PV. So growing a striped LV is limited by
the PV size. The only way to grow a striped LV in LVM1 in case one of
its stripes hits the PV size is to pvmove the stripe to a larger PV.

LVM2 doesn't have such constraint any longer :)

>  
> Alasdair
> -- 
> agk@uk.sistina.com
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
