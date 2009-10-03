Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n938YRM1010128
	for <linux-lvm@redhat.com>; Sat, 3 Oct 2009 04:34:27 -0400
Received: from destar.net (mail.destar.net [12.12.38.18])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id n938Y7SS030039
	for <linux-lvm@redhat.com>; Sat, 3 Oct 2009 04:34:08 -0400
Subject: Re: [linux-lvm] Re: "Incorrect metadata area header checksum"
	after a pvmove and pvresize
From: Jon <jonr@destar.net>
In-Reply-To: <d60517f30909291431m1e8de73asd033a0e82526896e@mail.gmail.com>
References: <d60517f30909222050j77b16ce7x769f442043151bbd@mail.gmail.com>
	<d60517f30909232055g452df1cjcd298ddb0e428ba4@mail.gmail.com>
	<d60517f30909291431m1e8de73asd033a0e82526896e@mail.gmail.com>
Date: Sat, 03 Oct 2009 00:34:03 -0800
Message-Id: <1254558843.2105.69.camel@laptop-jr.destar.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: jonr@destar.net,
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi Thiago,

Here is a link to a RH doc that seems to match what you are describing.
I have used this once before successfully but use at your own peril. :)

http://www.redhat.com/docs/en-US/Red_Hat_Enterprise_Linux/5.4/html/Logical_Volume_Manager_Administration/mdatarecover.html

Jon

On Tue, 2009-09-29 at 21:31 +0000, Thiago Nunes wrote:
> Please, some one have a hint to me? Have I made something wrong?
> 
> I have an 80 GB hard drive (sda) who had a swap of 500 MB (sda1), an
> /boot with 30 MB (sda2), a physical volume with 55 GB (sda3) and some
> less important partitions after.
> 
> I use gentoo and some days ago I needed some more free space on my
> /var/tmp/paludis (/dev/vg/tmp-paludis) and, workaroundly, ran a
> pvcreate on /dev/sda5, who had 5 GB, added it to my volume group and
> resized the logical volume /dev/vg/tmp-paludis.
> 
> Now I want to use my hard drive with a new scheme partition using the
> sda3  until the end of the drive, with no more partitions after this.
> To do that I took an auxiliary hard drive and booted my machine with
> this drive (sdb) and using the System Rescue CD (v1.1.3) distribution.
> 
> Then I created an sdb1 with 6GB, ran pvcreate on it and added it to my
> volume group. So I ran pvmove on sda5 to move data to sdb1, since sda3
> had no more free space. After that I removed sda5 from my volume group
> and deactivated the volume group to repartition my hard drive,
> recreated the sda3 to occupies the drive until the end and ran
> pvresize on sda3. Everything ran ok with no errors or warnings.
> 
> Then I wanted to use my system again and I rebooted the PC to boot my
> system. I would continue to pvmove the sdb1 after I got my system
> running but at the boot got the message "Incorrect metadata area
> header checksum" from vgchange -a y on initrd and never more could
> access my volume group.
> 
> Now I am on system rescue cd again and can't access my data. I don't
> know what went wrong and don't know how to securely recover my volume
> group.
> 
> Someone have any hint to me?
> 
> Here are the output of plenty useful commands:
> http://200.19.254.116/~thiago/arquivos-lvm/
> 
> --
> thiago
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
