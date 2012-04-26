Date: Thu, 26 Apr 2012 15:43:15 -0400
From: Brian McCullough <bdmc@bdmcc-us.com>
Message-ID: <20120426194315.GA2873@bdmcc-us.com>
References: <20120424132419.GA2244@bdmcc-us.com>
	<20120426145811.GA3329@bdmcc-us.com> <4F997C15.6090300@redhat.com>
	<20120426172338.GA1355@bdmcc-us.com> <4F998A2C.6030909@redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4F998A2C.6030909@redhat.com>
Subject: Re: [linux-lvm] Missing PV
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
To: Milan Broz <mbroz@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Apr 26, 2012 at 07:47:24PM +0200, Milan Broz wrote:
> 
> Are you sure that VM see that second qcow file content? I don't think so.

You are right.

dmesg shows that the "drive" is found and accessable to the system.

HOWEVER, no partitions.  Or more properly, no partition table!   ????

Confirmed by fdisk.


I then did a dd of the first 512K of that disk, and then ran strings on
it.  When I did that, I saw strings like "GRUB," "Hard Disk" and such
fairly early in the file.

I also saw "LVM2," which I know is the beginning of LVM2 meta-data.  I
can see a nice block of at least two different revisions of LVM2
meta-data on this drive. ( I stopped looking there. )


I tried a tool know I know of called "testdisk," which attempts to
recover partition tables, and it wasn't able to help.  Odd.


Still looking.


B
