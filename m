Received: from reti (vpn50-14.rdu.redhat.com [172.16.50.14])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i21DW1uq008757
	for <linux-lvm@redhat.com>; Mon, 1 Mar 2004 13:32:03 GMT
Received: from joe by reti with local (Exim 4.30)
	id 1AxnXE-0007ul-3N
	for linux-lvm@redhat.com; Mon, 01 Mar 2004 13:32:40 +0000
From: Joe Thornber <thornber@redhat.com>
Subject: Re: [linux-lvm] Snapshot validity
Message-ID: <20040301133239.GB28493@reti>
References: <LAW11-OE28DKBKhwWn500022e47@hotmail.com> <20040301132047.GA25377@redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040301132047.GA25377@redhat.com>
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Mon Mar  1 08:30:13 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Mon, Mar 01, 2004 at 02:20:47PM +0100, Heinz Mauelshagen wrote:
> 
> Sachin,
> 
> you can resize original logical volumes and their snapshots
> and they stay valid.

This scenario worries me:

- create a snapshot
- exceptions are triggered on the back half of the volume
- shrink volume to half its size
- use recovered space from back half for something else temporarily
- extend origin back to the old size

How does LVM1 deal with this ?

- Joe
