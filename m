Subject: Re: [linux-lvm] LVM Read/Write speed <10% drive's normal speed
From: "Bryn M. Reeves" <bmr@redhat.com>
In-Reply-To: <1253137773.5136.357.camel@hamerst1-ll1>
References: <1253137773.5136.357.camel@hamerst1-ll1>
Date: Thu, 17 Sep 2009 11:21:42 +0100
Message-Id: <1253182902.30299.34.camel@breeves.fab.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: Stephen.Hamer@jhuapl.edu, LVM general discussion and development <linux-lvm@redhat.com>
Cc: xen-users@lists.xensource.com

On Wed, 2009-09-16 at 21:49 +0000, Stephen Hamer wrote:
> Hello all,
> 
> I've been searching through the archives and the internet for a while
> now, and can't seem to find anything that helps me out. I hope you
> don't my posting this to both xen-users and linux-lvm simultaneously,
> but i figured it'd help keep the solution in one place... even though
> it'll be the same across two places... Anyways:
> 
> My setup is this:
>         Xen 3.3 hypervisor (from the ubuntu repositories)
>         Ubuntu 9.04 server
>         Kernel and module listed here:
> http://www.infohit.net/blog/post/running-xen-on-ubuntu-intrepid-and-jaunty.html
> 
> The dom0 and domUs in my Xen setup are all Ubuntu 9.04, using that
> kernel. (I'm not sure if the kernel has something to do with it, so i
> included it just in case.) All the domUs are set up to use LVM. The
> dom0 uses a straight ext3 fs on /dev/sda1. The domUs use ext3 fs's
> within LVMs (using LVM2) set up on /dev/sda5.

What is the configuration of the guest's storage? I.e. what type of virt
driver are you using to expose the dom0 storage to the domUs? This can
have a massive impact on the performance levels you can achieve.

You should also test the performance of these underlying devices in the
domUs - i.e. benchmark read (and if possible write) performance of
the /dev/sd*, /dev/hd* or /dev/xvd* devices seen in domU (or whatever
other type of virtual disks you are using).

Regards,
Bryn.
