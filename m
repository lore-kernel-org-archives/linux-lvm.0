Message-ID: <3FAA4566.7090304@webhackande.se>
From: Rickard Olsson <richie@webhackande.se>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Can I dd one disc of a lv
References: <20031106130748.A15981@wagener.nu> <3FAA3C95.8010708@webhackande.se> <20031106134246.A16570@wagener.nu> <3FAA42D1.3080102@webhackande.se> <20031106135231.A1157@wagener.nu>
In-Reply-To: <20031106135231.A1157@wagener.nu>
Content-Transfer-Encoding: 7bit
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
Date: Thu Nov  6 07:00:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Tobias Wagener wrote:

> After I switched the new disc to the "hdX" of the old one? 

Yes. You can remove the old disk after the dd_rescue is done.

> Or in which way knows the lvm to use the new disc?

I believe vgcfgrestore does that. If you don't want to (or can't) move 
the disks around, check the -o option.

If you want to, you can use the LVM2 pvcreate instead, to create the new 
disk with the PVUUID from the old one. pvdisplay /dev/olddisk tells you 
the ID.

    / Rickard Olsson,IT-Konsult/
   / Telefon: +46 70 635 01 42/
  / http://www.webhackande.se/
