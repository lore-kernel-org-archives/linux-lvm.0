Message-ID: <000201c3b3a4$75bdb040$100119ac@hydro>
From: "<hYdRo>" <hydro@blueyonder.co.uk>
References: <014d01c3b2f8$be15a930$100119ac@hydro>
Subject: Re: [linux-lvm] LVM2 on 2.4.22. (Fedora core 1 with nptl) 
MIME-Version: 1.0
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
Date: Tue Nov 25 16:37:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I've got a ~56K bz2 diff from after getting LVM2 working against the fedora
2.4.22-1.2115.nptl kernel sources (after make mrproper, which I always have
to do to get redhat kernel's to compile).

Here the definition of working is compiles + system rebooted with kernel
(LVM2 devmapper is a module).  Module loaded and used pvcreate, vgextend,
pvmove, on test data and all *seem* ok.

Can I mail a 56K attachment to the list, or is there somewhere else I can
put it?

<hYdRo> wrote:
> tugg <tugg@dial.pipex.com> writes:
>
>> Trying to install LVM2 on 2.4.22. (Fedora core 1 with nptl)
>>
>
> Please post notes back to here if you managed to work out the patches
> that are needed.  I'd like to stick with the fedora kernel instead of
> grabbing a clean 2.4.22 as I need some of the other patching that
> Fedora have done.
>
>> device/dev-io.c: In function `dev_get_size':
>> device/dev-io.c:215: error: `BLKGETSIZE64' undeclared (first use in
>> this
> function)
>
> The BLKGETSIZE64 error is due to it not being in the "userspace"
> <linux/fs.h> for Fedora (glibc-kernel-headers package).
> Just add the #define line from /usr/src/linux/include/linux/fs.h (or
> compile against that fs.h as other parts of LVM2 seem to want to
> compile against kernel private headers from the warnings thrown
> during compile).
>
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
