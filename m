Return-Path: <steve.wray@the.net.nz>
From: "Steve Wray" <steve.wray@the.net.nz>
Subject: RE: [linux-lvm] LILO configuration for LVM "boot" filesystem
Date: Fri, 8 Jun 2001 09:52:28 +1200
Message-ID: <NBBBKLKHMJHIJLHOGAOJGECDIPAA.steve.wray@the.net.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <3B1FF416.F804129@wrkhors.com>
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
To: linux-lvm@sistina.com

> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of Steven Lembark
> 
> > Tell me, what is wrong with having /tmp as a mount point
> > for a LV?
> 
> LV are generally slower than other types of storage.  Since the
> boot partition is generally cyl 0 it's on the fastest storage
> available (short of tmpfs).  

Proportionally, how much slower is it? 50%? 25%? 12%? 
less than 1% slower?
Does it really matter?


> 
> Another approach is to mirror-mount the /var/tmp and /tmp onto
> a single volume.
