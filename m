From: "SI Reasoning" <si@mindspring.com>
Subject: Re: [linux-lvm] RAID5 bug? [was: Re: raid and lvm]
Message-ID: <20030206.kbn.38328100@si.homelinux.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
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
Date: Thu Feb  6 14:03:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I have had much better results with software (linux) raid 1 and then lvm (which
replaces raid0). The difference in performance on a small system is immediately
noticable. I also use XFS (on all lvm) and jfs (for the root partition that is
raid1 only). I saw some benchmarks that had jfs with some of the best read specs
(or writes I forgot which one) and XFS with the best balanced specs over software
raid. I chose XFS for lvm because it allows for lvm to resize while mounted. I
wasn't sure if jfs could do that.

Another added benefit of this approach was that the default mandrake kernel will
recognize raid0 and raid1 for the root directory (but not raid5 which caused
considerable headaches when I installed a new kernel). The boot directory still
needs to be non-raid and i also have 4 swap directories that are non raid. Because
of lvm i was able to create 3 raid1 partitions (this is for a 4 disk system). 2
disks had a small directory for /, then I used the rest of the space for a 2nd
larger directory for lvm. The other two were mostly lvm (except for swap). I
merged both of them into 1 lvm group and created my /home, /var and /usr directory
there (leaving some space for expansion). This is now working quite snappy!

Jason Smith (jhs@openenterprise.biz) wrote*:
>
>-----BEGIN PGP SIGNED MESSAGE-----
>Hash: SHA1
>
>On Wednesday 29 January 2003 04:26 am, Christophe Saout wrote:
>> At the moment neither LVM1 nor DM (LVM2) can provide redundancy. But you
>> can use LVM on top of the software raid5 driver in linux. I don't think
>> there is another way at the moment.
>
>Hi.  What is the best current answer to the canonical LVM plus software RAID5
>issue?  FYI, I'm talking about how the kernel's cache needs to correspond to
>the width of i/o requests.  When LVM controls a RAID5 PV, it will cause many
>differently-sized i/o requests to hit the array in parallel, basically
>forcing the kernel to flush the cache and rebuild continuously.  So,
>basically my array performs horribly once I create a snapshot volume.
>
>I'm using LVM2.1.95.10 + 2.4.20-dm-7.
>
>Some older LKML traffic explains the problem, but I haven't found an answer
>yet.
>
>Thanks much.
>
>- --
>Jason Smith
>Open Enterprise Systems
>Bangkok, Thailand
>-----BEGIN PGP SIGNATURE-----
>Version: GnuPG v1.2.1 (GNU/Linux)
>
>iD8DBQE+Qizym5qEoSbpT3kRAhKwAKCubNE0VqXCqtdnlRDowuUlLWeWGQCcDjan
>ZxpF2yaJud/9JM2fnTg23kQ=
>=YCls
>-----END PGP SIGNATURE-----
>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--
SI Reasoning
si@mindspring.com
gpg public key ftp://ftp.p-p-i.com/pub/si-mindspring-pubkey.asc

The significant problems we face cannot be solved by
the same level of thinking that created them.
-Albert Einstein
