Date: Thu, 29 Jun 2000 12:49:36 +0200
From: "Andi Kleen" <ak@suse.de>
Subject: Re: [linux-lvm] Re: IBM to release LVM Technology to the Linux
Message-ID: <20000629124936.A23629@gruyere.muc.suse.de>
References: <B45465FD9C23D21193E90000F8D0F3DF6834FF@mailsrv.linkvest.ch>
Mime-Version: 1.0
In-Reply-To: <B45465FD9C23D21193E90000F8D0F3DF6834FF@mailsrv.linkvest.ch>; from Jean-Eric.Cuendet@linkvest.com on Thu, Jun 29, 2000 at 07:32:29AM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean-Eric Cuendet <Jean-Eric.Cuendet@linkvest.com>
Cc: linux-lvm@msede.com

On Thu, Jun 29, 2000 at 07:32:29AM +0200, Jean-Eric Cuendet wrote:
> 
> > Another thing to consider is that the LVMS Architecture is really a
> > framework.  It doesn't do much by itself.  The vast majority of the
> > functionality of an LVMS based on this architecture lies in 
> > the plug-in
> > modules that are loaded.  This is what allows this 
> 
> Where stands the VFS layer? Behind LVMS? Or is it just a plugin for LVMS? Or
> is it replaced?

VFS is above file systems, LVM/block devices are below.

The layering is roughly like this

        System calls  / NFS server 
                   VFS
                 Filesystems          (sometimes bypassed)
             Generic Page Cache       (sometimes bypassed)  
     	     LVM / Raid / LVMS
                 elevator 
     IDE driver / HW RAID driver / SCSI drivers 



 

-Andi
