Message-ID: <3DA47C6E.5090901@free.fr>
From: Emmanuel Varagnat <emmanuel.varagnat@free.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Disk crash , LVM and ext2... (bis)
References: <3D90EBDA.5070605@free.fr> <20020925071843.GI1291@tykepenguin.com> <3D91674F.3040601@free.fr> <20020925075113.GK1291@tykepenguin.com> <3D98D656.2070904@free.fr> <3D99B6CC.30102@free.fr> <20021004123352.A9010@sistina.com>
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
Date: Wed Oct  9 13:59:22 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Heinz J . Mauelshagen wrote:
> We don't support zeroing of the data in the error case so far and do return
> an io error to the application. Later we plan to as an option.
> 
> So today you get a read error if the block is not available and the data
> is not zeroed in memory. No need to (ab)use LV_BMAP.
> 
> If your application needs to distinguish those cases anyways, you would want
> to stay with 'io error returned'.

Ok it works as I expected.
The error was coming from the fact that _I_ zeroed the partition to let 
the LVM utilties think that the PV isn't here. So the data returned was 
effectively coming from the partition.
Instead I delete the partition, reboot and retest.

Thanks for taking time to answer.

-=( manu )=-
