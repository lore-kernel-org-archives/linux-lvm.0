Date: Tue, 7 Aug 2007 22:03:59 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20070807210359.GA2064@agk.fab.redhat.com>
References: <46B0EAEF.6090305@cfl.rr.com>
	<20070802065012.GA28687@percy.comedia.it>
	<46B1B5E1.1050406@redhat.com> <46B251BB.1010004@cfl.rr.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <46B251BB.1010004@cfl.rr.com>
Subject: [linux-lvm] Re: [dm-devel] Re: LVM on dmraid breakage
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
To: device-mapper development <dm-devel@redhat.com>, "ATARAID (eg, Promise Fasttrak,
	Highpoint 370) related discussions" <ataraid-list@redhat.com>, linux-lvm@redhat.com

On Thu, Aug 02, 2007 at 05:50:51PM -0400, Phillip Susi wrote:
> The problem is that lvm is looking at the physical disks at all.  It 
> needs to scan the dmraid device, not the underlying disks.
 
Indeed.  Please send the evidence showing where it is going wrong so
we can fix it.

Alasdair
-- 
agk@redhat.com
