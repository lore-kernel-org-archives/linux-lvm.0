Date: Thu, 22 Sep 2011 12:27:26 +0200 (CEST)
From: Lukas Czerner <lczerner@redhat.com>
In-Reply-To: <4E7B077F.7030307@redhat.com>
Message-ID: <alpine.LFD.2.00.1109221219410.4968@dhcp-27-109.brq.redhat.com>
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
	<1316623554-28975-2-git-send-email-lczerner@redhat.com>
	<20110921185901.GB6760@yahoo.fr>
	<alpine.LFD.2.00.1109221057550.4968@dhcp-27-109.brq.redhat.com>
	<4E7B077F.7030307@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] [PATCH 01/35] fsadm: Add "create" command
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: Lukas Czerner <lczerner@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 22 Sep 2011, Zdenek Kabelac wrote:

> Dne 22.9.2011 11:28, Lukas Czerner napsal(a):
> > On Wed, 21 Sep 2011, Stephane Chazelas wrote:
> > 
> >> 2011-09-21 18:45:20 +0200, Lukas Czerner:
> >>> Create command provides the functionality of creating a new logical
> >>> volumes including defined file system.
> >>>
> >>> This commit also changes the way how are commands recognised an
> >>> executed. The new approach is more suitable for bigger number of
> >>> commands.
> >>
> >> There are so many shell scripting bad practices in there that I
> >> thought I had to reply.
> > 
> > Great, that's what I need, Thanks!
> > 
> >>
>  So above:
> >>
> >> TOOL=$(basename -- "$0")
> >>
> >>>  
> >>>  _SAVEPATH=$PATH
> >>
> >> Why would you need to save $PATH?
> > 
> > Yeah, that is something I would like to know as well :) I have actually
> > removed this in patch 24 since it does not make sense to change PATH in
> > this script.
> 
> When we are at this one - this commit definitely does not belong into the
> fsadm update patch set - such patch should be submitted as a separate
> unrelated patch and not 'well' hidden in the middle - and there are more such
> things which should probably go separately - especially if they present some
> bugfixes and should be merged before this large fsadm gets slowly upstream.
> 
> Zdenek
> 

The patch removing the PATH think is in the separate path, and I
mentioned above. Regarding more bug fixes, I am not sure what do you
mean specifically, some of them are separate patches and some of them
might be unfortunately part of other patches.

The reason is simple, I have extended fsadm from 494 lines to 1486 lines
with series of patches, improvements and new features. I would be painful
to identify each and every bug fix and create separate patch, which will
go through separate merging process especially since it is a single file
script.

Also the patch is not "well" hidden, it is just a part of the series and
it is done after all the big changes I have made.

Thanks!
-Lukas
