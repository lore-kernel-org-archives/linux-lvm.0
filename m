From: =?iso-8859-1?Q?Jos=E9_Luis_Domingo_L=F3pez?= <linux-lvm@24x7linux.com>
Subject: Re: [linux-lvm] adding a bootsector to a PV destroys it ?!?
Message-ID: <20020901090001.GA1739@localhost>
References: <20020901022635.E6906@zealot.blacknet.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020901022635.E6906@zealot.blacknet.de>
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
Date: Sun Sep  1 04:05:52 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sunday, 01 September 2002, at 02:26:35 +0200,
Goetz Bock wrote:

> Still, just to make sure:
> overwriting the first 512byte of a PV destroy it?
> 
If I recall correctly, metadata is placed at the beginning of each PV,
so overwriting the first 512-byte sector of it will probably render
metadata unusable for LVM.

-- 
Jose Luis Domingo Lopez
Linux Registered User #189436     Debian Linux Woody (Linux 2.4.19-pre6aa1)
