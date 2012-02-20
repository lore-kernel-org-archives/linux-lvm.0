Date: Mon, 20 Feb 2012 16:09:40 +0100
From: Spelic <spelic@shiftmail.org>
In-reply-to: <20120220135103.GB27388@redhat.com>
Message-id: <4F426234.1020704@shiftmail.org>
MIME-version: 1.0
Content-transfer-encoding: 7bit
References: <4F405E1B.5030609@shiftmail.org>
	<20120220135103.GB27388@redhat.com>
Subject: Re: [linux-lvm] DM / LVM hangs if snapshot present on kernel v3.0.3
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: Mike Snitzer <snitzer@redhat.com>
Cc: device-mapper development <dm-devel@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>, linux-lvm@redhat.com

On 02/20/12 14:51, Mike Snitzer wrote:
> I've never seen this. Which distro are you using?

Ubuntu 11.04  64-bit but with vanilla 3.0.3 kernel

Ubuntu's lvm:
# lvm version
   LVM version:     2.02.66(2) (2010-05-20)
   Library version: 1.02.48 (2010-05-20)

> The "Snapshot cow pairing for exception table handover failed" is the 
> error path most commonly associated with the snapshot-merge feature. 
> Are you using snapshot-merge for the root LV (e.g. lvconvert --merge 
> ...)? Mike 

Absolutely not, never merged a snapshot in my life, and also the root of 
the host was *not* on LVM.

Here is some more info:

Host machine had 2 PV, 2 VG (each of 1 PV), only one LV had only one 
snapshot, more specifically:

PV1 (a MD raid) --> VG1 --> 5 x LVs used for virtual machines disks; of 
these, only one LV had one snapshot. No other snapshots. None of these 
volumes were mounted on the host. This is where the problem happened.
PV2 (a MD raid) --> VG2 --> 1 x LV , I don't remember if this was 
mounted on the host at that time or was a disk for a virtual machine, 
but anyway was not the root filesystem of the host. No snapshots here.

Root filesystem of the host was definitely *not* on LVM.

Unfortunately the machine where it happened is a production machine and 
it's too dangerous to try to reproduce it there; this weekend I tried to 
reproduce it elsewhere but clearly it didn't happen. I had a stack trace 
of the DM hang but I lost it, stupid me...
