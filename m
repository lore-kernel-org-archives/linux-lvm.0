Subject: Re: [linux-lvm] Help for Vg max size
Message-ID: <OFC68C05EF.E1D1F007-ONC1256CFD.0032FD6B-C1256CFD.00331868@nl.ibm.com>
From: "Rick van der Linde" <h.r.vanderlinde@nl.ibm.com>
MIME-Version: 1.0
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
Date: Thu Apr  3 02:17:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com


>When you create your VG, you choose a PE size. I think there is a max of
>65k PE's for
>a disk. See man vgcreate, or the LWN howto.
>
>google for: lvm howto linux + i'm feeling lucky

65K PE's a VG. The size of the PE determines the max vg size.

Rick
