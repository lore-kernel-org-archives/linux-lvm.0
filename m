From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] How do I do RAID 4/5 *and* LVM?
Message-ID: <20020522103014.A9107@sistina.com>
References: <3CEA6695.4000100@uci.edu> <Pine.LNX.4.44.0205210827230.29039-100000@koa.knief.net>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.44.0205210827230.29039-100000@koa.knief.net>; from herman@knief.net on Tue, May 21, 2002 at 08:29:41AM -0700
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
Date: Wed May 22 03:34:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, May 21, 2002 at 08:29:41AM -0700, Herman L. Knief wrote:
> Yes, create the RAID (MD) device, then layer LVM on top... Now, depeneding
> on your requirements, you may not need LVM (do you want/need snapshots,
> etc?)

Well, LVM makes a lot of sense in case he changes his mind to go with a single
partition later. In that case LVM plus fs shrinkers give him much more
flexible options he doesn't have with MD alone.

> 
> Also, how are you connecting these disks?  How many IDE ports are you
> using?  I would recommend against any sort of master/slave setup, as
> you'll have difficulties with failure detection and won't get the best
> throughput.
> 
>  - Herman
> 
> On Tue, 21 May 2002, Dave Newman wrote:
> 
> ->Hi --
> ->
> ->I have four 160 GB IDE disks, and wanted to install software RAID 4/5
> ->*and* LVM, and wanted to ask a couple of brief questions:
> ->
> ->a) Do I need LVM if I want to see a single partition (or can RAID do
> ->this for me)?
> ->
> ->b) Do I first install RAID, then LVM?  Are there any difficulties with
> ->these installs?  (I have already successfully done LVM on its own)
> ->
> ->c) Are there any reasons why I shouldn't use both RAID and LVM?
> ->
> ->Thanks in advance,
> ->Dave
> ->
> ->
> ->
> ->_______________________________________________
> ->linux-lvm mailing list
> ->linux-lvm@sistina.com
> ->http://lists.sistina.com/mailman/listinfo/linux-lvm
> ->read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> ->
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
