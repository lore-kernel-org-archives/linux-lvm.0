Message-ID: <4C74FED0.5000603@redhat.com>
Date: Wed, 25 Aug 2010 13:30:24 +0200
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
References: <loom.20100825T100856-592@post.gmane.org>
In-Reply-To: <loom.20100825T100856-592@post.gmane.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Can't remove snapshot at first
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Alexander Skwar <alexanders.mailinglists+nospam@gmail.com>

On 08/25/2010 10:12 AM, Alexander Skwar wrote:
> I noticed, that rather often, I'm unable to remove an unused
> snapshot volume at first command execution. See this:
> 
> --($ ~)-- sudo /sbin/lvremove /dev/Sys/Home-Backup_Snapshot 
>   Can't remove open logical volume "Home-Backup_Snapshot"
> 
> --($ ~)-- sudo /sbin/lvremove /dev/Sys/Home-Backup_Snapshot 
> Do you really want to remove active logical volume Home-Backup_Snapshot? [y/n]: 
> 
> Between those two commands, I did not do anything at all! I ran the
> commands directly after each other in like 5 seconds or so.

I t is possible that udev run some async scan in reaction to even (during snap manipulation).

Distro maintainers should probably update lvm udev rules
(and possibly udisks rules etc) to work relieably.

Upstream lvm2 with combination of recent udev and udisks package
should have this fixed (hopefully).

Milan
