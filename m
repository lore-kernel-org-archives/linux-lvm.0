From: Anders Widman <andewid@tnonline.net>
Message-ID: <1899663439.20030409133243@tnonline.net>
Subject: Re: [linux-lvm] Are there problems with same VG on same hard disk?
In-Reply-To: <20030409112739.GA1244@glorybox>
References: <20030409112739.GA1244@glorybox>
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
Date: Wed Apr  9 06:33:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> Hi,

> Question: Is it good to have /dev/hdb1 /dev/hdb2 into the same Volume
> Group? I think I have read that VGs of the same group should not be on
> the same hard disk. Is this correct or a legend?

Why  would  you want to do that? One of the major benefits with LVM is
that  you  do  not have to divide your physical disks into partitions,
but  to  do  that through LVM. Also, performance-wise it is not a good
idea to do what you suggested.

//Anders



--------
PGP public key: https://tnonline.net/secure/pgp_key.txt
