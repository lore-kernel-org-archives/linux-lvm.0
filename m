Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Thu, 28 Feb 2013 10:32:10 +0100
Message-ID: <0926B8B0C4D4424CAE1FCE69BD50CB2F0854C76E@s02008.neopost.grp>
In-Reply-To: <20130227181236.GG1514@agk.fab.redhat.com>
References: <0926B8B0C4D4424CAE1FCE69BD50CB2F0854C4EC@s02008.neopost.grp>
	<20130227181236.GG1514@agk.fab.redhat.com>
From: "MOLLE Thomas" <t.molle@neopost.com>
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
To: Alasdair G Kergon <agk@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

kernel: lvcreate: sending ioctl 1261 to a partition!
kernel: device-mapper: table: 252:8: raid: Unrecognised raid_type
kernel: device-mapper: ioctl: error adding target to table

I do not understand why the type is not recognized

>On Wed, Feb 27, 2013 at 05:45:02PM +0100, MOLLE Thomas wrote:
> # device-mapper: reload ioctl on failed: Invalid argument # Failed to 
> activate new LV.
> 
>Look in your kernel message log for a more detailed error message.
>
>Alasdair
