Date: Thu, 8 Jun 2000 12:11:20 +0200
From: Jan Niehusmann <jan@gondor.com>
Subject: Re: [linux-lvm] Reliability
Message-ID: <20000608121120.A2855@gondor.com>
References: <20000607194335.B17473@hmsysv.t-online.de> <200006080031.CAA16192@e35.marxmeier.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200006080031.CAA16192@e35.marxmeier.com>; from mike@msede.com on Thu, Jun 08, 2000 at 02:31:19AM +0000
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Marxmeier <mike@msede.com>
Cc: Mauelshagen@Sistina.com, linux-lvm@msede.com

On Thu, Jun 08, 2000 at 02:31:19AM +0000, Michael Marxmeier wrote:
> As far as i can see Quorum support looks like the saner option:
> If you loose a disk and only restore the partition table and VGDA
> the replacement disk still mostly contains garbage (eg. not a fs).

That, and it may be usefull to be able to say: I know something is
wrong, but I need some files _now_, so please give me everything 
you have and don't wait until I mounted and initialized a new drive.

Perhaps damaged VGs should be read only, at least by default, to prevent
further damage. 

I was really worried when LVM didn't start with a corrupted partition
table: The PV on that disk was actually empty (perhaps a LV on it,
but no data) as I only added it to try out ext2 resizing without risking
the other partitons.

Jan
