Return-Path: <torsten@pclab.ifg.uni-kiel.de>
From: Torsten Landschoff <torsten@pclab.ifg.uni-kiel.de>
Date: Mon, 7 May 2001 13:58:47 +0200
Subject: Re: [linux-lvm] LVM export
Message-ID: <20010507135847.A1469@pclab.ifg.uni-kiel.de>
References: <3AF68126.93ACCE81@lanzenberg.at> <20010507134024.A26477@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010507134024.A26477@sistina.com>; from Mauelshagen@sistina.com on Mon, May 07, 2001 at 01:40:24PM +0000
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

On Mon, May 07, 2001 at 01:40:24PM +0000, Heinz J. Mauelshagen wrote:
 
> There's a hack to reactivate it in case you still have a valid VGDA backup,
> but let me first understand what your actual problem is, before we can decide
> to try that.

I guess he tried to move a disk to a new one by exporting the volume
group, moving the data onto the new disk and importing that one. I guess
the solution would be to import the volume group from the old disk 
(assuming the data is still available on it) and using pvcreate, 
vgextend and pvmove to get the data on the new disk, the use vgreduce
to remove the pv of the old disk and remove it from the system.

Greetings

	Torsten
