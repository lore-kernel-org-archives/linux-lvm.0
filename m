From: Jose Luis Domingo Lopez <linux-lvm@24x7linux.com>
Subject: Re: [linux-lvm] [Q] patch to overcome 2TB block device limit?
Message-ID: <20030509194249.GB6189@localhost>
References: <b9fsao$k3s$1@main.gmane.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b9fsao$k3s$1@main.gmane.org>
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
Date: Fri May  9 14:42:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Friday, 09 May 2003, at 18:29:46 +0900,
A. S. wrote:

> Is there any kernel patches to exceed the 2TB kernel block device limit ?
> I want to be able to create about single 5TB LV.
> 
Yes, and it has been in mainline 2.5.x kernels for a while now. Do a
"make menuconfig" and under "Block devices" the last option is 
"[ ] Support for Large Block Devices". From the help:

  x CONFIG_LBD:                                                             x   
  x                                                                         x   
  x Say Y here if you want to attach large (bigger than 2TB) discs to       x   
  x your machine, or if you want to have a raid or loopback device          x   
  x bigger than 2TB.  Otherwise say N.                                      x

I don't know if it has been backported to 2.4.x, but seems reasonable.

Regards,

-- 
Jose Luis Domingo Lopez
Linux Registered User #189436     Debian Linux Sid (Linux 2.5.69)
