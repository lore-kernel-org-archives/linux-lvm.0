Return-Path: <seawolf@attglobal.net>
Message-ID: <3A67C108.31E63E1E@attglobal.net>
Date: Thu, 18 Jan 2001 23:22:32 -0500
From: Les Hazelton <seawolf@attglobal.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm]  Migration path - 2.2.17 & LVM 0.8final -> 2.4.0 & LVM
References: <200101182322.XAA20983@lindbergh.avbrief.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Tom,

Thanks for the reply, and the advice about a backup kernel.  I followed
your example and it all went rather smoothly. There was another post
suggesting I try the LVM rpm files from Connectiva and I did that at
first but could not make it work.  I obviously did something wrong or
incompletely.

I removed those rpm packages and completed your path with the "make
install" for the 0.9.1 user space tools, built the required
lvmcreate_initrd file for the 2.4.0 kernel and did a reboot.

The first time there were a couple of error messages about the lvm
config data being in the wrong format but the system came up anyway. I
did another re-boot and this time it come up cleanly.

I have tried creating, using and removing a few test LVs and all of that
appears to be working correctly.

So far, much easier than I expected.  Many thanks to all.

Les

Tom Dawes-Gamble wrote:
> 
> Hi,
>         Although not quite the same upgrade that you are doing.  I have just
> a good trouble free conversion to 0.9.1_beta1. From 0.8-pre02.10.1999
> and Kernel 2.2.16 to 2.2.18.
> 
> First I made sure I had a separate bootable emergency
> partition just in casse things went badly wrong.  :-)
> (then I could activate the vg and put back the old tools if required.)
> 
> Next I downloaded and unpacked the 2.2.18 tarball.
> Same for lvm  0.9.1_beta1.
> 
> Read and follow the README in PATCH.
> Built the kernel.
> Installed the kernel.
> Built the 0.9.1_beta1 tools.
> And now for the sort of point of no return.
> Installed the 0.9.1_beta1 tools.
> 
> Now you have tools that don't work withthe running kernel.  :-(
> 
> Now boot the new kernel.
> 
> That didn't go clean for me. So I was droped to the shell prompt
> during fsck.
> 
> I just ran a vgscan it rebuilt my /etc/lvmtab and then I ran vgchange -a y
> the vg activated NP.
> 
> exit from the shell causes a reboot.
> 
> Boot the new kernel again and this time it comes up clean.
> 
> Note:-  I only have vgchange in my rc.sysinit not vgsacn and vgchange.
> I seem to remember that the docs say you should have both so may be
> It's a good idea as my system would have started clean if I had followed
> that.  However, I don't upgrade LVM that often so I think overall it's
> faster to not do the vgscan.  :-)
> 
> Tom.
> 
> On Thu Jan 18 22:05:26 2001 Les Hazelton wrote:-
> >
> > My current workstation is running Linux Mandrake 7.2.  It has a 2.2.17
> > kernel patched with lvm-0.8final-2.2.16TL.patch.
> >
> > Most of the system is reiserfs created on lvm devices.  In fact, the
> > only part of the system that is not reiserfs/lvm is the /boot tree as
> > you can see:
> >
> > Filesystem            Size  Used Avail Use% Mounted on
> > /dev/lvg01/slash      600M  268M  332M  45% /
> > /dev/hda1              45M  4.4M   39M  10% /boot
> > /dev/lvg01/home       1.0G  133M  891M  13% /home
> > /dev/lvg01/usr        2.0G  1.3G  752M  63% /usr
> > /dev/lvg01/src        700M  249M  451M  36% /usr/src
> > /dev/lvg01/local      1.0G  537M  487M  52% /usr/local
> > /dev/lvg01/var        300M  123M  177M  41% /var
> > /dev/lvg01/mp3        1.5G  1.4G  110M  93% /mp3
> > /dev/lvg01/pictures   1.0G   38M  986M   4% /pictures
> > /dev/lvg01/wine       1.0G   32M  992M   3% /wine
> >
> >
> > I want to migrate to the source from
> >
> >       kernel-headers-2.4.0-5mdk.i586.rpm
> >       kernel-source-2.4.0-5mdk.i586.rpm
> >
> > patched with lvm_0.9.1_beta2.tar.gz.
> >
> > The problem is, I am not sure of the implementation order.  i.e., should
> > I first try to add the 0.9.1 user space tools and then the new kernel.
> > Or, should I try to add a 0.9.1 patch to the current kernel before
> > switching to the new 2.4.0 kernel etc...
> >
> > As you can see,  I am a bit confused.  I would appreciate some words of
> > guidance from anyone that has already done something similar
> > (successfully).
> >
> > --
> >
> > Good Journey, longevity and prosperity to all
> >
> > Les Hazelton
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> >
> 
> --
> char  *r,*e,*w="%.9s%.7s%.7s\n";extern int printf(const char*,...);int main(){
> int l=*w,a,b,th=*(w-~(l/=l))-*(w+l);b=*w+~th--;a=b-th;//Aviation Briefing Ltd.
> r=e="  DISPLAY'tmdg@avbr';,,;'ief.com'*>"+b;l+=~b,th-=printf(w,e-a,th+e,r);
> r=e="  DISPLAY'http://www.avbrief.com/' *>"-~b,exit(~l-printf(w,e+~a,th+e,r));}
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

-- 

Good Journey, longevity and prosperity to all

Les Hazelton
