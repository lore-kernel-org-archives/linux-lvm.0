From: Petro <petro@corp.vendio.com>
Message-ID: <20030713182743.GD20860@corp.vendio.com>
References: <20030712000127.GE15461@corp.vendio.com> <20030713121151.H23240@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030713121151.H23240@sistina.com>
Subject: Re: [linux-lvm] Problems with LVM
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
Date: Sun Jul 13 13:29:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Jul 13, 2003 at 12:11:51PM +0200, Heinz J . Mauelshagen wrote:
> Petro,
> what's the lvcreate command line ?

lvcreate -L10G -n snap000 -s /dev/vg0 

> (highmem may cause problems if you use the snapsho9t, creation should
> work fine)

Is this highmem problem across all 2.4 kernels, or just 2.4.19+? The
first report I've seen of it is with a 2.4.19 kernel. 

> 
> Regards,
> Heinz    -- The LVM Guy --
> 
> On Fri, Jul 11, 2003 at 05:01:27PM -0700, Petro wrote:
> > Hello again. 
> > 
> > I'm having a problem with LVM, and I'm really, really hoping you won't
> > tell me it's because of:
> > 
> > # CONFIG_NOHIGHMEM is not set
> > CONFIG_HIGHMEM4G=y
> > # CONFIG_HIGHMEM64G is not set
> > CONFIG_HIGHMEM=y
> > CONFIG_HIGHIO=y
> > 
> > (linux kernel 2.4.21, lvm 1.0.7 stuff installed)  
> > 
> > I've got 8 boxes with 4 gig of memory, and 6 200 gig drives in a raid 0 
> > setup, and I need to use LVM+Snapshots. 
> > 
> > I can setup and create a 1.09T logical volume, but when I go to create a
> > snaphot, I get: 
> > 
> > lvcreate -- INFO: using default snapshot chunk size of 64 KB for "/dev/vg0/test"
> > lvcreate -- ERROR "Cannot allocate memory" creating VGDA for "/dev/vg0/test" in kernel
> > 
> > Now, in reading past posts there is some talk of how having "high
> > memory" turned on will cause problems with snapshots. 
> > 
> > The problem is that on these machines I *need* 4 gig of memory, and I
> > *need* snapshots. 
> > 
> > Help? 
> > 
> > 
> > --- Physical volume ---
> > PV Name               /dev/sda
> > VG Name               vg0
> > PV Size               1.09 TB [2344319232 secs] / NOT usable 32.31 MB [LVM: 267 KB]
> > PV#                   1
> > PV Status             available
> > Allocatable           yes
> > Cur LV                1
> > PE Size (KByte)       32768
> > Total PE              35770
> > Free PE               570
> > Allocated PE          35200
> > PV UUID               LyEPH1-pq2I-D022-v5c9-98rp-n7Ff-4LnNKL
> > 
> > --- Volume group ---
> > VG Name               vg0
> > VG Access             read/write
> > VG Status             available/resizable
> > VG #                  0
> > MAX LV                256
> > Cur LV                1
> > Open LV               1
> > MAX LV Size           2 TB
> > Max PV                256
> > Cur PV                1
> > Act PV                1
> > VG Size               1.09 TB
> > PE Size               32 MB
> > Total PE              35770
> > Alloc PE / Size       36032 / 1.10 TB
> > Free  PE / Size       4294967034 / 131071.99 TB
> > VG UUID               KciSkB-xbr8-22RM-zmke-6A69-6BEM-xLWMzv
> > 
> > --- Logical volume ---
> > LV Name                /dev/vg0/lv0
> > VG Name                vg0
> > LV Write Access        read/write
> > LV Status              available
> > LV #                   1
> > # open                 1
> > LV Size                1.07 TB
> > Current LE             35200
> > Allocated LE           35200
> > Allocation             next free
> > Read ahead sectors     1024
> > Block device           58:0
> > 
> > 
> >    procs                      memory    swap          io     system         cpu
> >  r  b  w   swpd   free   buff  cache  si  so    bi    bo   in    cs  us  sy  id
> >  0  0  0      0 3949704   1648  26104   0   0     3     2   27     5   0   0 100
> > 
> > 
> > -- 
> > "On two occasions, I have been asked [by members of Parliament], 'Pray, 
> > Mr. Babbage, if you put into the machine wrong figures, will the right 
> > answers come out?' I am not able to rightly apprehend the kind of confusion 
> > of ideas that could provoke such a question." -- Charles Babbage 
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> *** Software bugs are stupid.
>     Nevertheless it needs not so stupid people to solve them ***
> 
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> 
> Heinz Mauelshagen                                 Sistina Software Inc.
> Senior Consultant/Developer                       Am Sonnenhang 11
>                                                   56242 Marienrachdorf
>                                                   Germany
> Mauelshagen@Sistina.com                           +49 2626 141200
>                                                        FAX 924446
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 
"On two occasions, I have been asked [by members of Parliament], 'Pray, 
Mr. Babbage, if you put into the machine wrong figures, will the right 
answers come out?' I am not able to rightly apprehend the kind of confusion 
of ideas that could provoke such a question." -- Charles Babbage 
