Subject: Re: [linux-lvm] ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of volume group "vg1" from physical volume(s)
References: <87wutolm26.fsf@papadoc.bayour.com>
	<20020529105556.C31380@sistina.com>
From: Turbo Fredriksson <turbo@bayour.com>
In-Reply-To: <20020529105556.C31380@sistina.com>
Message-ID: <87y9e3f6ya.fsf@papadoc.bayour.com>
MIME-Version: 1.0
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
Date: Wed May 29 07:57:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>>>>> "Heinz" == Heinz J Mauelshagen <mauelshagen@sistina.com> writes:

    Heinz> Which LVM (tools+driver) version?

[papadoc.pts/1]$ vgdisplay --version
vgdisplay: Logical Volume Manager 1.0.3
Heinz Mauelshagen, Sistina Software  19/02/2002 (IOP 10)
[papadoc.pts/1]$ uname -a
Linux papadoc 2.4.17-xfs1.0.2-lvm1.0.3-pptpmasq2 #1 SMP Mon Mar 11 10:09:32 CET 2002 i686 unknown

    Heinz> What exactly happened before vgscan failed?

I had plugged in two new harddisks, but from what I can tell, ID's AFTER
the last pv disk/partition...

I did accidently boot it up with a new disk IN BETWEEN a PV, and that gave some
errors... I noticed this, and moved the two new disks to a higher ID...
-- 
Saddam Hussein Ft. Meade munitions FBI Albanian terrorist Panama spy
iodine cracking Cocaine Soviet bomb genetic quiche
[See http://www.aclu.org/echelonwatch/index.html for more about this]
