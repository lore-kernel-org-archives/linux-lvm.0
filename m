Date: Thu, 9 Dec 2004 12:55:08 +0100
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Can't access LVM volume group after changing a
	non-LVM partition
Message-ID: <20041209115508.GA30928@redhat.com>
References: <b9a453c204120705542e927fac@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b9a453c204120705542e927fac@mail.gmail.com>
Reply-To: mauelshagen@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: =?iso-8859-1?Q?=D2scar_=C1lvarez?= Vilaplana <grimborg@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Dec 07, 2004 at 02:54:39PM +0100, �scar �lvarez Vilaplana wrote:
> Hi,
> 
> When I try to access my lvm group (for example, running vgdisplay) I
> get the following error:
>   Couldn't find device with uuid '5VBBLW-70Dj-fwjf-Xvzc-7VZr-icQa-l9XQ2N'.
>   Couldn't find all physical volumes for volume group data.
>   Couldn't find device with uuid '5VBBLW-70Dj-fwjf-Xvzc-7VZr-icQa-l9XQ2N'.
>   Couldn't find all physical volumes for volume group data.
>   Volume group "data" doesn't exist
> 
> It happened just right after I deleted a /dev/hda6 (a *non-lvm*
> partition) and created two partitions in the space that the deleted
> partition was occupying (/dev/hda6 and /dev/hda8) (my idea was to
> shrink /dev/hda6, and that did work).
> 
> Here's what the partition table looked before and after the change:
> 
> before:
>    Device Boot      Start         End      Blocks   Id  System
> /dev/hda1   *           1        1459    11719386   8e  Linux LVM
> /dev/hda2            1460        3891    19535040   83  Linux
> /dev/hda3            3892       14593    85963815    5  Extended
> /dev/hda5            3892        5107     9767488+  8e  Linux LVM
> /dev/hda6            5108       14225    73240303+  83  Linux
> /dev/hda7           14226       14471     1975963+  8e  Linux LVM
> /dev/hda8           14472       14593      979933+  82  Linux swap
> 
> after:
> /dev/hda1   *           1        1459    11719386   8e  Linux LVM
> /dev/hda2            1460        3891    19535040   83  Linux
> /dev/hda3            3892       14593    85963815    5  Extended
> /dev/hda5            3892        5107     9767488+  8e  Linux LVM
> /dev/hda6           11796       14225    19518943+  8e  Linux LVM
> /dev/hda7           14226       14471     1975963+  8e  Linux LVM
> /dev/hda8            5108       11795    53721328+  83  Linux
> 
> 
> I looked up (in /etc/lvm) the uuid lvm was complaining about and found
> out it corresponds to /dev/hda7. This seems odd, /dev/hda7 should not
> have been affected by the partition deleting & creation... its start
> and end cylinder remained the same throughout the process and there
> was no partition overlapping.
> 
> I thought maybe changing the uuid for /dev/hda7 in the /etc/lvm files,
> but I couldn't find how to get the correct uuid for /dev/hda7.
> 
> What course of action do you suggest? Is it possible to get the data back?

vgscan ; vgdisplay

> 
> Thanks a lot,
> Oscar.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
