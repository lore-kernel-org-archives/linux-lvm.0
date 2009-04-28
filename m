Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3SEfdZL008670
	for <linux-lvm@redhat.com>; Tue, 28 Apr 2009 10:41:39 -0400
Received: from eastrmmtao101.cox.net (eastrmmtao101.cox.net [68.230.240.7])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n3SEfOYk007438
	for <linux-lvm@redhat.com>; Tue, 28 Apr 2009 10:41:24 -0400
Received: from eastrmimpo03.cox.net ([68.1.16.126]) by eastrmmtao101.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090428144124.TUIH13757.eastrmmtao101.cox.net@eastrmimpo03.cox.net>
	for <linux-lvm@redhat.com>; Tue, 28 Apr 2009 10:41:24 -0400
Message-ID: <49F71594.2020602@cox.net>
Date: Tue, 28 Apr 2009 10:41:24 -0400
From: "Clyde E. Kunkel" <rascal.jumper-747@cox.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Random file system errors
References: <003a01c9c7a3$fa10a000$ee31e000$@no>
In-Reply-To: <003a01c9c7a3$fa10a000$ee31e000$@no>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 04/27/2009 09:52 PM, Gaute Lund wrote:
> I have searched the web and the mailing list without finding anything
> similar to this.
>
> At home I have an LVM setup. Reading data gives random errors. I only
> recently discovered it's an LVM issue. I think.
>
> The issue: If I md5sum largeish files, or test archives, I sometimes get
> errors or randomly different md5sums. Like now, I have 11 folders, all with
> rar files in parts: some 300 15MB pieces in 6 folders/sets, totaling 4,2GB,
> and 560 50MB pieces in 5 folders/sets, totaling 23G.
>
> OK, so I "rar t" all of these 5 times over. Errors pop up randomly, 52 times
> in the 50MB pieces, 10 times in the 15MB pieces. That's about 1 error for
> every 2,1GB of data read. Md5suming multiple files gives about the same
> error rate.
>
> If I run repeated test on a rar set small enough to fit in cache mem, I get
> errors, but they are indentical with each run.
>
> Is it really an lvm problem? Well, I have created new LVs and use different
> filesystems, ext3, xfs, jfs - they're all the same. If I create an md on
> some other disks, and put a filesystem on it, without LVM, no problems.
>
> I can't find any other errors, in any logs or dmesg. The errors weren't
> there to begin with, they came at one point and got worse. It took a while
> before I realized it was a generic disk problem, and for a period I kind of
> gave up on it. So it's been there for ... maybe six months?
>
> The VG consist of two software RAID 5 md's, one consisting of four 200GB
> IDEs, one of five 500GB SATAs, yielding av VG totaling 2,37TB. Other
> hardware is 4GB memory and a Core 2 Duo 6600 CPU.
>
> Machine runs Ubuntu 8.10 with kernel 2.6.27-11, and
>    LVM version:     2.02.39 (2008-06-27)
>    Library version: 1.02.27 (2008-06-25)
>    Driver version:  4.14.0
>
> But the VG was originally created long ago, on LVM1 even.
>
> Well, I guess that's it. Any other information that could be helpful? Any
> way I could debug this?
>
> Best regards
> Gaute Lund
>    

I am seeing the same thing with large (distros on DVDs) ISO files also.  
Running md5sum or sha1sum on the file gives different results each time 
and burning the iso gives a dvd that contains files with errors.  I ran 
memory tests over night and all was good.  I turned on smartd checking 
and ran disk checks and all is ok and I continue to look for disk errors 
on a periodic basis and all is well.

The linux system is Fedora rawhide, but the problem also exists in 
Fedora 9 and 10.  The files are being downloaded with wget to a Download 
directory on my home directory which is an ext3 LV mounted on an ext4 
home filesystem.  Wgeting to a standard non-LV ext3 parition results in 
good isos which demonstrate consistent sha1sums.  If I cp the good iso 
to the LV Download directory, problems again occur.  So far the problem 
only manifests with dvd size iso files.  CD size iso files are fine.

I first noticed this problem several months ago, but have not bz'd it 
since I cannot yet for sure say it is LVM causing the problem.  However, 
I think at this point I have eliminated wget as the problem but not 
ext4.  I need to create an ext3 LV for / to test on.

Any guidance on error capturing or any testing features of LVM2 that can 
be turned on?

Thanks.
