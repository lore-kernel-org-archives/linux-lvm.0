Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id iA8ESBbM004491
	for <linux-lvm@redhat.com>; Mon, 8 Nov 2004 14:28:11 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CRAV9-00064p-1k
	for linux-lvm@redhat.com; Mon, 08 Nov 2004 14:28:11 +0000
Date: Mon, 8 Nov 2004 14:28:11 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Creating PV over a /dev/mapper device
Message-ID: <20041108142811.GH2717@agk.surrey.redhat.com>
References: <tk9so0di0jsl44dagc1dl8at6e9ld4r1be@4ax.com>
	<20041107192450.GF2717@agk.surrey.redhat.com>
	<3e4to0lgsvjoe6mqijohlh8558vbbb9uhj@4ax.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3e4to0lgsvjoe6mqijohlh8558vbbb9uhj@4ax.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, Nov 07, 2004 at 10:35:57PM +0100, Roman Medina-Heigl Hernandez wrote:
> First, thanks for your fast answer. I added the "device-mapper" type
> but it is still not working. Example:
 
    # List of pairs of additional acceptable block device types found 
    # in /proc/devices with maximum (non-zero) number of partitions.
    # types = [ "fd", "device-mapper", 16 ]

Firstly the line is commented out;
secondly make it:
  types = [ "device-mapper", 16 ]

You can run 'lvm dumpconfig' to check what settings have actually 
been read in from the config files.


> I've set-up lvm1 mode ('cause I read that it is more stable than lvm2)

Don't know where you read that but I'd strongly dispute it.

Alasdair
-- 
agk@redhat.com
