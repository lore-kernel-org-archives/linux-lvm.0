From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] Re: LVM writes on raw disk of ATA RAID Mirror
Message-ID: <20030430235827.A11394@uk.sistina.com>
References: <arechenberg@shermfin.com> <20030430193030.AF83AAE4F5@basilica.la.naos.co.nz>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030430193030.AF83AAE4F5@basilica.la.naos.co.nz>; from lvm@ewen.mcneill.gen.nz on Thu, May 01, 2003 at 07:30:30AM +1200
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
Date: Wed Apr 30 17:58:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, May 01, 2003 at 07:30:30AM +1200, Ewen McNeill wrote:
> I've been told that LVM 2 has some support where you can say what
> devices to scan (and what devices not to scan).  

LVM2 offers selection by device type (i.e. the names that appear in
/proc/devices giving block device major numbers) and regular-expression 
based selection by device name.

Alasdair
-- 
agk@uk.sistina.com
