From: Andreas Dilger <adilger@turbolabs.com>
Date: Thu, 4 Oct 2001 14:46:43 -0600
Subject: Re: [linux-lvm] pvcreate fails on a software RAID metadisk
Message-ID: <20011004144643.B31725@turbolinux.com>
References: <3BBC8B5B.1A484028@legis.state.ak.us> <3BBCBF87.5520C8F9@legis.state.ak.us>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3BBCBF87.5520C8F9@legis.state.ak.us>
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

On Oct 04, 2001  11:59 -0800, Bill Ellis wrote:
> Some more playing around led me to discover that 'lvmdiskscan' is also not
> recognizing my software RAID metadisks correctly.  Here's what I think are the
> relevant portions of the ~5600 lines of output from the 'lvmdiskscan -d -v'
> command:
> 
> <22> lvm_dir_cache_find -- CALLED with /dev/md7
> <333> pv_check_name -- CALLED with "/dev/md7"
> <4444> lvm_check_chars -- CALLED with name: "/dev/md7"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <4444> lvm_check_dev -- CALLED
> <55555> lvm_check_partitioned_dev -- CALLED
> <666666> lvm_get_device_type called
> <666666> lvm_get_device_type leaving with 2
> <55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE

This is a problem - MD devices are not partitioned.  Have a look at
this function to see why it thinks so.

> <4444> lvm_check_dev -- LEAVING with ret: 1
> <333> pv_check_name -- LEAVING with ret: 0
> <333> lvm_dir_cache -- CALLED
> <333> lvm_dir_cache -- LEAVING with ret: 50
> <22> lvm_dir_cache_find -- LEAVING with entry: 4

> <22> lvm_check_partitioned_dev -- CALLED
> <333> lvm_get_device_type called
> <333> lvm_get_device_type leaving with 2
> <22> lvm_check_partitioned_dev -- LEAVING with ret: TRUE

A pet peeve of mine - we shouldn't have to call this function twice
(probably we should assume that anything that is in the dir cache is
a valid device (and check devices one time when they are added)).

> <22> lvm_partition_count -- CALLED for 0x907
> <333> lvm_get_device_type called
> <333> lvm_get_device_type leaving with 2
> <22> lvm_partition_count -- LEAVING with ret: 16

I suspect this is just an artifact of the code thinking it is a partitioned
device.

Cheers, Andreas
--
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
