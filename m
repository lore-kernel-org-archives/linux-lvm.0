Date: Thu, 27 Apr 2000 19:32:27 +0200
From: "Andi Kleen" <ak@suse.de>
Subject: Re: [linux-lvm] Protection of used scsi disks by LVM
Message-ID: <20000427193227.A3507@gruyere.muc.suse.de>
References: <DCBFB8E1BD8BD311A94D00A0C9CA44EA0CCCE1@mail.store-age.com>
Mime-Version: 1.0
In-Reply-To: <DCBFB8E1BD8BD311A94D00A0C9CA44EA0CCCE1@mail.store-age.com>; from SVichik@store-age.com on Thu, Apr 27, 2000 at 03:52:47PM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sergey Vichik <SVichik@store-age.com>
Cc: "'linux-lvm@msede.com'" <linux-lvm@msede.com>

On Thu, Apr 27, 2000 at 03:52:47PM +0200, Sergey Vichik wrote:
> 
> Hello,
> 
> I have a question : 
> Why does LVM not protect the scsi devices which are used for volumes ?
> 
> I can easily go to /dev/sda1 for example, and erase everything on it.
> 
> Of course it is a stupid thing to do, but there is a minimal requirement on
> protection, isn't it ?

<as folklore says:>

Unix/Linux doesn't stop you (=root) from doing stupid things, because
that would stop you from doing clever things.


-Andi
