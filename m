Message-ID: <36DFB4AF.3BE72568@ep-ag.com>
Date: Fri, 05 Mar 1999 11:40:47 +0100
From: Klaus Strebel <stb@ep-ag.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Problems with LVM 0.6
References: <36DEC203.C9CCD889@notes.seagate.com>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Steve Brueggeman <steve_brueggeman@notes.seagate.com>
Cc: linux-lvm@msede.com

Hi Steve,

Steve Brueggeman wrote:
> 
> First off, I had trouble compiling the tools.  I got a warning that
> "LVM_BLK_MAJOR" was undeclared, when compiling
> tools/lib/lvm_tab_get_free_blk_dev.c
Seems to me, that your patch was not successfull. LVM_BLK_MAJOR is to be defined
in $LINUX_SRC/include/linux/major.h. Look for a .rej file in that directory
(btw. this should be done after every patch ;-)). The sequence in the INSTALL
file should be changed: first patch the kernel sources, then build the tools.
The other things is, that, if you apply the patch to a already patched source
(ex. to update LVM0-5alpha to 0.6_also_alpha), the new module source is inserted
to the beginning of the source file, both versions are in it and the compiler is
the talking to you, telling you funny things ;-). Perhaps there should be
upgrade-patches-from-xx-to-yy ?

One very very heavy problem i ran in yesterday was, that the dynamic creation of
the /dev/lvm device-file with devfs does not work in lvm-0.6 anymore (sorry, i
didn't search why). So i have to create the /dev/lvm after loading the
lvm-module before i can vgscan. 

Btw. what are the files vgscan creates in /etc are used for. Is it possible to
suppress creation (or even rw-access) to these files if they already exist?
Background is, that i have to fsck and remount,rw my root-fs before i can use
lvm. Is that really neccessary?

But, after all that criticism, cheers for this software! It is what i waited
for! Let`s get it stable quickly!

Ciao
Klaus
-- 
Klaus Strebel
stb@ep-ag.com
EIGNER + PARTNER AG   - The Engineering Warehouse Company -
<http://www.ep-ag.com>
-----------------------------------------------------------------------
In Heaven there will be no DOS, no Intel, and above all, no Bill Gates.
