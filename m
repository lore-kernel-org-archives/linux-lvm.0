From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] How to grow a PV?
Message-ID: <20030612154434.A24004@sistina.com>
References: <3EE83C19.10805@maintech.de> <20030612121012.C26918@sistina.com> <3EE857C8.2050300@maintech.de> <3EE875FD.20900@maintech.de>
Mime-Version: 1.0
In-Reply-To: <3EE875FD.20900@maintech.de>; from thomas.kleffel@maintech.de on Thu, Jun 12, 2003 at 02:45:49PM +0200
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
Date: Thu Jun 12 08:58:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Jun 12, 2003 at 02:45:49PM +0200, Thomas Kleffel wrote:
> Hi again...
> 
> ...I'm sorry for having to ask again...

No problem.

> 
> Heinz J . Mauelshagen wrote:
> 
> > LVM2 supports PV resizing. 
> 
> I just installed 1.95.15 and pvresize tells me "Command not implemented 
> yet."
> "pvresize --version" gives me the following:
> 
>  > LVM version:       1.95.15 (2003-01-10)
>  > Library version:      0.96.08-ioctrl (2003-03-27)
>  > Driver version:      1.0.10
> 
> Did I fetch an old version? Or do I need to get some bleeding-edge-stuff 
> from the CVS?
> Or am I simply too stupid? :)

No, you need to use pvcreate+vgcfgrestore with LVM2.
Make a copy of your LVM metadata before you try it ;)
(dd if=/dev/md0 of=md0.vgda bs)1k count=4k)

> 
> Thanks for your help,
> 
> Thomas Kleffel
> 
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
