From: Denie Andriessen <D.Andriessen@pink.nl>
Subject: Re: [linux-lvm] help with redhat install
Message-Id: <002b01c1cb3e$519fc2c0$f707a182@gimmie.tudelft.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <200203140409.g2E49OY06946@blok14b.gimmie.tudelft.nl>
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
Date: Thu Mar 14 03:58:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi

sounds like you need to recompile the kernel with the LVM support in it..

Denie

----- Original Message ----- 
From: "Ed Jackson" <ej_external@bigfoot.com>
To: <linux-lvm@sistina.com>
Sent: Thursday, March 14, 2002 5:03 AM
Subject: [linux-lvm] help with redhat install


> I'm trying to install and use LVM on my redhat - but I'm having 
> difficulties getting started.
> 
> When I install all of those RPMs with gnorpm, and try to run the wrapped 
> shell scripts for anything to do with LVM (like pvcreate) I get an error 
> message stating:
> 
> -------------- sample message --------------
> vgcreate
> lvmiopversion -- LVM driver/module not loaded?
> 
> vgcreate: /lib/lvm-iop not found.  Is lvm-iop installed?
> -----------------------------------------------
> 
