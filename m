Date: Mon, 7 Feb 2000 10:37:19 +0100
From: Fabian.Herschel@suse.de
Subject: Re: [linux-lvm] Configuring boot partition with LVM
Message-ID: <20000207103719.A1170@suse.de>
References: <Pine.LNX.4.20.0002041218580.416-100000@claudius.mgmt-inc.com>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.20.0002041218580.416-100000@claudius.mgmt-inc.com>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

On Fri, Feb 04, 2000 at 12:29:34PM -0500, Jim Cain wrote:
> All,
> 
> Has anyone been successful in creating a completely LVM-managed system?
> Specifically, I'm wondering about the problem with needing LVM-enabled
> kernel on a boot floppy for installation purposes.

At this point of time lilo is not ready to boot a kernel fom a lv. Lilo
should also learn how to boot a kernel fom a striped volume...

Greetings
Fabian



> 
> Or is this not a good idea? Is it better to have a non-LVM root partition
> on a separate drive, and then use LVM for everything else?
> 
> Thanks for the input,
> Jim

-- 
-----------------------------------------------------------------------
Fabian Herschel                                 SuSE Rhein/Main AG     
Tel:    +49-6196-50951-23                       Mergenthalerallee 45-47
Fax:    +49-6196-409-607                        D-65760 Eschborn
mailto: Fabian.Herschel@suse.de                 http://www.suse.de      
