Return-Path: <raheesom@navpoint.com>
Message-Id: <200104252032.f3PKWY005110@west.navpoint.com>
Subject: Re: [linux-lvm] I need to convert my root file system to LVM
	(adding a 2nd disk as well).
From: Rupert Heesom <raheesom@navpoint.com>
In-Reply-To: <20010425083538.B806@tykepenguin.com>
References: <200104241645.f3OGjE001662@west.navpoint.com> 
	<20010425083538.B806@tykepenguin.com>
Date: 25 Apr 2001 11:24:42 -0400
Mime-Version: 1.0
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

On 25 Apr 2001 08:35:38 +0100, Patrick Caulfield wrote:
> On Tue, Apr 24, 2001 at 11:39:02AM -0400, Rupert Heesom wrote:
> 
> Yes you should be able to do that. Follow the instructions in the HOWTO
> (without shrinking the main disk obviously!) substituting hdb1 for hda4.
> 
> When you've got it working you can then make a PV on sda5 and 
> pvmove hdb1 back onto it if you want to keep root on the SCSI disk.
> 
> If you're not very familiar with LVM I recommend you have a play with it on the
> new disk before attempting to convert the root filesystem though.

Thanks, Patrick.    Yes, I think I'll have a play with it on the 2nd
disk.  I'm not very familiar at all with LVM.


-- 
regs
rupert
