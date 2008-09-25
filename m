Message-ID: <48DBE19F.4050109@redhat.com>
Date: Thu, 25 Sep 2008 21:08:15 +0200
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
References: <779919740809251019t82ef425w6863c4b05044519a@mail.gmail.com>
In-Reply-To: <779919740809251019t82ef425w6863c4b05044519a@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: [Linux-cluster] pvmove with a clustered VG
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
Content-Type: text/plain; charset="us-ascii"
To: linux clustering <linux-cluster@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Jeremy Lyon wrote:
> Is it not possible to run pvmove on a clustered VG?  Any help would be
> appreciated.

Hi,
basic pvmove operation on clustered VG is supported since RHEL4.7
and should be available for RHEL5.3 too.

But not yet for mirrored LV, only for linear mapped LVs.

If you have clustered mirror module available, it can run online,
otherwise you have to deactivate VG (and pvmove run exclusively on one node).

Milan
--
mbroz@redhat.com
