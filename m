From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] More LVM on RAID issues
Message-ID: <20011115153611.T5739@lynx.no>
References: <5E34D857F6BB704CA3369B7553233A81651A80@ntsviemxs0152.connect.at-work.ent>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5E34D857F6BB704CA3369B7553233A81651A80@ntsviemxs0152.connect.at-work.ent>; from Ferenc.Csuk@one.at on Thu, Nov 15, 2001 at 11:10:16PM +0100
Content-Transfer-Encoding: quoted-printable
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
Date: Thu Nov 15 16:38:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: "Csuk, Ferenc" <Ferenc.Csuk@one.at>
Cc: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

On Nov 15, 2001  23:10 +0100, Csuk, Ferenc wrote:
> Could someone tell me why I don=B4t receive the mails from the mailing =
list?
> Did I subsscribe wrongly? I just checked the internet and saw the answe=
rs
> for my questions.

I think you can check if you are subscribed at the URL:
http://lists.sistina.com/mailman/listinfo/linux-lvm

> Anyway, I couldn=B4t complete the setup for LVM on top of RAID1. Though=
,
> suddenly pvcreate statement worked after deleting the volume groups, an=
d the
> partitions, but now it creates physical volumes with wrong size. For ex=
ample
> there is a partition with 16GB(/dev/md0), but pvcreate use only 50M.=20

May still be a problem with reading DOS partition data from beginning of
the drive.  Did you "dd if=3D/dev/zero of=3D/dev/mdX" for each device?  I=
t
looks like you are getting the 50M boot partition data for your PV (this
may be corrupting that partition).  Are you sure your MD configuration
is correct, and that you are pvcreating the correct partition?

> Just to make the configuration clear we have 4 drives(sda, sdb, sdc, sd=
d)
> and we created primary partitions on sda for boot(50M), root(200M), and
> swap(700M), and another one for the rest(tmp, opt, var home 16GB).=20

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
