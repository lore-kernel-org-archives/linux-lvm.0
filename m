Date: Tue, 21 Dec 2004 20:17:24 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] [PATCH] cannot create PV on empty drive
Message-ID: <20041221201724.GP26670@agk.surrey.redhat.com>
References: <41C1C572.15958.1B62373@localhost>
	<20041218194256.GH26670@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20041218194256.GH26670@agk.surrey.redhat.com>
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
To: Jerome Borsboom <j.borsboom@erasmusmc.nl>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, Dec 18, 2004 at 07:42:56PM +0000, Alasdair G Kergon wrote:
> Do you have verbose output from the failing pvcreate with '-vvvv'?
> (or debug-log-to-file output)
 
I still don't know how to reproduce this.

Meanwhile, I'm checking in a patch based on yours.

Alasdair
-- 
agk@redhat.com
