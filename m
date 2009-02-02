Received: from [10.34.32.183] (mazybook.englab.brq.redhat.com [10.34.32.183])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n129C17Y011649
	for <linux-lvm@redhat.com>; Mon, 2 Feb 2009 04:12:01 -0500
Message-ID: <4986B8DF.7020307@redhat.com>
Date: Mon, 02 Feb 2009 10:11:59 +0100
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] resizefs and ext4
References: <20090202034739.8EE5C6F06C@alopias.GreenKey.net>
In-Reply-To: <20090202034739.8EE5C6F06C@alopias.GreenKey.net>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Curtis Doty wrote:
> Any plans to let the fsadm script support ext4 in Fedora 11?

For fsadm, probably only a small change needed in script, please
fill a bug for lvm2 component/rawhide on bugzilla.redhat.com to track this.

Thanks,
Milan
--
mbroz@redhat.com
