From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] LV not mounting from fstab.
Message-ID: <20020605220416.A21310@zealot.blacknet.de>
References: <20020605113818.D8251@yukon.drivingbeat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020605113818.D8251@yukon.drivingbeat.com>; from jleach@mail.ocis.net on Wed, Jun 05, 2002 at 11:38:18AM -0700
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
Date: Wed Jun  5 16:03:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Jun 05 '02 at 11:38, Jason C. Leach wrote:
> When I boot my system ( a test box ) the VG always are not active. I must do:
> vgchange -a y test
> Any reason for this? 
By design. The kernel need the userspace tool to scan the discs and
setup the metadata. 
There are other aproaces (LVM2 or EVMS (IIRC)) but as long as you want
to stay with the (stable) LVM1 you must do this (btw: it's documented
that way).

Cu,     
    Goetz.
