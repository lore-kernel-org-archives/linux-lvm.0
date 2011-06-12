Message-ID: <4DF48075.4070804@redhat.com>
Date: Sun, 12 Jun 2011 11:01:41 +0200
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
References: <4DF3EFD8.21200.145B56@mikes.kuentos.guam.net>
In-Reply-To: <4DF3EFD8.21200.145B56@mikes.kuentos.guam.net>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Question on LVM and Bare Metal Restore?
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

On 06/12/2011 12:44 AM, Michael D. Setzer II wrote:

> Backing up the regular partitions that contain an LVM has been 
> always been available, and backing up the whole disk image. 
> Recent versions have added the ability to backup the LVM dm 
> partitions as well. Backing up and restore works fine as long as 
> the LVM setup is already there, but it a disk completely fails one 
> would need to recreate the LVM before being able to restore it.

Recovery is very easy with LVM (once you find how to do that:-)

I suggest you read the LVM documentation, mainly
the section 6. LVM troubleshooting.

http://docs.redhat.com/docs/en-US/Red_Hat_Enterprise_Linux/6/html-single/Logical_Volume_Manager_Administration/index.html

All you need to recover LVM metadata is metadata backup
(automatically maintained in /etc/lvm or directory specified in lvm.conf)
and then something like
pvcreate -u <uuid> --restorefile <backup file> <PV> # only if PV header is lost!
vgcfgrestore -f <backup file> <VG>

Milan
