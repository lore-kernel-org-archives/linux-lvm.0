Return-Path: <mike@marxmeier.com>
Date: Thu, 8 Feb 2001 20:55:51 +0100
From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Message-ID: <20010208205551.C21949@vestdata.no>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] questions
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@msede.com

Hi

Is there a limit for the maximum size of a LVM diskgroup?
(internally in LVM-code, or because of other limits in the kernel)
The 2TB (1 TB) maximum devicesize in the linux-kernel doesn't apply, does
it?

How does LVM handle that one of it's devices changes size? E.g. if one
of the physical disks is a RAIDset, and more disks are added to it?
Is there any way to tell LVM to use more or less of the disk?


Thanks.


--=20
Ragnar Kj=EF=BF=BDrstad
BigStorage
