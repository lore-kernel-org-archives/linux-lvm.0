Message-ID: <38FB29FE.7017CB71@ednet.ns.ca>
Date: Mon, 17 Apr 2000 12:13:02 -0300
From: Patrick Boutilier <boutilpj@ednet.ns.ca>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgcfgrestore
References: <38F4AF07.7136C51@ednet.ns.ca>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM Mailing List <linux-lvm@msede.com>

I will answer my own questions just in case somebody is searching through
the archives for answers to similar problems.


Patrick Boutilier wrote:

> Hello,
>
> Looks like I am going to have to resort to using vgcfgrestore as I get
> the following error running vgscan:
>
> vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- scanning for all active volume group(s) first
> vgscan -- found active volume group "data_vg"
> vgscan -- reading data of volume group "data_vg" from physical volume(s)
>
> vgscan -- ERROR -364: can't get data of volume group "data_vg" from
> physical volume(s)
> vgscan -- ERROR -364 creating "/etc/lvmtab" and "/etc/lvmtab.d"
>
> I assume with an error like that there is no way I am going to be able
> to activate my logical volumes on the next reboot?
>

I will answer my own questions just in case somebody is searching through
the archives for answers to similar problems.


>
> Also I haven't seen anywhere where it says that the logical volumes and
> volume group must be offline when running vgcfgrestore other than this
> piece at the end of the vgcfgrestore man page:
>
> vgcfgrestore returns an exit state of 0 for success and > 0 for error:
>
>        1  no physical volume on command line
>        2  invalid physical volume name
>        3  volume grou is active
>         ......
>
> So I will ask the question. Can vgcfgrestore be run on active logical
> volumes and volume groups?

As I thought the volume group did have to be inactive. One note though. I
could not successfully run vgcfgrestore in single user mode.  I kept
getting an error (which I didn't write down) until I went to run level 3
without
activating my volume group. Good news is that the restore worked and vgscan
now runs properly.
