Mime-Version: 1.0 (Apple Message framework v1085)
From: Brassow Jonathan <jbrassow@redhat.com>
In-Reply-To: <0926B8B0C4D4424CAE1FCE69BD50CB2F0854CA38@s02008.neopost.grp>
Date: Mon, 15 Apr 2013 16:16:17 -0500
Message-Id: <2EA00CB8-ABA8-4444-930E-C2CB29293FDA@redhat.com>
References: <0926B8B0C4D4424CAE1FCE69BD50CB2F0854C4EC@s02008.neopost.grp>
	<20130227181236.GG1514@agk.fab.redhat.com>
	<0926B8B0C4D4424CAE1FCE69BD50CB2F0854C76E@s02008.neopost.grp>
	<512F5A51.3000909@redhat.com>
	<0926B8B0C4D4424CAE1FCE69BD50CB2F0854CA38@s02008.neopost.grp>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] raid1 Failed to activate new LV
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Marian Csontos <mcsontos@redhat.com>


On Feb 28, 2013, at 7:59 AM, MOLLE Thomas wrote:

> "lvcreate -vvv --type raid1 -m 1 -L 557G -n lv0 vg0" returns about 2000
> rows.
> Do you know what I could look?
> 
> Kernel : 2.6.39-300.28.1.el6uek.x86_64
> # dmsetup targets
> raid             v1.0.0

there's your problem.

From latest kernel Documentation/device-mapper/dm-raid.txt:
Version History
---------------
1.0.0   Initial version.  Support for RAID 4/5/6
1.1.0   Added support for RAID 1


 brassow
