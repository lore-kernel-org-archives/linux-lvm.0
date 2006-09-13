Date: Wed, 13 Sep 2006 23:18:41 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Oops and BUG in dm-snapshot
Message-ID: <20060913221840.GU13859@agk.surrey.redhat.com>
References: <44D3D04B.5060603@dgreaves.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <44D3D04B.5060603@dgreaves.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Greaves <david@dgreaves.com>
Cc: "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>, LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Aug 04, 2006 at 11:55:07PM +0100, David Greaves wrote:
> EIP is at exit_exception_table+0x36/0x5f [dm_snapshot]

http://bugzilla.kernel.org/show_bug.cgi?id=7040

Here's a patch for this to test:
http://www.kernel.org/pub/linux/kernel/people/agk/patches/2.6/editing/dm-snapshot-fix-freeing-pending-exception.patch
(depending on your kernel, to apply it you may require earlier snapshot patches
listed in the series file in the same directory)

Alasdair
-- 
agk@redhat.com
