From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Max. devices supported in LVM.
Message-ID: <20021113105042.A29263@sistina.com>
References: <BEB8A0E46889D31188CB002048406D7008CE5959@lsv-msg03.stortek.com>
Mime-Version: 1.0
In-Reply-To: <BEB8A0E46889D31188CB002048406D7008CE5959@lsv-msg03.stortek.com>; from GovinT@LOUISVILLE.STORTEK.COM on Tue, Nov 12, 2002 at 03:26:10PM -0700
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
Date: Wed Nov 13 03:56:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Nov 12, 2002 at 03:26:10PM -0700, Govindan, Thiru wrote:
> Hi,
> 
>             What are the max. number of devices that can be supported in
> LVM. Can I add as many devices as possible ?? what is the limiting factor ?.
> Also what are the max. VGs and volumes that can be created.

With LVM1, a grand total of 256 VGs+LVs are supported, because of fixed major
device numbers used. IOW: you can have up to 256 LVs in just 1 VG or up
to 256 VGs with 1 LV each (not that usefull ;)

LVM2 will remove that constraint in Linux 2.5 by using dynamic major numbers
shortly. In Linux 2.5 that constraint will disapear anyway soon.

> 
>  
> 
> Thanks,
> 
> Govindan
> 

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
