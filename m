From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] I broke my PVs!
Message-ID: <20021020213439.GA28082@percy.comedia.it>
References: <20021020104912.GD26167@percy.comedia.it> <1035144994.29693.2.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1035144994.29693.2.camel@localhost.localdomain>
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
Date: Sun Oct 20 16:35:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Oct 20, 2002 at 03:16:34PM -0500, Austin Gonyou wrote:
>I ran fdisk, then just saved. So I guess you could say I just lost the
>partition table.

ok, you lost lvm metadata...

>> destructive, it only touched disk metadata. so you could try pvcreate,
>> vgcreate and lvcreate.
>> DO A BACKUP OF YOUR RAW DISK DATA FIRST
>
>what about vgcfgrestore from another set of smaller disks that are laid
>out the same way? could that work?
>
>Wish I could, but I can't. Don't have enough disk space. :(

i believe it should be the same...

Heinz? someone?

l.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
