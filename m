Date: Sat, 24 Jul 2010 00:13:02 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20100723231302.GP19063@agk-dp.fab.redhat.com>
References: <4C4A0D33.20100@storix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4C4A0D33.20100@storix.com>
Subject: Re: [linux-lvm] Detecting active/inactive volume groups
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
Content-Transfer-Encoding: 7bit
To: Keegan Quinn <kquinn@storix.com>
Cc: linux-lvm@redhat.com

The concept of 'active' (or 'available') and 'inactive' in respect of Volume
Groups has been removed.  Under the LVM1 architecture it made sense - VG
metadata was cached in-kernel - but with device-mapper it doesn't - the kernel
doesn't know anything about VGs, only LVs.

Do your detection at the LV level instead.

Alasdair
