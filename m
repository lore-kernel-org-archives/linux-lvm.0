Date: Thu, 26 Oct 2000 23:37:07 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: [linux-lvm] Re: LVM snapshotting broken?
Message-ID: <20001026233707.A12201@srv.t-online.de>
Reply-To: Mauelshagen@sistina.com
References: <Pine.LNX.4.21.0010261632440.15696-100000@duckman.distro.conectiva>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.21.0010261632440.15696-100000@duckman.distro.conectiva>; from riel@conectiva.com.br on Thu, Oct 26, 2000 at 04:36:37PM -0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rik van Riel <riel@conectiva.com.br>
Cc: linux-kernel@vger.kernel.org, linux-lvm@msede.com, mge@sistina.com


Hi Rik,

I can't reproduce it on my box.

Could you provide a "lvcreate -d" output of what you did to help
me to dig into that one.

Did somebody else out there face the same 0.8final snapshot weirdness?


On Thu, Oct 26, 2000 at 04:36:37PM -0200, Rik van Riel wrote:
> Hi Heinz,
> 
> it looks like the LVM snapshotting in 2.4 doesn't allow you
> to create snapshots from anything else than the _first_ LV
> in the VG...
> 
> I have run both the following command lines (after lvremoving
> snap1, of course) and both of them give as a result that the
> LV /dev/test_vg/swap ends up being the snapshotted filesystem ;(
> 
> # lvcreate -s -L100 -nsnap1 /dev/test_vg/test
> # lvcreate -s -L100 -nsnap1 /dev/test_vg/swap
> 
> # cat /proc/lvm
> LVM driver version 0.8final  (15/02/2000)
> 
> 	<snip VG/PV info>
> 
>     LVs: [AWDL  ] swap            122880 /30       1x open
>          [AWDL  ] test            204800 /50       1x open
>          [ARDL  ] snap1           122880 /30       close
> 
> It looks like somewhere in either the utilities or the
> kernel, the argument of which LV to snapshot gets mangled...
> Oh, I'm using version 0.8final of the LVM utities.
> 
> regards,
> 
> Rik
> --
> "What you're running that piece of shit Gnome?!?!"
>        -- Miguel de Icaza, UKUUG 2000
> 
> http://www.conectiva.com/		http://www.surriel.com/

-- 

Regards,
Heinz      -- The LVM guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Bartningstr. 12
                                                  64289 Darmstadt
                                                  Germany
Mauelshagen@Sistina.com                           +49 6151 7103 86
                                                       FAX 7103 96
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
