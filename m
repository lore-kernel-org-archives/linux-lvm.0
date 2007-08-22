Date: Wed, 22 Aug 2007 11:42:21 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] partitioning enterprise Linux 4 one or more
	partitions?
In-Reply-To: <1187786370.6318.14.camel@jfaubin.cnedom.cgi.com>
Message-ID: <Pine.LNX.4.44.0708221126290.17389-100000@bmsred.bmsi.com>
MIME-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: redhat-list@redhat.com

On Wed, 22 Aug 2007, Aubin, Jean-Francois wrote:

> RHEL 4 with ACL SELinux activated for more secure server, monitoring and
> backuping this server. 
> Swap partition with ext3
> /boot with ext3 partition
> / Root in a LVM partition for the rest of system files

I've done 6 or so el4 (actually centos) systems, and evolved to this, except
swap goes on LVM also.  You have only 2 old fashioned partitions: /boot and
LVM PV.  The only reason /boot is not in LVM is to play nice with rhel 
versions of grub.

For the last 3 I've added a new wrinkle which has greatly helped, although
it is not obvious why at first.  Install and boot el5, and run el4 in a xen
VM (with only 1 LV for system with boot and root).  This lets you do all kinds
of things to the VM without being physically present.  You can do fun things
like take a rw snapshot of the application VM, create a new VM, and apply an
upgrade to see if you like the result, all without disturbing the live
application system.  You can migrate the application VM to different hardware
with no fuss - apparently you can migrate it live while running, but I haven't
tried this yet.  The only glitch I've run into is that when you map a LV to a
xenblk (which is otherwise most convenient), you can't resize the LV for the VM
without rebooting the VM (which at least doesn't require rebooting the physical
machine).

If you can't afford both el4 and el5 license, maybe you could use
CentOS for one (not sure how RH would feel about that).  They
should offer a discount for that kind of setup, since it makes support
easier rather than harder.  Caveat: I haven't tried running Oracle
with multi-gigs of RAM in a VM.  My VMs are all 256-512M range.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
