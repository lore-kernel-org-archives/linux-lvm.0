From: Wolfgang Weisselberg <weissel@netcologne.de>
Subject: Re: [linux-lvm] You must specify a filesystem type error
Message-ID: <20011208154443.E4792@tiger.bigcats.invalid>
References: <3C115049.90403@kenamea.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3C115049.90403@kenamea.com>; from kenny@kenamea.com on Fri, Dec 07, 2001 at 03:27:05PM -0800
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
Date: Sat Dec  8 09:03:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi, Kenny!

Kenny Gorman (kenny@kenamea.com) wrote 33 lines:

> I am utilizing LVM snapshots, and every once in a while I get this 'you 
> must specify the filesystem type' error when trying to mount the volume:

> mount: you must specify the filesystem type

Mount could not mount the FS.  

> But it only happens once in a while.

So it's probably not an journalled FS (which needs a
kernel-patch for online snapshots).  What does the system
log say?  (dmesg, /var/log/messages or whereever)

> How can I rid myself of this 
> issue?  I am on SuSE Linux 7.2 (2.4.7-64GB-smp) with lvm 0.9.1 beta7.

You may want to upgrade your Kernel and LVM-Tools to 1.0.1...
No guarantee that the snapshots will be any better, though.

-Wolfgang
