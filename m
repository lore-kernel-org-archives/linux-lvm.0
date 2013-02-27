Date: Wed, 27 Feb 2013 18:12:36 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20130227181236.GG1514@agk.fab.redhat.com>
References: <0926B8B0C4D4424CAE1FCE69BD50CB2F0854C4EC@s02008.neopost.grp>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0926B8B0C4D4424CAE1FCE69BD50CB2F0854C4EC@s02008.neopost.grp>
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
Content-Transfer-Encoding: 7bit
To: MOLLE Thomas <t.molle@neopost.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Feb 27, 2013 at 05:45:02PM +0100, MOLLE Thomas wrote:
> # device-mapper: reload ioctl on failed: Invalid argument
> # Failed to activate new LV.
 
Look in your kernel message log for a more detailed error message.

Alasdair
