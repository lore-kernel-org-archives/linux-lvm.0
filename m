Date: Thu, 18 Oct 2001 11:39:54 +0200
From: Stefan Onken <Stefan.Onken@difi.de>
Message-ID: <55520025253.20011018113954@difi.de>
Subject: Re: [linux-lvm] replace bad hard disc
In-Reply-To: <20011016105533.A4318@sistina.com>
References: <110278234233.20011015163039@difi.de>
 <20011016105533.A4318@sistina.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "Heinz J . Mauelshagen" <linux-lvm@sistina.com>

Hallo Heinz J . Mauelshagen,

Am Dienstag, 16. Oktober 2001 um 10:55 schriebst Du:

> pvcreate /dev/sde1
> vgextend Stonki2 /dev/sde1
> pvmove /dev/sdd1 /dev/sde1
> vgreduce Stonki2 /dev/sdd1

stupid question: what about resizing the reiserfs file system ?
Is it not necessary ?

cu
stonki


-- 
The More I See, The More I Know. The More I Know, The Less I Understand
