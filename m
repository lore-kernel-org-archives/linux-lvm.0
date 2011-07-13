Date: Wed, 13 Jul 2011 19:47:31 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20110713184731.GY7857@agk-dp.fab.redhat.com>
References: <4E1A526F.9090700@tlinx.org>
	<20110711025811.GF7857@agk-dp.fab.redhat.com>
	<4E1D77A7.4030801@tlinx.org>
	<alpine.LRH.2.00.1107131137130.28748@bmsred.bmsi.com>
	<20110713161141.GX7857@agk-dp.fab.redhat.com>
	<0A03EDA0F33C5C428BFFF019C40D609E9D3AE24268@SCMBXC01.bcbad.state.sc.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0A03EDA0F33C5C428BFFF019C40D609E9D3AE24268@SCMBXC01.bcbad.state.sc.us>
Subject: Re: [linux-lvm] Inconsistent naming...?
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
To: "Males, Jess" <jmales@cio.sc.gov>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Jul 13, 2011 at 01:34:15PM -0400, Males, Jess wrote:
> That works, but it's not exactly convenient.
> [root@system ~]# dmsetup splitname /dev/mapper/tempvg-lvspare1

It's not expecting the /dev/mapper prefix there.

It's used here:
  11-dm-lvm.rules:IMPORT{program}="$env{DM_SBIN_PATH}/dmsetup splitname --nameprefixes --noheadings --rows $env{DM_NAME}"

Obviously we can patch it to understand the '/dev/mapper' prefix and other
things.

Alasdair
