Date: Wed, 5 Sep 2001 08:29:22 +0100
Subject: Re: [linux-lvm] physically swapping hdd with hda
Message-ID: <20010905082922.A398@btconnect.com>
References: <3B956D56.67E5F650@carolina.rr.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3B956D56.67E5F650@carolina.rr.com>; from jedgecombe@carolina.rr.com on Tue, Sep 04, 2001 at 08:09:58PM -0400
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

On Tue, Sep 04, 2001 at 08:09:58PM -0400, Jason Edgecombe wrote:
> hi all,
> 
>   I have RH 7.1 and I snagged kernel 2.4.9 from kernel.org with LVM-1.0
> and the reiserfs patches.
> 
> I have my system running which hdd as the root drive with /boot as ext2
> and an LVM / & /home reiserfs filesystems.
> 
> what do I need to do before/during/after I physically swap hda with hdd
> in the same PC?

Just run vgscan after the swap.  vgscan looks at all the devices
hunting for LVM labels, these labels contain unique id's for PV's.

- Joe
