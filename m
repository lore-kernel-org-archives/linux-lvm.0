Return-Path: <joe@66bassett.freeserve.co.uk>
Date: Mon, 19 Mar 2001 09:15:14 +0000
From: Joe Thornber <joe@66bassett.freeserve.co.uk>
Subject: Re: [linux-lvm] Apparent performance degradation for each PV with striping
Message-ID: <20010319091514.A667@66bassett.freeserve.co.uk>
References: <3AB59501.FF6ED9F3@dataventures.com> <15029.41256.426234.309500@nv.192.168.71.6> <3AB5AFC0.5C4A58C9@dataventures.com>
Mime-Version: 1.0
In-Reply-To: <3AB5AFC0.5C4A58C9@dataventures.com>; from dlt@dataventures.com on Mon, Mar 19, 2001 at 12:05:36AM -0700
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Mar 19, 2001 at 12:05:36AM -0700, Donald Thompson wrote:
> I actually was thinking seriously about getting a 3ware card when I
> started this machine, but I wussed out and just went with the two onboard
> IDE interfaces. Its definately a cheaper option than replacing or adding
> SCSI drives to the system.

I did some striping tests at the weekend with a pair of IDE disks, I
managed to get 56 M/s read and 28M/s write (according to bonnie++).
These numbers are twice the performance of the slowest of the two IDE
drives, which is good.

- Joe
