Return-Path: <thornber@btconnect.com>
Date: Fri, 20 Jul 2001 16:34:30 +0100
Subject: Re: [linux-lvm] 2 LVM questions
Message-ID: <20010720163430.B538@btconnect.com>
References: <200107201334.QAA26563@easymail.hol.gr>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200107201334.QAA26563@easymail.hol.gr>; from moka@hol.gr on Fri, Jul 20, 2001 at 04:34:15PM +0300
From: Joe Thornber <thornber@btconnect.com>
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

On Fri, Jul 20, 2001 at 04:34:15PM +0300, moka@hol.gr wrote:
> 
> Hi there, new to LVM, so I would appreciate if you can 
> point me to answers to these questions:

First off, if you're new to LVM do not be tempted to try and run root
off an LV.

> 1) I have a system with 3 hard disks, and only one of 
> them is presently used. This contains boot, root and 
> swap plus a logical  partition(not LVM) containing
> /var and /home.
> 
> I have big database tables, so I would like
>  to create one volume group consisting of the 2
>  unused disks plus the /var. Is this possible
>  without losing what is in /var?

I suggest you create a volume group from the 2 spare disks.

create an lv big enough for var

format it and copy var into it and adjust /etc/fstab accordingly

at this point the old var can be added to the vg with vgextend,
however I would keep it around for a while until you are sure you have
set things up correctly.

> 2) The reason I need  a lot of space is that mysql
>   which I am using stores the database tables in /var.
>  Can I somehow "name" the volume group /var
>   so that mysql will not be confused?

mount the logical volume on /var

- Joe
