Subject: Re: [linux-lvm] snapshots+highmem+'md raid5'
Mime-Version: 1.0 (Apple Message framework v552)
From: "Dale J. Stephenson" <dalestephenson@mac.com>
Content-Transfer-Encoding: 7bit
In-Reply-To: <20030612134151.C26917@sistina.com>
Message-Id: <C4AA99FA-9DE1-11D7-B4BB-0003937830E4@mac.com>
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
Date: Fri Jun 13 15:59:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

On Thursday, June 12, 2003, at 07:41  AM, Heinz J . Mauelshagen wrote:

>
> Anyone out there using MD RAID5 as physical volumes, high memory 
> enabled
> (> 960m of physical memory) and snapshots under load successfully ?
>
It depends on your definition of successful.  I'm using 2.4.18 with 
HIGHMEM and RAID 5 physical volumes, (and my chaining snapshot patch).  
Existing snapshots seem to work OK under load, but I have trouble 
creating the snapshots under load consistently.  My problems are with 
xfs_fs_freeze(), xfs's fsync_dev_lockfs implementation.

I have similar problems with 2.4.19.  I've run with 2.4.20, but not 
under load.  Haven't tried 2.4.21 yet.

Dale J. Stephenson
dalestephenson@mac.com
