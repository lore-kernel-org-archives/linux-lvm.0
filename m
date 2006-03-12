Date: Sun, 12 Mar 2006 21:24:09 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] simultaneous use of different versions of lvm
Message-ID: <20060312212409.GH25317@agk.surrey.redhat.com>
References: <20060312200405.GC8421@tui.site>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20060312200405.GC8421@tui.site>
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
To: Gunther Clasen <gunther_clasen@arcor.de>
Cc: linux-lvm@redhat.com

On Sun, Mar 12, 2006 at 08:04:05PM +0000, Gunther Clasen wrote:
> created a VG on a PV which lies completely above the 128GiB limit? 

Create it with metadata in lvm2 format: -M2 rather than -M1.

Alasdair
-- 
agk@redhat.com
