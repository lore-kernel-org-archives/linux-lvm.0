From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] LVM2 and whole disk booting
Message-ID: <20031124234610.Q16901@uk.sistina.com>
References: <000d01c3b159$0e603e60$100119ac@hydro>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000d01c3b159$0e603e60$100119ac@hydro>; from hydro@blueyonder.co.uk on Sun, Nov 23, 2003 at 12:30:54AM -0000
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
Date: Mon Nov 24 17:47:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Nov 23, 2003 at 12:30:54AM -0000, <hYdRo> wrote:
> I've noticed LVM2 PVs in a partition don't use the first sector, does
> this mean you can now put lilo in the first sector of a whole disk PV
> and boot from it?

New-style LVM2 PVs indeed store the LVM2 label in the second sector (1)
by default.  The sector used can be specified in the range 0-3 using
pvcreate --labelsector.  (The tools scan the first 4 sectors of
each device for an LVM2 label.)

So by default the first sector (0) is free for other uses such as booting.

Alasdair
-- 
agk@uk.sistina.com
