From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] lvm2: VG data differs between PVs /dev/hda3 and /dev/hdg3
Message-ID: <20030303130619.A11845@uk.sistina.com>
References: <20030302150724.GB745@gallifrey>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030302150724.GB745@gallifrey>; from gilbertd@treblig.org on Sun, Mar 02, 2003 at 03:07:24PM +0000
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
Date: Mon Mar  3 07:07:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gilbertd@treblig.org
Cc: linux-lvm@sistina.com

On Sun, Mar 02, 2003 at 03:07:24PM +0000, Dr. David Alan Gilbert wrote:
> Below I've included the output of a few commands from the working 
> lvm1 installation - more info available as required.

So I can find the seg fault, please send me full diagnostic output 
from the failing 'pvs' command:
e.g. add to config file:
    log {
            file="/tmp/lvm2.log"
	    level=7
    }
Run the failing 'pvs' command then send lvm2.log.

For the other problem, a copy of how LVM2 interprets the 
metadata might help:
  vgcfgbackup -P -f <outputfile>

And also you can use LVM1's 'pvdata' with various flags 
to see how LVM1 interprets the same on-disk metadata:
  e.g. pvdata -a -v /dev/hda1

Alasdair
-- 
agk@uk.sistina.com
