From: Jims <theman@chaj.com>
In-Reply-To: <E1711Hq-00019X-00@hermes.sistina.com>
Message-Id: <Pine.LNX.4.33.0204261221060.302-100000@x.firesites.com>
MIME-Version: 1.0
Subject: [linux-lvm] Re: LVM Woes
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
Date: Fri Apr 26 11:23:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: mauelshagen@sistina.com

Thanks for the suggestion. When I try it, here is what I get...

/sbin/vgcfgrestore -n world -o /dev/sdd1 /dev/hda2
vgcfgrestore -- ERROR "vg_write(): open" storing VGDA of "world" on disks

Am I supposed to do something to the new disk other than creating an LVM
partition on it ?

Jims

On Fri, 26 Apr 2002 linux-lvm-request@sistina.com wrote:

> Date: Thu, 25 Apr 2002 12:05:18 +0200
> From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] Lvm woes
> Reply-To: linux-lvm@sistina.com
>
>
> Jims,
>
> you hit one of the tradeofs of LVM1: binary metadata backup formats.
> Therefore we have text formated ones in LVM2.
>
> "Well, that doesn't help me", I hear you say.
>
> So the help story goes:
>
> - stay with your 0.9 version
>
> - comment out the "if ( pv_get_size ( pv_name, NULL) != vg.pv[index]->pv_size) "
>   which should be starting arround line 321 in vgcfgrestore.c
>
> - generate and install the LVM software
>
> - retry to vgcfgrestore to hdd1 as you did before
>
> - vgscan;vgchange -ay world
>
> - upgrade to LVM 1.0.3 is recommended afterwards
>
> Please tell me, how that goes.
>
> Regards,
> Heinz    -- The LVM Guy --
