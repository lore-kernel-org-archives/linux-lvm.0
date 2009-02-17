Message-ID: <499A9C88.4060100@redhat.com>
Date: Tue, 17 Feb 2009 11:16:24 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] File system size difference betwen lvdisplay & df -h
References: <9d1973c20902170225m7e0f87d2ydda7622a2c0dccf7@mail.gmail.com>	
	<499A96CD.20808@redhat.com>
	<9d1973c20902170305h14bfb304h84f839f5ac301b03@mail.gmail.com>
In-Reply-To: <9d1973c20902170305h14bfb304h84f839f5ac301b03@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Reply-To: bmr@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dayanand Math <dmmath@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Dayanand Math wrote:
> Hi,
> 
> The following df -h & lvdisplay shows the discrpancy..What could be
> the reson? I am referring to the discrepancy between LV Size in
> lvdisplay &  total size df -h output of the corresponding file
> system.

That just appears to be normal file system overheads. All file systems
use some of the total space available on a device for storing internal
structures and data (the file system's metadata). You'll see this with
any block device type, e.g. with a 64M USB key:

# df -h /mnt
Filesystem            Size  Used Avail Use% Mounted on
/dev/sdc1              61M  5.3M   53M  10% /mnt

Regards,
Bryn.
