Subject: Re: [linux-lvm] LVM and devfs
From: Jord Tanner <jord@indygecko.com>
In-Reply-To: <20031214113328.74647.qmail@web13505.mail.yahoo.com>
References: <20031214113328.74647.qmail@web13505.mail.yahoo.com>
Message-Id: <1071510487.3227.4.camel@gecko.indygecko.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Mon Dec 15 11:49:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I believe your problem is that you need an initrd that includes LVM
stuff. Try the command "lvmcreate_initrd", then ensure that the new
lvm_initrd file is loaded with lilo (I use grub so I can't help you with
lilo). RH uses their own initrd, so you should be able to use the
existing lilo.conf as a guide. If you have an unusual setup you may have
to mount the initrd file, and edit it yourself. 

Jord Tanner



On Sun, 2003-12-14 at 03:33, Stuart Felenstein wrote:
> I didn't see a search option in the archives and I apologize if this
> is more appropriate to the devfs list.  I installed RedHat9 , and
> partitioned with DiskDruid using LVM.  The only partition that is not
> LVM is /boot.
> However I have now compiled kernel 2.4.23 with LVM and devfs and
> running into a problem with kernel panics.  I'm not sure if having LVM
> is causing the issue.  Even though I've tried many different append
> roots, looking at the working kernel in lilo.conf I see root =
> /dev/Volume00/LogVol01.  So I'm' wondering how I translate that to
> /dev/ide/host0..... .
>  
> Here is my current /etc/fstab: 
> /dev/Volume00/LogVol01           /                       ext3
> LABEL =/boot                          /boot                 ext3
> /dev/Volume00/LogVol02           /cache              ext3
> /dev/Volume00/LogVol03           /myth                ext3
> none                                       /proc                  proc
> none                                       /dev/shm            tmpfs
> /dev/Volume00/LogVol00          /swap                 swap
> /dev/cdrom
> 
> Greatly appreciate some help, pointers and / or links.
> Thank you,
> Stuart
-- 
Jord Tanner <jord@indygecko.com>
